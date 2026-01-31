





x418819_var_FileId 		= 418819

x418819_var_LevelMin		=	1






function x418819_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418819_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418819_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418819_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418819_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418819_ProcActivateOnce( varMap, varPlayer, varImpact )


--	StartItemTask(varMap)
--	ItemAppendBind( varMap, 10306075, 1 )	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
--			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,196)
			Msg2Player( varMap,varPlayer,"打开礼包可获得#c0000FF武威军称号。",8,3) ;
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







function x418819_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
