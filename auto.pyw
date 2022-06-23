import subprocess

# reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v "name" /t REG_SZ /d "path"

def log(text):
	with open("log.txt", "w") as f:
		f.write(str(text))


try:
	subprocess.Popen("C:/Python/auto/auto.ahk", shell=True)
except Exception as e:
	log(str(e))
