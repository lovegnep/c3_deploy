





x418808_var_FileId 		= 418808

x418808_var_LevelMin		=	1






function x418808_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418808_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418808_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418808_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418808_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418808_ProcActivateOnce( varMap, varPlayer, varImpact )


	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050322, 1 )	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,185)
			Msg2Player( varMap,varPlayer,"打开礼包获得史前巨蜥降世符和#cFF0000四国霸主#cC8B88E称号。",8,3) ;
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







function x418808_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
