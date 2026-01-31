
x300382_var_FileId = 300382


function x300382_ProcIntervalOverEvent( varMap, varPlayer )
	if varMap == 0 then
		local varLevel = GetLevel(varMap, varPlayer)
		local varExp = varLevel * varLevel
		AddExp ( varMap , varPlayer , varExp )
	end
end


function x300382_ProcActiveEvent( varMap, varPlayer )
end


function x300382_ProcFadeOutEvent( varMap, varPlayer )
end

function x300382_ProcEventEntry()
end
