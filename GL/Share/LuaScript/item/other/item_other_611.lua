





x418611_var_FileId 		= 418611

x418611_var_LevelMin		=	1






function x418611_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418611_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418611_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418611_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418611_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418611_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418611_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10300150, 1 )	
	ItemAppendBind( varMap, 11010242, 1 )
    ItemAppendBind( varMap, 12030016, 2 )
    ItemAppendBind( varMap, 12030012, 20 )
    ItemAppendBind( varMap, 11990011, 2 )
    ItemAppendBind( varMap, 12010021, 1 )  
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得时装和道具。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			
			local nMoney = 500000
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
			
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







function x418611_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
