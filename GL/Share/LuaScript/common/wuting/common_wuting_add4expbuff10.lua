
x300191_var_FileId = 300191
x300191_var_FarScriptId = 300160
x300191_var_BuffId = 7668


function x300191_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300191_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300191_var_BuffId)
	end
end


function x300191_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300191_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300191_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300191_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300191_var_BuffId)
	end
end




function x300191_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


