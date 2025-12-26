@echo off
title RoFFlagger - Flag list maker for Roblox
color 0f
mode 54,12
:mainmenu
set x=
cls
echo -----             [31mRo[37mblox Flag List Maker         -----
echo -- [Made by [32mxf1op[37m]
echo.
echo --- [1] Create A New Flag List For Roblox
echo --- [2] Remove All Flag Lists From Roblox
echo --- [3] Clear Cached Roblox Game Assets
echo --- [4] Open All Directories With Flag Lists
echo --- [5] Set Custom Framerate For Roblox (Closes App)
echo.
echo --- [0] Exit script
echo.
set /p x=-- Number: 
if '%x%'=='1' goto create
if '%x%'=='2' goto remove
if '%x%'=='3' goto clearcache
if '%x%'=='4' goto opendirs
if '%x%'=='5' goto customFPS
if not '%x%'=='0' goto mainmenu
goto end

:create
cls
echo -- Searching For Roblox Launchers
echo.
if exist "%localappdata%\Bloxstrap\Modifications" set "Xstrap=Bloxstrap" && goto XstrapLauncher
if exist "%localappdata%\Fishstrap\Modifications" set "Xstrap=Fishstrap" && goto XstrapLauncher
if exist "%localappdata%\Froststrap\Modifications" set "Xstrap=Froststrap" && goto XstrapLauncher
if exist "%localappdata%\Roblox\Versions" for /f "delims=" %%A in ('powershell -Command "Get-ChildItem '%localappdata%\roblox\versions' -Recurse -Filter RobloxPlayerBeta.exe | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty DirectoryName"') do set "nver=%%A" & goto OgRoLauncher
goto NoRobloxInstalled

:XstrapLauncher
set starter=XstrapLauncher
echo -- Found %Xstrap% Launcher
cd %localappdata%\%Xstrap%\Modifications\ClientSettings
echo.
goto listMaker

:OgRoLauncher
set starter=Default
echo -- Found Roblox Launcher
cd %nver% && md ClientSettings && cd ClientSettings
echo.
goto listMaker

:listMaker
echo -- Starting Flag List Maker
timeout /nobreak 2 >nul
:flaglistmenu
set x=
cls
echo -----             Flag List Creator!             -----
echo.
echo --- [1] Create A Custom Set
echo --- [2] Use Maximum Quality Set
echo --- [3] Use Balanced Set
echo --- [4] Use Performance Set
echo --- [5] Use Maximum Performance (Worst Texture Look)
echo.
echo.
echo --- [0] Go Back
echo.
set /p x=-- Number: 
if '%x%'=='1' goto freshSet
if '%x%'=='2' goto quality
if '%x%'=='3' goto balanced
if '%x%'=='4' goto performance
if '%x%'=='5' goto maxperformance
if not '%x%'=='0' goto flaglistmenu
goto mainmenu

:freshSet
cls
set x=
echo -----          Create Custom Set (1/10)          -----
echo - DFFlagDebugPauseVoxelizer
echo -- Disables All Light From Generating In Games
echo - [1] Disable
echo - [2] Enable
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f1=False" && goto cf2
if not '%x%'=='2' goto freshSet
set f1=True
:cf2
cls
set x=
echo -----          Create Custom Set (2/10)          -----
echo - DFFlagDisableDPIScale
echo -- Disables Pixel Scaling To Improve Quality
echo - [1] Disable
echo - [2] Enable
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f2=False" && goto cf3
if not '%x%'=='2' goto cf2
set f2=True
:cf3
cls
set x=
echo -----          Create Custom Set (3/10)          -----
echo - DFIntDebugFRMQualityLevelOverride
echo -- Forces Quality Level In Roblox
echo - [1] Adjustable (-1)
echo - [2] Forced 1 (Lowest)
echo - [3] Forced 21 (Max)
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f3=-1" && goto cf4
if '%x%'=='2' set "f3=1" && goto cf4
if not '%x%'=='3' goto cf3
set f3=21
:cf4
cls
set x=
echo -----          Create Custom Set (4/10)          -----
echo - DFIntCSGLevelOfDetailSwitchingDistance
echo -- Object Quality After X Distance Decreases
echo - [1] Max Quality
echo - [2] Balanced
echo - [3] Performance
echo - [4] Maximum Performance
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f4=4000" && set "f4b=4000" && set "f4c=4000" && set "f4d=4000" && goto cf5
if '%x%'=='2' set "f4=250" && set "f4b=500" && set "f4cc=750" && set "f4d=1000" && goto cf5
if '%x%'=='3' set "f4=250" && set "f4b=250" && set "f4c=250" && set "f4d=250" && goto cf5
if not '%x%'=='4' goto cf4
set f4=0
set f4b=0
set f4c=0
set f4d=0
:cf5
cls
set x=
echo -----          Create Custom Set (5/10)          -----
echo - DFIntTextureQualityOverride
echo -- Texture Quality Of All Objects
echo - [1] Highest 
echo - [2] Medium
echo - [3] Low
echo - [4] Lowest
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f5=True" && set "f5b=3" && goto cf6
if '%x%'=='2' set "f5=True" && set "f5b=2" && goto cf6
if '%x%'=='3' set "f5=True" && set "f5b=1" && goto cf6
if not '%x%'=='4' goto cf5
set f5=True
set f5=0
:cf6
cls
set x=
echo -----          Create Custom Set (6/10)          -----
echo - DirectX11, Vulkan Or OpenGL Api 
echo -- Api Roblox Will Run On
echo - [1] DirectX11 (Fast, Default)
echo - [2] Vulkan (Fast, Unstable)
echo - [3] OpenGL (Linux, Android)
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f6=True" && set "f6b=False" && set "f6c=False" && goto cf7
if '%x%'=='2' set "f6=False" && set "f6b=False" && set "f6c=True" && goto cf7
if not '%x%'=='3' goto cf6
set f6=False
set f6b=True
set f6c=False
:cf7
cls
set x=
echo -----          Create Custom Set (7/10)          -----
echo - FFlagDebugSkyGray
echo -- Gray Sky For Roblox Games
echo - [1] Disabled
echo - [2] Enabled
set /p x=-- Number: 
if '%x%'=='1' set "f7=False" && goto cf8
if not '%x%'=='2' goto cf7
set f7=True
:cf8
cls
set x=
echo -----          Create Custom Set (8/10)          -----
echo - FFlagHandleAltEnterFullscreenManually
echo -- Exclusive Fullscreen For Roblox (Alt+Enter)
echo - [1] Disabled (Default?)
echo - [2] Enabled
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f8=False" && goto cf9
if not '%x%'=='2' goto cf8
set f8=True
:cf9
cls
set x=
echo -----          Create Custom Set (9/10)          -----
echo - FIntDebugForceMSAASamples
echo -- Makes Corners Of Objects Sharper Or Smoother
echo - [1] Value 0 (Automatic)
echo - [2] Value 1
echo - [3] Value 2
echo - [4] Value 4
echo - [5] Value 8
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f9=0" && goto cf10
if '%x%'=='2' set "f9=1" && goto cf10
if '%x%'=='3' set "f9=2" && goto cf10
if '%x%'=='4' set "f9=4" && goto cf10
if not '%x%'=='5' goto cf9
set f9=8
:cf10
cls
set x=
echo -----          Create Custom Set (10/10)         -----
echo - FIntFRMMaxGrassDistance
echo -- Distance Of Grass In Roblox
echo - [1] Very Far
echo - [2] Normal
echo - [3] Reduced
echo - [4] No Grass
echo.
set /p x=-- Number: 
if '%x%'=='1' set "f10=4000" && set "f10b=4000" && set "f10c=10" && goto finish
if '%x%'=='2' set "f10=250" && set "f10b=100" && set "f10c=5" && goto finish
if '%x%'=='3' set "f10=100" && set "f10b=50" && set "f10c=0" && goto finish
if not '%x%'=='4' goto cf10
set f10=0
set f10b=0
set f10c=0
goto finish

:quality
set f1=False
set f2=True
set f3=-1
set f4=4000
set f4b=4000
set f4c=4000
set f4d=4000
set f5=True
set f5b=3
set f6=True
set f6b=False
set f6c=False
set f7=False
set f8=False
set f9=8
set f10=4000
set f10b=4000
set f10c=10
goto finish

:balanced
set f1=False
set f2=False
set f3=-1
set f4=250
set f4b=500
set f4c=750
set f4d=1000
set f5=True
set f5b=2
set f6=True
set f6b=False
set f6c=False
set f7=False
set f8=False
set f9=2
set f10=100
set f10b=50
set f10c=5
goto finish

:performance
set f1=False
set f2=False
set f3=-1
set f4=250
set f4b=250
set f4c=250
set f4d=250
set f5=True
set f5b=2
set f6=True
set f6b=False
set f6c=False
set f7=False
set f8=False
set f9=1
set f10=0
set f10b=0
set f10c=0
goto finish

:maxperformance
set f1=True
set f2=False
set f3=1
set f4=0
set f4b=0
set f4c=0
set f4d=0
set f5=True
set f5b=0
set f6=True
set f6b=False
set f6c=False
set f7=True
set f8=False
set f9=1
set f10=0
set f10b=0
set f10c=0
goto finish

:finish
cls
echo -- Applying Flag List
echo {"DFFlagDebugPauseVoxelizer": "%f1%","DFFlagDisableDPIScale": "%f2%","DFIntDebugFRMQualityLevelOverride": "%f3%","DFIntCSGLevelOfDetailSwitchingDistance": "%f4%","DFIntCSGLevelOfDetailSwitchingDistanceL12": "%f4b%","DFIntCSGLevelOfDetailSwitchingDistanceL23": "%f4c%","DFIntCSGLevelOfDetailSwitchingDistanceL34": "%f4d%","DFFlagTextureQualityOverrideEnabled": "%f5%","DFIntTextureQualityOverride": "%f5b%","FFlagDebugGraphicsPreferD3D11": "%f6%","FFlagDebugGraphicsPreferOpenGL": "%f6b%","FFlagDebugGraphicsPreferVulkan": "%f6c%","FFlagDebugSkyGray": "%f7%","FFlagHandleAltEnterFullscreenManually": "%f8%","FIntDebugForceMSAASamples": "%f9%","FIntFRMMaxGrassDistance": "%f10%","FIntFRMMinGrassDistance": "%f10b%","FIntGrassMovementReducedMotionFactor": "%f10c%"} >ClientAppSettings.json
echo.
echo -- Starting Roblox Client
goto launchRoblox

:remove
cls
echo -- Removing All Flag Lists
if exist "%localappdata%\Roblox\Versions" for /f "delims=" %%A in ('powershell -Command "Get-ChildItem '%localappdata%\roblox\versions' -Recurse -Filter RobloxPlayerBeta.exe | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty DirectoryName"') do set "nver=%%A"
md %nver%\ClientSettings 2>nul >nul
erase /f /q "%nver%\ClientSettings\ClientAppSettings.json" 2>nul >nul
erase /f /q "%localappdata%\Fishstrap\Modifications\ClientSettings\ClientAppSettings.json" 2>nul >nul
erase /f /q "%localappdata%\Bloxstrap\Modifications\ClientSettings\ClientAppSettings.json" 2>nul >nul
erase /f /q "%localappdata%\Froststrap\Modifications\ClientSettings\ClientAppSettings.json" 2>nul >nul
echo -- Removed!
timeout /nobreak 2 >nul
goto mainmenu

:clearcache
cls
echo -- Cleaning Roblox Game Asset Cache
rd %temp%\Roblox /s /q 2>nul >nul
rd %localappdata%\Roblox\rbx-storage /s /q 2>nul >nul
erase %localappdata%\Roblox\rbx-storage* /f /q 2>nul >nul
echo -- Cleaning Completed
timeout /nobreak 2 >nul
goto mainmenu

:opendirs
if exist "%localappdata%\Roblox\versions" for /f "delims=" %%A in ('powershell -Command "Get-ChildItem '%localappdata%\roblox\versions' -Recurse -Filter RobloxPlayerBeta.exe | Sort-Object LastWriteTime -Descending | Select-Object -First 1 -ExpandProperty DirectoryName"') do start %%A\ClientSettings
if exist "%localappdata%\Bloxstrap\Modifications" start %localappdata%\Bloxstrap\Modifications\ClientSettings
if exist "%localappdata%\Froststrap\Modifications" start %localappdata%\Froststrap\Modifications\ClientSettings
if exist "%localappdata%\Fishstrap\Modifications" start %localappdata%\Fishstrap\Modifications\ClientSettings
goto mainmenu

:customFPS
set FPS=
taskkill /f /im RobloxPlayerBeta.exe 2>nul >nul
cls
echo -----            Set Custom Framerate            -----
echo.
echo --- Write Your Amount Of FPS You Would Like To Have
echo.
echo - Warning! Roblox Crashes If Value Is Over 1000
echo.
taskkill /f /im RobloxPlayerBeta.exe 2>nul >nul
set /p FPS=Amount: 
cls
if '%FPS%'=='' set FPS=60
powershell -Command "(Get-Content \"%LOCALAPPDATA%\Roblox\GlobalBasicSettings_13.xml\") -replace '<int name=\"FramerateCap\">\d+</int>', '<int name=\"FramerateCap\">%FPS%</int>' | Set-Content \"%LOCALAPPDATA%\Roblox\GlobalBasicSettings_13.xml\""
echo -- Value Successfully Set
timeout /nobreak 2 >nul
goto mainmenu

:NoRobloxInstalled
echo -- Roblox Client Is Not Installed!!
echo.
echo -- Install Client At roblox.com/download
echo.
echo -- Returning
timeout /nobreak 2 >nul
goto mainmenu

:launchRoblox
echo.
echo -- Opening Roblox Client
if '%starter%'=='Default' start /b %nver%\RobloxPlayerBeta.exe
if '%starter%'=='XstrapLauncher' start /b %localappdata%\%Xstrap%\%Xstrap%.exe -player
goto end

:end
echo.
echo -- Cleaning Roblox And Launcher Logs
rd %localappdata%\Roblox\Logs /s /q 2>nul >nul
rd %localappdata%\Bloxstrap\Logs /s /q 2>nul >nul
rd %localappdata%\Fishstrap\Logs /s /q 2>nul >nul
rd %localappdata%\Froststrap\Logs /s /q 2>nul >nul
echo.
echo -- Exiting Script...
timeout /nobreak 2 >nul

exit
