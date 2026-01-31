
x300166_var_FileId = 300166
x300166_var_FarScriptId = 300160
x300166_var_BuffId = 7647


function x300166_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300166_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300166_var_BuffId)
	end
end


function x300166_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300166_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300166_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300166_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300166_var_BuffId)
	end
end




function x300166_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


