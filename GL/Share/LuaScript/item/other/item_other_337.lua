x418337_var_FileId = 418337 


function x418337_ProcEventEntry( varMap, varPlayer, varBagIdx )

end

function x418337_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
	
	
end

function x418337_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418337_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x418337_ProcDeplete( varMap, varPlayer )

	return 1
end

function x418337_ProcActivateOnce( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, 12054300, 50 ) --还童书50本
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2507) 
		local message = format("打开骐骥千里包，获得了物品：#R50本还童书")
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
	else
		local strText = "背包空间不足,不能使用此物品"
		Msg2Player( varMap, varPlayer, strText, 8, 2)
	end				

	if GetBagSpace(varMap, varPlayer) >= 1 then
		local varRand = random (1,500)
		if varRand <= 1 then --500分之一
			StartItemTask( varMap )
			ItemAppendBind( varMap, 12050280, 1 ) --天龙降世符
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R天龙降世符"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开骐骥千里包，获得了天龙降世符"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		elseif varRand <= 2 then --500分之一
			StartItemTask( varMap )
			ItemAppendBind( varMap, 12050281, 1 ) --青螭降世符
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R青螭降世符"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开骐骥千里包，获得了青螭降世符"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		elseif varRand <= 7 then --100分之一
			StartItemTask( varMap )
			ItemAppendBind( varMap, 12050267, 1 ) --毛驴降世符
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R毛驴降世符"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开骐骥千里包，获得了毛驴降世符"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		elseif varRand <= 12 then --100分之一
			StartItemTask( varMap )
			ItemAppendBind( varMap, 12050268, 1 ) --熊猫降世符
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R熊猫降世符"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开骐骥千里包，获得了熊猫降世符"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		elseif varRand <= 17 then --100分之一
			StartItemTask( varMap )
			ItemAppendBind( varMap, 12050279, 1 ) --羊驼降世符
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R羊驼降世符"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."打开骐骥千里包，获得了羊驼降世符"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			end
		end
	end
end

function x418337_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
