






x310930_var_FileId = 310930 
x310930_var_FileItemId = 12035212
x310930_var_ItemList = {
                                      { varId = 12030059, price = 1,  varName="金砖"               , probability =5000   },
                                      { varId = 11000552, price = 1,  varName="完美星辰"           , probability =5000   },
                                      { varId = 12041109, price = 1,  varName="混元丹"             , probability =5000  },
                                      { varId = 11000300, price = 30,  varName="灵魂印"             , probability =500    },
                                      { varId = 11000906, price = 100,  varName="传说级洗石剂·莲华"             , probability =500    },
                                      { varId = 11000934, price = 100,  varName="传说级洗石剂·雪魂"             , probability =500    },
                                      { varId = 11000935, price = 100,  varName="传说级洗石剂·冰魄"             , probability =500    },
                                      { varId = 12272601, price = 1,  varName="传说级洗石剂·冰魄碎片"             , probability =2000    },
                                      { varId = 12272600, price = 1,  varName="传说级洗石剂·雪魂碎片"             , probability =2000    },
                                      { varId = 11990018, price = 1,  varName="传说级洗石剂·莲华碎片"             , probability =2000    },
                                      { varId = 11000907, price = 1000,  varName="神话级洗石剂"             , probability =50    },
                                      { varId = 11000966,  price = 1, varName="神话级洗石剂碎片"             , probability =300    },
}
                                                                     
                                                                     



function x310930_ProcEventEntry( varMap, varPlayer, varBagIdx )

end                                                                  
                                                                     





function x310930_ProcIsSpellLikeScript( varMap, varPlayer)                 
	return 1;
end






function x310930_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310930_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x310930_ProcDeplete( varMap, varPlayer )
	return 1;
end



function x310930_ProcAddItemByRandom(varMap, varPlayer)
	local Min = 1
	local Max = 1
	local item = nil
	local varName = nil


    -- 先求总概率
    local totalProb = 0
    for i, iter in x310930_var_ItemList do
        local prob = iter.probability
        totalProb = totalProb + prob
    end
         
    local allitem = x310930_var_ItemList
    local probability = random(1,totalProb)
    for varI, iter in allitem do
        Max = Max + iter.probability
        if probability >= Min and probability < Max then
            item = iter
            break
        end
    end
	x310930_ProcAddItem(varMap, varPlayer, item)
end

function x310930_ProcAddItem(varMap, varPlayer, varItemInfo)
  local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local varItem = varItemInfo.varId
    local iname = varItemInfo.varName

	StartItemTask(varMap)   
	if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then
		ItemAppend( varMap,varItem, 1 )	
	else
		ItemAppendBind( varMap,varItem, 1 )
	end	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			local varStr =format( "您开启了1个@item_%d#cffcf00，获得了1个@item_%d", 12035212,varItem)
			if varItemInfo.price >= 30 then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
				local varMsg1 =format(varName.."打开宾利大礼包获得了"..iname)
				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			end
			TalkAppendString(varMap,varStr)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
      
      GamePlayScriptLog( varMap, varPlayer, 2503)			
		end

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end








function x310930_ProcActivateOnce( varMap, varPlayer, varImpact )
    if GetBagSpace(varMap, varPlayer) <= 0 then
        Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
        Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
        return
    end
    x310930_ProcAddItemByRandom(varMap, varPlayer)
end

function x310930_autobinli( varMap, varPlayer )
	local Min = 1
	local Max = 1
	local item = nil
	local varName = nil


	-- 先求总概率
	local totalProb = 0
	for i, iter in x310930_var_ItemList do
		local prob = iter.probability
		totalProb = totalProb + prob
	end

	local allitem = x310930_var_ItemList
	local probability = random(1,totalProb)
	for varI, iter in allitem do
		Max = Max + iter.probability
		if probability >= Min and probability < Max then
			item = iter
			break
		end
	end

	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法开启宾利大礼包", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法开启宾利大礼包", 0, 3)
		return 0
	end

    local varItemInfo = item
	local varItem = varItemInfo.varId
	local iname = varItemInfo.varName

	StartItemTask(varMap)
	ItemAppendBind( varMap,varItem, 1 )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if DelItem(varMap,varPlayer,x310930_var_FileItemId,1) == 1 then
			StartTalkTask(varMap)
			local varStr =format( "您开启了1个@item_%d#cffcf00，获得了1个@item_%d", 12035212,varItem)
			if varItemInfo.price >= 30 then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
				local varMsg1 =format(varName.."打开宾利大礼包获得了"..iname)
				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			end
			TalkAppendString(varMap,varStr)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)

			GamePlayScriptLog( varMap, varPlayer, 2503)
			return 1
		else
			return 0

		end

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

end

function x310930_Procautousebinli( varMap, varPlayer )
	local Num = GetItemCount( varMap, varPlayer, x310930_var_FileItemId )
	if Num > 0 then
		if Num > 100 then
			Num = 100--最多1次开启100个
		end
		for i=1 , Num  do
			if GetBagSpace(varMap, varPlayer) <= 0 then
				Msg2Player(varMap, varPlayer, "背包已满，无法开启宾利大礼包", 0, 2)
				Msg2Player(varMap, varPlayer, "背包已满，无法开启宾利大礼包", 0, 3)
				return
			end
			if x310930_autobinli(varMap, varPlayer) == 0 then
				return
			end
		end

	end

end





function x310930_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
