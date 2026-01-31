





x418213_var_FileId = 418213
x418213_var_ItemList = {}
x418213_var_LevelMin = 1	






function x418213_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418213_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418213_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418213_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418213_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418213_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418213_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12041102, 10 )	
		ItemAppendBind( varMap, 12030218, 10 )
		ItemAppendBind( varMap, 12030258, 20 )
		ItemAppendBind( varMap, 12030505, 1 )
		ItemAppendBind( varMap, 12050288, 1 )
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了节日时装礼包,天赋丹10个，全福月饼20个，年兽降世符1个，强效练功人偶10个")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有5个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418213_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
