





x418433_var_FileId 		= 418433

x418433_var_LevelMin		=	1






function x418433_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418433_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418433_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418433_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418433_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418433_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050229, 1 )	--公牛降世符
	ItemAppendBind( varMap, 11990050, 1 )	--回魂丹
	ItemAppendBind( varMap, 11990011, 2 )	--三番令
	ItemAppendBind( varMap, 12041101, 3 )	--修行草

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了公牛降世符1个，回魂丹1个、三番令2个、修行草3个",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2689)
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







function x418433_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
