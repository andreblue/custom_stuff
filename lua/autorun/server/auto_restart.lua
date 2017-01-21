local restart_times = {
	--This needs to be in 34 hour time
	["00:00"] = true,
	["12:00"] = true,
}
local notify_time = {
	["23:50"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "10 minutes!"},
	["23:55"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "5 minutes!"},
	["23:56"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "4 minutes!"},
	["23:57"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "3 minutes!"},
	["23:58"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "2 minutes!"},
	["23:59"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "1 minutes!"},
	["11:59"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "1 minutes!"},
	["11:50"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "10 minutes!"},
	["11:55"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "5 minutes!"},
	["11:56"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "4 minutes!"},
	["11:57"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "3 minutes!"},
	["11:58"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "2 minutes!"},
	["11:59"] = { Color(255,0,0), "Server will restart in ", Color(255,0,255), "1 minutes!"},
}
local date = os.date
hook.Add( "Initialize", "RestartCreateTimers", function()
	if timer.Exists( "RestartCheckTimer" ) then
		timer.Remove( "RestartCheckTimer" )
	end
	timer.Create( "RestartCheckTimer", 60, 0, function()
		local time = date( "%H:%M" )
		print(time)
		if restart_times[time] then RunConsoleCommand( "_restart" ) end
		if notify_time[time] then BroadcastChatPrintColored( notify_time[time] ) end
	end)
end
) 