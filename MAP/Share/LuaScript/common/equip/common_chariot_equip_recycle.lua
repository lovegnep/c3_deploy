

x800138_var_FileId 									= 800138

x800138_var_QuestName								="战车装备回收"

x800138_var_LuckNum = 50	-- 幸运奖数量
x800138_var_LuckRate = 1	-- 幸运奖几率(x/1000)


-- 返回值常量定义
x800138_var_Success = 0
x800138_var_Fail = 1			-- 失败
x800138_var_BagFull = 2			-- 背包满
x800138_var_ItemError = 3		-- 指定的装备不能回收
x800138_var_ItemLocked = 4		-- 装备加锁


function x800138_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	TalkAppendButton(varMap, x800138_var_FileId, x800138_var_QuestName, 3)
end


function x800138_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)	
	return 0
end

function x800138_ProcItemWanfa( varMap, varPlayer, varWanfaType )

	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	if dataCount ~= 1 then
		WriteLog( 1, format("x800138_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount))
		return
	end
	
	------------------------------------------
	local bagPos = wanfaDataTable[1]-- 目标道具Pos
	------------------------------------------
	
	-- 检查物品是否合法
	if IsItemValid( varMap, varPlayer, bagPos ) == 0 then
		WriteLog( 1, format("x800138_ProcItemWanfa item invalid! varMap=%d,PlayerGUID=%X, bagPos=%d",varMap,GetGUID(varMap,varPlayer),bagPos));
		return
	end
	
	if IsEquipLocked(varMap, varPlayer, bagPos) == 1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_ItemLocked )
		return
	end
	
	-- 检查物品是否是战车装备
	local itemClass = GetItemProperty( varMap, varPlayer, bagPos, "ItemClass" );
	if itemClass ~= ICLASS_CHARIOT_EQUIP then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_ItemError )
		return
	end
	
	-- 背包空间
	if GetBagSpace(varMap, varPlayer) < 1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_BagFull )
		return
	end
	
	-- 取得道具ID
	local itemTableIndex = GetItemProperty( varMap, varPlayer, bagPos, "ItemTableIndex" );
	if itemTableIndex == nil or itemTableIndex == -1 then
		WriteLog( 1, format("x800138_ProcItemWanfa get item table index failed"))
		return
	end
	
	-- 道具是否绑定
	local bBind = 0
	if IsItemBind(varMap, varPlayer, bagPos) > 0 then
		bBind = 1
	end
	
	-- 取得回收配置
	local varRateInfo = {{0,0}, {0,0}, {0,0}}
	local varGiveItem = -1
	varGiveItem,
	varRateInfo[1][1], varRateInfo[1][2],
	varRateInfo[2][1], varRateInfo[2][2],
	varRateInfo[3][1], varRateInfo[3][2] = GetChariotEquipRecycleConfig( itemTableIndex )
	if varGiveItem == -1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_ItemError )
		return
	end
	
	-- 删除道具
	if EraseItem( varMap, varPlayer, bagPos) ~= 1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_Fail )
		return
	end
	
	local varLuckRate = random(1, 1000)
	if varLuckRate <= x800138_var_LuckRate then
		
		-- 幸运奖
		StartItemTask( varMap)
		
		if bBind == 1 then
			ItemAppendBind( varMap, varGiveItem, x800138_var_LuckNum)
		else
			ItemAppend( varMap, varGiveItem, x800138_var_LuckNum)
		end
		if StopItemTask( varMap, varPlayer) <= 0 then
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_BagFull )
		    return
		else
		    DeliverItemListSendToPlayer( varMap, varPlayer)
		    GamePlayScriptLog(varMap, varPlayer, 2610)
		    Msg2Player(varMap,varPlayer,format("回收完成，你获得#R"..x800138_var_LuckNum.."#cffcf00个黄金藏宝图碎片"),8,3)
		    --NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_Success )
		end
		
		-- 世界广播
		LuaAllScenceM2Wrold( varMap,
			format("%s回收战车装备时意外获得了#R%d个#R#{_ITEM%d}", GetName( varMap, varPlayer), x800138_var_LuckNum, varGiveItem ), CHAT_MAIN_RIGHTDOWN, 1);
	
	else
	
		local varNum = x800138_GetRandomItem(varRateInfo)
		if varNum == -1 then
			WriteLog( 1, format("x800138_ProcItemWanfa get item count failed"))
			return
		end
		
		StartItemTask( varMap)
		
		if bBind == 1 then
			ItemAppendBind( varMap, varGiveItem, varNum )
		else
			ItemAppend( varMap, varGiveItem, varNum)
		end
		if StopItemTask( varMap, varPlayer) <= 0 then
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_BagFull )
		    return
		else
		    DeliverItemListSendToPlayer( varMap, varPlayer)
		    GamePlayScriptLog(varMap, varPlayer, 2611)
		   -- NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800138_var_Success )
		    Msg2Player(varMap,varPlayer,format("回收完成，你获得#R"..varNum.."#cffcf00个黄金藏宝图碎片"),8,3)
		end
	end
		
end

function x800138_GetRandomItem(tblRecord)
	local varCnt = 3
	
	local varRateMax = 0
	for i=1, varCnt do
		varRateMax = varRateMax + tblRecord[i][2]
	end
	
	local varSegMin = 0
	local varSegMax = 0
	local varRate = random(1, varRateMax)
	for i=1, varCnt do
		varSegMin = varSegMax
		varSegMax = varSegMin + tblRecord[i][2]
		if varSegMin < varRate and varRate <= varSegMax then
			return tblRecord[i][1]
		end
	end
	
	return -1
end
