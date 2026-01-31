
x300383_var_FileId = 300383


function x300383_ProcIntervalOverEvent( varMap, varPlayer )
	if varMap == 0 then
		local varLevel = GetLevel(varMap, varPlayer)
		local varExp = varLevel * varLevel
		AddExp ( varMap , varPlayer , varExp )
	end
end


function x300383_ProcActiveEvent( varMap, varPlayer )
end


function x300383_ProcFadeOutEvent( varMap, varPlayer )
end

function x300383_ProcEventEntry()
end
