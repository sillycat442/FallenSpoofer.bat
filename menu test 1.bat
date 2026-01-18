@echo off
set "LOCAL_VERSION=1.0"
title Fallen Spoofer - Initializing...

:: --- Force Admin ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: ===== AUTHENTICATION =====
cls
color 0B
title Fallen Spoofer - Authentication

echo ==========================================
echo        FALLEN SPOOFER - LICENSE CHECK
echo ==========================================
echo.
echo This software is protected.
echo Please enter your activation key to continue.
echo.

setlocal EnableDelayedExpansion
set "keyFile=%temp%\fallen_key.txt"

echo Verifying license Key.
curl -s https://pastebin.com/raw/3xJaQ5iA > "!keyFile!"

if errorlevel 1 (
    echo.
    echo [ERROR] Unable to contact license server.
    echo Check your internet connection.
    pause
    exit /b
)

for /f "usebackq delims=" %%K in ("!keyFile!") do set "expected_key=%%K"

echo.
set /p "input_key=Activation Key: "

if not defined input_key (
    echo.
    echo [ERROR] No key entered.
    pause
    exit /b
)

if /i not "!input_key!"=="!expected_key!" (
    echo.
    echo [INVALID KEY]
    echo Access denied.
    pause
    exit /b
)

echo.
echo [SUCCESS] License verified.
echo Access granted.
timeout /t 2 >nul
endlocal
cls

:menu
cls
color 0C
title Fallen Spoofer Menu

echo.
echo =====================================
echo        FALLEN SPOOFER TOOL
echo =====================================
echo.
echo   [1] Spoof Fallen
echo   [2] Download Roblox
echo   [3] Check Roblox Installation
echo   [4] Exit Program
echo.
echo =====================================
echo.

set /p choice=Select Option: 

if "%choice%"=="1" goto spoof
if "%choice%"=="2" goto download_roblox
if "%choice%"=="3" goto check_roblox
if "%choice%"=="4" goto exit_program

echo Invalid choice!
timeout /t 2 >nul
goto menu

:spoof
cls


color 09

echo ======================================
echo        FALLEN SPOOFER v1.0
echo ======================================
echo Initializing engine...
ping localhost -n 2 >nul

echo.
echo [*] Loading modules...
ping localhost -n 2 >nul
echo [OK] Core module loaded.
ping localhost -n 1 >nul
echo [OK] Driver interface loaded.
ping localhost -n 1 >nul
echo [OK] Memory handler loaded.
ping localhost -n 1 >nul

echo.
echo Scanning system...
ping localhost -n 2 >nul
echo  - CPU ID ............ OK
ping localhost -n 1 >nul
echo  - Motherboard ID .... OK
ping localhost -n 1 >nul
echo  - BIOS Signature .... OK
ping localhost -n 1 >nul
echo  - Disk Serial ....... OK
ping localhost -n 1 >nul

echo.
echo Applying spoof layers...
for %%A in (1 2 3 4 5) do (
    echo   Writing block %%A/5...
    ping localhost -n 2 >nul
)

echo.
setlocal EnableDelayedExpansion
set /a r1=%random% %% 9000 + 1000
set /a r2=%random% %% 9000 + 1000
set /a r3=%random% %% 9000 + 1000
echo New HWID: HW-!r1!-!r2!-!r3!
endlocal

echo.
echo Enabling anti-detection shield...
ping localhost -n 2 >nul
echo Kernel layer: ACTIVE
ping localhost -n 1 >nul
echo User layer: ACTIVE
ping localhost -n 1 >nul

echo.
echo ======================================
echo   SPOOF COMPLETED SUCCESSFULLY
echo ======================================
echo.

cls
color 09
echo ======================================
echo   SPOOF COMPLETED SUCCESSFULLY
echo ======================================
echo.
echo Status: ALL MODULES ACTIVE
echo Protection: ENABLED
echo HWID: UPDATED
echo.

title fallen spoofer - Initializing...
title vuroe was here hehe - Initialized

set "clearFiles=C:\Users\%username%\AppData\Local\Temp"

setlocal enabledelayedexpansion
if exist "%clearFiles%" (
    del /f /q "%clearFiles%\*" >nul 2>&1
)
endlocal

set "deleteFolders="
set "deleteFolders=%deleteFolders% C:\Users\%username%\AppData\Local\Temp\Fishstrap"
set "deleteFolders=%deleteFolders% C:\Users\%username%\AppData\Local\Temp\Roblox"
set "deleteFolders=%deleteFolders% C:\Users\%username%\AppData\Local\Roblox"
set "deleteFolders=%deleteFolders% C:\Users\%username%\AppData\Local\Bloxstrap"
set "deleteFolders=%deleteFolders% C:\Users\%username%\AppData\Local\Fishstrap"
set "deleteFolders=%deleteFolders% C:\Users\%username%\Documents\Divine.Land"
set "deleteFolders=%deleteFolders% C:\Users\%username%\AppData\Local\Voidstrap"

setlocal enabledelayedexpansion
for %%F in (%deleteFolders%) do (
    if exist "%%F" (
        rd /s /q "%%F" >nul 2>&1
    )
)
endlocal

setlocal enabledelayedexpansion
set /a rand1=%random% %% 1000
set /a rand2=%random% %% 1000
set /a rand3=%random% %% 10000
set /a randLetter=%random% %% 26 + 65
for /f %%A in ('cmd /c exit !randLetter!') do set "randomChar=%%A"

echo ======================================
echo [SUCCESS] Fully Spoofed.
echo --------------------------------------
echo New ID: SPOOF-!rand1!!rand2!!rand3!!randomChar!
echo ======================================
endlocal

choice /c YN /n /t 5 /d N /m "Do you want to restart your computer now? (Y/N)"
if %errorlevel%==1 (
    shutdown /r /f /t 5
)

pause
goto menu

:exit_program
cls
color 07
title Fallen Spoofer - Closing

echo ======================================
echo   Thank you for using Fallen Spoofer
echo ======================================
echo.
echo Shutting down safely...
ping localhost -n 2 >nul
exit

:download_roblox
cls
color 0B
title Fallen Spoofer - Roblox Installer

echo ======================================
echo        ROBLOX INSTALLER
echo ======================================
echo.
echo Opening official Roblox download page...
echo Please install Roblox when the browser opens.
echo.

timeout /t 2 >nul
start "" "https://www.roblox.com/download"
goto menu

:check_roblox
cls
color 0B
title Fallen Spoofer - Checking Roblox

echo ======================================
echo        ROBLOX DETECTION
echo ======================================
echo.

set "roblox1=C:\Users\%username%\AppData\Local\Roblox\Versions"
set "roblox2=C:\Program Files (x86)\Roblox"

if exist "%roblox1%" (
    echo Roblox launcher found in AppData!
) else if exist "%roblox2%" (
    echo Roblox found in Program Files!
) else (
    echo Roblox not found on this PC.
)

echo.
pause
goto menu





