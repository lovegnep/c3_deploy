





x418268_var_FileId 		= 418268

x418268_var_LevelMin		=	1






function x418268_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418268_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418268_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418268_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418268_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418268_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418268_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12050250, 1 )	--元宵玉兔降世符
		ItemAppendBind( varMap, 12030012, 5 )	--路易十三
		ItemAppendBind( varMap, 12030016, 3 )	--队伍召集令
		ItemAppendBind( varMap, 12266785, 1 )	--小钱包

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开特权卡，获得元宵玉兔降世符1个、路易十三5个、队伍召集令3个、小钱包1个")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足，需要4个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418268_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
