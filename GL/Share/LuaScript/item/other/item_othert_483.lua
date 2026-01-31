x432483_var_FileId = 432483
x432483_var_ItemNum = 12 
x432483_var_ItemList = {11010801,11010821,11010841,11010861,11010881,11010901,11010921,11010941,11010961,11010981,11011001,11011021}
x432483_var_LevelMin = 1	

function x432483_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x432483_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x432483_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x432483_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x432483_ProcDeplete( varMap, varPlayer )

	return 1
end

function x432483_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x432483_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	rand = random(1, x432483_var_ItemNum)
	itemIndex=x432483_var_ItemList[rand]
	StartItemTask(varMap)
	ItemAppendBind( varMap, itemIndex, 1 )	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local message = format("打开礼包，获得了1个@item_%d",itemIndex)
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
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

function x432483_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
