#include "utils.h"
#include "csapp.h"

const char* USER_AGENT_HDR = "User-Agent: Mozilla/5.0 "
    "(X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n";

FileDiscriptor::operator int() const { return *fdptr; }
FileDiscriptor::FileDiscriptor(int fd) {
    fdptr = std::shared_ptr<int>(new int(fd), [](int *p) {
        if (*p > 0) Close(*p); // automatic close on delete
        delete p;
    });
}
