
x300167_var_FileId = 300167
x300167_var_FarScriptId = 300160
x300167_var_BuffId = 7648


function x300167_ProcIntervalOverEvent( varMap, varPlayer)
	if varMap == 14 then
		LuaCallNoclosure(x300167_var_FarScriptId, "ProcIntervalOverEvent", varMap, varPlayer, x300167_var_BuffId)
	end
end


function x300167_ProcActiveEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300167_var_FarScriptId, "ProcActiveEvent", varMap, varPlayer)
	end
end


function x300167_ProcFadeOutEvent( varMap, varPlayer )
	if varMap == 14 then
		LuaCallNoclosure(x300167_var_FarScriptId, "ProcFadeOutEvent", varMap, varPlayer, x300167_var_BuffId)
	end
end




function x300167_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


