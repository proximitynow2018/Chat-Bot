@echo off
title Chat Bot
set orgcd=%cd%
cd settings
:test1
if exist speech.dat (
goto test2
) else (
echo Please run the setup.bat
pause
goto exit
)
:test2
if exist name.dat (
goto start
) else (
echo Please run the setup.bat
pause
goto exit
)
:start
echo Reading Settings Folder...
echo Reading settings/speech.dat
for /f "delims=" %%a in (speech.dat) DO ( 
echo Speech set to %%a
set speechpack=%%a
)
echo Reading settings/name.dat
for /f "delims=" %%a in (name.dat) DO ( 
echo Name set to %%a
set usersname=%%a
)
echo Searching for speechpack...
cd %orgcd%/speech
if exist %speechpack% (
goto speechexist
) else (
echo Cannot find speechpack: %speechpack%. Have you imported the right speechpack? Have you maybe wrote a typo?
pause
goto exit
)
:speechexist
echo Found speechpack checking contents...
cd %speechpack%
tree /f /a
echo All ready! (hopefully)
goto chatbot
:chatbot
cls
title Chatbot v1.0
echo Chatbot v1.0
echo github.com/proximitynow2018/chat-bot/
echo.
echo 1) Start chatbot
echo.
echo 2) Visit GitHub
echo.
echo 3) Exit
echo.
choice /c 123
if %errorlevel% == 1 goto start
if %errorlevel% == 2 start "" http://www.github.com/proximitynow2018/chat-bot/
if %errorlevel% == 3 goto exit
:exit