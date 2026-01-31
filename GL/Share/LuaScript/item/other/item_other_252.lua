





x418252_var_FileId 		= 418252 

x418252_var_LevelMin		=	40






function x418252_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418252_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418252_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418252_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418252_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418252_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418252_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000214, 10 )	--国传海蓝钻石
		ItemAppendBind( varMap, 12041101, 5 )	--修行草
		ItemAppendBind( varMap, 12250006, 10 )	--精品杰克丹尼

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了国传海蓝钻石、修行草和精品杰克丹尼")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有3个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418252_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
