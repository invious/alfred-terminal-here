#on alfred_script(q)
set finderPath to ""

tell application "Finder"
	try
		set finderFolder to (folder of the front window as alias)
	on error
		set finderFolder to (path to home folder as alias)
	end try
	set finderPath to quoted form of POSIX path of finderFolder
end tell

tell application "Terminal"
	if application "Terminal" is running then
		activate
		tell application "System Events" to keystroke "t" using {command down}
	else
		activate
	end if
	
	do script ("cd " & finderPath) in window 1
end tell
#end alfred_script