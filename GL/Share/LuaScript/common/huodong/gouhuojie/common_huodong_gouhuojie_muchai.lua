

--将单根木柴合成一捆木柴



x310852_var_FileId = 310852
x310852_var_ItemList = {}
x310852_var_LevelMin = 10	
x310852_var_Material = {id=12110210, num=10} --单根木柴
x310852_var_TargetItem = 13810521	--大捆木柴






function x310852_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetLevel(varMap, varPlayer)< x310852_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local HaveCount =GetItemCount(varMap, varPlayer, x310852_var_Material.id)
	if HaveCount < x310852_var_Material.num then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"你没有足够的木柴，无法合成")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, x310852_var_TargetItem, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DelItem(varMap, varPlayer, x310852_var_Material.id, x310852_var_Material.num)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"顺利将10根木柴合成一大捆木柴")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 3161)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end






function x310852_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x310852_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310852_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x310852_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x310852_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x310852_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
