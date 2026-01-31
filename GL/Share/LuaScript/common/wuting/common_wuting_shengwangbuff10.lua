
x300183_var_FileId = 300183
x300183_var_FarScriptId = 300160
x300183_var_BuffId = 7666


function x300183_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300183_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300183_var_BuffId)
	end
end


function x300183_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300183_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300183_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300183_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300183_var_BuffId)
	end
end




function x300183_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


