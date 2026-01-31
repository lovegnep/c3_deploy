
x300855_var_FileId	= 300855

x300855_var_x1		= 391
x300855_var_z1		= 282
x300855_var_x2		= 410
x300855_var_z2		= 302

x300855_var_TimerIndex				=	6
x300855_var_Shoubian_FileId			=	300858
x300855_var_Quest_Id				=	7584





function x300855_GetQuestId( varMap, varPlayer )
	
	return x300855_var_Quest_Id
end


function x300855_ProcIntervalOverEvent( varMap, varPlayer )
	local varCountry = GetCurCountry( varMap, varPlayer )

	local nMyQuestId = x300855_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM(varMap,varPlayer,nMyQuestId) <= 0 then
        return 
    end















	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, nMyQuestId )
    local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

	if varCompleted>=1 then
		return
	end

	if varCountry==0 then
		if varMap==51 then
			if x300855_CheckPlayerInArea(varMap, varPlayer)>0 then
				x300855_AddShoubianBonus(varMap, varPlayer)
			end
		end
	end

	if varCountry==1 then
		if varMap==151 then
			if x300855_CheckPlayerInArea(varMap, varPlayer)>0 then
				x300855_AddShoubianBonus(varMap, varPlayer)
			end
		end
	end

	if varCountry==2 then
		if varMap==251 then
			if x300855_CheckPlayerInArea(varMap, varPlayer)>0 then
				x300855_AddShoubianBonus(varMap, varPlayer)
			end
		end
	end

	if varCountry==3 then
		if varMap==351 then
			if x300855_CheckPlayerInArea(varMap, varPlayer)>0 then
				x300855_AddShoubianBonus(varMap, varPlayer)
			end
		end
	end
end


function x300855_ProcActiveEvent( varMap, varPlayer )
	local nMyQuestId = x300855_GetQuestId( varMap, varPlayer )




end


function x300855_ProcFadeOutEvent( varMap, varPlayer )

	local varMyQuest = x300855_GetQuestId( varMap, varPlayer )
	
	if IsHaveQuestNM(varMap,varPlayer,varMyQuest) <= 0 then
        return 
    end


	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	LuaCallNoclosure(x300855_var_Shoubian_FileId,"QuestLogRefresh",varMap, varPlayer, varMyQuest)
end

function x300855_ProcEventEntry()
end




function x300855_CheckPlayerInArea(varMap, varPlayer)
	local varX,z =GetWorldPos(varMap,varPlayer)

	if varX>x300855_var_x1 and varX<x300855_var_x2 and z>x300855_var_z1 and z<x300855_var_z2 then
		return 1;
	end

	return 0;
end





function x300855_AddShoubianBonus(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local varDayCount = LuaCallNoclosure(x300855_var_Shoubian_FileId,"GetDayCount",varMap, varPlayer)
	if varDayCount == 0 then
		local varExp1 = floor((varLevel * 15000*0.15*0.3)/60)
		local exp2 = floor((varLevel * 15000*0.15*0.3)/60)
		local varExp = 0
		if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
			varExp = varExp1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			varExp = exp2;
		end 
		AddExp ( varMap , varPlayer , varExp )
		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet == 1 then
			AddExp ( varMap , varPlayer , varExp )
		end
	elseif varDayCount == 1 then
		local varExp1 =floor((varLevel * 15000*0.3*0.5)/60)
		local exp2 =floor((varLevel * 15000*0.3*0.5)/60)
		local varExp = 0
		if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
			varExp = varExp1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			varExp = exp2;
		end 
		AddExp ( varMap , varPlayer , varExp )
		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet == 1 then
			AddExp ( varMap , varPlayer , varExp )
		end
	elseif varDayCount == 2 then
		local varExp1 = floor((varLevel * 15000*0.5*0.7)/60)
		local exp2 = floor((varLevel * 15000*0.5*0.7)/60)
		local varExp = 0
		if GetLevel(varMap, varPlayer) >=30 and GetLevel(varMap, varPlayer) < 70 then
			varExp = varExp1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			varExp = exp2;
		end 
		AddExp ( varMap , varPlayer , varExp )
		local varRet = CountryIsFortuneTime(varMap,varPlayer,0)
		if varRet == 1 then
			AddExp ( varMap , varPlayer , varExp )
		end
	end
end


function x300855_ProcessQuestFail(varMap, varPlayer, varQuest)
end




function x300855_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DATE[1], DQ_SHOUBIAN_DATE[2],DQ_SHOUBIAN_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, DQ_SHOUBIAN_DAYCOUNT[1], DQ_SHOUBIAN_DAYCOUNT[2],DQ_SHOUBIAN_DAYCOUNT[3] );
	return varDaycount;



	

end

