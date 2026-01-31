
x310186_var_FileId = 310186

function x310186_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	if GetWeek() ~= 0 then
		return
	end

	if varMap ~= 0 then
		return
	end

	if WULONGCIDIAN_AWARD_COUNT  <= 0 then
		return
	end
	
	for varI=1, WULONGCIDIAN_AWARD_COUNT do
		if varI==1 then
			local varMsg = format("#G恭喜#Y%s#G获得#Y%s#G的称号,请前往大都在大内总管海总管处领取奖励。", WULONGCIDIAN_AWARD_NAME[varI], "乌龙宗师")
			LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
		elseif varI==2 then
			local varMsg = format("#G恭喜#Y%s#G获得#Y%s#G的称号,请前往大都在大内总管海总管处领取奖励。", WULONGCIDIAN_AWARD_NAME[varI], "乌龙高手")
			LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
		elseif varI==3 then
			local varMsg = format("#G恭喜#Y%s#G获得#Y%s#G的称号,请前往大都在大内总管海总管处领取奖励。", WULONGCIDIAN_AWARD_NAME[varI], "乌龙强人")
			LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 0)
		end
			
	end

	for varI=1, 3 do
		WULONGCIDIAN_AWARD_Draw[varI] = 0
	end

end
