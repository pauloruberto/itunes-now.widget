on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running


set safRunning to is_running("iTunes")
if safRunning then
	run script "tell application \"iTunes\"
		if player state is playing then
			set bitR to \" \"
			set mark to \"  \"
			set star to \"★\"
			set nowrating to \"\"
			repeat ((rating of current track) / 20) times
				set nowrating to (nowrating & star)
			end repeat

			set mark to \"<prehalf>🏁 </prehalf>\"
			if (player position/duration of current track) > .5 then
				set mark to \"<posthalf>🏁 </posthalf>\"
			end if
			
			if (bit rate of current track) > 320 then
				set bitR to \"💿\"
			end if
		return mark & \"<nowtrack><em>\" & name of current track & \"</em></nowtrack> <punct>by</punct> \" & \"<nowartist>\" & artist of current track & \"</nowartist> <punct>on</punct> \" & \"<nowalbum>\" & album of current track & \"</nowalbum>\" & \"<metaInfo> \" & year of current track & \"</metaInfo>\" & \"<metaInfo>\" & time of current track & \"</metaInfo><metaInfo>\"  &  track number of current track & \"/\" & track count of current track & \"</metaInfo>\" & \"<metaInfo>\"  & bitR & \"</metaInfo></br>\" & nowrating
		end if	
	end tell"
end if