# -*- Mode: Makefile; -*-
CC=mpicc
CFLAGS=-fpie -pie -rdynamic -pthread -g3 -O3 -Wall
BSPMM_COMMON_SRC=bspmm_common.c
BINS=bspmm_profile
ifeq ($(LDFLAGS),)
LDFLAGS=-L$(HOME)/local/lib -lopenblas -Wl,-rpath=$(HOME)/local/lib
endif
C_INCLUDE=-I$(HOME)/local/include

all: $(BINS)

bspmm_profile: bspmm_profile.c $(BSPMM_COMMON_SRC)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(C_INCLUDE)

clean:
	rm -f $(BINS)
