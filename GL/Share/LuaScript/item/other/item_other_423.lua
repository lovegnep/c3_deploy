





x418423_var_FileId 		= 418423

x418423_var_LevelMin		=	1






function x418423_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418423_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418423_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418423_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418423_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418423_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10306054, 1 )
	ItemAppendBind( varMap, 11011450, 1 )
	 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了1件国蕴时装(30天)和一个一级属性纹样·经验",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2694)
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







function x418423_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
