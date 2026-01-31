x432489_var_FileId = 432489
x432489_var_ItemNum = 4 
x432489_var_ItemList = {11011101,11011181,11011261,11011341}
x432489_var_LevelMin = 1	

function x432489_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x432489_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x432489_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x432489_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x432489_ProcDeplete( varMap, varPlayer )

	return 1
end

function x432489_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x432489_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	rand = random(1, x432489_var_ItemNum)
	itemIndex=x432489_var_ItemList[rand]
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

function x432489_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
