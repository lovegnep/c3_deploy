x310240_var_FileId = 310240 
x310240_var_itemId ={} 


function x310240_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	local varRand = random(1, 100)
	local varLevel = GetLevel(varMap, varPlayer)
	
	if varLevel < 40 then
		local message = format("等级不足40级，无法使用弱国补偿包。" )
		Msg2Player(varMap,varPlayer, message,4,2)
		return
		
	end
	
	if GetBagSpace(varMap, varPlayer) <= 1 then
		Msg2Player(varMap, varPlayer, "请至少留出两个背包空位，再使用此道具。", 0, 2)
		Msg2Player(varMap, varPlayer, "请至少留出两个背包空位，再使用此道具", 0, 3)
		return
	end	

	

	
	if varRand >= 1 and varRand <=5 then
		local item1 =12010020  
		local item2 = 12010021 
		local varItem;
		if varLevel < 60 then
			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=60 then
			varItem =item2
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
	end
		
	if varRand >= 6 and varRand <=10 then
		
		local item1 =11990110  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand >= 11 and varRand <=20 then
		local item1 =12041101  
		local item2 = 12041102 
		local varItem;
		if varLevel < 80 then
			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 3 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=80 then
			varItem =item2
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 3 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
	end
	
	if varRand >= 21 and varRand <=30 then
		local item1 =11000202  
		local item2 = 11000203 
		local varItem;
		if varLevel < 80 then
			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 20 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=80 then
			varItem =item2
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 20 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
	end
	
	if varRand >= 31 and varRand <=40 then
		local item1 =11050003  
		local item2 = 11050004 
		local varItem;
		if varLevel < 80 then
			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 20 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=80 then
			varItem =item2
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 20 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
	end
		
	if varRand >= 41 and varRand <=50 then
		local item1 =11000501  
		local item2 = 11000550 
		local varItem;
		if varLevel < 80 then
			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 2 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=80 then
			varItem =item2
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 4 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
	end
		
	if varRand >= 51 and varRand <=60 then
		
		local item1 =11990050  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 5 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand >= 61 and varRand <=70 then
		
		local item1 =12041108  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 2 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand >= 71 and varRand <=80 then
		
		local item1 =12054300  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 2 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand >= 81 and varRand <=90 then
		
		local item1 =11060003  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand >= 91 and varRand <=95 then
		
		local item1 =12030031  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand == 96 then
		
		local item1 =11000300  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand == 97 then
		
		local item1 =11000500  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand == 98 then
		
		local item1 =11000502  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand == 99 then
		
		local item1 =11000503  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
	
	if varRand == 100 then
		
		local item1 =11000504  
		local varItem;

			varItem =item1
			StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开弱国补偿包，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	end
end

function x310240_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310240_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310240_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310240_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310240_ProcActivateOnce( varMap, varPlayer )
end

function x310240_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
