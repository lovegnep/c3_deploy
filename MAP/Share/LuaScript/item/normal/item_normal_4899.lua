






x404899_var_FileId 		= 404899 

x404899_var_LevelMin		=	20






function x404899_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404899_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404899_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404899_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404899_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x404899_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if x404899_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"本威望包一周只能开启一次,请您尝试其他威望包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = 150*1000
		AddMoney(varMap, varPlayer, 1, nMoney)
		
		local varStr = format("获得了#{_MONEY%d}银卡的奖励。", nMoney)

		Msg2Player(varMap,varPlayer,varStr,8,2)

		StartTalkTask(varMap)
		TalkAppendString(varMap,varStr)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		x404899_SaveDoTime(varMap, varPlayer)
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x404899_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x404899_IsOneWeekPassed(varMap, varPlayer)

	local curWeek = GetWeekIndex();

	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_WEIWANG_MONEY_WEEK[1], MD_WEIWANG_MONEY_WEEK[2],MD_WEIWANG_MONEY_WEEK[3] );

	if curWeek ~= lastWeek then
		return 1
	else
		return 0;
	end
	

end




function x404899_SaveDoTime(varMap, varPlayer)

	local curWeek = GetWeekIndex();
	SetPlayerGameData(varMap, varPlayer, MD_WEIWANG_MONEY_WEEK[1], MD_WEIWANG_MONEY_WEEK[2], MD_WEIWANG_MONEY_WEEK[3], curWeek)
	
	
	
end
