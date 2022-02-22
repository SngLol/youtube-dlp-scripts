@echo off
chcp 1250
set /p "video=Link: "
youtube-dlp.exe -o Temp/%%(title)s.%%(ext)s %video% -f bestvideo+bestaudio --merge-output-format mkv
FOR %%F IN (Temp\*) DO (set name=%%~nF)
FOR %%F IN (Temp\*) DO (set filename=%%F)
IF NOT EXIST "Temp/%name%.mkv" GOTO move
ffmpeg.exe -i "Temp/%name%.mkv" -c:v copy "VR Downloads/%name%.mp4"
@RD /S /Q Temp
goto end
:move
move "%filename%" "VR Downloads"
@RD /S /Q Temp
:end