@echo off
setlocal EnableDelayedExpansion
(set nl=^
%=EMPTY=%
)
set /p "video=Link: "
choice /n /c:1234567 /m "Choose video quality!nl!1: 1080p!nl!2: 720p!nl!3: 480p!nl!4: 360p!nl!5: 240p!nl!6: 144p!nl!7: Custom!nl!"
rem setlocal DisableDelayedExpansion
cls
IF %ERRORLEVEL%==2 GOTO p720
IF %ERRORLEVEL%==3 GOTO p480
IF %ERRORLEVEL%==4 GOTO p360
IF %ERRORLEVEL%==5 GOTO p240
IF %ERRORLEVEL%==6 GOTO p144
IF %ERRORLEVEL%==7 GOTO pCus
youtube-dlp.exe -o "Video Downloads/%%(title)s.%%(ext)s" %video% -f "[height <=? 1080][ext=mp4]"
goto end
:p720
youtube-dlp.exe -o "Video Downloads/%%(title)s.%%(ext)s" %video% -f "[height <=? 720][ext=mp4]/[height >=? 720][ext=mp4]"
goto end
:p480
youtube-dlp.exe -o "Video Downloads/%%(title)s.%%(ext)s" %video% -f "[height <=? 480][ext=mp4]/[height >=? 480][ext=mp4]"
goto end
:p360
youtube-dlp.exe -o "Video Downloads/%%(title)s.%%(ext)s" %video% -f "[height <=? 360][ext=mp4]/[height >=? 360][ext=mp4]"
goto end
:p240
youtube-dlp.exe -o "Video Downloads/%%(title)s.%%(ext)s" %video% -f "133+bestaudio/160+bestaudio/[height >=? 360][ext=mp4]"
goto end
:p144
youtube-dlp.exe -o "Video Downloads/%%(title)s.%%(ext)s" %video% -f "160+bestaudio/133+bestaudio/[height >=? 360][ext=mp4]"
goto end
:pCus
set /p "q=Quality: "
youtube-dlp.exe -o "Video Downloads/%%(title)s.%%(ext)s" %video% -f "%q%+bestaudio"
goto end
:end