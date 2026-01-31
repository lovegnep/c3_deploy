--DECLARE_QUEST_INFO_START--
x303125_var_FileId 						= 303125

function x303125_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, varParam5 )

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	--local GetWeekcount = mod (GetWeekIndex() , 2)
	
	if minOfDay < 1228 or minOfDay > 1382 then
		return
	end

	if weekIdx ~= 2 and weekIdx ~= 5 then
		return
	end	
	
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	--local curWeek = 0
	--local curCount = 0
	local varMsg1 = nil
	if ( curWeek == 12 and curCount == 24 ) then
		varMsg1 = format("本赛季跨服帮会战已结束，请及时领取赛季排行奖励。")
	else
		varMsg1 = format("请及时领取跨服帮会战奖励。")
	end
	--LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
	--LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
	SetSystemTimerTick( varMap, x303125_var_FileId, "ProcTimerTick", varAct, 1000)
	
end

function x303125_ProcTimerTick(varMap, varAct, varTime)

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	--local GetWeekcount = mod (GetWeekIndex() , 2)
	
	if minOfDay < 1230 or minOfDay > 1380 then
		return
	end

	if weekIdx ~= 2 and weekIdx ~= 5 then
		return
	end	
	
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	--local curWeek = 0
	--local curCount = 0
	local varMsg2 = nil
	if ( curWeek == 12 and curCount == 24 ) then
		varMsg2 = format("本赛季跨服帮会战已结束，请及时前往本国的帮战发布人处领取跨服帮会战赛季排行榜奖励。")
	else
		varMsg2 = format("请及时前往本国的帮战发布人处领取跨服帮会战奖励。")
	end
	LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_PLANE_SCROLL, 1)
	LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_LEFTDOWN, 1)
	--LuaAllScenceM2Wrold(varMap, varMsg2, CHAT_MAIN_RIGHTDOWN, 1)
	SetSystemTimerTick( varMap, x303125_var_FileId, "ProcTimerTick", varAct, 1000 * 60 * 30 )
	
end
