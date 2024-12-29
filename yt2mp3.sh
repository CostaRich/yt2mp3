#!/bin/bash

# Extend the PATH to include common binary locations
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Variables for tool paths
YT_DLP_PATH=$(command -v yt-dlp)
FFMPEG_PATH=$(command -v ffmpeg)

# Directory where downloaded files will be stored
DOWNLOAD_DIR=~/Music/yt
mkdir -p "$DOWNLOAD_DIR"

# Initialize an error message variable
ERROR_MESSAGE=""

# Function to display a macOS dialog box with accumulated errors
display_errors() {
    if [[ -n "$ERROR_MESSAGE" ]]; then
        osascript <<EOF
        tell app "System Events"
            display dialog "$ERROR_MESSAGE" buttons {"OK"} default button 1 with title "YT2MP3 Downloader" with icon caution
        end tell
EOF
        exit 1
    fi
}

# Pre-check: Ensure yt-dlp is installed and executable
if [[ -z "$YT_DLP_PATH" || ! -x "$YT_DLP_PATH" ]]; then
    ERROR_MESSAGE+="• yt-dlp is not installed. Install it via Homebrew (brew install yt-dlp) or from the official site: https://github.com/yt-dlp/yt-dlp\n"
fi

# Pre-check: Ensure ffmpeg is installed and executable
if [[ -z "$FFMPEG_PATH" || ! -x "$FFMPEG_PATH" ]]; then
    ERROR_MESSAGE+="• ffmpeg is not installed. Install it via Homebrew (brew install ffmpeg) or from the official site: https://ffmpeg.org\n"
fi

# Display errors if any tools are missing
display_errors

# Get input from clipboard or command-line argument
input=${1:-$(pbpaste)}

# Function to check if input looks like a YouTube video ID
is_youtube_id() {
    [[ "$1" =~ ^[a-zA-Z0-9_-]{11}$ ]]
}

# Prepare the URL based on input
if is_youtube_id "$input"; then
    url="https://www.youtube.com/watch?v=$input"
else
    url="$input"
fi

# Validate the URL
if ! [[ "$url" =~ ^https?:// ]]; then
    ERROR_MESSAGE+="• The input is invalid. Please provide a valid URL or YouTube video ID.\n"
    display_errors
fi

# Attempt to download and convert the video
"$YT_DLP_PATH" -f bestaudio \
    --extract-audio --audio-format mp3 --audio-quality 0 \
    --embed-thumbnail \
    --ffmpeg-location "$FFMPEG_PATH" \
    -o "$DOWNLOAD_DIR/%(title)s.%(ext)s" "$url"

# Check if the download succeeded
if [[ $? -eq 0 ]]; then
    osascript -e "display notification \"Download complete! Check $DOWNLOAD_DIR for your MP3.\" with title \"YT2MP3 Downloader\""
else
    osascript -e "display notification \"Download failed. Please check the input and try again.\" with title \"YT2MP3 Downloader\""
    exit 1
fi
