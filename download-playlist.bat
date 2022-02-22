@echo off
chcp 1250
set /p "list=Link: "
choice /c:yn /m "Use Archive? [Y/N]"
IF %ERRORLEVEL%==2 GOTO noarch
choice /c:123 /m "Download in 1: MP3 / 2: MP4 / 3: MP4 HD"
IF %ERRORLEVEL%==3 GOTO mp4hd
IF %ERRORLEVEL%==2 GOTO mp4
youtube-dlp.exe -o "%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --ignore-errors --download-archive "archive/archive.txt" %list%
goto end
:mp4
youtube-dlp.exe -o "%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --yes-playlist --ignore-errors --download-archive "archive/archive.txt" %list% -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best
goto end
:mp4hd
youtube-dlp.exe -o "%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --yes-playlist --ignore-errors --download-archive "archive/archive.txt" %list% -f bestvideo+bestaudio --merge-output-format mkv --recode-video mp4
goto end
:noarch
youtube-dlp.exe -o "%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --ignore-errors %list%
goto end
:mp4
youtube-dlp.exe -o "%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --yes-playlist --ignore-errors %list% -f bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best
goto end
:mp4hd
youtube-dlp.exe -o "%%(playlist)s/%%(playlist_index)s - %%(title)s.%%(ext)s" --yes-playlist --ignore-errors %list% -f bestvideo+bestaudio --merge-output-format mkv --recode-video mp4
rem for /d %%a in (Temp\*) do set "folderName=%%a"
rem Setlocal EnableDelayedExpansion
rem set playlist=!folderName:Temp\=!
rem :convert
rem FOR %%F IN (%folderName%\*) DO (
rem	set name=%%~nF
rem	set filename=%%F
rem	ffmpeg.exe -i "!filename!" -c:v copy "%playlist%/!name!.mp4"
rem )
rem @RD /S /Q Temp
:end