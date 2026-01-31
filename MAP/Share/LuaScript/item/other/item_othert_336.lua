x432336_var_FileId = 432336 


function x432336_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x432336_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x432336_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x432336_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x432336_ProcDeplete( varMap, varPlayer )

	return 1
end

function x432336_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 4 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 12050090, 42 ) --一级融雪丹42个
	ItemAppendBind( varMap, 12050091, 16 ) --二级融雪丹16个
	ItemAppendBind( varMap, 12050092, 5 ) --三级融雪丹5个
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2504)
		local message = format("打开良驹繁殖包，获得了物品：#R42个一级融雪丹，16个二级融雪丹和5个三级融雪丹")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				

	if GetBagSpace(varMap, varPlayer) >= 1 then
		local varRand = random (1,200)
		if varRand <= 1 then
			StartItemTask( varMap )
			local Rand = random (1,6)
			if Rand <= 1 then
				ItemAppendBind( varMap, 12052456, 1 ) --骑术秘笈：六级悟性
				message = "打开良驹繁殖包，恭喜您获得了物品：#R骑术秘笈：六级悟性"
				message1 = GetName(varMap, varPlayer)
				message1 = message1.."打开良驹繁殖包，获得了骑术秘笈：六级悟性"
			elseif Rand <= 2 then
				ItemAppendBind( varMap, 12052056, 1 ) --骑术秘笈：六级全能
				message = "打开良驹繁殖包，恭喜您获得了物品：#R骑术秘笈：六级全能"
				message1 = GetName(varMap, varPlayer)
				message1 = message1.."打开良驹繁殖包，获得了骑术秘笈：六级全能"
			elseif Rand <= 3 then
				ItemAppendBind( varMap, 12052026, 1 ) --骑术秘笈：六级蛮力
				message = "打开良驹繁殖包，恭喜您获得了物品：#R骑术秘笈：六级蛮力"
				message1 = GetName(varMap, varPlayer)
				message1 = message1.."打开良驹繁殖包，获得了骑术秘笈：六级蛮力"
			elseif Rand <= 4 then
				ItemAppendBind( varMap, 12052036, 1 ) --骑术秘笈：六级追影
				message = "打开良驹繁殖包，恭喜您获得了物品：#R骑术秘笈：六级追影"
				message1 = GetName(varMap, varPlayer)
				message1 = message1.."打开良驹繁殖包，获得了骑术秘笈：六级追影"
			elseif Rand <= 5 then
				ItemAppendBind( varMap, 12052046, 1 ) --骑术秘笈：六级聪慧
				message = "打开良驹繁殖包，恭喜您获得了物品：#R骑术秘笈：六级聪慧"
				message1 = GetName(varMap, varPlayer)
				message1 = message1.."打开良驹繁殖包，获得了骑术秘笈：六级聪慧"
			elseif Rand <= 6 then
				ItemAppendBind( varMap, 12052016, 1 ) --骑术秘笈：六级健体
				message = "打开良驹繁殖包，恭喜您获得了物品：#R骑术秘笈：六级健体"
				message1 = GetName(varMap, varPlayer)
				message1 = message1.."打开良驹繁殖包，获得了骑术秘笈：六级健体"
			end
			
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				LuaAllScenceM2Wrold( varMap, message1, 5, 1 )
			end
		end
	end
end

function x432336_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
