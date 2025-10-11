@echo off

IF "%~1" == ""      (goto MENU) 
IF "%~1" == "sln"   (goto DO_SLN) 
IF "%~1" == "web"   (goto DO_WEB) 
IF "%~1" == "go"    (goto DO_RUN_WEB) 
IF "%~1" == "nb"    (goto DO_NGB) 
IF "%~1" == "ngo"   (goto DO_NG_S) 
IF "%~1" == "full"  (goto DO_FULL) 


:MENU
cls
echo.
echo === My CLI Tool ===
echo.
echo 1. Build   C# Solution (sln)
echo 2. Build   C# Web      (web)
echo 3. Run     C# Web      (go)         
echo 4. Build   Angular UI  (nb)         
echo 5. Run     Angular UI  (ngo)         
echo 6. Compile all (C# + NG) and Run Web   (full)         
echo.
set /p CHOICE="Enter your choice #: "

if "%CHOICE%"=="1" goto DO_SLN
if "%CHOICE%"=="2" goto DO_WEB
if "%CHOICE%"=="3" goto DO_RUN_WEB
if "%CHOICE%"=="4" goto DO_NGB
if "%CHOICE%"=="5" goto DO_NG_S
if "%CHOICE%"=="6" goto DO_FULL


:DO_FULL
dotnet build Starter-.NET-4.8-NG-18.sln
::npm's are batches themselves and calling them without call will stop the script
call npm run build --prefix Starter-.NET-4.8-NG-18/AngularFront/Starter-.NET-4.8-NG-18
dotnet run --project Starter-.NET-4.8-NG-18.Web
goto END




:DO_SLN
dotnet build Starter-.NET-4.8-NG-18.sln
goto END


:DO_WEB
dotnet build Starter-.NET-4.8-NG-18.Web/Starter-.NET-4.8-NG-18.Web.csproj
goto END



:DO_RUN_WEB
dotnet run --project Starter-.NET-4.8-NG-18.Web
goto END

::TODO make the web thing open browser


:DO_NGB
npm run build --prefix Starter-.NET-4.8-NG-18/AngularFront/Starter-.NET-4.8-NG-18
goto END


:DO_NG_S
::TODO in package.json "start2": "ng serve --open",
npm run start2 --prefix Starter-.NET-4.8-NG-18/AngularFront/Starter-.NET-4.8-NG-18
goto END




:END
echo Exiting CLI.

exit
