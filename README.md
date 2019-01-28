# Video Utils

## Overlay Icons

```bash
ffmpeg -i <input>.mp4 -i media/base/icon.png \
    -filter_complex "overlay=10:main_h-overlay_h-10" \
    <input>-overlay.mp4
```

## Merge Videos

```bash
ffmpeg -i media/base/intro.mp4 -i <input>-overlay.mp4 \
    -filter_complex "[0:v:0] [0:a:0] [1:v:0] [1:a:0] concat=unsafe=1:n=2:v=1:a=1 [v] [a]" \
    -map "[v]" -map "[a]" <input>-v2.0.mp4
```
