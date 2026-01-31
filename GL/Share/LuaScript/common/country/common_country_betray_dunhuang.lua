x300823_var_FileId	= 300823
x300823_var_curCountryID = 3
x300823_var_GameOpenId = 1098
x300823_var_CountryTransPos = {
							[0] = {varMap=50,posX=128,posZ=30},
							[1] = {varMap=150,posX=128,posZ=30},
							[2] = {varMap=250,posX=128,posZ=30},
							[3] = {varMap=350,posX=128,posZ=30},
							}

x300823_var_Interval = 30 --叛国的周期间隔
x300823_var_DynamicBetrayLevelLimit = 70 --动态叛国的等级限制
x300823_var_CountryId = 3 --国家Id

function x300823_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
end


function x300823_ProcEventEntry( varMap, varPlayer, varTalknpc)		

	StartTalkTask(varMap)

		local Readme_1 = "#Y【国家】前往敦煌#r#W #r"	
		local Readme_2 = "   您确实想放弃现有的国籍，前往敦煌王国发展么？#r"
		local Readme_3 ="#G提示，您必须等以下情况消失或解除后，才可以进行国籍改变：#r"
		local Readme_4 ="#G1.保护时间内上线，或转换地图保护时间未消失。#r2.处于护送状态时。#r3.处于变身状态中。#r4.您身上有国家官职。#r5.您必须退出帮会。#r"
		local Readme_5 ="#G6.您在组队状态下。#r7.您必须完成或放弃身上的所有任务。#r8.您必须解除夫妻或师徒关系。#r9.距离上次改变国籍时间小于" .. x300823_var_Interval .. "天。"
		
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		TalkAppendString( varMap,varReadme)

	StopTalkTask(varMap)

	DeliverTalkMenu(varMap,varPlayer,varTalknpc);
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, 300823, -1 );

end




