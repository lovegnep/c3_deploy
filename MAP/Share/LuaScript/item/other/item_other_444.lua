





x418444_var_FileId 		= 418444

x418444_var_LevelMin		=	1






function x418444_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418444_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418444_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418444_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418444_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418444_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10306069, 1 )	--宫廷时装（7天）

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了宫廷时装（7天）",8,3) ;
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







function x418444_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
