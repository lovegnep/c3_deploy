
x310372_var_FileId 		= 310372



function x310372_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
end

function x310372_ProcEventEntry( varMap, varPlayer, varBagIdx )
end

function x310372_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
end

function x310372_ProcTimerDoingStart( varMap, TimerId, varParam1, varParam2, varParam3, varParam4, Param5)
	
    SetSystemTimerTick( varMap, 310372, "ProcTimer", TimerId, 1000)
    
end

function x310372_ProcTimer( varMap, TimerId, varTime)
	
	local hour,minute,sec =GetHourMinSec();
	if hour == 23 and minute == 0 and sec >= 0 then
		local varHumanCount = GetScenePlayerCount( varMap)
	    if varHumanCount > 0 then
	        for varI = 0, varHumanCount do
	            local varObj = GetScenePlayerObjId( varMap,varI)
	            if varObj >= 0 then
        			SendSpecificImpactToUnit( varMap, varObj, varObj, varObj, 8400, 0) 
	            end
	        end
	    end
	end

    
    SetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO1, -1)
end
