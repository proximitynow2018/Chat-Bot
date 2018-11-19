@echo off
title Chat Bot
:test1
if exist Settings-Speech.dat (
goto test2
) else (
echo Please run the setup.bat
pause
goto exit
)
:test2
if exist Settings-Name.dat (
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