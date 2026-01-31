MD_2011RUYIJINNANG_DATE 			= {250, 13, 9}
MD_2011RUYIJINNANG_COUNT 			= {250, 22, 4}

x418222_var_FileId 					= 418222
---------------道具与奖励相关
x418222_var_MaxDays					= 30
x418222_var_MaxCount				= 3	--周期内最大使用次数
x418222_var_Item 						=	12030308
x418222_var_Gift						= { --{获取金卡的数量}
																100, 150, 250
															}			
---------------提示相关
x418222_hint_DeleteItemFail = "礼包扣除失败!!!" --删除失败的提示
x418222_hint_FullCount			= "30天内使用次数已满!!!" --满次提示
x418222_hint_FullTotalCount = "你已经领取过3次!!!" --使用总次数已满
x418222_hint_InvalidCount		= "使用次数无效!!!"
x418222_hint_InvalidItem		= "无效的空道具!!!" --使用了无效的道具
x418222_hint_GiveItemFail		= "给与道具失败!!!"

--修改如意囊的次数
function x418222_ChangeCount(varMap, varPlayer)

	local nDate = GetPlayerGameData(varMap, varPlayer, MD_2011RUYIJINNANG_DATE[1], MD_2011RUYIJINNANG_DATE[2], 
										MD_2011RUYIJINNANG_DATE[3])
	
	local nCount = GetPlayerGameData(varMap, varPlayer, MD_2011RUYIJINNANG_COUNT[1], MD_2011RUYIJINNANG_COUNT[2], 
										MD_2011RUYIJINNANG_COUNT[3])
										
	local curYear, curMonth, curDay = GetYearMonthDay();
	local currDay = (curMonth - 1) * 30 + curDay
	
	WriteLog(1, format("x418222_ChangeCount --- varMap=%d, varPlayer=%d, currDay=%d, nDate=%d, nCount=%d", 
						varMap, varPlayer, currDay, nDate, nCount))
	
	SetPlayerGameData(varMap, varPlayer, MD_2011RUYIJINNANG_DATE[1], 
										MD_2011RUYIJINNANG_DATE[2], MD_2011RUYIJINNANG_DATE[3], currDay)

	SetPlayerGameData(varMap, varPlayer, MD_2011RUYIJINNANG_COUNT[1], 
										MD_2011RUYIJINNANG_COUNT[2], MD_2011RUYIJINNANG_COUNT[3], nCount + 1)
	
end

----------------------------------------------------------------------------------------------
--判断玩家使用如意馕是否次数已满
----------------------------------------------------------------------------------------------
function x418222_IsPlayerGamingFull(varMap, varPlayer)
	
	WriteLog(1, format("x418222_IsPlayerGamingFull --- varMap=%d, varPlayer=%d", varMap, varPlayer))
	
	local nDate   = GetPlayerGameData(varMap, varPlayer, MD_2011RUYIJINNANG_DATE[1], 
										MD_2011RUYIJINNANG_DATE[2], MD_2011RUYIJINNANG_DATE[3])
										
	local nCount  = GetPlayerGameData(varMap, varPlayer, MD_2011RUYIJINNANG_COUNT[1], 
										MD_2011RUYIJINNANG_COUNT[2], MD_2011RUYIJINNANG_COUNT[3])

	local curYear, curMonth, curDay = GetYearMonthDay();
	local currDay = (curMonth - 1) * 30 + curDay
	
	if nCount >= x418222_var_MaxCount then
		Msg2Player(varMap, varPlayer, x418222_hint_FullTotalCount, 8, 2)
		Msg2Player(varMap, varPlayer, x418222_hint_FullTotalCount, 8, 3)
		return 1
	end
	
	if (nDate ~= 0) and (currDay >= nDate) and (currDay < nDate + x418222_var_MaxDays) then
		Msg2Player(varMap, varPlayer, x418222_hint_FullCount, 8, 2)
		Msg2Player(varMap, varPlayer, x418222_hint_FullCount, 8, 3)
		return 1
	end

	return 0
end

--获取当前使用的次数
function x418222_GetCount(varMap, varPlayer)
	local nCount  = GetPlayerGameData(varMap, varPlayer, MD_2011RUYIJINNANG_COUNT[1], 
										MD_2011RUYIJINNANG_COUNT[2], MD_2011RUYIJINNANG_COUNT[3])
	return nCount + 1
end



function x418222_ProcActivateOnce(varMap, varPlayer)
	WriteLog(1, format("x418222_ProcActivateOnce --- varMap=%d, varPlayer=%d", varMap, varPlayer))
	
	if x418222_IsPlayerGamingFull(varMap, varPlayer) == 1 then
		return
	end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then --扣除成功
		x418222_GetGift(varMap, varPlayer, x418222_GetCount(varMap, varPlayer))
		x418222_ChangeCount(varMap, varPlayer)
	else
		Msg2Player(varMap, varPlayer, x418222_hint_DeleteItemFail, 8, 2)
		Msg2Player(varMap, varPlayer, x418222_hint_DeleteItemFail, 8, 3)
	end
end

function x418222_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

--给奖励
function x418222_GetGift(varMap, varPlayer, count)
	
	WriteLog(1, format("x418222_GetGift --- varMap=%d, varPlayer=%d, count=%d", varMap, varPlayer, count))
	
	if count < x418222_var_MaxCount then 
		StartItemTask(varMap)
		ItemAppend(varMap, x418222_var_Item, 1)
		if StopItemTask(varMap, varPlayer) <= 0 then
			Msg2Player(varMap, varPlayer, x418222_hint_GiveItemFail, 8, 2)
			Msg2Player(varMap, varPlayer, x418222_hint_GiveItemFail, 8, 3)
		else
	  	DeliverItemListSendToPlayer(varMap, varPlayer)
		end
	end
	
	local itemNum = getn(x418222_var_Gift)
	
	if count > itemNum then
		count = 0
	end
	
	AddMoney(varMap, varPlayer, 3, x418222_var_Gift[count])
end

-- 空接口
function x418222_ProcIsSpellLikeScript(varMap, varPlayer)
	return 1
end

-- 空接口
function x418222_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end

-- 空接口
function x418222_ProcConditionCheck( varMap, varPlayer)
	return 1; 
end

function x418222_ProcDeplete( varMap, varPlayer)
    return 1
end

-- 不需要这个接口，但要保留空函数
function x418222_ProcEventEntry(varMap, varPlayer, bagIndex)
end
