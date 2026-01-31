





x418345_var_FileId 		= 418345 

x418345_var_LevelMin		=	1






function x418345_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418345_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418345_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418345_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418345_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418345_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418345_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000830, 1 )	--主手图谱
		ItemAppendBind( varMap, 11000831, 1 )	--副手图谱
		ItemAppendBind( varMap, 11000832, 1 )	--战甲图谱
		ItemAppendBind( varMap, 11000833, 1 )	--头盔图谱

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了1个主手图谱和1个副手图谱等")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有4个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418345_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
