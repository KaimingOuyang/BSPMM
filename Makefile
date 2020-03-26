# -*- Mode: Makefile; -*-
CC=mpicc
CFLAGS=-fpie -pie -rdynamic -pthread -g3 -O3 -Wall
BSPMM_COMMON_SRC=bspmm_common.c
BINS=bspmm_normal
LDFLAGS=-L$(HOME)/local/lib -lopenblas -Wl,-rpath=$(HOME)/local/lib
C_INCLUDE_FLAGS=-I$(HOME)/local/include

all: $(BINS)

bspmm_normal: bspmm_normal.c $(BSPMM_COMMON_SRC)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(C_INCLUDE_FLAGS)

clean:
	rm -f $(BINS)
