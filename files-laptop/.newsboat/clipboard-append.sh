#!/bin/sh

printf "%s%s " "$(xsel -o -b | sed q)" "$1" | xsel -b
