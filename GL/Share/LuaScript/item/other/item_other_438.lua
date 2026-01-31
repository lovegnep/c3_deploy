





x418438_var_FileId 		= 418438

x418438_var_LevelMin		=	1






function x418438_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418438_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418438_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418438_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418438_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418438_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030802, 1 )	--宫廷时装（7天）
	ItemAppendBind( varMap, 11990011, 2 )	--三番令
	ItemAppendBind( varMap, 11000200, 3 )	--世传水晶
	ItemAppendBind( varMap, 12030801, 1 )	--小钱包
	ItemAppendBind( varMap, 12031031, 5 )	--烟花

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了宫廷时装（7天），三番令2个、世传水晶3个、小钱包1个、烟花5个",8,3) ;
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







function x418438_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
