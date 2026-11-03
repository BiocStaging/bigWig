#
# compiler definitions for R
#

CC:=$(shell $(R_HOME)/bin/R CMD config CC)
# Use uname -m for the actual CPU architecture; avoids Rosetta2 mismatch
# where x86_64 R on Apple Silicon reports aarch64 from R.version$arch.
MACHTYPE:=$(shell uname -m | sed 's/arm64/aarch64/')
LDFLAGS:=$(shell $(R_HOME)/bin$(R_ARCH_BIN)/R CMD config LDFLAGS)
CPICFLAGS:=$(shell $(R_HOME)/bin$(R_ARCH_BIN)/R CMD config CPICFLAGS)
# Suppress deprecated empty-prototype warnings in jkweb headers included
# by the main package C files (clang on macOS; GCC silently ignores unknown -Wno-*)
COPT:=-Wno-deprecated-non-prototype
CFLAGS += $(shell $(R_HOME)/bin$(R_ARCH_BIN)/R CMD config CFLAGS) $(CPICFLAGS) -I${R_HOME}/include 
