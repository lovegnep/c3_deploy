
x300165_var_FileId = 300165
x300165_var_FarScriptId = 300160
x300165_var_BuffId = 7650


function x300165_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300165_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300165_var_BuffId)
	end
end


function x300165_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300165_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300165_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300165_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300165_var_BuffId)
	end
end




function x300165_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


