
x300174_var_FileId = 300174
x300174_var_FarScriptId = 300160
x300174_var_BuffId = 7645


function x300174_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300174_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300174_var_BuffId)
	end
end


function x300174_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300174_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300174_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300174_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300174_var_BuffId)
	end
end




function x300174_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


