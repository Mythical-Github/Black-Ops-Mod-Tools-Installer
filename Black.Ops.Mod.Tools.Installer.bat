@echo off
color 0A
Title Mythical's Black Ops Mod Tools Installer
echo Checking for updates...
powershell -Command "Start-BitsTransfer -Source "https://github.com/Mythical-Github/Black-Ops-Mod-Tools-Installer/releases/download/vStatic/Black.Ops.Mod.Tools.Installer.bat"
cls
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
cd %~dp0
cls
echo.
echo                                    #     #                                           ###                                              
echo                                    ##   ## #   # ##### #    # #  ####    ##   #      ###  ####                                        
echo                                    # # # #  # #    #   #    # # #    #  #  #  #       #  #                                            
echo                                    #  #  #   #     #   ###### # #      #    # #      #    ####                                        
echo                                    #     #   #     #   #    # # #      ###### #               #                                       
echo                                    #     #   #     #   #    # # #    # #    # #          #    #                                       
echo                                    #     #   #     #   #    # #  ####  #    # ######      ####                                        
echo.                                                                                                                                      
echo #####   ####    #    #  ####  #####    #####  ####   ####  #       ####    # #    #  ####  #####   ##   #      #      ###### #####    
echo #    # #    #   ##  ## #    # #    #     #   #    # #    # #      #        # ##   # #        #    #  #  #      #      #      #    #   
echo #####  #    #   # ## # #    # #    #     #   #    # #    # #       ####    # # #  #  ####    #   #    # #      #      #####  #    #   
echo #    # #    #   #    # #    # #    #     #   #    # #    # #           #   # #  # #      #   #   ###### #      #      #      #####    
echo #    # #    #   #    # #    # #    #     #   #    # #    # #      #    #   # #   ## #    #   #   #    # #      #      #      #   #    
echo #####   ####    #    #  ####  #####      #    ####   ####  ######  ####    # #    #  ####    #   #    # ###### ###### ###### #    #  
echo.
echo The place this bat is located is where the mod tools will be installed if need be
echo.
echo This tool installs the following (some or all components depending on Steam or Non-Steam):
echo.
echo Game_mod 
echo Linker_mod
echo Assets_wip_0.1.0
echo Mod Tools Fixes 1-1.41_updated
echo FTG Remastered BO map source example
echo T5-MissingAssets
echo SteamCMD
echo Base game, Multiplayer, any dlc you own, and mod tools through steamcmd
echo.
echo It will also run the setup.bat, converter, and clean up unneeded files
echo.
echo Important Notes:
echo.
echo The Steam method (uses steamcmd) is no longer available, you can self reactivate it if you'd like, but this is only for advanced users.
echo The Non-Steam method is the reccomended method.
echo You can use the Non-Steam method with an existing Steam Base Game, Multiplayer, and Mod Tools (any dlc you own will be autoinstalled).
echo.
echo Having Bgamer installed can replace key files, if you are having issues check this first
echo.
echo Some errors/warning when the converter is ran is normal, you can ignore them.
echo Don't run the converter yourself unless you're absolutely sure.
echo It has the potential to delete files you may want to keep.
echo.
echo Installing older mod fixes over this will likely cause problems.
echo.
echo The Launcher.exe must be ran as administrator or else errors may occur.
echo.
echo Your Install will approximately 14gb or less depending on dlc owned.
echo.
echo If this window gets stuck, try clicking on it, then hitting enter.
echo If that doesn't work close it and run it again.
echo.
echo Now to get started
echo.

:a
rem echo Are you using Steam or Non-Steam?
echo.
set /p ans="Enter "Non-Steam" to continue:"
rem set /p ans="Enter "Steam" or "Non-Steam":"
echo.
rem if %ans%==Steam (goto b)
rem if %ans%==steam (goto b)
if %ans%==Non-Steam (goto b)
if %ans%==NonSteam (goto b)
if %ans%==non-steam (goto b)
if %ans%==nonsteam (goto b)
echo Your input was something other than "Non-Steam"
rem echo Your input was something other than "Steam" or "Non-Steam"
echo Try again.
echo.
goto a

