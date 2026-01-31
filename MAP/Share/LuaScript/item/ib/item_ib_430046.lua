
--中级体力丹
x430046_var_FileId = 430046 
x430046_var_AddPhysicalForce =200		--增加体力值	
x430046_var_LimitCount =5			--限制使用个数





function x430046_ProcEventEntry( varMap, varPlayer, varBagIdx )
		return 0;
end






function x430046_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430046_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430046_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	if GetPlayerPhysicalForce(varMap, varPlayer) >= GetPlayerMaxPhysicalForce(varMap, varPlayer) then
		local varText = "您的体力值已满，不需要此物品"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		return 0
	end
	
	if x430046_GetDayCount(varMap, varPlayer) >= x430046_var_LimitCount then
			local varText = format("每天只能使用#G%d#cffcf00个体力丹！",x430046_var_LimitCount)
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText)
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			return 0		
	end

	return 1; 
end







function x430046_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x430046_ProcActivateOnce( varMap, varPlayer )
	if x430046_GetDayCount(varMap, varPlayer) < x430046_var_LimitCount then
		local varTili = GetPlayerMaxPhysicalForce(varMap, varPlayer)
		local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
		local Addvalue = curForce + x430046_var_AddPhysicalForce
		if Addvalue > varTili then
			Addvalue = varTili 
		end
		SetPlayerPhysicalForce(varMap, varPlayer, Addvalue)
		x430046_SetDayCount(varMap, varPlayer)
		GamePlayScriptLog(varMap,varPlayer,3052)
	end
	return 1;
end







function x430046_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x430046_GetDayCount(varMap, varPlayer)
	local day = GetDayOfYear()
	local rday = GetPlayerGameData(varMap,varPlayer,MD_WUYILINGJIANG_DATE[1],MD_WUYILINGJIANG_DATE[2],MD_WUYILINGJIANG_DATE[3])
	local daycount =  GetPlayerGameData(varMap, varPlayer, MD_TILIDAN_COUNT[1], MD_TILIDAN_COUNT[2], MD_TILIDAN_COUNT[3])
	if day ~= rday then
		return 0
	else
		return daycount
	end
	
	return 0
end

function x430046_SetDayCount(varMap, varPlayer)
	local day = GetDayOfYear()
	local rday = GetPlayerGameData(varMap, varPlayer, MD_WUYILINGJIANG_DATE[1], MD_WUYILINGJIANG_DATE[2], MD_WUYILINGJIANG_DATE[3])

	if day ~= rday then
		SetPlayerGameData(varMap, varPlayer, MD_WUYILINGJIANG_DATE[1], MD_WUYILINGJIANG_DATE[2], MD_WUYILINGJIANG_DATE[3], day)
		SetPlayerGameData(varMap, varPlayer, MD_TILIDAN_COUNT[1], MD_TILIDAN_COUNT[2], MD_TILIDAN_COUNT[3], 1)
	else
		local daycount = GetPlayerGameData(varMap, varPlayer, MD_TILIDAN_COUNT[1], MD_TILIDAN_COUNT[2], MD_TILIDAN_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_TILIDAN_COUNT[1], MD_TILIDAN_COUNT[2], MD_TILIDAN_COUNT[3], daycount+1)
	end
end
