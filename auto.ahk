#NoEnv
SendMode Input
SetWorkingDir, %A_ScriptDir%

; ^ = CTRL, # = WIN, ! = ALT, + = Shift

^+q::ExitApp

^+p:: ; show the IPv4
Run, cmd.exe /k "ipconfig | find "IPv4""
return

^+w:: ; show the wifi passwords
Run, wifi_password_reader.py
return

^+x:: ; clean the temp folder
Run, temp_clean.bat
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

#Enter::
Run, cmd.exe
WinActivate, C:\windows\SYSTEM32\cmd.exe
WinWaitActive, C:\windows\SYSTEM32\cmd.exe
Send, ubuntu{ENTER}desk{ENTER}c{ENTER}	; desk -> alias for "cd Desktop", c -> alias for "clear"
return

^+m::
Send, c{ENTER}m{Enter}	; c -> alias for "clear", m -> alias for "make"
return

^+r::
Send, c{ENTER}r{Enter}	; c -> alias for "clear", r -> alias for "make run"
return
