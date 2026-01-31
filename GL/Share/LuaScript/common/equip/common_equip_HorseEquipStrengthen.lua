

x800164_var_FileId = 800164

x800164_var_Result_Failure_Locked = 4
x800164_var_Result_Failure_Not_EnoughGold = 20
x800164_var_Result_Failure_EquipLevel = 21
x800164_var_Result_Failure_PlayerLevel =22
x800164_var_Result_Failure_Material = 23
x800164_var_Result_Failure_Money = 24
x800164_var_Result_Failure_DeleteMaterial = 25
x800164_var_Result_Failure_Not_EnoughSpace = 26
x800164_var_Result_Failure_MaxStarNum =27
x800164_var_Result_Failure_Other =28

x800164_var_CostMoney_Whys = 524

x800164_var_MaxStarNum = 86

function x800164_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800164_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end

function x800164_ProcItemWanfa( varMap, varPlayer, varWanfaType )
	
	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	if dataCount == nil or dataCount < 2 then
		Msg2Player( varMap, varPlayer, "强化失败", 0, 3 )
		Msg2Player( varMap, varPlayer, "强化失败", 0, 2 )
		WriteLog(1, format("骑乘装备强化失败，参数错误。player=%d, map=%d", varPlayer, varMap))
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Other )
		return 
	end
	
	local bagType = wanfaDataTable[1]
	local itemPlaceIndex = wanfaDataTable[2]
	local highSection = 0
	local lowSection = 0
	
	if bagType > 0 then
		if dataCount < 4 then
			Msg2Player( varMap, varPlayer, "强化失败", 0, 3 )
			Msg2Player( varMap, varPlayer, "强化失败", 0, 2 )
			WriteLog(1, format("骑乘装备强化失败，参数错误。player=%d, map=%d", varPlayer, varMap))
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Other )
			return
		end
		
		highSection = wanfaDataTable[3]
		lowSection = wanfaDataTable[4]
	end
	
	--获取当前装备下一级升级需要的条件

	local starNumCur				--当前星级
	local moneyNeed					--需要的金钱
	local itemNeedLevel			--需要的装备等级
	local playerNeedLevel		--需要的人物等级
	local levelUpFlag				--是否升阶
	
	starNumCur, moneyNeed, itemNeedLevel, playerNeedLevel, levelUpFlag = GetHorseEquipStrengthenInfo(varMap, varPlayer, wanfaDataTable[1], wanfaDataTable[2], 0, highSection, lowSection)
	if starNumCur == nil or moneyNeed == nil or itemNeedLevel == nil or playerNeedLevel == nil or levelUpFlag == nil then
		WriteLog(1,format("----nil--- 莉戈ア毖bagType=%d, itemPlaceIndex=%d,", wanfaDataTable[1], wanfaDataTable[2]))
		Msg2Player( varMap, varPlayer, "强化失败", 0, 3 )
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Other )
		return
	end

	
	if starNumCur < 0 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Other )
    Msg2Player( varMap, varPlayer, "强化出错", 0, 3 )
    return
	end
	
	if starNumCur == x800164_var_MaxStarNum then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_MaxStarNum )
    Msg2Player( varMap, varPlayer, "已经达到最大星级", 0, 3 )
    return
	end
	
	--检查金钱
	--if IsEnoughMoney(varMap, varPlayer, moneyNeed) ~= 1 then
  	--NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Not_EnoughGold )
    --Msg2Player( varMap, varPlayer, "金钱不足", 0, 3 )
    --return
	--end
	if GetMoney(varMap, varPlayer, 1) < moneyNeed and GetMoney(varMap, varPlayer, 0) < moneyNeed then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Not_EnoughGold )
		Msg2Player( varMap, varPlayer, "金钱不足", 0, 3 )
		return
	end
	
	--检查装备等级
