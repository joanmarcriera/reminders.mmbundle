#!/bin/bash

# Using osascript via bash. For some reason, using osascript directly prevents the Reminders.app from being launched.
osascript  <<END

on run argv
	set theFilename to "$1"
	set theName to do shell script "head -n1 " & theFilename
	set theNote to do shell script "tail -n+2 " & theFilename
	

	tell application "Reminders"
		set theReminder to make new reminder 
		set name of theReminder to theName
		set due date of theReminder to date ((date string of ((current date) + (1 * days))))
	end tell
end run
END