





x418831_var_FileId 		= 418831

x418831_var_LevelMin		=	1






function x418831_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418831_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418831_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418831_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418831_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418831_ProcActivateOnce( varMap, varPlayer, varImpact )


	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041126, 1 )
    ItemAppendBind( varMap, 12041261, 1 )	
    ItemAppendBind( varMap, 12041295, 1 )
	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,207)
			Msg2Player( varMap,varPlayer,"打开礼包，获得王牌天·荆轲、防御图鉴·幽铠魇虎(黄)、攻击图鉴·寒霜和永恒神话炫彩称号",8,3) ;
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







function x418831_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
