#!/usr/bin/env bash

INPUT_VIDEO_PATH="$1"
if [ ! -f "$INPUT_VIDEO_PATH" ] ; then
	echo "INPUT_FILE not found: $1"; exit 1
fi
PARENT_DIR=$(dirname "$INPUT_VIDEO_PATH")
OUTPUT_VIDEO_PATH="${PARENT_DIR}/shrink-$(basename $INPUT_VIDEO_PATH)"

ffmpeg -c:v libx265 -crf 28 -pix_fmt yuv420p -tag:v hvc1 -movflags +faststart -c:a copy "$OUTPUT_VIDEO_PATH" -i "$INPUT_VIDEO_PATH"

exit 0