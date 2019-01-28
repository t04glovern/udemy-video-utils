#!/bin/bash

cd input
for line in *.mp4;
  do name=`echo $line | cut -d'.' -f1`;
  echo $line;
  echo $name;
  ffmpeg -i $line -i ../media/base/icon.png -filter_complex "overlay=10:main_h-overlay_h-10" "../output/${name}-layered.mp4"
  ffmpeg -i ../media/base/intro.mp4 -i "../output/${name}-layered.mp4" -filter_complex "[0:v:0] [0:a:0] [1:v:0] [1:a:0] concat=unsafe=1:n=2:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" "../output/${name}-v2.0.mp4"
done
