
x300176_var_FileId = 300176
x300176_var_FarScriptId = 300160
x300176_var_BuffId = 7644


function x300176_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300176_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300176_var_BuffId)
	end
end


function x300176_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300176_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300176_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300176_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300176_var_BuffId)
	end
end




function x300176_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


