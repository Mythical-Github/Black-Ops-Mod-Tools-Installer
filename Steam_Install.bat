mkdir "Temp"
cd "Temp"
powershell -Command "Start-BitsTransfer -Source https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
powershell -Command "Start-BitsTransfer -Source "https://github.com/Nukem9/LinkerMod/releases/download/v1.3.2/game_mod.zip"
powershell -Command "Start-BitsTransfer -Source "https://github.com/Nukem9/LinkerMod/releases/download/v1.0.0-r/LinkerMod-1.0.0.zip"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/873741090350583818/assets_wip_0.1.0.zip"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/874819091700015155/CoD_BO_Mod_Tools_Fix_1-1.4.1_updated_part_1.zip"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/874819090873724969/CoD_BO_Mod_Tools_Fix_1-1.4.1_updated_part_2.zip"
powershell -Command "Start-BitsTransfer -Source "https://cdn.discordapp.com/attachments/868600140880023592/874550119742205982/End_Message.txt"
powershell -Command "Expand-Archive -Force -LiteralPath steamcmd.zip"
cd ".."
call "Temp/steamcmd/steamcmd.exe" +login "YOURUSERNAME" "YOURPASSWORD" +force_install_dir "../.." +app_update 42700 +app_update 42740 verify +exit
cd "Temp"
powershell -Command "Expand-Archive -Force -LiteralPath game_mod.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath LinkerMod-1.0.0.zip -DestinationPath "..""
start steam://rungameid/42700
Timeout /T 90
taskkill /f /im BlackOps.exe
cd ".."
cd "bin\scripts"
call setup.bat
cd ".."
call converter.exe -nopause -n -nospam
cd ".."
cd "Temp"
powershell -Command "Expand-Archive -Force -LiteralPath assets_wip_0.1.0.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath CoD_BO_Mod_Tools_Fix_1-1.4.1_updated_part_1.zip -DestinationPath "..""
powershell -Command "Expand-Archive -Force -LiteralPath CoD_BO_Mod_Tools_Fix_1-1.4.1_updated_part_2.zip -DestinationPath "..""
type End_Message.txt
Timeout /T 30
cd ".."
powershell -Command "Remove-Item -Force -Recurse "Temp""
powershell -Command "Remove-Item -Force -Recurse "steamapps""