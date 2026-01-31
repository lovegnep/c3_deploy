





x404879_var_FileId 		= 404879 

x404879_var_LevelMin		=	20






function x404879_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404879_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404879_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404879_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404879_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x404879_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if x404879_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"本威望包一周只能开启一次,请您尝试其他威望包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 250*1000
		AddMoney(varMap, varPlayer, 1, nMoney)
		
		local varStr = format("获得了#{_MONEY%d}银卡的奖励。", nMoney)

		Msg2Player(varMap,varPlayer,varStr,8,2)

		StartTalkTask(varMap)
		TalkAppendString(varMap,varStr)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		x404879_SaveDoTime(varMap, varPlayer)
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x404879_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x404879_IsOneWeekPassed(varMap, varPlayer)

	local curWeek = GetWeekIndex();

	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_WEIWANG_MONEY_WEEK[1], MD_WEIWANG_MONEY_WEEK[2],MD_WEIWANG_MONEY_WEEK[3] );

	if curWeek ~= lastWeek then
		return 1
	else
		return 0;
	end
	

end




function x404879_SaveDoTime(varMap, varPlayer)

	local curWeek = GetWeekIndex();
	SetPlayerGameData(varMap, varPlayer, MD_WEIWANG_MONEY_WEEK[1], MD_WEIWANG_MONEY_WEEK[2], MD_WEIWANG_MONEY_WEEK[3], curWeek)
	
	
	
end
