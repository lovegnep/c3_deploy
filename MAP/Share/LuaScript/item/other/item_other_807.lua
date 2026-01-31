





x418807_var_FileId 		= 418807

x418807_var_LevelMin		=	1






function x418807_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418807_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418807_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418807_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418807_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418807_ProcActivateOnce( varMap, varPlayer, varImpact )


	StartItemTask(varMap)
	ItemAppendBind( varMap, 12035286, 1 )	
  ItemAppendBind( varMap, 12035281, 1 )
	ItemAppendBind( varMap, 12035282, 1 )
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,184)
			Msg2Player( varMap,varPlayer,"打开礼包获得生命神露（7天），修理神铁（7天），无限极乐草（7天）和#cFF0000天#O下#G精#c66caf3兵#cFF0000称号。",8,3) ;
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







function x418807_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
