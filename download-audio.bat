@echo off
set /p "link=Link: "
youtube-dlp.exe -o "Audio Downloads/%%(title)s.%%(ext)s" --extract-audio --audio-format mp3 --audio-quality 0 %link%