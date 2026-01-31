

x800136_var_FileId 									= 800136

x800136_var_QuestName								="战车宝石替换"


-- 返回值常量定义
x800136_var_Success = 0
x800136_var_Failed = 1
x800136_var_MaterialError = 2	-- 材料错误
x800136_var_MoneyNotEnough = 3		-- 金钱不足
x800136_var_HoleFull = 4			-- 满孔
x800136_var_HoleIsNotEnough = 5		-- 没有孔
x800136_var_GemNotExist = 6			-- 没有镶嵌宝石

x800136_var_InvalidPos = -1
x800136_var_InvalidItemID = 0


function x800136_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	TalkAppendButton(varMap, x800136_var_FileId, x800136_var_QuestName, 3)
end


function x800136_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)	
	return 0
end

function x800136_ProcItemWanfa( varMap, varPlayer, varWanfaType )

	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	-- ItemPos, GemCount, GemPos, HolePos, ...
	if dataCount < 2+2*1 or dataCount > 2*MAX_ITEM_GEM+2 then
		WriteLog( 1, format("x800136_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount))
		return
	end
	
	------------------------------------------
	local bagPos = wanfaDataTable[1]-- 目标道具Pos
	local gemCnt = wanfaDataTable[2]-- 宝石数量
	local GemInfo = {}
	for i=1, gemCnt do
		--WriteLog( 1, format("x800136_ProcItemWanfa gemPos = %d, HolePos=%d", wanfaDataTable[2+2*(i-1)+1], wanfaDataTable[2+2*(i-1)+2]))
		GemInfo[i] = {GemPos=-1, HolePos=-1}
		GemInfo[i].GemPos = wanfaDataTable[2+2*(i-1)+1]
		GemInfo[i].HolePos = wanfaDataTable[2+2*(i-1)+2]
	end
	------------------------------------------
	
	-- 检查物品是否合法
	if IsItemValid( varMap, varPlayer, bagPos ) == 0 then
		WriteLog( 1, format("x800136_ProcItemWanfa item invalid! varMap=%d,PlayerGUID=%X, bagPos=%d",varMap,GetGUID(varMap,varPlayer),bagPos));			
		return
	end
		
	-- 检查物品是否是战车装备
	local itemClass = GetItemProperty( varMap, varPlayer, bagPos, "ItemClass" );
	if itemClass ~= ICLASS_CHARIOT_EQUIP then
		return
	end
	
	-- 当前孔数与宝石数量是否匹配
	local varHole = GetPlayerChariotEquipCurrHole( varMap, varPlayer, bagPos )
	if varHole < gemCnt then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800136_var_HoleIsNotEnough )
		return
	end
	
	local bBind = 0;
	local varNeedMoney = 0; -- 需要的金钱
	for i=1, gemCnt do
		-- 目标孔是否合法
		if GemInfo[i].HolePos < 0 or GemInfo[i].HolePos >= MAX_ITEM_GEM then
			WriteLog(1, format("invalid Hole=%d", GemInfo[i].HolePos));
			return
		end
		
		-- 宝石是否重复
		for j=i+1, gemCnt do
			if GemInfo[i].GemPos == GemInfo[j].GemPos or GemInfo[i].HolePos == GemInfo[j].HolePos then
				WriteLog(1, format("gem is repeat!%d %d", i, j));
				return
			end
		end
		
		-- 目标位置是否已经镶嵌了宝石
		local varGem = GetEquipGem(varMap, varPlayer, bagPos, GemInfo[i].HolePos);
		if varGem == -1 or varGem == x800136_var_InvalidItemID then
			WriteLog(1, format("GetEquipGem() failed: ItemPos=%d, HolePos=%d", bagPos, GemInfo[i].HolePos));
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800136_var_GemNotExist )
			return
		end
		
		-- 宝石是否合法
		if IsGemCanUseToEquip(varMap, varPlayer, bagPos, GemInfo[i].GemPos) == -1 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800136_var_MaterialError )
			return
		end
		
		-- 宝石是否绑定
		if IsItemBind(varMap, varPlayer, GemInfo[i].GemPos) > 0 then
			bBind = 1
		end
		
		-- 计算花费总额
		local nMoney = GetGemUsePrice(varMap, varPlayer, GemInfo[i].GemPos);
		if nMoney == -1 then
			WriteLog(1, format("GetGemUsePrice() failed: Pos=%d", GemInfo[i].GemPos));
			return
		end
		varNeedMoney = varNeedMoney + nMoney;
	end
	
	
	-- 金钱是否充足
	if IsEnoughMoney( varMap, varPlayer, varNeedMoney ) == 0 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800136_var_MoneyNotEnough )
		return
	end
	
	-- 镶嵌
	for i=1, gemCnt do
		if ChariotEquipAddGem( varMap, varPlayer, bagPos, GemInfo[i].GemPos, GemInfo[i].HolePos ) == -1 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800136_var_Failed )
			WriteLog(1, format("x800136_ProcItemWanfa ChariotEquipAddGem failed(1)! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
			return
		end
	end
	
	-- 消耗道具
	for i=1, gemCnt do
		if EraseItem( varMap, varPlayer, GemInfo[i].GemPos) ~= 1 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800136_var_MaterialError )
			return
		end
	end
	
	-- 消耗金钱
	local varRet, varType = SpendMoney( varMap, varPlayer, varNeedMoney )
	if varRet == -1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800136_var_MoneyNotEnough )
		return
	end
	
	if bBind == 1 or varType == 1 then
		BindItem( varMap, varPlayer, bagPos)
	end

	NotifyItemInfo( varMap, varPlayer, bagPos )
	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800136_var_Success )
	--日志
	WriteEquipLog( varMap, varPlayer, bagPos, eEquipAct_ChariotEquipReplaceGem )
		
end
