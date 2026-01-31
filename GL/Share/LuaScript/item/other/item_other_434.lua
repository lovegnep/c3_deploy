





x418434_var_FileId 		= 418434

x418434_var_LevelMin		=	1






function x418434_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418434_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418434_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418434_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418434_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418434_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050230, 1 )	--白驼降世符
	ItemAppendBind( varMap, 12054300, 2 )	--还童书
	ItemAppendBind( varMap, 11990050, 2 )	--回魂丹
	ItemAppendBind( varMap, 11990011, 2 )	--三番令

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了白驼降世符1个、还童书2个、回魂丹2个、三番令2个",8,3) ;
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







function x418434_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
