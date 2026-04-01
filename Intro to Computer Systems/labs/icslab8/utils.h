#pragma once

#include "csapp.h"
#include <memory>

typedef char buffer_t[MAXLINE];

struct FileDiscriptor {
    std::shared_ptr<int> fdptr;
    operator int() const;
    FileDiscriptor(int fd);
};

extern const char *USER_AGENT_HDR;

/* Recommended max cache and object sizes */
#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400
#define MAX_CACHED_NUM 10
