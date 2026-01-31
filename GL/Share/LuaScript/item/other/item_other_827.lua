





x418827_var_FileId 		= 418827

x418827_var_LevelMin		=	1






function x418827_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418827_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418827_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418827_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418827_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418827_ProcActivateOnce( varMap, varPlayer, varImpact )


	StartItemTask(varMap)
	ItemAppendBind( varMap, 11970018, 20 )	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开获得：浮世印20个",8,3) ;
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







function x418827_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
