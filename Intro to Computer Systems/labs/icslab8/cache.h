#pragma once

#include "utils.h"
#include <iostream>

std::pair<std::string_view, bool> fetchCache(const std::string& url);
void storeCache(const std::string& url, const std::string& content);