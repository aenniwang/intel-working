# Test with gcc and icc
CC=gcc
ICC_ROOT:=/opt/intel/compilers_and_libraries/linux/bin/

GLIBC122_ROOT=/home/david/working/glibc/glibc-2.22/build
GLIBC122_STATIC_FLAGS= -L"${GLIBC122_ROOT}:${GLIBC122_ROOT}/math:\
${GLIBC122_ROOT}/elf:\
${GLIBC122_ROOT}/dlfcn:\
${GLIBC122_ROOT}/nss:\
${GLIBC122_ROOT}/nis:\
${GLIBC122_ROOT}/rt:\
${GLIBC122_ROOT}/resolv:\
${GLIBC122_ROOT}/crypt:\
${GLIBC122_ROOT}/nptl:\
${GLIBC122_ROOT}/dfp " 

# To fix following error:
GLIBC122_ROOT=/home/david/working/glibc/glibc-2.22/build
GLIBC122_FLAGS= -Wl,-rpath="${GLIBC122_ROOT}:\
/lib64:\
${GLIBC122_ROOT}/math:\
${GLIBC122_ROOT}/elf:\
${GLIBC122_ROOT}/dlfcn:\
${GLIBC122_ROOT}/nss:\
${GLIBC122_ROOT}/nis:\
${GLIBC122_ROOT}/rt:\
${GLIBC122_ROOT}/resolv:\
${GLIBC122_ROOT}/crypt:\
${GLIBC122_ROOT}/nptl:\
${GLIBC122_ROOT}/dfp "  -Wl,--dynamic-linker=${GLIBC122_ROOT}/elf/ld.so 

all: glibc-os glibc-122 glibc-122-static  glibc-icc-os glibc-icc-122 glibc-icc-122-static
	@echo "=1= calling glibc-os"
	@ldd ./glibc-os
	./glibc-os
	@echo ""
	@echo "=2= calling glibc-122"
	@ldd ./glibc-122
	./glibc-122
	@echo ""
	@echo "=3= calling glibc-122-static"
	@-ldd ./glibc-122-static 
	./glibc-122-static
	@echo ""
	@echo "=4= calling glibc-icc-os"
	@ldd ./glibc-icc-os
	./glibc-icc-os
	@echo ""
	@echo "=5= calling glibc-icc-122"
	@ldd ./glibc-icc-122
	./glibc-icc-122
	@echo ""
	@echo "=6= calling glibc-icc-122-static"
	@-ldd ./glibc-icc-122-static 
	./glibc-icc-122-static
	@echo ""


glibc-os:
	$(CC) -Wl,-Map,linker.system.map -o glibc-os main.c 

glibc-122:
	$(CC) ${GLIBC122_FLAGS} -Wl,-Map,linker.122.map  -o glibc-122 main.c

glibc-122-static:
	$(CC) -L${GLIBC122_ROOT} -Wl,-Map,linker.122.static.map -static -o glibc-122-static main.c
	#$(CC) ${GLIBC122_STATIC_FLAGS} -Wl,-Map,linker.122.static.map -static -o glibc-122-static main.c

glibc-icc-os:
	. ${ICC_ROOT}/compilervars.sh intel64
	icc main.c -Wl,-Map,linker.icc.map -o glibc-icc-os

glibc-icc-122:
	. ${ICC_ROOT}/compilervars.sh intel64
	icc ${GLIBC122_FLAGS_ICC} -Wl,-Map,linker.icc.122.map -o glibc-icc-122 main.c

glibc-icc-122-static:
	. ${ICC_ROOT}/compilervars.sh intel64
	icc -L${GLIBC122_ROOT} --static -Wl,-Map,linker.icc.122.static.map -o glibc-icc-122-static main.c

clean: 
	@-rm glibc*
