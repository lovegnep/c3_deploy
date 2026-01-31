





x418369_var_FileId 		= 418369

x418369_var_LevelMin		=	1






function x418369_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418369_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418369_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418369_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418369_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418369_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418369_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12500101, 1 )--战车御行甲大礼包
		ItemAppendBind( varMap, 12500102, 1 )--战车底盘大礼包
		ItemAppendBind( varMap, 12500103, 1 )--战车机枢大礼包
		ItemAppendBind( varMap, 12500104, 1 )--战车龙击炮大礼包
		ItemAppendBind( varMap, 12500105, 1 )--战车重击器大礼包
			
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开战车装备大礼包，分别获得战车御行甲、底盘、机枢、龙击炮、重击器各大礼包1个。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2598)
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







function x418369_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
