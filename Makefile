REV=$(shell sh -c 'git rev-parse --short @{0}')

all: wav-winmm.dll

wav-winmm.rc.o: wav-winmm.rc.in
	sed 's/__REV__/$(REV)/g' wav-winmm.rc.in | sed 's/__FILE__/wav-winmm/g' | i586-mingw32msvc-windres -O coff -o wav-winmm.rc.o

wav-winmm.dll: wav-winmm.c wav-winmm.def wav-winmm.rc.o
	i586-mingw32msvc-gcc -Wl,--enable-stdcall-fixup -O2 -shared -s -o wav-winmm.dll wav-winmm.c wav-winmm.def wav-winmm.rc.o -lwinmm

clean:
	rm -f wav-winmm.dll wav-winmm.rc.o