function x300823_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

	
	
		
		
		
		
		
		
	

	
	if IsPlayerMutexState(varMap, varPlayer,PLAYER_STATE_PROTECTTIME) == 1 then
		StartTalkTask(varMap)
		local varText = "很抱歉，您现在处于保护状态，请等状态消失后才能放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return		
	end
	
	
	
	
	if IsPlayerMutexState(varMap, varPlayer,PLAYER_STATE_CRASHBOX) == 1 then
		StartTalkTask(varMap)
		local varText = "很抱歉，您正处于护送状态，不能放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return		
	end	
	
	
	if IsPlayerMutexState(varMap, varPlayer,PLAYER_STATE_TIESAN) == 1 		
		or IsHaveSpecificImpact(varMap, varPlayer,7702) == 1				
		or IsPlayerMutexState(varMap, varPlayer,PLAYER_STATE_TONGQUBUFF) == 1	
		then
		StartTalkTask(varMap)
		local varText = "很抱歉，您正处于变身状态，不能放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return			
	end
	
	
	if CountryGetOfficial(varMap, varPlayer) ~= 0 then
		StartTalkTask(varMap)
		local varText = "很抱歉，您必须先辞去国家相关职务，才可以放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return			
	end
	
	if GetEmpirePosition( varMap, varPlayer ) ~= 0 then
			
			StartTalkTask(varMap)
			local varText = "很抱歉，您必须先辞去帝国相关职务，才可以放弃国籍！"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return			
	
	end
	
	
	if GetGuildID(varMap, varPlayer) ~= -1 then
		StartTalkTask(varMap)
		local varText = "很抱歉，您必须先脱离帮会，才可以放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return			
	end
	
	
	if GetQuestCount(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		local varText = "很抱歉，您必须先将您身上的任务完成或放弃，才可以放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return			
	end
	
	
	if IsMarried(varMap, varPlayer) == 1 then
		StartTalkTask(varMap)
		local varText = "很抱歉，您必须先解除夫妻关系，才可以放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return		
	end
	
	
	if IsHaveMaster(varMap, varPlayer) == 1 
		or IsHavePrentice(varMap, varPlayer) == 1  then
		StartTalkTask(varMap)
		local varText = "很抱歉，您必须先解除师徒关系，才可以放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return		
	end
	
	
	if HasTeam(varMap, varPlayer) == 1 then
		StartTalkTask(varMap)
		local varText = "很抱歉，您必须先退出队伍，才可以放弃国籍！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return	
	end	
	
	
	local varLastday = GetPlayerGameData(varMap,varPlayer,MD_COUNTRY_BETRAY_LASTDAY[1], MD_COUNTRY_BETRAY_LASTDAY[2],MD_COUNTRY_BETRAY_LASTDAY[3])
	local curDay = GetDayTime()
	local diffDay = x300823_GetDiffDay(varLastday,curDay)
	if diffDay < x300823_var_Interval then
		StartTalkTask(varMap)
		local varText = "很抱歉，放弃国籍" .. x300823_var_Interval .. "天内不能再次放弃国籍，请".. x300823_var_Interval - diffDay .."天后再来。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end
	
	
	return 1
	
end





function x300823_ProcAccept( varMap, varPlayer )
	
	--配置控制开关
	if GetCountryBetrayConfig() == 0 then
		return
	end

	--玩法控制开关
	if x300823_var_GameOpenId > 0 and GetGameOpenById( x300823_var_GameOpenId ) <= 0 then
      return
  end	
	
	local nCost = x300823_GetBetrayCost( varMap, varPlayer )
	if x300823_CostMoney(varMap, varPlayer, nCost ) == 0 then
		StartTalkTask(varMap)
		local varText = "很抱歉，您身上的现金不足以支付放弃国籍的费用！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return	
	end
	
	
	SendCountryBetrayMsg( varMap, varPlayer, x300823_var_curCountryID, x300823_var_FileId )

end




function x300823_ProcCountryBetrayResult( varMap, varPlayer, result )

	
	if result == 0 then
		
		StartTalkTask(varMap)
		local varText = "很抱歉，服务器内部错误，改变国籍失败！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		
		
		local nCost = x300823_GetBetrayCost( varMap, varPlayer )
		AddMoney( varMap, varPlayer, 3, nCost )
		
		return
	end
	
	
	
	StartTalkTask(varMap)
	local varText = "恭喜，您已顺利改变国籍为"..GetCountryName(x300823_var_curCountryID)
	TalkAppendString( varMap, varText )
	StopTalkTask( varMap )
	DeliverTalkTips( varMap, varPlayer )	
	
	
	local curDay = GetDayTime()
	SetPlayerGameData(varMap,varPlayer,MD_COUNTRY_BETRAY_LASTDAY[1], MD_COUNTRY_BETRAY_LASTDAY[2],MD_COUNTRY_BETRAY_LASTDAY[3], curDay )
	
	
	local newSceneId 	= x300823_var_CountryTransPos[x300823_var_curCountryID].varMap
	local newPosX		= x300823_var_CountryTransPos[x300823_var_curCountryID].posX
	local newPosZ		= x300823_var_CountryTransPos[x300823_var_curCountryID].posZ
	SetPlayerNextSceneInfo(varMap, varPlayer, newSceneId, newPosX, newPosZ)
	NewWorld(varMap, varPlayer, newSceneId, newPosX, newPosZ, x300823_var_FileId)
	
end




function x300823_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300823_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300823_CheckSubmit( varMap, varPlayer )
end



function x300823_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300823_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300823_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300823_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

--验证动态叛国条件
function x300823_CheckDynamicBetrayCondition()
	local nWorldId = GetWorldIdEx()
	local level = GetTopListInfo_MaxLevel(nWorldId)
	WriteLog(1, format("x300823_CheckDynamicBetrayCondition --- LevelToplist max level = %d", level))
	if (level >= x300823_var_DynamicBetrayLevelLimit) then
		return 1
	end
	return 0
end

function x300823_GetBetrayCost(varMap, varPlayer)

	local nRank = GetCountryRank(x300823_var_curCountryID)
	local nCost = 0
	
	if nRank == 0 then 
		nCost = 250000		
	elseif nRank == 1 or nRank == 2 then 
		nCost = 100000		
	elseif nRank == 3 then 
		nCost = 50000		
	end	

	local result = x300823_CheckDynamicBetrayCondition()
	WriteLog(1, format("x300823_GetBetrayCost --- result = %d", result))
	
	if (result == 1) then  --判断是否满足动态叛国的条件
		local total = x300823_GetStrongWeakTotal()
		local playerCountry = GetCurCountry(varMap, varPlayer)
		
		if (playerCountry ~= -1) then
		
			local playerCountryStrongWeak = GetStrongWeakScore(playerCountry)
			local betrayStrongWeak = GetStrongWeakScore(x300823_var_CountryId) --判去的国家
			WriteLog(1, format("x300823_GetBetrayCost --- playerCountryStrongWeak = %d, total = %d, betrayStrongWeak = %d"
									, playerCountryStrongWeak, total, betrayStrongWeak))
		
			if (playerCountryStrongWeak * 4 <= total) then 
				--本国强弱值小于1/4	
				if (playerCountryStrongWeak * 5 > total) then 
					--本国强弱值大于1/5
					if (betrayStrongWeak * 4 > total) then
						nCost = 100000
					end
					
				else 
					-- 本国强弱值小于1/5
					if (betrayStrongWeak * 4 > total) then
						nCost = 250000
					end
				end
				
			end
		end
	end

	return nCost
	
end

--获取所有国家强弱的总值
function x300823_GetStrongWeakTotal()
	local total = 0
	for i = 0, 3 do
		total = GetStrongWeakScore(i) + total
	end
	
	return total
end


function x300823_CostMoney( varMap, varPlayer, value )
	local nGoldMode = GetGoldMode( varMap, varPlayer )
	
	
		if CostMoney(varMap, varPlayer, 2, value,303) == -1 then
			return 0
		end
	
	
		
			
				
			
		
	
	
		
	

	return 1
end



function x300823_GetDiffDay( varLastday, curDay )
	local diffDay = 0;
	local lastYear = floor(varLastday/1000);
	local curYear = floor(curDay/1000);
	local lastDayofYear = mod(varLastday,1000);
	local curDayOfYear = mod(curDay,1000);
	local varDaycount = 365;

	if mod(lastYear,4)==0 then
		varDaycount = 366;
	end
	
	if curDay<varLastday then
		diffDay = 0
	elseif curYear == lastYear then
		diffDay = curDay - varLastday
	elseif curYear < lastYear then
		diffDay = 0
	elseif curYear > lastYear then
		diffDay = (curYear-lastYear)*varDaycount + curDayOfYear - lastDayofYear;
	end
	
	return diffDay
end
