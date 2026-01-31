x418221_var_FileId 					= 418221
---------------道具与奖励相关
x418221_Item_Key = { -- 道具对应的不同的MD的key值
	[ 12030551 ] = 1 , 
	[ 12030552 ] = 2 ,
}

x418221_md_Array = { -- 存放MD表的表
	{MD_2011RUYINANG_DATE, MD_2011RUYINANG_COUNT} ,
	{MD_2011RUYIJINNANG_DATE, MD_2011RUYIJINNANG_COUNT} ,
}

x418221_hint_Array = {
	"使用如意锦囊,获得%d两金卡",
	"使用如意聚宝盆,获得%d两金卡",
}

x418221_var_Gift						= { --{获取金卡的数量}
																250000, 150000, 100000
															}	

--获取使用道具的Id
function x418221_get_item_table_id(varMap , varPlayer)
	local bag_id = GetBagIndexOfUsedItem(varMap , varPlayer);
	
	if bag_id == nil then
		return nil
	end
	
	local item_id = GetItemIDByIndexInBag(varMap , varPlayer, bag_id);
	
	if item_id == nil then
		return nil
	end
	
	return item_id
end

function x418221_ProcActivateOnce(varMap, varPlayer, varImpact)
	WriteLog(1, format("x418221_ProcActivateOnce --- varMap=%d, varPlayer=%d", varMap, varPlayer))

	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	
	local itemId = x418221_get_item_table_id(varMap, varPlayer);
	local key = x418221_Item_Key[itemId]
	local MD_DATA = x418221_md_Array[key][1]
	
	local varToday = GetDayOfYear() 
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_DATA[1], MD_DATA[2],MD_DATA[3])
	
	if varToday == 500 then varToday = 0 end
	if varLastday == 501 then varLastday = 1 end
	
	if varLastday ~= 0 then
		local varDaycount = 0
		if varToday < varLastday-1 then
			varDaycount = varToday + 366 - varLastday
		else
			varDaycount = varToday + 1 - varLastday
		end
		 
		if varDaycount < 30 then
			local varMsg = format("还有%d天才能使用", 30-varDaycount)
			Msg2Player(varMap,varPlayer,varMsg,8,3)
			Msg2Player(varMap,varPlayer,varMsg,8,2)
			return
		end
	end
	
	SetPlayerGameData(varMap, varPlayer, MD_DATA[1], MD_DATA[2], MD_DATA[3], varToday+1)

  local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
  SetBagItemMultTimes(varMap, varPlayer, varBagIdx, curTimes - 1)
	
	if curTimes == 1 then
		StartItemTask(varMap)
		StopItemTask(varMap, varPlayer)
		DepletingUsedItem(varMap, varPlayer)
	end
	
	if curTimes > getn(x418221_var_Gift) then
		curTimes = getn(x418221_var_Gift)
	end
	
	local money = x418221_var_Gift[curTimes]
	
	AddMoney(varMap, varPlayer, 3, money)
	Msg2Player(varMap, varPlayer, format(x418221_hint_Array[key], money/1000), 8, 3)
	Msg2Player(varMap, varPlayer, format(x418221_hint_Array[key], money/1000), 8, 2)
	return 1
end

-- 空接口
function x418221_ProcIsSpellLikeScript(varMap, varPlayer)
	return 1
end

-- 空接口
function x418221_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end

-- 空接口
function x418221_ProcConditionCheck( varMap, varPlayer)
	return 1; 
end

-- 空接口
function x418221_ProcDeplete( varMap, varPlayer)
    return 1
end

-- 空接口
function x418221_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

-- 空接口
function x418221_ProcEventEntry(varMap, varPlayer, bagIndex)
end
