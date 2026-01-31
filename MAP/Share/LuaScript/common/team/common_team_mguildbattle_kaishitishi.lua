--DECLARE_QUEST_INFO_START--
x303124_var_FileId 						= 303124

function x303124_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, varParam5 )

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	--local GetWeekcount = mod (GetWeekIndex() , 2)
	
	if minOfDay < 1168 or minOfDay > 1202 then
		return
	end

	if weekIdx ~= 2 and weekIdx ~= 5 then
		return
	end	
	
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	--local curWeek = 0
	--local curCount = 0
	local varMsg1 = format("跨服帮会战第"..curWeek.."周的比赛将在20:00正式开始，请大家做好准备。")
	--LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
	--LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
	SetSystemTimerTick( varMap, x303124_var_FileId, "ProcTimerTick", varAct, 1000)
	
end

function x303124_ProcTimerTick(varMap, varAct, varTime)

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	--local GetWeekcount = mod (GetWeekIndex() , 2)
	
	if minOfDay < 1170 or minOfDay > 1200 then
		return
	end

	if weekIdx ~= 2 and weekIdx ~= 5 then
		return
	end	
	
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	--local curWeek = 0
	--local curCount = 0
	local varMsg2 = format("跨服帮会战第"..curWeek.."周的比赛将在20:00正式开始，请大家做好准备。跨服帮会战本赛季已经进行了"..curCount.."场比赛。")
	LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_PLANE_SCROLL, 1)
	LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_LEFTDOWN, 1)
	--LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_MAIN_RIGHTDOWN, 1)
	SetSystemTimerTick( varMap, x303124_var_FileId, "ProcTimerTick", varAct, 1000 * 60 * 10 )
	
end
