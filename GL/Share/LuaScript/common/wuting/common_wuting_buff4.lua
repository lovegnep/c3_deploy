
x300168_var_FileId = 300168
x300168_var_FarScriptId = 300160
x300168_var_BuffId = 7649


function x300168_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300168_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300168_var_BuffId)
	end
end


function x300168_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300168_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300168_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300168_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300168_var_BuffId)
	end
end




function x300168_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


