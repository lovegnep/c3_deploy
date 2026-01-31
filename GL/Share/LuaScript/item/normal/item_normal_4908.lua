






x404908_var_FileId 		= 404908 

x404908_var_LevelMin		=	20






function x404908_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404908_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404908_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404908_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404908_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x404908_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if x404908_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"本威望包一周只能开启一次,请您尝试其他威望包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000503, 1 )
	
	local varRet = StopItemTask(varMap,varPlayer)

	if varRet>0 then

		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开威望鎏金包，获得了奖励物品")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)

			x404908_SaveDoTime(varMap, varPlayer)
			
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







function x404908_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x404908_IsOneWeekPassed(varMap, varPlayer)

	
	local curWeek = GetWeekIndex();

	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_WEIWANG_YUNGUANG_WEEK[1], MD_WEIWANG_YUNGUANG_WEEK[2],MD_WEIWANG_YUNGUANG_WEEK[3] );

	if curWeek ~= lastWeek then
		return 1
	else
		return 0;
	end
	
	
	

end




function x404908_SaveDoTime(varMap, varPlayer)

	local curWeek = GetWeekIndex();
	SetPlayerGameData(varMap, varPlayer, MD_WEIWANG_YUNGUANG_WEEK[1], MD_WEIWANG_YUNGUANG_WEEK[2], MD_WEIWANG_YUNGUANG_WEEK[3], curWeek)
	
	
	
end
