@echo off
setlocal
cd /d "%~dp0"
title GrabCash Android APK Builder

set "ROOT=%CD%"
set "ANDROID_HOME=%LOCALAPPDATA%\Android\Sdk"
set "SRC=%ROOT%\android_pixel\app\src\main"
set "OUT=%ROOT%\android_pixel\build"
set "APK=%ROOT%\GrabCash-Pixel.apk"
set "KEYSTORE=%ROOT%\android_pixel\grabcash-debug.keystore"

echo ========================================
echo GrabCash Android APK Builder
echo ========================================
echo.

if not exist "%SRC%\AndroidManifest.xml" (
    echo Android project was not found at:
    echo %SRC%
    pause
    exit /b 1
)

if not exist "%ANDROID_HOME%" (
    echo Android SDK was not found at:
    echo %ANDROID_HOME%
    echo Install Android Studio or set up the Android SDK first.
    pause
    exit /b 1
)

set "BUILD_TOOLS="
for /f "delims=" %%D in ('dir /b /ad /o-n "%ANDROID_HOME%\build-tools" 2^>nul') do (
    if not defined BUILD_TOOLS set "BUILD_TOOLS=%ANDROID_HOME%\build-tools\%%D"
)

if not defined BUILD_TOOLS (
    echo Android build-tools were not found under:
    echo %ANDROID_HOME%\build-tools
    pause
    exit /b 1
)

set "PLATFORM="
for /f "delims=" %%D in ('dir /b /ad /o-n "%ANDROID_HOME%\platforms\android-*" 2^>nul') do (
    if not defined PLATFORM set "PLATFORM=%ANDROID_HOME%\platforms\%%D\android.jar"
)

if not exist "%PLATFORM%" (
    echo Android platform android.jar was not found.
    pause
    exit /b 1
)

set "JAVAC="
set "KEYTOOL="
where javac >nul 2>nul
if not errorlevel 1 for /f "delims=" %%J in ('where javac') do if not defined JAVAC set "JAVAC=%%J"
where keytool >nul 2>nul
if not errorlevel 1 for /f "delims=" %%K in ('where keytool') do if not defined KEYTOOL set "KEYTOOL=%%K"

if not defined JAVAC if exist "C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot\bin\javac.exe" set "JAVAC=C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot\bin\javac.exe"
if not defined KEYTOOL if exist "C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot\bin\keytool.exe" set "KEYTOOL=C:\Program Files\Eclipse Adoptium\jdk-21.0.11.10-hotspot\bin\keytool.exe"

if not defined JAVAC (
    echo Java compiler javac was not found. Install JDK 17 or newer.
    pause
    exit /b 1
)

if not defined KEYTOOL (
    echo Java keytool was not found. Install JDK 17 or newer.
    pause
    exit /b 1
)

if not exist "%BUILD_TOOLS%\aapt2.exe" (
    echo aapt2.exe was not found in:
    echo %BUILD_TOOLS%
    pause
    exit /b 1
)

if not exist "%BUILD_TOOLS%\d8.bat" (
    echo d8.bat was not found in:
    echo %BUILD_TOOLS%
    pause
    exit /b 1
)

if not exist "%BUILD_TOOLS%\zipalign.exe" (
    echo zipalign.exe was not found in:
    echo %BUILD_TOOLS%
    pause
    exit /b 1
)

if not exist "%BUILD_TOOLS%\apksigner.bat" (
    echo apksigner.bat was not found in:
    echo %BUILD_TOOLS%
    pause
    exit /b 1
)

if exist "%OUT%" rmdir /s /q "%OUT%"
mkdir "%OUT%\compiled" "%OUT%\classes" "%OUT%\dex" >nul

echo Using Android build-tools:
echo %BUILD_TOOLS%
echo.

echo Compiling Android resources...
"%BUILD_TOOLS%\aapt2.exe" compile --dir "%SRC%\res" -o "%OUT%\compiled\resources.zip"
if errorlevel 1 goto fail

echo Linking APK shell...
"%BUILD_TOOLS%\aapt2.exe" link -o "%OUT%\unsigned.apk" -I "%PLATFORM%" --manifest "%SRC%\AndroidManifest.xml" "%OUT%\compiled\resources.zip" --java "%OUT%\gen"
if errorlevel 1 goto fail

echo Compiling Java...
dir /s /b "%SRC%\java\*.java" "%OUT%\gen\*.java" > "%OUT%\sources.txt"
"%JAVAC%" -encoding UTF-8 -source 8 -target 8 -bootclasspath "%PLATFORM%" -d "%OUT%\classes" @"%OUT%\sources.txt"
if errorlevel 1 goto fail

echo Creating DEX...
"%BUILD_TOOLS%\d8.bat" --lib "%PLATFORM%" --output "%OUT%\dex" "%OUT%\classes"
if errorlevel 1 goto fail

echo Adding DEX to APK...
copy "%OUT%\unsigned.apk" "%OUT%\with-dex.apk" >nul
pushd "%OUT%\dex"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Compress-Archive -Path 'classes.dex' -Update -DestinationPath '%OUT%\with-dex.apk'"
popd
if errorlevel 1 goto fail

if not exist "%KEYSTORE%" (
    echo Creating debug signing key...
    "%KEYTOOL%" -genkeypair -v -keystore "%KEYSTORE%" -storepass grabcash -alias grabcash -keypass grabcash -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=GrabCash,O=GrabCash,C=IN"
    if errorlevel 1 goto fail
)

echo Aligning APK...
"%BUILD_TOOLS%\zipalign.exe" -f 4 "%OUT%\with-dex.apk" "%OUT%\aligned.apk"
if errorlevel 1 goto fail

echo Signing APK...
"%BUILD_TOOLS%\apksigner.bat" sign --ks "%KEYSTORE%" --ks-pass pass:grabcash --key-pass pass:grabcash --out "%APK%" "%OUT%\aligned.apk"
if errorlevel 1 goto fail

echo Verifying APK...
"%BUILD_TOOLS%\apksigner.bat" verify "%APK%"
if errorlevel 1 goto fail

echo.
echo APK ready:
echo %APK%
pause
exit /b 0

:fail
echo.
echo Android APK build failed.
pause
exit /b 1
