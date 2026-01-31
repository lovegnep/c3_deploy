

x800129_var_FileId 									= 800129

x800129_var_QuestName								="战车装备制造"


x800129_var_Success = 0
x800129_var_BagIsFull = 1
x800129_var_MaterialNotEnough = 2
x800129_var_MaterialCountNotEnough = 3
x800129_var_MaterialError = 4
x800129_var_CreateFail = 5
x800129_var_GetRandomItem = 6


function x800129_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	TalkAppendButton(varMap, x800129_var_FileId, x800129_var_QuestName, 3)
end


function x800129_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	
	return 0
end

function x800129_ProcItemWanfa( varMap, varPlayer, varWanfaType )
	--BuildChariotEquip(varMap, varPlayer)
	
	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	if dataCount ~= 4 then
		WriteLog( 1, format("x800130_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount))
		return
	end
	
	------------------------------------------
	local varItem = wanfaDataTable[1] -- 目标道具ID
	local varGem1 = wanfaDataTable[2] -- 宝石
	local varGem2 = wanfaDataTable[3] -- 宝石
	local varGem3 = wanfaDataTable[4] -- 宝石
	------------------------------------------
	
	local varNum1, varNum2, varNum3 = GetChariotEquipBuildConfigInfo(varItem, varGem1, varGem2, varGem3)
	if varNum1 == -1 then
		WriteLog( 1, format("x800129_ProcItemWanfa param count invalid! TargetItem=%d, Gem1=%d, Gem2=%d, Gem3=%d", varItem, varGem1, varGem2, varGem3))
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_MaterialError )
		return
	end
	
	local varPoint = GetChariotEquipPoint(varItem)
	if varPoint == -1 then
		WriteLog( 1, format("x800129_ProcItemWanfa get item point failed! Item = %d", varItem))
		return
	end
	local tblRecord = GetChariotEquipRandomConfig(varPoint)
	if getn(tblRecord) < 1 then
		WriteLog( 1, format("x800129_ProcItemWanfa get random item config failed! Equip point = %d", varPoint))
		return
	end
	
	-- 背包空间
	if GetBagSpace(varMap, varPlayer) < 1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_BagIsFull )
		return
	end
	-- 材料数量是否充足
	if GetItemCount(varMap, varPlayer, varGem1) < varNum1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_MaterialCountNotEnough )
		return
	end
	if GetItemCount(varMap, varPlayer, varGem2) < varNum2 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_MaterialCountNotEnough )
		return
	end
	if GetItemCount(varMap, varPlayer, varGem3) < varNum3 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_MaterialCountNotEnough )
		return
	end
	
	-- 消耗材料
	local bBind = 0
	for i=1 , varNum1  do 
		local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, varGem1)
		if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
			bBind = 1
		end
		if DelItem( varMap, varPlayer, varGem1, 1) ~= 1 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_MaterialCountNotEnough )
			return
		end
	end
	
	for i=1 , varNum2  do 
		local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, varGem2)
		if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
			bBind = 1
		end
		if DelItem( varMap, varPlayer, varGem2, 1) == 0 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_MaterialCountNotEnough )
			return
		end
	end
	
	for i=1 , varNum3  do 
		local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, varGem3)
		if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
			bBind = 1
		end
		if DelItem( varMap, varPlayer, varGem3, 1) == 0 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_MaterialCountNotEnough )
			return
		end
	end
	
	local varRate = random(1, 10000)
	if varRate < tblRecord[1] then
		
		local varFailItem = x800129_GetRandomItem(tblRecord)
		if varFailItem == -1 then
			WriteLog( 1, format("x800129_ProcItemWanfa get random item failed! Equip point = %d", varPoint))
			return
		end
		
		StartItemTask( varMap)
		if (bBind == 1) then
			ItemAppendBind( varMap, varFailItem, 1)
		else
			ItemAppend( varMap, varFailItem, 1)
		end
		if StopItemTask( varMap, varPlayer) <= 0 then
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_BagIsFull )
		else
		    DeliverItemListSendToPlayer( varMap, varPlayer)
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_GetRandomItem )
		end
	
	else
	
		StartItemTask( varMap)
		if (bBind == 1) then
			ItemAppendBind( varMap, varItem, 1)
		else
			ItemAppend( varMap, varItem, 1)
		end
		if StopItemTask( varMap, varPlayer) <= 0 then
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_BagIsFull )
		else
		    DeliverItemListSendToPlayer( varMap, varPlayer)
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800129_var_Success )
		end
	end
		
end


function x800129_GetRandomItem(tblRecord)
	local varCnt = tblRecord[2]
	local varRate = random(1, 10000)
	local varSegMin = 0
	local varSegMax = 0
	
	for i=1, varCnt do
		varSegMin = varSegMax
		varSegMax = varSegMin + tblRecord[2+(i-1)*2+2]
		if varSegMin < varRate and varRate <= varSegMax then
			return tblRecord[2+(i-1)*2+1]
		end
	end
	
	return -1
end
