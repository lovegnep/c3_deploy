





x404884_var_FileId 		= 404884 

x404884_var_LevelMin		=	20






function x404884_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404884_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404884_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404884_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404884_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x404884_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if x404884_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"本威望包一周只能开启一次,请您尝试其他威望包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11030501, 15 ) 
	ItemAppendBind( varMap, 11030405, 15 ) 
	ItemAppendBind( varMap, 11020501, 15 ) 
	
	local varRet = StopItemTask(varMap,varPlayer)

	if varRet>0 then

		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开威望材料包，获得了奖励物品")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)

			x404884_SaveDoTime(varMap, varPlayer)
			
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







function x404884_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x404884_IsOneWeekPassed(varMap, varPlayer)

	
	local curWeek = GetWeekIndex();

	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_WEIWANG_ITEM_WEEK[1], MD_WEIWANG_ITEM_WEEK[2],MD_WEIWANG_ITEM_WEEK[3] );

	if curWeek ~= lastWeek then
		return 1
	else
		return 0;
	end
	
	
	

end




function x404884_SaveDoTime(varMap, varPlayer)

	local curWeek = GetWeekIndex();
	SetPlayerGameData(varMap, varPlayer, MD_WEIWANG_ITEM_WEEK[1], MD_WEIWANG_ITEM_WEEK[2], MD_WEIWANG_ITEM_WEEK[3], curWeek)
	
	
	
end
