
--骑乘装备回收处理脚本
x800165_var_FileId = 800165

--骑乘装备回收结果
x800165_var_Result_Failed_Succ = 1
x800165_var_Result_Failed_CantRecall = 0
x800165_var_Result_Failed_Other = -1
x800165_var_Result_Failed_Class = -2
x800165_var_Result_Failed_Locked = -3
x800165_var_Result_Failed_NoSpace = -4

x800165_var_AddWardLog = 525

function x800165_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800165_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

end

function x800165_ProcItemWanfa( varMap, varPlayer, varWanfaType)
	
	local wanfaDataTable = GetItemWanfaData( varMap )	
	local bagIndex = wanfaDataTable[1]
	
	--检查参数
	if bagIndex == nil or bagIndex < 0 then
		Msg2Player( varMap, varPlayer, "没有找到该物品", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Other)
		return 
	end 
	
	
	--检查物品类型
	if GetItemClassByBagPos(varMap, varPlayer, bagIndex, 0) ~= 30 then
		Msg2Player( varMap, varPlayer, "只有骑乘装备才可以回收", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Class)
		return 
	end
	
	
	--检查锁定
	local varLockType = IsItemLocked(varMap, varPlayer, bagIndex)
	if varLockType < 0  then		
		Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
		WriteLog(1,format("马装备回收读取物品失败，playerID=%d, mapID=%d, bagIndex=%d", varPlayer, varMap, bagIndex))
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Other)
		return 
	end
	
	if varLockType  == 1 then		
		Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Locked)
		return 
	end
	
	--检查装备锁定
	if IsEquipLocked(varMap, varPlayer, bagIndex)  == 1 then		
		Msg2Player( varMap, varPlayer, "物品锁定，无法回收", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Locked)
		return 
	end
	
		
	--if IsPasswordUnlocked(varMap, varPlayer, 0) == 0 and IsPasswordProtect(varMap, varPlayer) > 0 then
	--end
	
	
	--读表EquipRecall.tab，获取数据
	local awardType, awardValue, itemIndexTB, itemNum = GetItemRecallInfo(varMap, varPlayer, bagIndex, 0)
	if awardType == -2 then
		Msg2Player( varMap, varPlayer, "此物品无法回收", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_CantRecall)
		return
	elseif awardType == -1 then
		Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Other)
		return		
	end
	
	
	--WriteLog(1,format("1=%d,2=%d,3=%d,4=%d",awardType, awardValue, itemIndexTB, itemNum))
	
	--奖励物品
	if awardType == 16 then
		if itemIndexTB == nil or itemIndexTB < 0 then
			Msg2Player( varMap, varPlayer, "此物品不可以回收", 0, 2)
			WriteLog(1,format("读取EquipRecall.tab错误，itemBagIndex=%d, playerid=%d", bagIndex, varPlayer))
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_CantRecall )
			return
		end
		
		StartItemTask(varMap)
    ItemAppendBind(varMap, itemIndexTB, itemNum )
    
    local varRet = StopItemTask(varMap, varPlayer)
    if varRet <= 0 then
			Msg2Player( varMap, varPlayer, "背包空间已满", 0, 2)
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_NoSpace )
			return
    end
    
    --删除物品
		if EraseItem(varMap, varPlayer, bagIndex) ~= 1 then
			Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Other)
			return
		end
    
    DeliverItemListSendToPlayer(varMap, varPlayer)
    
	
	else
		
		if awardType == 6 then
			if GetGuildID(varMap, varPlayer) == -1 then
				Msg2Player( varMap, varPlayer, "您还没有帮会", 0, 2)
				NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Other)
				return
			end
		end
		
		--删除物品
		if EraseItem(varMap, varPlayer, bagIndex) ~= 1 then
			Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Other)
			return
		end	
		
		AddAwardValue(varMap, varPlayer, awardType, awardValue, x800165_var_AddWardLog)
	end
	
	
	Msg2Player( varMap, varPlayer, "骑乘装备回收完成", 8, 2)  
	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800165_var_Result_Failed_Succ )
	
end




