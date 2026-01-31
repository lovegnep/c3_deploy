x310157_var_FileId = 310157
 
x310157_var_GameOpenId = 1026

function x310157_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )

    if GetGameOpenById(x310157_var_GameOpenId) <= 0 then
		return
	end

	
	if CountryBattleLite_CheckWeekConfig() == 0 then
		return
	end
	
	
	
	if varAct == 42 then
		
		LuaAllScenceM2Wrold(varMap,"屠城战将于16：00开启，身处中兴府，王城，边境的国民可以参加！",1,1)
		
	elseif varAct == 43 then
		
		LuaAllScenceM2Wrold(varMap,"屠城战将在5分钟后开始，国民请尽快赶往中兴府，王城，边境参加屠城战！",1,1)
		
	elseif varAct == 44 then
		
		LuaAllScenceM2Wrold(varMap,"屠城战火热进行中，您可以在国家管理员处参加！",1,1)
		
	elseif varAct == 45 then
		
		LuaAllScenceM2Wrold(varMap,"距离屠城战参加截止时间还有5分钟！",1,1)
	
	elseif varAct == 46 then
	
	    LuaAllScenceM2Wrold(varMap,"屠城战已经结束！",1,1)
	end

end
