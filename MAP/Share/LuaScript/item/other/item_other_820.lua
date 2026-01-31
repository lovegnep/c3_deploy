





x418820_var_FileId 		= 418820

x418820_var_LevelMin		=	1






function x418820_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418820_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418820_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418820_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418820_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418820_ProcActivateOnce( varMap, varPlayer, varImpact )


--	StartItemTask(varMap)
--	ItemAppendBind( varMap, 10306075, 1 )	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
--			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,197)
			Msg2Player( varMap,varPlayer,"打开礼包可获得#cA346FF虎贲将军#cC8B88E称号。",8,3) ;
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







function x418820_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
