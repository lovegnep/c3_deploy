--DECLARE_QUEST_INFO_START--
x303121_var_FileId 						= 303121

function x303121_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, varParam5 )

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	--local GetWeekcount = mod (GetWeekIndex() , 2)
	
	if minOfDay < 1018 or minOfDay > 1112 then
		return
	end

	if weekIdx ~= 2 and weekIdx ~= 5 then
		return
	end	
	
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	--local curWeek = 0
	--local curCount = 0
	local varMsg1 = format("跨服帮会战第"..curWeek.."周的比赛现在开始报名，本赛季已经进行了"..curCount.."场比赛。")
	--LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
	--LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
	SetSystemTimerTick( varMap, x303121_var_FileId, "ProcTimerTick", varAct, 1000)
	
end

function x303121_ProcTimerTick(varMap, varAct, varTime)

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	--local GetWeekcount = mod (GetWeekIndex() , 2)
	
	if minOfDay < 1020 or minOfDay > 1110 then
		return
	end

	if weekIdx ~= 2 and weekIdx ~= 5 then
		return
	end	
	
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	--local curWeek = 0
	--local curCount = 0
	local varMsg2 = format("跨服帮会战第"..curWeek.."周的比赛报名已开始，请各帮帮主通过随身战场报名按钮报名参加。跨服帮会战本赛季已经进行了"..curCount.."场比赛。")
	LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_PLANE_SCROLL, 1)
	LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_LEFTDOWN, 1)
	--LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_MAIN_RIGHTDOWN, 1)
	SetSystemTimerTick( varMap, x303121_var_FileId, "ProcTimerTick", varAct, 1000 * 60 * 15 )
	
end
