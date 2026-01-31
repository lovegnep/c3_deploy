
x203383_var_FileId = 203383
x203383_var_BuffId = 32612



function x203383_ProcIntervalOverEvent( varMap, varPlayer)
	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID ~= -1 and IsObjValid (varMap,varBusID) == 1 then
		return
	end
	local obj = {138002,123828,126126,129177,132156}
	--local monobj = FindMonsterByGUID(varMap,138002)
	--local playerx,playery =GetWorldPos( varMap, varPlayer) 
	--local monx,mony = GetWorldPos( varMap, monobj)
	--local dir = (playerx-monx)*(playerx-monx) + (playery-mony)*(playery-mony)
--	if dir >100 then
		local questid = {3202,3295,3395,3498,3795}
		local pos = {{299,324},{185,111},{185,111},{185,111},{185,111}}
		for k ,v in questid do
			if IsHaveQuest(varMap,varPlayer, v) > 0 then
				if k>1 and k<=5 and (varMap ==50 or varMap == 150 or varMap == 250 or varMap ==350) then
					SetPos(varMap, varPlayer ,pos[k][1],pos[k][2])
					if IsHaveSpecificImpact( varMap, varPlayer, x203383_var_BuffId) == 1 then
				 		DispelSpecificImpact( varMap, varPlayer, x203383_var_BuffId)
				 	end
					local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, v )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
			 	elseif k== 1 and (varMap ==87 or varMap == 187 or varMap == 287 or varMap ==387) then
				 	SetPos(varMap, varPlayer ,pos[k][1],pos[k][2])
					if IsHaveSpecificImpact( varMap, varPlayer, x203383_var_BuffId) == 1 then
				 		DispelSpecificImpact( varMap, varPlayer, x203383_var_BuffId)
				 	end
					local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, v )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )

			 	end

			 	
			end
		end
--	end

 	 
end


function x203383_ProcActiveEvent( varMap, varPlayer )

end


function x203383_ProcFadeOutEvent( varMap, varPlayer )
end




function x203383_ProcEventEntry( varMap, varPlayer, varBagIdx)
end




