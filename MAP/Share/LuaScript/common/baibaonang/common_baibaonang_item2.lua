x300373_var_FileId = 300373 


function x300373_ProcEventEntry( varMap, varPlayer, varBagIdx )

	if GetBagSpace(varMap, varPlayer) < 2 then
		Msg2Player(varMap,varPlayer, "至少需要两个背包空间,才能使用此道具",4,3)
		return
	end

  local buff 	=	9011
	local buff1 =	9013	
	local buff2 =	9012	
	local varRand = random(1, 20)
	local varLevel = GetLevel(varMap, varPlayer)
	local awardMoney = varLevel*300
	if varRand <= 2 then --10%微瑕星辰
		local varItem=11000550
			StartItemTask( varMap )
				if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppendBind( varMap, varItem, 1 )
				else
					ItemAppendBind( varMap, varItem, 1 )
				end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开藏宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		
	elseif varRand <=4 then--洗石剂 10%
		local varItem = 11000903
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppendBind( varMap, varItem, 1 )
			else
					ItemAppendBind( varMap, varItem, 1 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开藏宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		
		elseif varRand <=6 then--天传水晶 20%
		local varItem = 11000203
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppendBind( varMap, varItem, 3 )
			else
					ItemAppendBind( varMap, varItem, 3 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开藏宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	
		elseif varRand <=10 then--天之龙眼石 20%
		local varItem = 11050004
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppendBind( varMap, varItem, 1 )
			else
					ItemAppendBind( varMap, varItem, 1 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开藏宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
					
		elseif varRand ==11 then--还童 5%
		local varItem = 12054300
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppendBind( varMap, varItem, 1 )
			else
					ItemAppendBind( varMap, varItem, 1 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开藏宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end			
			
		elseif varRand ==12 then--木碳 5%
		local varItem = 11000501
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppendBind( varMap, varItem, 1 )
			else
					ItemAppendBind( varMap, varItem, 1 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开藏宝盒，获得了物品：#R#{_ITEM%d}", varItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end		
					
		elseif varRand <=16 then--生活技能材料 20%
			local itemId = {11030501,11030405,11020501}
			local rate = random(1, 3)
			local a = 1
			local b = 2
			if rate == 2 then
				a = 1
				b = 3
			elseif rate == 3 then
				a = 2
				b = 3
			end	
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					ItemAppendBind( varMap, itemId[a], 1 )
					ItemAppendBind( varMap, itemId[b], 1 )
			else
					ItemAppendBind( varMap, itemId[a], 1 )
					ItemAppendBind( varMap, itemId[b], 1 )
			end
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("你打开藏宝盒，获得了物品：#R#{_ITEM%d}、#{_ITEM%d}", itemId[a], itemId[b] )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)
				GamePlayScriptLog(varMap, varPlayer, 1932) 
			else
				local strText = "背包已满,不能使用此物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end			
					
	else --20%银卡
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
					AddMoney( varMap, varPlayer,0, awardMoney )
			else
					AddMoney( varMap, varPlayer,1, awardMoney )
			end
			
			local message = format( "你打开藏宝盒，获得了#R现银#{_MONEY%d}", awardMoney)
			local message1 = format( "你打开藏宝盒，获得了#R银卡#{_MONEY%d}", awardMoney)
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

				GamePlayScriptLog(varMap, varPlayer, 1933) 
	end



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
		elseif ban <= 35 then
			local iiitem = 0
			local rrr = random (1,7)
			StartItemTask( varMap )
			
			if rrr <= 1 then
				iiitem = 14100001
			elseif rrr <= 2 then
				iiitem = 14100011
			elseif rrr <= 3 then
				iiitem = 14100021
			elseif rrr <= 4 then
				iiitem = 14100031
			elseif rrr <= 5 then
				iiitem = 14100041
			elseif rrr <= 6 then
				iiitem = 14100051
			elseif rrr <= 7 then
				iiitem = 14100061
			end
			ItemAppend( varMap, iiitem, 1 )
			local varRet = StopItemTask( varMap, varPlayer )
					if varRet > 0 then
						DeliverItemListSendToPlayer(varMap,varPlayer)
						local message = format("恭喜您获得了物品：#R#{_ITEM%d}", iiitem )
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
function x300373_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x300373_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x300373_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x300373_ProcDeplete( varMap, varPlayer )

	return 0
end

function x300373_ProcActivateOnce( varMap, varPlayer )
end

function x300373_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
