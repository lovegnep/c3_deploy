





x310833_var_FileId = 310833 
x310833_var_ItemList = {
{11000200,11050001},
{11000201,11050002},
{11000202,11050003},
{11000203,11050004},
}






function x310833_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x310833_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x310833_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310833_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x310833_ProcDeplete( varMap, varPlayer )
	return 1;
end

function x310833_ProcAddMoney(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local money = 5000; 
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		GamePlayScriptLog( varMap, varPlayer, 2651)
		AddMoney( varMap , varPlayer ,0, money )
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您使用了狂欢珍宝盒")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
	end
	
end

function x310833_ProcAddItemByLevel(varMap, varPlayer)

	local varI = random(1,2)
	
	if GetLevel(varMap,varPlayer) < 40 then
		x310833_ProcAddItem(varMap, varPlayer, x310833_var_ItemList[1][varI])
		
	elseif (GetLevel(varMap,varPlayer) >=40 and GetLevel(varMap,varPlayer) < 60) then
		x310833_ProcAddItem(varMap, varPlayer, x310833_var_ItemList[2][varI])
		
	elseif (GetLevel(varMap,varPlayer) >= 60 and GetLevel(varMap,varPlayer) < 80) then
		x310833_ProcAddItem(varMap, varPlayer, x310833_var_ItemList[3][varI]) 
	elseif GetLevel(varMap,varPlayer) >= 80 then
		x310833_ProcAddItem(varMap, varPlayer, x310833_var_ItemList[4][varI]) 
	end
	
end

function x310833_ProcAddItem(varMap, varPlayer, varItem)

	StartItemTask(varMap)
	ItemAppendBind( varMap,varItem, 1 )	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog( varMap, varPlayer, 2651)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"您使用了狂欢珍宝盒")
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








function x310833_ProcActivateOnce( varMap, varPlayer, varImpact )

	local j = random(1,2)
	
	if j < 2 then
		x310833_ProcAddMoney(varMap, varPlayer)
	else
		x310833_ProcAddItemByLevel(varMap, varPlayer)
	end
	
end







function x310833_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
