





x418308_var_FileId 		= 418308

x418308_var_LevelMin		=	1






function x418308_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418308_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418308_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418308_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418308_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418308_ProcActivateOnce( varMap, varPlayer, varImpact )
	print(222234)
	
	if GetLevel(varMap, varPlayer)< x418308_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030320, 1 )--10两小钱包
		ItemAppendBind( varMap, 11000200, 10 )--世传水晶×10
		ItemAppendBind( varMap, 10222001, 1 )--红虎披风1个
		ItemAppendBind( varMap, 10300148, 1 )--草原之星时装1个
		ItemAppendBind( varMap, 12110207, 2 )--爱无止境2个
		ItemAppendBind( varMap, 12031020, 10 ) --战神×10

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开金山毒霸VIP礼包，获得1个小钱包，10个世传水晶，1个红虎披风，1个草原之星时装等道具。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418308_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
