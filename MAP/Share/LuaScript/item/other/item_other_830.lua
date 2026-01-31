





x418830_var_FileId 		= 418830

x418830_var_LevelMin		=	1






function x418830_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418830_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418830_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418830_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418830_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418830_ProcActivateOnce( varMap, varPlayer, varImpact )


	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041127, 1 )
    ItemAppendBind( varMap, 12041262, 1 )	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,206)
			Msg2Player( varMap,varPlayer,"打开礼包，获得王牌冥·李师师、图鉴·幽铠魇虎(白)和纵横无双炫彩称号",8,3) ;
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







function x418830_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
