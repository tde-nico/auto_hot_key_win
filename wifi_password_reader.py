import subprocess

data = subprocess.check_output(['netsh','wlan','show','profiles'])
data = data.decode('cp1252').split('\n') # cp1252 or utf-8
profiles = [profile.split(":")[1][1:-1] for profile in data if "Tutti i profili utente" in profile] # all users profiles

for profile in profiles:
	results = subprocess.check_output(['netsh','wlan','show','profile',profile,'key=clear'])
	results = results.decode('cp1252').split('\n') # cp1252 or utf-8
	results = [content.split(":")[1][1:-1] for content in results if "Contenuto chiave" in content] # key content
	try:
		print("{:<30}|  {:<}".format(profile, results[0]))
	except:
		print("{:<30}|  {:<}".format(profile, ""))

input('\nPress ENTER to exit')

