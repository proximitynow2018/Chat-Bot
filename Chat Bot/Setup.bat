@echo off
title Chat Bot Setup
echo Chat Bot Setup
echo github.com/proximitynow2018/chat-bot
echo.
echo Speech File Name (Do 'none' for default)
set /p name=
cls
echo Your Name
set /p yname=
cls
echo Applying Settings...
echo %name%>Settings-Speech.dat
echo %name%>Settings-Name.dat