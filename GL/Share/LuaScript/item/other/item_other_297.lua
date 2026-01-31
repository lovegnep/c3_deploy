x418297_var_FileId = 418297 


function x418297_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetBagSpace(varMap, varPlayer) < 2 then
			local strText = "背包空间不足,不能使用此物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
	end
	local varRand = random(1, 100)

	if varRand <= 20 then
		  local varItem=11000866 --单纹水蓝石
			StartItemTask( varMap )
			if IsItemBind( varMap,varPlayer,varBagIdx ) == 0 then
				ItemAppend( varMap, varItem, 20 )
			else
				ItemAppendBind( varMap, varItem, 20 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开蓝石宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包空间不足,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		
	elseif varRand <=40 then
		  local varItem = 11000871 --双纹水蓝石
			StartItemTask( varMap )
			if IsItemBind( varMap,varPlayer,varBagIdx ) == 0 then
				ItemAppend( varMap, varItem, 20 )
			else
				ItemAppendBind( varMap, varItem, 20 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开蓝石宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包空间不足,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		
		elseif varRand <=60 then
			local varItem = 11000876 --三纹水蓝石
			StartItemTask( varMap )
			if IsItemBind( varMap,varPlayer,varBagIdx ) == 0 then
				ItemAppend( varMap, varItem, 20 )
			else
				ItemAppendBind( varMap, varItem, 20 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开蓝石宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932)
			else
				local strText = "背包空间不足,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	
		elseif varRand <=80 then
		local varItem = 11000881 --四纹水蓝石
			StartItemTask( varMap )
			if IsItemBind( varMap,varPlayer,varBagIdx ) == 0 then
				ItemAppend( varMap, varItem, 20 )
			else
				ItemAppendBind( varMap, varItem, 20 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开蓝石宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932)
			else
				local strText = "背包空间不足,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
					
		elseif varRand <=100 then
		local varItem = 11000886 --五纹水蓝石
			StartItemTask( varMap )
			if IsItemBind( varMap,varPlayer,varBagIdx ) == 0 then
				ItemAppend( varMap, varItem, 20 )
			else
				ItemAppendBind( varMap, varItem, 20 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开蓝石宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932)
			else
				local strText = "背包空间不足,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end					
	end

	if GetBagSpace(varMap, varPlayer) >= 1 then
		local varRand = random (1,100)
		if varRand <= 10 then
			local varItem = 11000882 --四纹天蓝石
			StartItemTask( varMap )
			if IsItemBind( varMap,varPlayer,varBagIdx ) == 0 then
				ItemAppend( varMap, varItem, 4 )
			else
				ItemAppendBind( varMap, varItem, 4 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("恭喜您获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1934)
			end
			
		elseif varRand <=15 then
			local varItem = 11000888 --五纹靛蓝石
			StartItemTask( varMap )
			if IsItemBind( varMap,varPlayer,varBagIdx ) == 0 then
				ItemAppend( varMap, varItem, 4 )
			else
				ItemAppendBind( varMap, varItem, 4 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("恭喜您获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1934)
			end
		end
	else
		return
	end
end

function x418297_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x418297_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x418297_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x418297_ProcDeplete( varMap, varPlayer )

	return 0
end

function x418297_ProcActivateOnce( varMap, varPlayer )
end

function x418297_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
