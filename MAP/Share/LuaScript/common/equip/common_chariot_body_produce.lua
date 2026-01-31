

x800130_var_FileId 									= 800130

x800130_var_QuestName								="战车车身制造"


x800130_var_Success = 0
x800130_var_BagIsFull = 1
x800130_var_MaterialNotEnough = 2
x800130_var_MaterialCountNotEnough = 3
x800130_var_MaterialError = 4
x800130_var_CreateFail = 5
x800130_var_GetRandomItem = 6


function x800130_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	TalkAppendButton(varMap, x800130_var_FileId, x800130_var_QuestName, 3)
end


function x800130_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)	
	return 0
end

function x800130_ProcItemWanfa( varMap, varPlayer, varWanfaType )
	--BuildChariotBody(varMap, varPlayer)
		
	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	if dataCount ~= 2 then
		WriteLog( 1, format("x800130_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount))
		return
	end
	
	------------------------------------------
	local varItem = wanfaDataTable[1]-- 目标道具ID
	local varGem = wanfaDataTable[2] -- 宝石
	------------------------------------------
	
	local varGemTmp, varNum, varSuccessRate, varFailItem, varFailCnt = GetChariotBodyBuildConfigInfo(varItem, varGem)
	if varGemTmp == -1 then
		WriteLog( 1, format("x800130_ProcItemWanfa param count invalid! Gem=%d TargetItem=%d", varGem, varItem))
		return
	end
	
	-- 背包空间
	if GetBagSpace(varMap, varPlayer) < 1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800130_var_BagIsFull )
		return
	end
	-- 材料数量是否充足
	if GetItemCount(varMap, varPlayer, varGem) < varNum then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800130_var_MaterialCountNotEnough )
		return
	end

	-- 消耗道具
	local bBind = 0
	for i=1 , varNum  do 
		local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, varGem)
		if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
			bBind = 1
		end
		if DelItem( varMap, varPlayer, varGem, 1) ~= 1 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800130_var_MaterialCountNotEnough )
			return
		end
	end
	
	StartItemTask( varMap)
	local varRate = random(1, 10000)
	if varRate > varSuccessRate then
		if (bBind == 1) then
			ItemAppendBind( varMap, varFailItem, varFailCnt)
		else
			ItemAppend(varMap, varFailItem, varFailCnt)
		end
		if StopItemTask( varMap, varPlayer) <= 0 then
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800130_var_BagIsFull )
		else
		    DeliverItemListSendToPlayer( varMap, varPlayer)
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800130_var_GetRandomItem )
		end
	
	else
		if (bBind == 1) then
			ItemAppendBind( varMap, varItem, 1)
		else
			ItemAppend( varMap, varItem, 1)
		end
		if StopItemTask( varMap, varPlayer) <= 0 then
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800130_var_BagIsFull )
		else
		    DeliverItemListSendToPlayer( varMap, varPlayer)
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800130_var_Success )
		end
	end
		
end
