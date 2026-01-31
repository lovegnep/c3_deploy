





x418376_var_FileId 		= 418376

x418376_var_LevelMin		=	1






function x418376_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418376_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418376_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418376_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418376_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418376_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418376_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12041101, 3 )--修行草3个
		ItemAppendBind( varMap, 12010021, 1 )--中生命清露1个
		ItemAppendBind( varMap, 11990011, 3 )--三番令3个
		ItemAppendBind( varMap, 11000550, 10 )--微瑕星辰10个
		ItemAppendBind( varMap, 10222010, 1 )--企鹅披风1个
		ItemAppendBind( varMap, 11000501, 10 )--紫檀木炭10个
		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开QQ会员礼包，获得3个修行草，1个中生命清露和1个QQ会员专属披风等。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2635)
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







function x418376_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
