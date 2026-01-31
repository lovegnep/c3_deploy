
x310342_var_FileId 		= 310342
x310342_var_HongBuff		= 7536
x310342_var_LanBuff		= 7537


function x310342_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
end
function x310342_ProcEventEntry( varMap, varPlayer, varBagIdx )
end

function x310342_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
end
function x310342_ProcTimerDoingStart( varMap, TimerId, varParam1, varParam2, varParam3, varParam4, Param5)
	
    SetSystemTimerTick( varMap, 310342, "ProcTimer", TimerId, 1000)
    
end
function x310342_ProcTimer( varMap, TimerId, varTime)
	
	local hour,minute,sec =GetHourMinSec();
	if hour == 23 and minute == 0 and sec >= 0 then
		local varHumanCount = GetScenePlayerCount( varMap)
	    if varHumanCount > 0 then
	        for varI = 0, varHumanCount do
	            local varObj = GetScenePlayerObjId( varMap,varI)
	            if varObj >= 0 then
	            	CancelSpecificImpact( varMap, varObj, x310342_var_HongBuff)
        			CancelSpecificImpact( varMap, varObj, x310342_var_LanBuff)
        			SendSpecificImpactToUnit( varMap, varObj, varObj, varObj, 8400, 0) 
	            end
	        end
	    end
    
		
	end
end
