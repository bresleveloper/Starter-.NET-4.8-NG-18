@echo off
setlocal

REM Find Visual Studio MSBuild
set "MSBUILD_PATH="
if exist "C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\MSBuild.exe" (
    set "MSBUILD_PATH=C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\MSBuild.exe"
) else if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" (
    set "MSBUILD_PATH=C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe"
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\MSBuild.exe" (
    set "MSBUILD_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\MSBuild\Current\Bin\MSBuild.exe"
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe" (
    set "MSBUILD_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin\MSBuild.exe"
) else (
    echo ERROR: MSBuild not found. Please install Visual Studio or use Developer Command Prompt.
    pause
    exit /b 1
)

echo Building solution...
"%MSBUILD_PATH%" Starter-.NET-4.8-NG-18.sln /p:Configuration=Debug
if errorlevel 1 (
    echo ERROR: Build failed
    pause
    exit /b 1
)

echo Starting backend with IIS Express...
cd ndj-claude-agents

REM "%programfiles%\IIS Express\iisexpress.exe" /path:"%cd%" /port:49476 
REM you might need to change the /site: agrument bach to original value, see https://github.com/bresleveloper/Starter-.NET-4.8-NG-18/blob/master/cgo.bat
"%programfiles%\IIS Express\iisexpress.exe" /config:"%cd%\.vs\Starter-.NET-4.8-NG-18\config\applicationhost.config" /site:Starter-.NET-4.8-NG-18
