@echo off
chcp 1250
set /p "video=Link: "
youtube-dlp.exe -F %video%
pause
goto end
:end