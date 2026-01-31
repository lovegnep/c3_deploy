


x310341_var_FileId = 310341

function x310341_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	if varMap ~= 39 then
			return
	end
	
	if 0 == varParam1 then 
		
		SetGrowPointIntervalContainer(varMap, 240, 45000)
	elseif 1 == varParam1 then 
		RecycleGrowPointByType(varMap, 240, -1)
	end
end
