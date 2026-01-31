x300370_var_FileId = 300370 


function x300370_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetBagSpace(varMap, varPlayer) < 2 then
		Msg2Player(varMap,varPlayer, "至少需要两个背包空间,才能使用此道具",4,3)
		return
	end
    local buff 	=	9011
	local buff1 =	9013	
	local buff2 =	9012	
	local varRand = random(1, 3)
	local varLevel = GetLevel(varMap, varPlayer)
	local awardMoney = varLevel*300
	if varRand == 1 then
		local item1 =11050001
		local item2 = 11050002
		local item3 = 11050003
		local item4 = 11050004
		local varItem;
		if varLevel < 45 then
				varItem =item1
				StartItemTask( varMap )
					if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
						ItemAppend( varMap, varItem, 3 )
					else
						ItemAppendBind( varMap, varItem, 3 )	
					end		
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
			  if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=45 and varLevel < 60 then
			varItem =item2
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=60 and varLevel < 65 then
			varItem =item2
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >= 65 and varLevel < 85 then
			varItem =item3
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=85 then
			varItem =item4
			StartItemTask( varMap )
				if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
				else
					ItemAppendBind( varMap, varItem, 3 )
				end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
		
	elseif varRand == 2 then
		local item1 =11000200
		local item2 = 11000201
		local item3 = 11000202
		local item4 = 11000203
		local varItem;
		if varLevel < 40 then
			varItem = item1
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=40 and varLevel < 45 then
			varItem = item2
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
			  if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=45 and varLevel < 60 then
			varItem = item2
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >=60 and varLevel < 65 then
			varItem = item3
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		elseif varLevel >= 65 and varLevel < 80 then
			varItem = item3
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931)
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
			elseif varLevel >= 80 then
			varItem = item4
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppend( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开百宝囊，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1931) 
			else
				local varText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
		
	elseif varRand == 3 then
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					AddMoney( varMap, varPlayer,0, awardMoney )
			else
					AddMoney( varMap, varPlayer,1, awardMoney )
			end
			
			local message = format( "你打开百宝囊，获得了#R现银#{_MONEY%d}", awardMoney)
			local message1 = format( "你打开百宝囊，获得了#R银卡#{_MONEY%d}", awardMoney)
			StartTalkTask(varMap);
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
			else
				TalkAppendString(varMap, message1);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message1,4,2)
			end
			GamePlayScriptLog(varMap, varPlayer, 1931)
	end


	
if varLevel >= 60 then
	if GetBagSpace(varMap, varPlayer) >= 1 then
			local ban = random (1,100)
			if ban <= 15 then
			StartItemTask( varMap )
			ItemAppendBind( varMap, 12030013, 1 )
			local varRet = StopItemTask( varMap, varPlayer )
						if varRet > 0 then
							DeliverItemListSendToPlayer(varMap,varPlayer)
							local message = format("恭喜您获得了物品：#R#{_ITEM%d}", 12030013 )
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
			
	


end

function x300370_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x300370_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x300370_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300370_ProcDeplete( varMap, varPlayer )

	return 0
end

function x300370_ProcActivateOnce( varMap, varPlayer )
end

function x300370_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
