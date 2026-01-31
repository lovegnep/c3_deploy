





x418525_var_FileId 		= 418525

x418525_var_LevelMin		=	1






function x418525_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418525_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418525_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418525_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418525_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418525_ProcActivateOnce( varMap, varPlayer, varImpact )


	StartItemTask(varMap)
	ItemAppendBind( varMap, 10306075, 1 )	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,177)
			Msg2Player( varMap,varPlayer,"打开礼包，获得草原皇妃时装和倾国倾城炫彩称号",8,3) ;
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







function x418525_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
