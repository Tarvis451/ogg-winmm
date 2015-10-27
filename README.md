# ogg-winmm CD Audio Emulator

This project (originally by Hifi and forked by Tarvis451) uses .ogg music files on the disk
to emulate CD tracks, replacing the need otohave a CD in the drive
to play music in certain games. Good Old Games uses a modified version
for several of their games. 

WHAT'S NEW IN THIS FORK?:

- Implemented partially mciSendStringA to support more games (Tested on Ultim@te Race Pro)
- Easier to implement token-based commands in fake_mciSendStringA
- Added missing "joyConfigChanged" function in stubs.c
- Fixed some minor bugs

WINDOWS 10 SUPPORT:

Thanks to Tarvis451 the ogg-winmm is working on Windows 10 without any issues.

BUILDING:

By default the makefile looks in a "libs\include" subdirectory for 
"ogg" and "vorbis" dependencies.

Run "make" in the folder to build winmm.dll. Copy it into the same folder
as the executable of the game you want to emulate CD music for.

USAGE:

Copy "winmm.dll" into the same folder as the executable of the game you want 
to emulate CD music for.

In the same folder, make a "Music" subdirectory. Place the recorded music files
from the disk as track02.ogg, track03.ogg, and so on in this Music folder. Remember,
it starts with track02!

Now, instead of playing music from the CD, the game will play music from these
files instead.
