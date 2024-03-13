@echo off
color 0A
Title Mythical's Black Ops Mod Tools Installer


rem url list
set self_updater_url="https://github.com/Mythical-Github/Black-Ops-Mod-Tools-Installer/releases/download/vStatic/Black.Ops.Mod.Tools.Installer.bat"
set mod_tools_file_url="https://archive.org/download/black_ops_one_mod_tool_files/black_ops_one_mod_tool_files.zip"
set game_mod_url="https://github.com/Nukem9/LinkerMod/releases/download/v1.3.2/game_mod.zip"
set linker_mod_url="https://github.com/Nukem9/LinkerMod/releases/download/v1.0.0-r/LinkerMod-1.0.0.zip"
set end_message_url="https://ia800201.us.archive.org/24/items/black_ops_mod_tools_installer_files/End_Message.txt"
set steam_cmd_url="https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"


echo Checking for updates...
powershell -Command "Start-BitsTransfer -Source "%self_updater_url%""
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
echo Ville's various mod tools fixes, the latest from Jan 2, 2024
echo FTG Remastered BO map source example
echo SteamCMD
echo It will also run the setup.bat, converter, and clean up unneeded files
echo.
echo Important Notes:
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
echo Your Install will approximately 14gb or so depending on dlc owned.
echo.
echo If this window gets stuck, try clicking on it, then hitting enter.
echo If that doesn't work close it and run it again.
echo.
echo Now to get started
echo.

:a
echo.
set /p ans="Enter "yes" to continue:"
echo.
if %ans%==Yes (goto b)
if %ans%==yes (goto b)
if %ans%==Y (goto b)
if %ans%==y (goto b)
echo Your input was something other than "yes"
echo Try again.
echo.
goto a

:b
mkdir "Temp"
cd "Temp"


powershell -Command "Start-BitsTransfer -Source "%game_mod_url%""
powershell -Command "Start-BitsTransfer -Source "%linker_mod_url%""
powershell -Command "Start-BitsTransfer -Source "%mod_tools_file_url%""
powershell -Command "Start-BitsTransfer -Source "%end_message_url%""
if %ans%==Non-Steam (goto d)
if %ans%==NonSteam (goto d)
if %ans%==non-steam (goto d)
if %ans%==nonsteam (goto d)


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
call BlackOps.exe
Timeout /T 45
taskkill /f /im BlackOps.exe
cd "bin/scripts"
call setup.bat
cd ".."
call converter.exe -nopause -n -nospam
cd ".."
cd "Temp"
powershell -Command "Expand-Archive -Force -LiteralPath black_ops_one_mod_tool_files.zip -DestinationPath "..""
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

pause

exit /b
