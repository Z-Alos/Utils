#!/bin/bash

dirName="$(date +%B)$(date +%d)"

while getopts u: flag
do 
    case "${flag}" in 
        u) url=${OPTARG};;
    esac
done

cd "$HOME/Downloads/LiveStream/" 
source deez/bin/activate &&

mkdir "$dirName" &&
cd "$dirName"

yt-dlp -f "bestvideo+bestaudio/best" --merge-output-format mp4 --no-part --live-from-start -o "%(title)s.%(ext)s" "$url"





