





x418787_var_FileId 		= 418787

x418787_var_LevelMin		=	1






function x418787_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418787_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418787_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418787_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418787_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418787_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetBagSpace(varMap, varPlayer) < 3 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少3个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少3个背包空位", 0, 3)
		return 0
	end
	
	

	StartItemTask(varMap)
	
		ItemAppendBind( varMap, 12030258, 1 )		
		ItemAppendBind( varMap, 12041108, 1 )	
		ItemAppendBind( varMap, 12035017, 4 )				
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得50两银卡、1个全福月饼、1个荣誉之星和4张黄金藏宝图碎片。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney(varMap, varPlayer, 1, 50000)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418787_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
