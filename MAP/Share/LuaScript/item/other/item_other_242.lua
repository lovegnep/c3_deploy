





x418242_var_FileId = 418242
x418242_var_ItemList = {}
x418242_var_LevelMin = 1	






function x418242_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418242_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418242_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418242_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418242_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418242_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418242_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 12035228, 1 )	
	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了牌照1个")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varMsg = format( "恭喜#R%s#cffcc00开启藏宝盒获得了宾利#G牌照#cffcc00！", GetName( varMap, varPlayer) )
			LuaAllScenceM2Wrold(varMap, varMsg, 5, 1)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	


end







function x418242_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
