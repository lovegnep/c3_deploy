





x300394_var_FileId = 300394






function x300394_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300394_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300394_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300394_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x300394_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x300394_ProcActivateOnce( varMap, varPlayer, varImpact )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		StartItemTask(varMap)
		ItemAppend( varMap, 12030061, 2 )
		ItemAppend( varMap, 12030062, 2 )
		ItemAppend( varMap, 12030063, 2 )
		ItemAppend( varMap, 12030064, 2 )
		DropItemListToScene(varMap, varPlayer, 1)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您使用了喜庆包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"您使用了喜庆包",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
	end
end







function x300394_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
