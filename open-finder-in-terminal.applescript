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
		activate
		do script "cd " & finderPath
	end tell
#end alfred_script