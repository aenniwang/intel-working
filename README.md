
strchr
======
Fast strchr implementation and handling Chinese characters.

glibc-linking
=============
-. Linking with the seperate glibc build tree

Q: 
david@dev-davidwork:~/working/intel-working/glibc-linking$ ./glibc-122
-bash: ./glibc-122: /home/david/working/glibc/glibc-2.22/build/elf/ld.so -Wl: bad ELF interpreter: No such file or directory
david@dev-davidwork:~/working/intel-working/glibc-linking$ ldd glibc-122
        linux-vdso.so.1 =>  (0x00007ffd7efe4000)
        libc.so.6 => /home/david/working/glibc/glibc-2.22/build/libc.so.6 (0x00007ffa29d8d000)
        /home/david/working/glibc/glibc-2.22/build/elf/ld.so -Wl => /lib64/ld-linux-x86-64.so.2 (0x00007ffa2a130000)

Why ld.so still linked to system ld?
A: Put "-Wl,-rpath" before "-Wl,--dynamic-linker"

Q:

=5= calling glibc-icc-122
        linux-vdso.so.1 =>  (0x00007fffb5ba6000)
        libm.so.6 => /home/david/working/glibc/glibc-2.22/build/math/libm.so.6 (0x00007f23fa326000)
        libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f23fa0f5000)
        libc.so.6 => /home/david/working/glibc/glibc-2.22/build/libc.so.6 (0x00007f23f9d53000)
        libdl.so.2 => /lib64/libdl.so.2 (0x00007f23f9b4f000)
        /home/david/working/glibc/glibc-2.22/build/elf/ld.so => /lib64/ld-linux-x86-64.so.2 (0x00007f23fa625000)
./glibc-icc-122
./glibc-icc-122: error while loading shared libraries: libgcc_s.so.1: wrong ELF class: ELFCLASS32
make: *** [all] Error 127

A: Add /lib64 in the rpath library
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


Linking with new glibc tree at Runtime
======================================
builddir=`dirname "$0"`
GCONV_PATH="${builddir}/iconvdata" \
exec   env GCONV_PATH="${builddir}"/iconvdata LOCPATH="${builddir}"/localedata LC_ALL=C  "${builddir}"/elf/ld-linux-x86-64.so.2 --library-path "${builddir}":"${builddir}"/math:"${builddir}"/elf:"${builddir}"/dlfcn:"${builddir}"/nss:"${builddir}"/nis:"${builddir}"/rt:"${builddir}"/resolv:"${builddir}"/crypt:"${builddir}"/mathvec:"${builddir}"/nptl ${1+"$@"}

LD_LIBRARY_PATH and -Wl,-rpath
==============================
  Any directories specified by -rpath-link options.
       2.  Any directories specified by -rpath options.  The difference between -rpath and -rpath-link is that directories specified by -rpath options are included in the executable and used at runtime, whereas the -rpath-link option is only effective at link time. Searching -rpath in this way is only supported by native linkers and cross linkers which have been configured with the --with-sysroot option.
       3.  On an ELF system, for native linkers, if the -rpath and -rpath-link options were not used, search the contents of the environment variable "LD_RUN_PATH".
       4.  On SunOS, if the -rpath option was not used, search any directories specified using -L options.
       5.  For a native linker, the search the contents of the environment variable "LD_LIBRARY_PATH".
       6.  For a native ELF linker, the directories in "DT_RUNPATH" or "DT_RPATH" of a shared library are searched for shared libraries needed by it. The "DT_RPATH" entries are ignored if "DT_RUNPATH" entries exist.
       7.  The default directories, normally /lib and /usr/lib.
       8.  For a native linker on an ELF system, if the file /etc/ld.so.conf exists, the list of directories found in that file.
       If the required shared library is not found, the linker will issue a warning and continue with the link.

Static libary search path
=========================
Specified by '-L'
or 
Give out library(.a) used.
