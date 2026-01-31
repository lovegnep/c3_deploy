
x300381_var_FileId = 300381


function x300381_ProcIntervalOverEvent( varMap, varPlayer )
	if varMap == 0 then
		local varLevel = GetLevel(varMap, varPlayer)
		local varExp = varLevel * varLevel
		AddExp ( varMap , varPlayer , varExp )
	end
end


function x300381_ProcActiveEvent( varMap, varPlayer )
end


function x300381_ProcFadeOutEvent( varMap, varPlayer )
end

function x300381_ProcEventEntry()
end
