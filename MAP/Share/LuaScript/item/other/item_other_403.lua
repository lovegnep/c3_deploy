





x418403_var_FileId 		= 418403 

x418403_var_LevelMin		=	30






function x418403_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418403_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418403_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418403_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418403_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418403_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418403_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11990110, 1 )	--募集券
		ItemAppendBind( varMap, 12030016, 3 )	--队伍召集令
		ItemAppendBind( varMap, 12030011, 20 )	--杰克丹尼
		ItemAppendBind( varMap, 12030012, 20 )	--路易十三
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了募集券、队伍召集令、杰克丹尼和路易十三")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney(varMap, varPlayer, 1, 100000)
			GamePlayScriptLog(varMap, varPlayer, 2661) 
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有4个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418403_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
