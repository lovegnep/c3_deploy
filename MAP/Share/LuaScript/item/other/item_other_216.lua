





x418216_var_FileId = 418216
x418216_var_ItemList = {}
x418216_var_LevelMin = 1	






function x418216_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418216_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418216_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418216_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418216_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418216_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418216_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030508, 1 )	
		ItemAppendBind( varMap, 12041102, 10 )
		ItemAppendBind( varMap, 12030218, 20 )
		ItemAppendBind( varMap, 12030258, 100 )
		ItemAppendBind( varMap, 12030505, 1 )
		ItemAppendBind( varMap, 12050285, 1 )
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了掌门牌:大三元(30天)礼包，节日时装礼包,天赋丹10个，全福月饼100个，极品钢爪翼龙降世符1个，强效练功人偶20个")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有6个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418216_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
