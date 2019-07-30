REV=$(shell sh -c 'git rev-parse --short @{0}')

all: wav-winmm.dll

wav-winmm.rc.o: wav-winmm.rc.in
	sed 's/__REV__/$(REV)/g' wav-winmm.rc.in | sed 's/__FILE__/wav-winmm/g' | mingw32-windres -O coff -o wav-winmm.rc.o

wav-winmm.dll: wav-winmm.c wav-winmm.rc.o wav-winmm.def player.c stubs.c
	mingw32-gcc -std=gnu99 -Wl,--enable-stdcall-fixup -Ilibs/include -O2 -shared -s -o wav-winmm.dll wav-winmm.c player.c stubs.c wav-winmm.def wav-winmm.rc.o -L. -lvorbisfile-3 -lwinmm -static-libgcc

wav-winmm-debug.dll: wav-winmm.c wav-winmm.rc.o wav-winmm.def player.c stubs.c
	mingw32-gcc -std=gnu99 -Wl,--enable-stdcall-fixup -Ilibs/include -O2 -shared -s -o wav-winmm-debug.dll -D _DEBUG wav-winmm.c player.c stubs.c wav-winmm.def wav-winmm.rc.o -L. -lvorbisfile-3 -lwinmm -static-libgcc

clean:
	rm -f wav-winmm.dll wav-winmm.rc.o
