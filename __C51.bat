@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\"
"C:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c"
if not exist hex2mif.exe goto done
if exist Remote.ihx hex2mif Remote.ihx
if exist Remote.hex hex2mif Remote.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.hex
