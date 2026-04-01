#include "client.h"
#include "cache.h"
#include "utils.h"

#include <regex>
#include <string>
#include <cstdio>

struct UrlInfo {
    std::string host, port, path;
};

static UrlInfo parseUrl(const char *url) {
    // regex expression for url:         header    host    port   path
    static const std::regex urlRegex(R"((http://)?([^/:]+)(:\d+)?(/.*)?)");
    std::cmatch match;
    if (!std::regex_match(url, match, urlRegex)) {
        return { "$", "$", "$" }; // invalid
    } else {
        return {
            match[2].str(),
            match[3].str().empty() ? "80" : match[3].str().substr(1),
            match[4].str().empty() ? "/" : match[4].str()
        };
    }
}

static std::string readHeader(rio_t &rio, const std::string& host) {
    buffer_t buf;
    bool hasHost = false;
    std::string header;
    while (true) {
        if (rio_readlineb(&rio, buf, MAXLINE) < 0) return "$";
        if (strcmp(buf, "\r\n") == 0) break; // end of header
        if (!strcasecmp(buf, "Host:")) hasHost = true;
        else if (!strcasecmp(buf, "Connection:")) continue;
        else if (!strcasecmp(buf, "Proxy-Connection:")) continue;
        else if (!strcasecmp(buf, "User-Agent:")) continue;
        header += buf;
    }
    if (!hasHost) header += "Host: " + host + "\r\n";
    header += "Connection: close\r\n";
    header += "Proxy-Connection: close\r\n";
    header += USER_AGENT_HDR;
    header += "\r\n";
    return header;
}

static void doGet(rio_t &client_rio, const char *url) {
    auto info = parseUrl(url);
    if (info.host == "$") {
        fprintf(stderr, "Client error: Invalid URL %s\n", url);
        return ;
    }

    auto fineUrl = info.host + ":" + info.port + info.path;
    auto [hit, found] = fetchCache(fineUrl);
    if (found) {
        fprintf(stderr, "Client info: Cache hit for %s\n", fineUrl.c_str());
        // this is a risky implement to convert string_view::begin() to void*
        // but C love bytes stream. make it happy.
        if (rio_writen(client_rio.rio_fd, (void*)hit.begin(), hit.size())
            != (ssize_t)hit.size()) {
            fprintf(stderr, "Client error: Failed to send response to client\n");
            return ;
        }
        return ;
    }

    auto header = readHeader(client_rio, info.host);
    if (header == "$") {
        fprintf(stderr, "Client error: Failed to read request header\n");
        return ;
    }

    FileDiscriptor serverfd = open_clientfd((char*)info.host.c_str(),
                                            (char*)info.port.c_str());
    if (serverfd < 0) {
        fprintf(stderr, "Client error: Failed to connect to %s:%s\n",
                info.host.c_str(), info.port.c_str());
        return ;
    }

    rio_t server_rio;
    rio_readinitb(&server_rio, serverfd);
    buffer_t buf;
    sprintf(buf, "GET %s HTTP/1.0\r\n%s", info.path.c_str(), header.c_str());
    if (rio_writen(serverfd, buf, strlen(buf)) != (ssize_t)strlen(buf)) {
        fprintf(stderr, "Client error: Failed to send request to server\n");
        return ;
    }

    std::string cached;
    bool oversized = false;
    while (int current = rio_readnb(&server_rio, buf, MAXLINE)) {
        if (current < 0) {
            fprintf(stderr, "Client error: Failed to read response from server\n");
            return ;
        }
        if (rio_writen(client_rio.rio_fd, buf, current) != (ssize_t)current) {
            fprintf(stderr, "Client error: Failed to send response to client\n");
            return ;
        }
        if (!oversized && cached.size() + current <= MAX_OBJECT_SIZE) {
            cached.append(buf, current);
        } else {
            oversized = true;
            cached.clear(), cached.shrink_to_fit();
        }
    }
    if (!oversized) {
        storeCache(fineUrl, cached);
    }
}

void clientServer(FileDiscriptor connfd) {
    rio_t client_rio;
    buffer_t buf;
    rio_readinitb(&client_rio, connfd);
    if (rio_readlineb(&client_rio, buf, MAXLINE) <= 0) {
        fprintf(stderr, "Client error: Failed to read request line\n");
        return ;
    }

    buffer_t method, url, version;
    if (sscanf(buf, "%s %s %s", method, url, version) != 3) {
        fprintf(stderr, "Client error: Invalid request line %s\n", buf);
        return ;
    }

    if (!strcasecmp(method, "GET")) {
        doGet(client_rio, url);
    } else {
        fprintf(stderr, "Client error: Unsupported method %s\n", method);
        return ;
    }
}
