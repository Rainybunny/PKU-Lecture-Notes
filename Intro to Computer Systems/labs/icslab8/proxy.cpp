/*
 * name: Rainybunny
 * student-id: 20120712
 */
#include "csapp.h"
#include "utils.h"
#include "client.h"
#include <thread>
#include <memory>
#include <cstdio>

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <port>\n", argv[0]);
        return 1;
    }
    signal(SIGPIPE, SIG_IGN);

    FileDiscriptor listenfd = Open_listenfd(argv[1]);
    while (true) {
        sockaddr_storage clientaddr;
        socklen_t clientlen = sizeof(clientaddr);
        FileDiscriptor connfd = accept(listenfd, (SA*)&clientaddr, &clientlen);
        if (connfd < 0) {
            perror("Accept error");
            continue;
        }
        std::thread thr(clientServer, connfd);
        thr.detach();
    }
    return 0;
}
