# youtube-dlp-scripts
A collection of scripts for easier use of youtube-dlp

All scripts uses ffmpeg.exe to convert downloaded mkv to mp4.
Download ffmpeg and put ffmpeg.exe alongside the scripts. Same goes for youtube-dlp.exe

download-audio.bat :
Will take a youtube video link and download its audio only into an "Audio Downloads" subfolder. If errors, create subfolder manually.

download-playlist.bat :
Will take a youtube playlist link and download all videos in order specified on youtube website into a subfolder named the same as the playlist on youtube.
Videos will have their name appended with 001-999 before video name.
Will ask "Use Archive?". Yes: will create "archive.txt" under subfolder "Archive". This will collect downloaded urls to prevent redownloads when "Updating" a playlist.

download-video-hd.bat :
Will take a youtube video link and download in highest available quality into "Video Downloads" subfolder. If errors, create subfolder manually.

download-video-custom.bat :
Will take a youtube video link and download only in specified quality into "Video Downloads" subfolder. If errors, create subfolder manually.
For full functionality requires use of "check-video-qualities.bat".
Will ask for desired video quality to download in. Might not work for all videos.
If it does not work, use "check-video-qualities.bat" and copy index number of desired quality. Input index number after choosing "Custom" in "download-video-custom.bat".

check-video-qualities.bat :
Will take a youtube video link and output all available quality options along with their index number.

download-vr.bat :
Will take a youtube VR video link and dowload in VR viewable format into "VR Downloads" subfolder. If errors, create subfolder manually.

update.bat :
Will update your "youtube-dlp.exe".
Run this script if there are errors in any/all other scripts during normal use.
