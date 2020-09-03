Set shell = CreateObject("WScript.Shell" ) 
shell.Run """C:\Program Files\VcXsrv\vcxsrv.exe"" :0 -screen 0 @1 -ac +xinerama -engine 1 -nodecoration -wgl"
WScript.Sleep 200
shell.Run "C:\Windows\System32\wsl.exe bash -c ""~/.scripts/wsl-i3-launch""", 0
