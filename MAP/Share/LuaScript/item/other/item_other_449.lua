





x418449_var_FileId 		= 418449

x418449_var_LevelMin		=	1






function x418449_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418449_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418449_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418449_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418449_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418449_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12054300, 50 ) 
	ItemAppendBind( varMap, 12030810, 1 )
	
	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d和1个@item_%d", 50,12054300,12030810),8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 3010)
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







function x418449_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
