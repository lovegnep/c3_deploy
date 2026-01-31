
--骑乘装备回收处理脚本
x800169_var_FileId = 800169

--骑乘装备回收结果
x800169_var_Result_Failed_Succ = 1
x800169_var_Result_Failed_CantRecall = 0
x800169_var_Result_Failed_Other = -1
x800169_var_Result_Failed_Class = -2
x800169_var_Result_Failed_Locked = -3
x800169_var_Result_Failed_NoSpace = -4

x800169_var_AddWardLog = 526

function x800169_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800169_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

end

function x800169_ProcItemWanfa( varMap, varPlayer, varWanfaType)
	
	local wanfaDataTable = GetItemWanfaData( varMap )	
	local containerType = wanfaDataTable[1]
	local bagIndex = wanfaDataTable[2]

	--检查参数
	if bagIndex == nil or bagIndex < 0 or containerType == nil or containerType < 0 then
		Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Other)
		return 
	end 
	
	--containerType对应客户端的 ASCRIPTION_MYSELF_MESSAGE 和 ASCRIPTION_CARD_ITEM，表示容器类型
	if containerType ~= 2 and containerType ~= 21 then
		Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Other)
		return
	end
	
	
	if containerType == 2 then
		containerType = 0
	elseif containerType == 21 then
		containerType = 1
	end
	
	
	--检查物品类型
	if GetItemClassByBagPos(varMap, varPlayer, bagIndex, containerType) ~= 45 then
		Msg2Player( varMap, varPlayer, "只有卡牌才可以回收", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Class)
		return 
	end
	
	
	--检查锁定
	local varLockType = IsItemLocked(varMap, varPlayer, bagIndex, containerType)
	
	if varLockType < 0  then		
		Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
		WriteLog(1,format("卡牌回收读取物品失败，playerID=%d, mapID=%d, bagIndex=%d, containerType=%d", varPlayer, varMap, bagIndex, containerType))
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Other)
		return 
	end
	
	if varLockType  == 1 then		
		Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Locked)
		return 
	end
	
	--检查装备锁定 --卡牌不支持装备锁定
--	if IsEquipLocked(varMap, varPlayer, bagIndex)  == 1 then		
--		Msg2Player( varMap, varPlayer, "物品锁定，无法回收", 0, 2)
--		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Locked)
--		return 
--	end
	
		
	--if IsPasswordUnlocked(varMap, varPlayer, 0) == 0 and IsPasswordProtect(varMap, varPlayer) > 0 then
	--end
	
	
	--读表EquipRecall.tab，获取数据
	local awardType, awardValue, itemIndexTB, itemNum = GetItemRecallInfo(varMap, varPlayer, bagIndex, containerType)
	if awardType == -2 then
		Msg2Player( varMap, varPlayer, "此物品无法回收", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_CantRecall)
		return
	elseif awardType == -1 then
		Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Other)
		return		
	end
	
	
	--WriteLog(1,format("1=%d,2=%d,3=%d,4=%d",awardType, awardValue, itemIndexTB, itemNum))
	
	--奖励物品
	if awardType == 16 then
		if itemIndexTB == nil or itemIndexTB < 0 then
			Msg2Player( varMap, varPlayer, "此物品不可以回收", 0, 2)
			WriteLog(1,format("读取EquipRecall.tab错误，itemBagIndex=%d, playerid=%d", bagIndex, varPlayer))
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_CantRecall )
			return
		end
		
		StartItemTask(varMap)
    ItemAppendBind(varMap, itemIndexTB, itemNum )
    
    local varRet = StopItemTask(varMap, varPlayer)
    if varRet <= 0 then
			Msg2Player( varMap, varPlayer, "背包空间已满", 0, 2)
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_NoSpace )
			return
    end
    
    --删除物品
		if EraseItem(varMap, varPlayer, bagIndex, 1, containerType) ~= 1 then
			Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Other)
			return
		end
    
    DeliverItemListSendToPlayer(varMap, varPlayer)
    
	
	else
	
		if awardType == 6 then
			if GetGuildID(varMap, varPlayer) == -1 then
				Msg2Player( varMap, varPlayer, "您还没有帮会", 0, 2)
				NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Other)
				return
			end
		end
		
		--删除物品
		if EraseItem(varMap, varPlayer, bagIndex, 1, containerType) ~= 1 then
			Msg2Player( varMap, varPlayer, "回收失败", 0, 2)
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Other)
			return
		end
		
		AddAwardValue(varMap, varPlayer, awardType, awardValue, x800169_var_AddWardLog)
	end
	
	
	Msg2Player( varMap, varPlayer, "卡牌回收完成", 8, 2)  
	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800169_var_Result_Failed_Succ )
	
end




