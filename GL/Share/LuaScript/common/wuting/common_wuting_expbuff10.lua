
x300181_var_FileId = 300181
x300181_var_FarScriptId = 300160
x300181_var_BuffId = 7667


function x300181_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300181_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300181_var_BuffId)
	end
end


function x300181_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300181_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300181_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300181_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300181_var_BuffId)
	end
end




function x300181_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


