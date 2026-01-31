
x310926_var_FileId = 310926

function x310926_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
	SetGrowPointIntervalContainer(varMap, 241, 1000)
	if varMap ==36 then
		local varMsg1 = "新年礼物出现在大都东、南、西！"
		LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
	end
end
