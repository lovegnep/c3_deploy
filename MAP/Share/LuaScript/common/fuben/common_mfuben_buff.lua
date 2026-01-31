
x303180_var_FileId = 303180
x303180_var_BuffId = 8399
x303180_var_Pos  = {
							 			{NewMap = 50 ,varX = 69, varZ = 184},
							 			{NewMap = 150 ,varX = 72, varZ = 184},
							 			{NewMap = 250 ,varX = 182, varZ = 71},
							 			{NewMap = 350 ,varX = 193, varZ = 68}
									 }
function x303180_ProcIntervalOverEvent( varMap, varPlayer)
end


function x303180_ProcActiveEvent( varMap, varPlayer )
end


function x303180_ProcFadeOutEvent( varMap, varPlayer )
    local guo = GetCurCountry(varMap,varPlayer) +1
    if varMap == 4096 or varMap == 4097 or varMap == 4098 or varMap == 4099 then
			NewWorld( varMap, varPlayer, x303180_var_Pos[guo].NewMap, x303180_var_Pos[guo].varX, x303180_var_Pos[guo].varZ, 303180)
    end
end




function x303180_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


