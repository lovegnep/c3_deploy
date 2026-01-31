





x418399_var_FileId 		= 418399 

x418399_var_LevelMin		=	1






function x418399_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418399_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418399_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418399_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418399_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418399_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418399_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11990110, 1 )	--募集券
		ItemAppendBind( varMap, 12030016, 3 )	--队伍召集令
		ItemAppendBind( varMap, 12041108, 2 )	--荣誉之星
		ItemAppendBind( varMap, 12030011, 40 )	--杰克丹尼
		ItemAppendBind( varMap, 12030012, 20 )	--路易十三
		ItemAppendBind( varMap, 12010020, 1 )	--小生命清露

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了募集券、队伍召集令、荣誉之星、杰克丹尼、路易十三和小生命清露。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney(varMap, varPlayer, 1, 200000)
			GamePlayScriptLog(varMap, varPlayer, 2657) 
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有6个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418399_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
