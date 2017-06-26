# Test with gcc and icc
CC=gcc

GLIBC122_ROOT=/home/david/working/glibc/glibc-2.22/build
GLIBC122_FLAGS= -Wl,-rpath="${GLIBC122_ROOT}:${GLIBC122_ROOT}/math:\
${GLIBC122_ROOT}/elf:\
${GLIBC122_ROOT}/dlfcn:\
${GLIBC122_ROOT}/nss:\
${GLIBC122_ROOT}/nis:\
${GLIBC122_ROOT}/rt:\
${GLIBC122_ROOT}/resolv:\
${GLIBC122_ROOT}/crypt:\
${GLIBC122_ROOT}/nptl:\
${GLIBC122_ROOT}/dfp "  -Wl,--dynamic-linker=${GLIBC122_ROOT}/elf/ld.so 

all: glibc-os glibc-122 glibc-122-static
	@echo "=1= calling glibc-os"
	@ldd ./glibc-os
	./glibc-os
	@echo ""
	@echo "=2= calling glibc-122"
	@ldd ./glibc-122
	./glibc-122
	@echo ""
	@echo "=1= calling glibc-122-static"
	@-ldd ./glibc-122-static 
	./glibc-122-static
	@echo ""


glibc-os:
	$(CC) main.c -o glibc-os

glibc-122:
	$(CC) ${GLIBC122_FLAGS}  -o glibc-122 main.c

glibc-122-static:
	$(CC) ${GLIBC122_FLAGS} --static -o glibc-122-static main.c

clean: 
	@-rm glibc*
