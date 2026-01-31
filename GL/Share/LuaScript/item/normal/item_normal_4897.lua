






x404897_var_FileId 		= 404897 

x404897_var_LevelMin		=	20






function x404897_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404897_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404897_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404897_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404897_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x404897_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if x404897_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"本威望包一周只能开启一次,请您尝试其他威望包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	StartItemTask(varMap)
	local varLevel = GetLevel( varMap,varPlayer )

	if varLevel>=100 then
	    ItemAppendBind( varMap, 12030259, 4 )
	elseif varLevel>=90  then
		ItemAppendBind( varMap, 12030257, 4 )
	elseif varLevel >= 80 and varLevel < 90  then
		ItemAppendBind( varMap, 12030256, 4 )
	elseif varLevel >= 70 and varLevel < 80 then
		ItemAppendBind( varMap, 12030255, 4 )
	elseif varLevel >= 60 and varLevel < 70 then
		ItemAppendBind( varMap, 12030254, 4 )
	elseif varLevel >= 50 and varLevel < 60 then
		ItemAppendBind( varMap, 12030253, 4 )
	elseif varLevel >= 40 and varLevel < 50 then
		ItemAppendBind( varMap, 12030252, 4 )
	elseif varLevel >= 30 and varLevel < 40 then
		ItemAppendBind( varMap, 12030251, 4 )
	elseif varLevel >= 20 and varLevel < 30 then
		ItemAppendBind( varMap, 12030250, 4 )
	else
		return
	end

	local varRet = StopItemTask(varMap,varPlayer)

	if varRet>0 then

		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开威望月饼包，获得了奖励物品")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)

			x404897_SaveDoTime(varMap, varPlayer)
			
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x404897_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x404897_IsOneWeekPassed(varMap, varPlayer)

	
	local curWeek = GetWeekIndex();

	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_WEIWANG_MOONCAKE_WEEK[1], MD_WEIWANG_MOONCAKE_WEEK[2],MD_WEIWANG_MOONCAKE_WEEK[3] );

	if curWeek ~= lastWeek then
		return 1
	else
		return 0;
	end
	
	
	

end




function x404897_SaveDoTime(varMap, varPlayer)

	local curWeek = GetWeekIndex();
	SetPlayerGameData(varMap, varPlayer, MD_WEIWANG_MOONCAKE_WEEK[1], MD_WEIWANG_MOONCAKE_WEEK[2], MD_WEIWANG_MOONCAKE_WEEK[3], curWeek)
	
	
	
end
