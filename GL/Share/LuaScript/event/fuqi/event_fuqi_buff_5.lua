
x300384_var_FileId = 300384


function x300384_ProcIntervalOverEvent( varMap, varPlayer )
	if varMap == 0 then
		local varLevel = GetLevel(varMap, varPlayer)
		local varExp = varLevel * varLevel
		AddExp ( varMap , varPlayer , varExp )
	end
end


function x300384_ProcActiveEvent( varMap, varPlayer )
end


function x300384_ProcFadeOutEvent( varMap, varPlayer )
end

function x300384_ProcEventEntry()
end
