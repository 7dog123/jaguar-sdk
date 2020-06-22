#====================================================================
#       Macro & Assembler flags
#====================================================================

# BJL/in-RAM start address
STADDR = 4000

# BSS follows directly after text and data sections
BSSADDR = x

# Default alignment is double-phrase.  This can be overriden on the
# make command line, or before including this fragment in a Makefile.
ALIGN ?= d

ASMFLAGS = -fb -g -r$(ALIGN)
# Link flags:
#  -e  - Output using COF file format
#  -g  - Output source level debugging (where supported)
#  -l  - Add local symbols
#  -r<N> - Align sections to requested boundaries
#  -a  - Absolute section addresses
LINKFLAGS = -e -g -l -r$(ALIGN) -a $(STADDR) x $(BSSADDR)

# Enable additional logging if requested on the command line.
V ?= 0
VERBOSE =
ifeq ($(V),1)
  VERBOSE += -v
endif
ifeq ($(V),2)
  VERBOSE += -v -v
endif

LINKFLAGS += $(VERBOSE)

# Use rmac and rln as the assembler/linker respectively.
ASM = rmac
LINK = rln

# Use gcc to build C files
CFLAGS ?= -O2
CDEFS = -DJAGUAR
CC = m68k-aout-gcc

# Default build target
all:
.PHONY: all
