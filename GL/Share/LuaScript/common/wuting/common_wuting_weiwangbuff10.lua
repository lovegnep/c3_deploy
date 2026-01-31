
x300185_var_FileId = 300185
x300185_var_FarScriptId = 300160
x300185_var_BuffId = 7665


function x300185_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300185_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300185_var_BuffId)
	end
end


function x300185_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300185_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300185_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300185_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300185_var_BuffId)
	end
end




function x300185_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


