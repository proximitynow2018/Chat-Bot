@echo off
title Chat Bot
if exist Settings.dat (
goto start
) else (
echo Please run the setup.bat
pause
goto exit
)
:start
echo Reading Settings Folder...
pause
goto exit
:exit