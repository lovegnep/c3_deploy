





x418306_var_FileId 		= 418306

x418306_var_LevelMin		=	1






function x418306_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418306_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418306_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418306_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418306_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418306_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418306_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12041025, 10 )--五行魔道丸10个
		ItemAppendBind( varMap, 12041015, 10 )--五行神力丸10个
		ItemAppendBind( varMap, 12041035, 10 )--五行仙火丸10个
		ItemAppendBind( varMap, 12030631, 1 )--平衡神水大礼包1个
		ItemAppendBind( varMap, 12041098, 10 )--暴韧神水10个
		ItemAppendBind( varMap, 12041044, 10 )--混沌不灭丸10个

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开PK大礼包，获得10个五行魔道丸，10个五行神力丸，10个五行仙火丸，1个平衡神水大礼包，10个暴韧神水和10个混沌不灭丸。")
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







function x418306_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
