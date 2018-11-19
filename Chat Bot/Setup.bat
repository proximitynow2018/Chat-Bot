@echo off
cd settings
title Chat Bot Setup
echo Chat Bot Setup
echo github.com/proximitynow2018/chat-bot
echo.
echo Speech File Name (Do 'none' for default)
set /p name=
cls
echo Chat Bot Setup
echo github.com/proximitynow2018/chat-bot
echo.
echo Your Name
set /p yname=
cls
echo Chat Bot Setup
echo github.com/proximitynow2018/chat-bot
echo.
echo Applying Settings...
echo %name%>speech.dat
echo Applied %name% to settings/speech.dat
echo %yname%>name.dat
echo Applied %yname% to settings/name.dat
echo All Done!
echo Terminating Program...