:b
mkdir "Temp"
cd "Temp"
powershell -Command "Start-BitsTransfer -Source "https://github.com/Nukem9/LinkerMod/releases/download/v1.3.2/game_mod.zip"
powershell -Command "Start-BitsTransfer -Source "https://github.com/Nukem9/LinkerMod/releases/download/v1.0.0-r/LinkerMod-1.0.0.zip"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/873741090350583818/assets_wip_0.1.0.zip"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/874819091700015155/CoD_BO_Mod_Tools_Fix_1-1.4.1_updated_part_1.zip"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/874819090873724969/CoD_BO_Mod_Tools_Fix_1-1.4.1_updated_part_2.zip"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/875995770296336434/End_Message.txt"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/876022149473767494/BO_FTG_Map_Source.zip"
rem if %ans%==Steam (goto c)
rem if %ans%==steam (goto c)
if %ans%==Non-Steam (goto d)
if %ans%==NonSteam (goto d)
if %ans%==non-steam (goto d)
if %ans%==nonsteam (goto d)

:c
echo Steam Method Chosen
powershell -Command "Start-BitsTransfer -Source https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
powershell -Command "Expand-Archive -Force -LiteralPath steamcmd.zip"
cd ".."
set /p user="What is your steam username?":
set /p pass="What is your steam password?":
call "Temp/steamcmd/steamcmd.exe" +login "%user%" "%pass%" +force_install_dir "../.." +app_update 42700 verify +app_update 42710 verify +app_update 42740 verify +exit
cd "Temp"
powershell -Command "Expand-Archive -Force -LiteralPath game_mod.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath LinkerMod-1.0.0.zip -DestinationPath "..""
cd ".."
powershell -Command "Remove-Item -Force -Recurse "steamapps""
goto e

:d
echo Non-Steam Method Chosen
echo.
echo If you haven't already placed this bat in your BO + Mod Tools install
echo (next to your BlackOps.exe) close this window and do so before continuing
echo.
pause
powershell -Command "Expand-Archive -Force -LiteralPath game_mod.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath LinkerMod-1.0.0.zip -DestinationPath "..""
cd ".."
goto e

:e
rem start steam://rungameid/42700
rem Timeout /T 45
rem taskkill /f /im BlackOps.exe
rem Timeout /T 15
call BlackOps.exe
Timeout /T 45
taskkill /f /im BlackOps.exe
cd "bin/scripts"
call setup.bat
cd ".."
call converter.exe -nopause -n -nospam
cd ".."
cd "Temp"
powershell -Command "Expand-Archive -Force -LiteralPath assets_wip_0.1.0.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath CoD_BO_Mod_Tools_Fix_1-1.4.1_updated_part_1.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath CoD_BO_Mod_Tools_Fix_1-1.4.1_updated_part_2.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath BO_FTG_Map_Source.zip -DestinationPath "..""
echo.
echo 	Credits:
echo SE2Dev (Linker_Mod/Game_Mod/wip Asset Package)
echo Nukem9 (Linker_Mod/Game_Mod)
echo Jbleezy (Linker_Mod/Game_Mod)
echo dtzxporter (Linker_Mod/Game_Mod)
echo Ville88 (Mod Tools Fix)
echo Treyarch and Activision (Game)
echo Valve (SteamCMD)
echo Marcin Glinski (Ascii Art)
echo Rik from SuperUser.com (Maximized Window Code Snippet)
echo Synthetic Programming (Youtube Tutorial and Example Code)
echo 5and5 (FTG BO Map Source Example)
echo Inferno Maartem (Creator of WaW FTG Map)
echo patorjk.com (Ascii Art)
echo ss64.com (Batch Command List)
echo.
type "End_Message.txt"
echo.
Timeout /T 30
cd ".."
powershell -Command "Remove-Item -Force -Recurse "Temp""
