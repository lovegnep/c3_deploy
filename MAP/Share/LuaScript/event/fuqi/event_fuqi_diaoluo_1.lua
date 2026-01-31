





x300390_var_FileId = 300390 
x300390_var_ItemList = {
{11000200,11050001},
{11000201,11050002},
{11000202,11050003},
{11000203,11050004},
}






function x300390_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300390_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300390_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300390_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x300390_ProcDeplete( varMap, varPlayer )
	return 1;
end

function x300390_ProcAddMoney(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local money = 5000; 
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	
		AddMoney( varMap , varPlayer ,0, money )
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您使用了喜糖")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
	end
	
end

function x300390_ProcAddItemByLevel(varMap, varPlayer)

	local varI = random(1,2)
	
	if GetLevel(varMap,varPlayer) < 40 then
		x300390_ProcAddItem(varMap, varPlayer, x300390_var_ItemList[1][varI])
		
	elseif (GetLevel(varMap,varPlayer) >=40 and GetLevel(varMap,varPlayer) < 60) then
		x300390_ProcAddItem(varMap, varPlayer, x300390_var_ItemList[2][varI])
		
	elseif (GetLevel(varMap,varPlayer) >= 60 and GetLevel(varMap,varPlayer) < 80) then
		x300390_ProcAddItem(varMap, varPlayer, x300390_var_ItemList[3][varI]) 
	elseif GetLevel(varMap,varPlayer) >= 80 then
		x300390_ProcAddItem(varMap, varPlayer, x300390_var_ItemList[4][varI]) 
	end
	
end

function x300390_ProcAddItem(varMap, varPlayer, varItem)

	StartItemTask(varMap)
	ItemAppendBind( varMap,varItem, 1 )	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您使用了喜糖")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		end

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end








function x300390_ProcActivateOnce( varMap, varPlayer, varImpact )

	local j = random(1,2)
	
	if j < 2 then
		x300390_ProcAddMoney(varMap, varPlayer)
	else
		x300390_ProcAddItemByLevel(varMap, varPlayer)
	end
	
end







function x300390_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
