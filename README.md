
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


Linking with new glibc tree at Runtime
======================================
builddir=`dirname "$0"`
GCONV_PATH="${builddir}/iconvdata" \
exec   env GCONV_PATH="${builddir}"/iconvdata LOCPATH="${builddir}"/localedata LC_ALL=C  "${builddir}"/elf/ld-linux-x86-64.so.2 --library-path "${builddir}":"${builddir}"/math:"${builddir}"/elf:"${builddir}"/dlfcn:"${builddir}"/nss:"${builddir}"/nis:"${builddir}"/rt:"${builddir}"/resolv:"${builddir}"/crypt:"${builddir}"/mathvec:"${builddir}"/nptl ${1+"$@"}


