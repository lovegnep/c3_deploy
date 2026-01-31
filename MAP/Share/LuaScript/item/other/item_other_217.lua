





x418217_var_FileId = 418217
x418217_var_ItemList = {}
x418217_var_LevelMin = 1	






function x418217_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418217_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418217_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418217_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418217_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418217_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418217_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12030548, 1 )	
		ItemAppendBind( varMap, 12041102, 10 )
		ItemAppendBind( varMap, 12030218, 20 )
		ItemAppendBind( varMap, 12030258, 200 )
		ItemAppendBind( varMap, 12030505, 1 )
		ItemAppendBind( varMap, 12050285, 1 )
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了掌门牌:大三元(永久)礼包，节日时装礼包,天赋丹10个，全福月饼200个，极品钢爪翼龙降世符1个，强效练功人偶20个")
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







function x418217_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
