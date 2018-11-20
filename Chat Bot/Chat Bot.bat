@echo off
set orgcd=%cd%
title Chat Bot
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
title Chatbot v1.1.1
echo Chatbot v1.1.1
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
if %errorlevel% == 2 start "" http://www.github.com/proximitynow2018/chat-bot/&&goto chatbot
if %errorlevel% == 3 goto exit
:start
cls
echo Write to talk to your CPU
goto talk
:talk
echo.
set usersay=null
set /p usersay=You: 
goto scan

:scan
cd %orgcd%\speech\%speechpack%
for /f "delims=" %%a in (sayings.speeches) DO ( 
cd %orgcd%\speech\%speechpack%\user
for /f "delims=" %%b in (%%a.speech) DO ( 
set foundspeech=%%a
if "%usersay%" == "%%b" goto found
)
)
if exist leave.speech (
for /f "delims=" %%b in (leave.speech) DO ( 
set foundspeech=gotomenu
if "%usersay%" == "%%b" goto found
)
)
set foundspeech=noresponse
:found
echo.
cd %orgcd%\speech\%speechpack%
if "%foundspeech%" == "gotomenu" goto chatbot
for /f "delims=" %%a in (%foundspeech%.speech) DO ( 
echo CPU: %%a
)
goto talk
:exit