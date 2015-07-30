GLIBC122_ROOT="/home/david/working/glibc/glibc-2.22/build"
GLIBC122_FLAGS= -L${GLIBC122_ROOT}/lib -Wl,-rpath=${GLIBC122_ROOT}/rel/lib  -Wl,--dynamic-linker=${GLIBC122_ROOT}/elf/ld.so -I${GLIBC122_ROOT} -I${GLIBC122_ROOT}/include

all: mul-static

mul:
	    gcc main.c -lm -o mul

#
# new libraries and new headfiles.
mul-static-source:
	    #gcc main.c -nostdlib -lm -o mul_static
		gcc  ${GLIBC122_FLAGS} -lc -lm -o mul_static main.c

# 
# Linking with local libraries but using system header files
mul-static:
		gcc  -Wl,--rpath=./libs -Wl,--dynamic-linker=./libs/ld.so -lc -lm -o mul_static main.c

