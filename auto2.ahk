SendMode("Input")
SetWorkingDir(A_ScriptDir)

; ^ = CTRL, # = WIN, ! = ALT, + = Shift

^+q::ExitApp()

^+w:: { ; show the wifi passwords
	Run("py wifi_password_reader.py")
}

^+x:: { ; clean the temp folder
	Run("temp_clean.bat")
}

!u:: {
	Run("py pip_upgrader.py")
}

!f:: {
	Run("port_forwarder.exe 172.29.54.192")
}

!b:: { ; reboot the PC
	Run("shutdown /r -t 0")
}

!n:: { ; shutdown the PC
	Run("shutdown /s -t 0")
}

!t:: {
	Run("wt")
}

!w:: {
	Run("wsl --shutdown")
}
