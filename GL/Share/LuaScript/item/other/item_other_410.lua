





x418410_var_FileId 		= 418410

x418410_var_LevelMin		=	1






function x418410_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418410_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418410_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418410_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418410_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418410_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000902, 50 ) 
	ItemAppendBind( varMap, 11990018, 1 ) 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d#cffcf00和%d个@item_%d", 50,11000902 , 1, 11990018),8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2649)
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







function x418410_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
