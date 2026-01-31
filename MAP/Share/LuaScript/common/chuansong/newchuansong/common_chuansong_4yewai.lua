
x550006_var_SceneID1 =50								
x550006_var_SceneID2 =150	  						 	
x550006_var_SceneID3 =250								
x550006_var_SceneID4 =350								

x550006_var_TargetTypeId = {8000,8001,8002,8003} 





function x550006_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	local varCountry = GetCurCountry(varMap, varPlayer)
	local nDefaultCamp = GetSceneCamp( varMap )

	nDefaultCamp = nDefaultCamp - 16
	
	if varCountry == nDefaultCamp then
		if varCountry == 0 then
			DeliverTransferType(varMap, varPlayer, -1, x550006_var_TargetTypeId[1], -1)
		elseif varCountry == 1 then                  
			DeliverTransferType(varMap, varPlayer, -1, x550006_var_TargetTypeId[2], -1)
		elseif varCountry == 2 then                  
			DeliverTransferType(varMap, varPlayer, -1, x550006_var_TargetTypeId[3], -1)
		elseif varCountry == 3 then                  
			DeliverTransferType(varMap, varPlayer, -1, x550006_var_TargetTypeId[4], -1)
		end
	else
		return
	end
end

function x550006_ProcEventEntry( varMap, varPlayer,varTalknpc )


















	
end




















































function x550006_ProcMapTimerTick( varMap, monsterobjid )

end


function x550006_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550006_ProcEventEntry( varMap, monsterobjid )

end