--	if GetHorseEquipCurLevel(varMap, varPlayer, bagType, itemPlaceIndex) < itemNeedLevel then
--		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_EquipLevel )
--    Msg2Player( varMap, varPlayer, "装备等级不够", 0, 3 )
--    return
--	end
	
	--检查人物等级
	if GetLevel(varMap, varPlayer) < playerNeedLevel then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_EquipLevel )
    Msg2Player( varMap, varPlayer, "人物等级不够", 0, 3 )
    return
	end
	
	--如果需要升阶
	local itemIndexTBNew = -1
	local materialIndex1 = -1
	local materialNum1 = -1
	local materialIndex2 = -1
	local materialNum2 = -1
	local materialIndex3 = -1
	local materialNum3 = -1
	local materialIndex4 = -1
	local materialNum4 = -1
	 
	if levelUpFlag == 1 then
	
		--检查背包空间
		if GetBagSpace(varMap, varPlayer) <= 0 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Not_EnoughSpace )
			Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 3 )
	  	return
		end
	
	
		itemIndexTBNew, materialIndex1, materialNum1, materialIndex2, materialNum2, materialIndex3, materialNum3, materialIndex4, materialNum4 = GetHorseEquipStrengthenInfo(varMap, varPlayer, wanfaDataTable[1], wanfaDataTable[2], 1, highSection, lowSection)
		WriteLog(1,format("1=%d,2=%d,3=%d,4=%d,5=%d", itemIndexTBNew, materialIndex1, materialIndex2, materialIndex3, materialIndex4))
		--检查所需的材料是否足够
		if (materialIndex1 ~= -1) and (GetItemCount(varMap, varPlayer, materialIndex1) < materialNum1) then
    	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Material )
    	Msg2Player( varMap, varPlayer, "材料不足", 0, 3 )
     	return
    end
    
    if (materialIndex2 ~= -1) and (GetItemCount(varMap, varPlayer, materialIndex2) < materialNum2) then
    	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Material )
    	Msg2Player( varMap, varPlayer, "材料不足", 0, 3 )
     	return
    end
    
    if (materialIndex3 ~= -1) and (GetItemCount(varMap, varPlayer, materialIndex3) < materialNum3) then
    	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Material )
    	Msg2Player( varMap, varPlayer, "材料不足", 0, 3 )
     	return
    end
    
    if (materialIndex4 ~= -1) and (GetItemCount(varMap, varPlayer, materialIndex4) < materialNum4) then
    	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Material )
    	Msg2Player( varMap, varPlayer, "材料不足", 0, 3 )
     	return
    end
        
	end
	

  local containerType = 0
  if wanfaDataTable[1] == 0 then
  	containerType = 0
  elseif wanfaDataTable[1] > 0 then
  	containerType = 3
  end
	
	
	--检查物品是否锁定
	local varLockType = IsItemLocked(varMap, varPlayer, itemPlaceIndex, containerType, highSection, lowSection)
	
	if varLockType  < 0 then		
		Msg2Player( varMap, varPlayer, "强化失败", 0, 3)
		WriteLog(1,format("马装强化读取物品失败，playerID=%d, mapID=%d, itemPlaceIndex=%d, containerType=%d, highSection=%d, lowSection=%d", varPlayer, varMap, itemPlaceIndex, containerType, highSection, lowSection))
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Other)
		return 
	end
	
	if varLockType  == 1 then		
		Msg2Player( varMap, varPlayer, "强化失败", 0, 3)
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Locked)
		return 
	end
	
	
	--扣钱
	--local ret1, moneyType = SpendMoney(varMap, varPlayer, moneyNeed)
	--if ret1 <= 0 then
	--	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_Money )
    --Msg2Player( varMap, varPlayer, "扣钱失败", 0, 3 )
	--end

	-- 扣银卡
	if GetSillerMode( varMap, varPlayer) == 1 then
        if GetMoney(varMap, varPlayer, 0) < moneyNeed then
			CostMoney(varMap, varPlayer, 1, moneyNeed, x800164_var_CostMoney_Whys,x800164_var_FileId)
		else
			CostMoney(varMap, varPlayer, 0, moneyNeed, x800164_var_CostMoney_Whys,x800164_var_FileId)
		end
	else
		if GetMoney(varMap, varPlayer, 1) < moneyNeed then
			CostMoney(varMap, varPlayer, 0, moneyNeed, x800164_var_CostMoney_Whys,x800164_var_FileId)
		else
			CostMoney(varMap, varPlayer, 1, moneyNeed, x800164_var_CostMoney_Whys,x800164_var_FileId)
		end
    end
	
	
	--删除材料
	if levelUpFlag == 1 then
		if (materialIndex1 ~= -1) and (DelItem(varMap, varPlayer, materialIndex1, materialNum1) == 0) then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_DeleteMaterial )
			return
		end
		
		if (materialIndex2 ~= -1) and (DelItem(varMap, varPlayer, materialIndex2, materialNum2) == 0) then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_DeleteMaterial )
			return
		end
		
		if (materialIndex3 ~= -1) and (DelItem(varMap, varPlayer, materialIndex3, materialNum3) == 0) then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_DeleteMaterial )
			return
		end
		
		if (materialIndex4 ~= -1) and (DelItem(varMap, varPlayer, materialIndex4, materialNum4) == 0) then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800164_var_Result_Failure_DeleteMaterial )
			return
		end
  end
  
 	--增加一个绑定的接口，自由指定哪个容器
  
  BindContainerItem(varMap, varPlayer, containerType, wanfaDataTable[2], wanfaDataTable[1] - 1, highSection, lowSection)
  
  --强化物品
  local ret2 = StrengthenHorseEquip( varMap, varPlayer, wanfaDataTable[1], wanfaDataTable[2], itemIndexTBNew, highSection, lowSection)
  
	NotifyItemWanfa( varMap, varPlayer, varWanfaType, ret2)
end




