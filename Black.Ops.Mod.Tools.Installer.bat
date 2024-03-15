
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
set shippuden_map_maker_url="https://archive.org/download/black_ops_one_mod_tool_files/shippuden_map_maker.zip"


echo Checking for updates...
powershell -Command "Start-BitsTransfer -Source "%self_updater_url%""
cls
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
cd %~dp0

set "game_dir=%CD%"
set "temp_dir=%game_dir%/Temp"

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
echo This tool installs the following:
echo.
echo Game_mod 
echo Linker_mod
echo Assets_wip_0.1.0
echo Ville's various mod tools fixes, the latest from Jan 2, 2024
echo FTG Remastered BO map source example
echo Shippuden Map Maker
echo SteamCMD
echo It will also run the setup.bat, converter, and clean up unneeded files
echo.
echo Important Notes:
echo.
echo Having Bgamer installed can replace key files, if you are having issues check this first
echo.
echo Some errors/warning when the converter is ran is normal, you can ignore them.
echo Don't run the converter yourself unless you're absolutely sure.
echo rerunning this bat will rerun the converter. Backup projects first if you're worried.
echo It has the potential to delete files you may want to keep.
echo.
echo Installing older mod fixes over this will likely cause problems.
echo.
echo The Launcher.exe must be ran as administrator or else errors may occur.
echo.
echo Your Install will approximately 15gb or so depending on dlc owned.
echo.
echo If this window gets stuck, try clicking on it, then hitting enter.
echo If that doesn't work close it and run it again.
echo.
echo If you haven't already placed this bat in your BO + Mod Tools install
echo (next to your BlackOps.exe) close this window and do so before continuing.
echo.
echo Now to get started
echo.

:a
echo.
set /p ans="Enter "start" to continue:"
echo.
if %ans%==start (goto b)
echo Your input was something other than "start"
echo Try again.
echo.
goto a

:b
if not exist %temp_dir% (
    mkdir %temp_dir%
) 

cd %temp_dir%

powershell -Command "Start-BitsTransfer -Source "%game_mod_url%""
powershell -Command "Start-BitsTransfer -Source "%linker_mod_url%""
powershell -Command "Start-BitsTransfer -Source "%mod_tools_file_url%""
powershell -Command "Start-BitsTransfer -Source "%end_message_url%""
powershell -Command "Start-BitsTransfer -Source "%shippuden_map_maker_url%""

powershell -Command "Expand-Archive -Force -LiteralPath game_mod.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath LinkerMod-1.0.0.zip -DestinationPath "..""

cd ".."

set process_name=BlackOps.exe

call %process_name%
Timeout /T 45


tasklist /FI "IMAGENAME eq %process_name%" 2>NUL | find /I "%process_name%">NUL
if "%ERRORLEVEL%"=="0" (
    taskkill /F /IM %process_name%
)


cd "bin/scripts"
call setup.bat
cd ".."
call converter.exe -nopause -n -nospam
cd ".."
cd %temp_dir%
powershell -Command "Expand-Archive -Force -LiteralPath black_ops_one_mod_tool_files.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath shippuden_map_maker.zip -DestinationPath "..""
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
echo shippuden1592 (Shippuden Map Maker)
echo.
type "End_Message.txt"
echo.

rmdir /S /Q %temp_dir%

Timeout /T 30

exit /b
