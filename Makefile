# -*- Mode: Makefile; -*-
CC=mpicc
CFLAGS= -g3 -O3 -Wall
BSPMM_COMMON_SRC=bspmm_common.c
BINS=bspmm_single

all: $(BINS)

bspmm_single: bspmm_single.c $(BSPMM_COMMON_SRC)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	rm -f $(BINS)
