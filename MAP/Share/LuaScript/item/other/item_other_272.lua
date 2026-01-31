





x418272_var_FileId 		= 418272

x418272_var_LevelMin		=	60






function x418272_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418272_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418272_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418272_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418272_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418272_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418272_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12010021, 1 )	--中生命清露
		ItemAppendBind( varMap, 11990011, 10 )	--三番令
		ItemAppendBind( varMap, 12041108, 10 )	--荣誉之星
		ItemAppendBind( varMap, 11000501, 10 )	--紫檀木炭
		ItemAppendBind( varMap, 11990115, 2 )	--原生钻石矿
		ItemAppendBind( varMap, 12030577, 1 )	--老玩家经验大礼包

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开老玩家镇戍大礼包，获得三番令10个、紫檀木炭10个、原生钻石矿2个等道具")
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
		TalkAppendString(varMap,"背包空间不足，需要6个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418272_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
