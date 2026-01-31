





x418424_var_FileId 		= 418424

x418424_var_LevelMin		=	1






function x418424_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418424_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418424_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418424_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418424_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418424_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10306051, 1 )
	ItemAppendBind( varMap, 11011451, 1 )
	 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了1件月焰时装(30天)和一个二级属性纹样·经验",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2695)
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







function x418424_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
