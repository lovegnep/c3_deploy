





x418490_var_FileId = 418490
x418490_var_ItemList = {}
x418490_var_LevelMin = 1	
x418490_var_Bonusitem =12030851
x418490_var_Givemoney		=	5000	
x418490_g_ItemID = 12030850




function x418490_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetLevel(varMap, varPlayer)< x418490_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	

	if GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx) ~= x418490_g_ItemID then
		return
	end

	StartItemTask(varMap)
		ItemAppendBind( varMap, x418490_var_Bonusitem, 1 )	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DelItemByIndexInBag(varMap, varPlayer,varBagIdx,1)) == 1 then
			AddMoney(varMap, varPlayer, 3, x418490_var_Givemoney,101)
			local DoneMSG = format("恭喜您，您获得了金卡%d两和一个@item_%d！",x418490_var_Givemoney/1000,x418490_var_Bonusitem)			
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






function x418490_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418490_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418490_ProcConditionCheck( varMap, varPlayer )
	
	
--	
--	if(1~=VerifyUsedItem(varMap, varPlayer)) then
--		return 0
--	end
	return 1; 
end







function x418490_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418490_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

end







function x418490_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
