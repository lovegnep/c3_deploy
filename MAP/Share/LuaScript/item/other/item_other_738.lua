





x418738_var_FileId 		= 418738

x418738_var_LevelMin		=	1






function x418738_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418738_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418738_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418738_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418738_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418738_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418738_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030507, 1 )
		ItemAppendBind( varMap, 12030203, 2 )
		ItemAppendBind( varMap, 12030258, 50 )
		ItemAppendBind( varMap, 11990113, 4 )


	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得：掌门牌:清一色(30天)礼包，朝廷请柬2个，全福月饼50个，钻石原石4个。")
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
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418738_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
