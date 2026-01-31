
x310234_var_x1		= 179
x310234_var_z1		= 33
x310234_var_x2		= 219
x310234_var_z2		= 73
x310234_var_GameId = 1101
x310234_var_Xinbing_FileId			=	310234

function x310234_ProcIntervalOverEvent( varMap, varPlayer )
	if GetGameOpenById(x310234_var_GameId) ~= 1 then
		return
	end

				x310234_AddShoubianBonus(varMap, varPlayer)

end


function x310234_ProcActiveEvent( varMap, varPlayer )

end


function x310234_ProcFadeOutEvent( varMap, varPlayer )

end

function x310234_ProcEventEntry()

end

function x310234_CheckPlayerInArea(varMap, varPlayer)
	local varX,z =GetWorldPos(varMap,varPlayer)
	if varX>x310234_var_x1 and varX<x310234_var_x2 and z>x310234_var_z1 and z<x310234_var_z2 then
		return 1;
	end
	return 0;
end

function x310234_AddShoubianBonus(varMap, varPlayer)
			
		local varExp =floor(x310234_GetPerExpBonus(varMap, varPlayer )/30)
		AddExp ( varMap , varPlayer , varExp )
			
end

function x310234_ProcessQuestFail(varMap, varPlayer, varQuest)
end


function x310234_GetAllExpBonus(varMap, varPlayer )

	local varLevel = GetLevel(varMap, varPlayer)
	local muli = x310234_GetExpBonusMuil(varMap, varPlayer )
	local awardexp = 0
	if varLevel < 70 then 
		awardexp = 100 * 1.5 * varLevel / 6 * 4 * 2 * 3600 * muli
	elseif varLevel < 80 then 
		awardexp = 100 * 2.7 * varLevel / 6 * 4 * 2 * 3600 * muli
	elseif varLevel < 90 then 
		awardexp = 100 * 5.4 * varLevel / 6 * 4 * 2 * 3600 * muli
	elseif varLevel >= 90 then 
	 	awardexp = 100 * 5.4 * varLevel / 6 * 5.2 * 2 * 3600 * muli
	end 
	return awardexp	
end

function x310234_GetPerExpBonus(varMap, varPlayer )

	local awardexp = 0
	local allexp = x310234_GetAllExpBonus(varMap, varPlayer )
	awardexp = floor(allexp/15*5) 
	return awardexp	
end

function x310234_GetDayCount(varMap, varPlayer)
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAY[1], MD_QUEST_SUCHENGNEW_DAY[2], MD_QUEST_SUCHENGNEW_DAY[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_QUEST_SUCHENGNEW_DAYCOUNT[1], MD_QUEST_SUCHENGNEW_DAYCOUNT[2], MD_QUEST_SUCHENGNEW_DAYCOUNT[3])
		return varDaycount

end

function x310234_GetExpBonusMuil(varMap, varPlayer )
	local varLevelMax = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
	local level = GetLevel(varMap, varPlayer)	
	local Muil = 1
	if varLevelMax < 70 then 
		if level < 50 then
			Muil = 1.2
		end
	elseif varLevelMax < 80 then 
		if level < 50 then
			Muil = 1.5
		elseif level < 60 then
			Muil = 1.2		
		end
	elseif varLevelMax < 90 then 
		if level < 50 then
			Muil = 1.9
		elseif level < 60 then
			Muil = 1.5	
		elseif level < 70 then
			Muil = 1.2	
		end
	elseif varLevelMax < 100 then 
		if level < 50 then
			Muil = 2.5
		elseif level < 60 then
			Muil = 2
		elseif level < 70 then
			Muil = 1.6	
		elseif level < 80 then
			Muil = 1.3			
		end
	elseif varLevelMax < 110 then 
		if level < 50 then
			Muil = 3.2
		elseif level < 60 then
			Muil = 2.6		
		elseif level < 70 then
			Muil = 2.1	
		elseif level < 80 then
			Muil = 1.7	
		elseif level < 90 then
			Muil = 1.4							
		end
	elseif varLevelMax < 120 then 
		if level < 50 then
			Muil = 3.9
		elseif level < 60 then
			Muil = 3.2		
		elseif level < 70 then
			Muil = 2.6
		elseif level < 80 then
			Muil = 2.1
		elseif level < 90 then
			Muil = 1.7
		elseif level < 100 then
			Muil = 1.4
		end
	elseif varLevelMax >= 120 then 
		if level < 50 then
			Muil = 4.5
		elseif level < 60 then
			Muil = 3.7		
		elseif level < 70 then
			Muil = 3
		elseif level < 80 then
			Muil = 2.4
		elseif level < 90 then
			Muil = 1.9
		elseif level < 100 then
			Muil = 1.5
		elseif level < 110 then
			Muil = 1.2
		end		
	end 
	return Muil
end
