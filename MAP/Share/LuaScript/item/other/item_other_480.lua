





x418480_var_FileId = 418480
x418480_var_ItemList = {}
x418480_var_LevelMin = 1	
x418480_var_Bonusitem =12030870
x418480_var_Givemoney		=	5000	
x418480_g_ItemID = 12030869





function x418480_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetLevel(varMap, varPlayer)< x418480_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	

	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418480_g_ItemID then
		return
	end

	StartItemTask(varMap)
		ItemAppendBind( varMap, x418480_var_Bonusitem, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DelItemByIndexInBag(varMap, varPlayer,varBagIdx,1)) == 1 then
			AddMoney(varMap, varPlayer, 3, x418480_var_Givemoney,101)
			local DoneMSG = format("恭喜您，您获得了金卡%d两和一个@item_%d！",x418480_var_Givemoney/1000,x418480_var_Bonusitem)			
			StartTalkTask(varMap)
			TalkAppendString(varMap,DoneMSG)
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end






function x418480_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418480_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418480_ProcConditionCheck( varMap, varPlayer )
	
	
--	
--	if(1~=VerifyUsedItem(varMap, varPlayer)) then
--		return 0
--	end
	return 1; 
end







function x418480_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418480_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

end







function x418480_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
