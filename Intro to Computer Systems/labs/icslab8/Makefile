#
# Makefile for Proxy Lab 
#
# You may modify this file any way you like (except for the handin
# rule). Autolab will execute the command "make" on your specific 
# Makefile to build your proxy from sources.
#
CC = gcc
CPPC = g++

W_FLAGS = -Wall -Wextra
D_FLAGS = -g -DDEBUG
C_STD = -std=c2x
CPP_STD = -std=c++2a
C_FLAGS = $(C_STD) $(W_FLAGS)
CPP_FLAGS = $(CPP_STD) $(W_FLAGS)

ifdef DEBUG
CFLAGS = $(C_FLAGS) $(D_FLAGS)
CPPFLAGS = $(CPP_FLAGS) $(D_FLAGS)
else
CFLAGS = $(C_FLAGS) -O2
CPPFLAGS = $(CPP_FLAGS) -O2
endif

LDFLAGS = -lpthread

all: proxy

csapp.o: csapp.c csapp.h
# just compile without any special flags to avoid warnings,
# since csapp.c has so much old-style code.
# 	$(CC) $(CFLAGS) -c csapp.c
	$(CC) -c csapp.c

utils.o: utils.cpp utils.h
	$(CPPC) $(CPPFLAGS) -c utils.cpp

client.o: client.cpp client.h utils.h cache.h
	$(CPPC) $(CPPFLAGS) -c client.cpp

cache.o: cache.cpp cache.h utils.h
	$(CPPC) $(CPPFLAGS) -c cache.cpp

proxy.o: proxy.cpp utils.h csapp.h client.h cache.h
	$(CPPC) $(CPPFLAGS) -c proxy.cpp

proxy: proxy.o csapp.o utils.o client.o cache.o
	$(CPPC) $(CPPFLAGS) proxy.o utils.o client.o cache.o csapp.o -o proxy $(LDFLAGS)

# Creates a tarball in ../proxylab-handin.tar that you should then
# hand in to Autolab. DO NOT MODIFY THIS!
handin:
	(make clean; cd ..; tar czvf proxylab-handin.tar.gz proxylab-handout)

clean:
	rm -rf *~ *.o proxy core *.tar *.zip *.gzip *.bzip *.gz .proxy .noproxy
