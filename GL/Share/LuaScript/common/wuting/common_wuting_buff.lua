
x300162_var_FileId = 300162
x300162_var_FarScriptId = 300160
x300162_var_BuffId = 7646


function x300162_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300162_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300162_var_BuffId)
	end
end


function x300162_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300162_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300162_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300162_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300162_var_BuffId)
	end
end




function x300162_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


