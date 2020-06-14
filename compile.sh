#!/bin/sh

SDL_LIBS="-s USE_SDL=2 -s USE_SDL_IMAGE=2 -s USE_SDL_TTF=2 -s USE_SDL_MIXER=2"

emconfigure ./configure SDL_LIBS="$SDL_LIBS" LIBS="$SDL_LIBS" CXX=em++ CC=em++

emmake make SDL_LIBS="$SDL_LIBS" CXX=em++ CC=em++

cp src/pacman src/pacman.bc

em++ src/pacman.bc -o pacman.html $SDL_LIBS --preload-file data/@/usr/local/share/pacman/ --use-preload-plugins -s EXIT_RUNTIME=1 
