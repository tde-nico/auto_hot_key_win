#NoEnv
SendMode Input
SetWorkingDir, %A_ScriptDir%

; ^ = CTRL, # = WIN, ! = ALT, + = Shift

^!f::
Run *RunAs "C:\Program Files\Git\bin\sh.exe" -c "bash port.sh"
return

^+q::ExitApp

^+p:: ; show the IPv4
Run, cmd.exe /k "ipconfig | find "IPv4""
return

^+w:: ; show the wifi passwords
Run, py wifi_password_reader.py
return

^+x:: ; clean the temp folder
Run, temp_clean.bat
return

!u::
Run, py pip_upgrader.py
return

!b:: ; reboot the PC
Run, % A_ComSpec /c "shutdown /r -t 0"
return

!n:: ; shutdown the PC
Run, % A_ComSpec /c "shutdown /s -t 0"
return

^+c::
Send, {F4}{Esc}cmd{ENTER}	; from the window's file explorer it lounches the cmd into the current folder
return

!t::
Run, wt
;WinActivate, Ubuntu
;WinWaitActive, Ubuntu
return

!w::
Run, wsl --shutdown
return

