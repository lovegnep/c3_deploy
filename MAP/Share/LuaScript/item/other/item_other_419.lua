





x418419_var_FileId 		= 418419

x418419_var_LevelMin		=	1






function x418419_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418419_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418419_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418419_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418419_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418419_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11990114, 3 ) 	
	ItemAppendBind( varMap, 11990115, 2 ) 	
	ItemAppendBind( varMap, 11990122, 5 ) 		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了3个次生钻石矿,2个原生钻石矿和5个明亮的彩钻",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2684)
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







function x418419_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
