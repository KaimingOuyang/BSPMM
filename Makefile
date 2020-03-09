# -*- Mode: Makefile; -*-
CC=mpicc
CFLAGS= -g3 -O3 -Wall -DFINE_TIME
BSPMM_COMMON_SRC=bspmm_common.c
BINS=bspmm_single
LDFLAGS=-L$(HOME)/local/lib -lopenblas -Wl,-rpath=$(HOME)/local/lib
C_INCLUDE_FLAGS=-I$(HOME)/local/include

all: $(BINS)

bspmm_single: bspmm_single.c $(BSPMM_COMMON_SRC)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(C_INCLUDE_FLAGS)

clean:
	rm -f $(BINS)
