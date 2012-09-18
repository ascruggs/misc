--Sync photo dir to S3
tell application "Transmit"
	-- Prevent interactive alerts from popping up during script execution
	set SuppressAppleScriptAlerts to true
	
	-- CONFIGURATION - edit what you need to below
	-- replace "LincolnMullen" with the name of your favorite
	set remoteFavorite to item 1 of (favorites whose name is "S3")
	-- replace everything in between "" to the remote path you want to sync TO
	set remotePath to "static.scrug.gs/Pictures"
	-- replace everything in between "" to the local path you want to sync FROM
	set localPath to "/Users/aascruggs/Dropbox/Photos"
	-- END CONFIGURATION
	
	-- set a variable naming all the skip rules that are enabled in Transmit preferences
	set myRules to (skip rules whose enabled is true)
	
	-- Create a new window (and thus a single tab) for this script
	tell current tab of (make new document at end)
		
		-- Go into the local and remote folders that we want to sync.
		change location of local browser to path localPath
		connect to remoteFavorite
		change location of remote browser to path remotePath
		
		-- Run a sync from the current local folder to the current remote folder
		synchronize local browser to remote browser using skip rules myRules with automatically determine time offset
		-- Close the current window
		close
	end tell
end tell
