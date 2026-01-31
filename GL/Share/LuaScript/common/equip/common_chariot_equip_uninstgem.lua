

x800135_var_FileId 									= 800135

x800135_var_QuestName								="战车宝石拆除"


-- 返回值常量定义
x800135_var_Success = 0
x800135_var_Failed = 1
x800135_var_MaterialError = 2	-- 材料不足
x800135_var_MoneyNotEnough = 3	-- 金钱不足
x800135_var_GemNotExist = 4		-- 指定孔没有镶嵌宝石
x800135_var_BagIsFull = 5		-- 背包满

x800135_var_NeedItem = 11033007 -- 拆卸需要的道具ID
x800135_var_NeedItemCnt = 1		-- 拆卸需要的道具数量
x800135_var_NeedMoney = 1000	-- 拆卸需要的金钱

x800135_var_InvalidPos = -1
x800135_var_InvalidItemID = 0


function x800135_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	TalkAppendButton(varMap, x800135_var_FileId, x800135_var_QuestName, 3)
end


function x800135_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)	
	return 0
end

function x800135_ProcItemWanfa( varMap, varPlayer, varWanfaType )

	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	if dataCount ~= 2 then
		WriteLog( 1, format("x800135_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount))
		return
	end
	
	------------------------------------------
	local bagPos = wanfaDataTable[1]	-- 目标道具Pos
	local holePos = wanfaDataTable[2]	-- 宝石位置
	------------------------------------------
	
	-- 检查物品是否合法
	if IsItemValid( varMap, varPlayer, bagPos ) == 0 then
		WriteLog( 1, format("x800135_ProcItemWanfa item invalid! varMap=%d,PlayerGUID=%X, bagPos=%d",varMap,GetGUID(varMap,varPlayer),bagPos));			
		return
	end
		
	-- 检查物品是否是战车装备
	local itemClass = GetItemProperty( varMap, varPlayer, bagPos, "ItemClass" );
	if itemClass ~= ICLASS_CHARIOT_EQUIP then
		return
	end
	
	-- 背包空间
	if GetBagSpace(varMap, varPlayer) < 1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_BagIsFull )
		return
	end
	
	-- 目标位置是否已经镶嵌了宝石
	local varGem = GetEquipGem(varMap, varPlayer, bagPos, holePos);
	if varGem == -1 or varGem == x800135_var_InvalidItemID then
		WriteLog(1, format("GetEquipGem() failed: ItemPos=%d, HolePos=%d", bagPos, holePos));
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_GemNotExist )
		return
	end
	
	-- 金钱是否充足
	if IsEnoughMoney( varMap, varPlayer, x800135_var_NeedMoney ) == 0 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_MoneyNotEnough )
		return
	end
	-- 材料数量是否充足
	if GetItemCount(varMap, varPlayer, x800135_var_NeedItem) < x800135_var_NeedItemCnt then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_MaterialError )
		return
	end
	
	-- 拆卸
	if ChariotEquipDelGem( varMap, varPlayer, bagPos, holePos ) == -1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_Failed )
		WriteLog(1, format("x800135_ProcItemWanfa ChariotEquipAddGem failed(1)! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
		return
	end
	
	-- 生成宝石
	StartItemTask( varMap)
	ItemAppendBind( varMap, varGem, 1)
	if StopItemTask( varMap, varPlayer) <= 0 then
	    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_BagIsFull )
	    return
	else
	    DeliverItemListSendToPlayer( varMap, varPlayer)
	end
	
	-- 消耗道具
	if DelItem( varMap, varPlayer, x800135_var_NeedItem, x800135_var_NeedItemCnt) == 0 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_MaterialError )
		return
	end
	
	-- 消耗金钱
	local varRet, varType = SpendMoney( varMap, varPlayer, x800135_var_NeedMoney )
	if varRet == -1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_MoneyNotEnough )
		return
	end
	
	-- 根据消耗的金钱类型决定是否绑定道具
	if varType == 1 then
		BindItem( varMap, varPlayer, bagPos)
	end
	
	NotifyItemInfo( varMap, varPlayer, bagPos )
	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800135_var_Success )
	--日志
	WriteEquipLog( varMap, varPlayer, bagPos, eEquipAct_ChariotEquipDelGem )
		
end
