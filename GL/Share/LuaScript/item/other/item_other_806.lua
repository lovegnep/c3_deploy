





x418806_var_FileId 		= 418806

x418806_var_LevelMin		=	1






function x418806_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418806_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418806_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418806_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418806_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418806_ProcActivateOnce( varMap, varPlayer, varImpact )


	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050321, 1 )	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,183)
			Msg2Player( varMap,varPlayer,"打开可获得炽焰火麟降世符和#cFF0000天#O下#G霸#c66caf3主#cFF0000#cC8B88E称号。",8,3) ;
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







function x418806_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
