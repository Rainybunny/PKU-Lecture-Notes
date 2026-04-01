#include "utils.h"
#include "cache.h"
#include <atomic>
#include <mutex>
#include <shared_mutex>
#include <unordered_map>

static std::mutex stampMutex;
static int globalTimestamp = 0;

struct CacheEntry {
    std::string content;
    int timestamp;
};

static std::shared_mutex cacheMutex;
static std::unordered_map<std::string, CacheEntry> cache;

std::pair<std::string_view, bool> fetchCache(const std::string& url) {
    std::shared_lock<std::shared_mutex> rlock(cacheMutex);
    auto it = cache.find(url);
    if (it != cache.end()) {
        { // limit slock's lifetime
            // if locked, rlock is held, no deadlock
            std::lock_guard<std::mutex> slock(stampMutex);
            // we don't use atomic_int here
            // to make the following statement atomic as a whole
            it->second.timestamp = globalTimestamp++;
        }
        return { std::string_view(it->second.content), true };
    } else {
        return { "", false };
    }
}

void storeCache(const std::string& url, const std::string& content) {
    std::unique_lock<std::shared_mutex> wlock(cacheMutex);
    // try lock this after cacheMutex to avoid deadlock
    std::lock_guard<std::mutex> slock(stampMutex);
    if (cache.size() < MAX_CACHED_NUM) {
        cache[url] = { content, globalTimestamp++ };
    } else {
        // evict the least recently used entry
        auto lruIt = cache.begin();
        for (auto it = cache.begin(); it != cache.end(); ++it) {
            if (it->second.timestamp < lruIt->second.timestamp) {
                lruIt = it;
            }
        }
        cache.erase(lruIt);
        cache[url] = { content, globalTimestamp++ };
    }
}
