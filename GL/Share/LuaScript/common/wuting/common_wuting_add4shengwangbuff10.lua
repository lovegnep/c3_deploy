
x300189_var_FileId = 300189
x300189_var_FarScriptId = 300160
x300189_var_BuffId = 7669


function x300189_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300189_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300189_var_BuffId)
	end
end


function x300189_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300189_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300189_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300189_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300189_var_BuffId)
	end
end




function x300189_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


