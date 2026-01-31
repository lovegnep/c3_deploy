
x300380_var_FileId = 300380

function x300380_ProcIntervalOverEvent( varMap, varPlayer )
	if varMap == 0 then
		local varLevel = GetLevel(varMap, varPlayer)
		local varExp = varLevel * varLevel
		AddExp ( varMap , varPlayer , varExp )
	end
end


function x300380_ProcActiveEvent( varMap, varPlayer )
end


function x300380_ProcFadeOutEvent( varMap, varPlayer )
end

function x300380_ProcEventEntry()
end
