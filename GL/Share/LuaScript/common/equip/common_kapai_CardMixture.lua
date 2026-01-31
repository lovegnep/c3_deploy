x800160_var_FileId = 800160

x800160_var_QuestName="将星卡合成"

x800160_var_CreateCardItem_Whys = 253		-- 创建卡片原因

x800160_var_CostMoney_Whys = 507

x800160_var_QuickMixCardTab = {}

x800160_var_limit_QuickMixCardNum = 25 -- 限制一次 一键合成产出卡牌的数量，避免产出过多引起客户端收到消息饱和导致的重连

function x800160_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800160_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800160_var_FileId,x800160_var_QuestName,3);
end

function x800160_ProcItemWanfa( varMap, varPlayer, varWanfaType )

	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	WriteLog(1, format("x800160_ProcItemWanfa: wanfaDataTable=%d", dataCount))

	if dataCount ~= 5 then
		--NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800160_var_EQUIP_WANFA_FAIL )
		WriteLog( 1, format("x800160_ProcItemWanfa dataCount num err: varMap=%d,PlayerGUID=%X,dataCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount) );
		return
	end
	
	if (wanfaDataTable[1] < 100000) then
		x800160_ProcItemWanfaQuickMix(varMap, varPlayer, varWanfaType, wanfaDataTable[1], wanfaDataTable[2])
		return
	end
	
	--for i = 1, 5 do
	--	print(wanfaDataTable[i])
	--end
	
	local ItemTab = {}
	for i = 1, dataCount do
		if(wanfaDataTable[i] ~= nil and wanfaDataTable[i] ~= -1) then
			ItemTab[i] = {}
			ItemTab[i].num = floor(wanfaDataTable[i] / 100000)
			ItemTab[i].isInCardBag = floor(mod(wanfaDataTable[i],100000) / 1000)
			ItemTab[i].Pos = mod(wanfaDataTable[i], 1000)
		end
	end
	
	x800160_DealMix(varMap, varPlayer, varWanfaType, ItemTab)

end

function x800160_ProcItemWanfaQuickMix( varMap, varPlayer, varWanfaType, varBaseColorType, varCount )
	-- 背包剩余空间
    if GetBagSpace(varMap, varPlayer) <= 0 and GetBagSpace(varMap,varPlayer,1) <= 0 then
    	Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 3 )
		Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 2 )
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, -3 * 100000 - varCount)
        return
    end

	x800160_LoadAllCardItem(varMap, varPlayer, varBaseColorType)
	
	local liNum = x800160_var_QuickMixCardTab.nCount;
	x800160_var_QuickMixCardTab.nCount = nil
	local Ret = 0
	
	if liNum ~= nil and liNum >= 5 then
		local nCanMixNum = floor(liNum / 5)
		
		if nCanMixNum > x800160_var_limit_QuickMixCardNum then
			nCanMixNum = x800160_var_limit_QuickMixCardNum
		end
		
		for i = 1, nCanMixNum do
		
			local nCount = 1;
			local nCardNum = 0;
			local Tmp = {}
			
			for idx, item in x800160_var_QuickMixCardTab do
				
				Tmp[nCount] = {}
				Tmp[nCount].Pos = item.Pos
				Tmp[nCount].isInCardBag = item.isInCardBag
				if (item.num > (5 - nCardNum)) then
					Tmp[nCount].num = (5 - nCardNum)
					item.num = item.num - (5 - nCardNum)
					nCardNum = nCardNum + (5 - nCardNum)
				else
					Tmp[nCount].num = item.num
					nCardNum = nCardNum + Tmp[nCount].num
					item.num = 0
				end
				
				if item.num == 0 then
					x800160_var_QuickMixCardTab[idx] = nil
				end
				
				if nCardNum == 5 then
					break
				end
				
				nCount = nCount + 1
			end
			
			Ret = x800160_DealMix(varMap, varPlayer, varWanfaType, Tmp, 1)
			if Ret == 0 then
				break
			else
				varCount = varCount + 1
			end
			--print("-------------------------------------"..i)
		end
	end
	
	if Ret ~= 0 then
		Msg2Player( varMap, varPlayer, "合成完成", 0, 3 )
		Msg2Player( varMap, varPlayer, "合成完成", 0, 2 )
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, -2 * 100000 - varCount)
		--print("-------------------------------------")
	else
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, -3 * 100000 - varCount)
		--print("------------------------fffffffff-------------")
	end

end

function x800160_LoadAllCardItem( varMap, varPlayer, varBaseColorType )
	
	x800160_var_QuickMixCardTab = {}
	x800160_var_QuickMixCardTab.nCount = 0
	local nCount = 1;
	
	-- 遍历卡包
	for idx = 0, 96 do
		local color,start = GetCardInfoByPos(varMap, varPlayer, 1, idx)
		if color == varBaseColorType then
			x800160_var_QuickMixCardTab[nCount] = {}
			x800160_var_QuickMixCardTab[nCount].num = GetItemCountInBagPos(varMap, varPlayer, idx, 1)
			x800160_var_QuickMixCardTab[nCount].isInCardBag = 1
			x800160_var_QuickMixCardTab[nCount].Pos = idx
			x800160_var_QuickMixCardTab.nCount = x800160_var_QuickMixCardTab.nCount + x800160_var_QuickMixCardTab[nCount].num
			
			nCount = nCount + 1
		end
	end
	
	-- 遍历背包
	for idx = 0, 184 do
		local color,start = GetCardInfoByPos(varMap, varPlayer, 0, idx)
		if color == varBaseColorType then
			x800160_var_QuickMixCardTab[nCount] = {}
			x800160_var_QuickMixCardTab[nCount].num = GetItemCountInBagPos(varMap, varPlayer, idx)
			x800160_var_QuickMixCardTab[nCount].isInCardBag = 0
			x800160_var_QuickMixCardTab[nCount].Pos = idx
			x800160_var_QuickMixCardTab.nCount = x800160_var_QuickMixCardTab.nCount + x800160_var_QuickMixCardTab[nCount].num
			
			nCount = nCount + 1
		end
	end
	
	return x800160_var_QuickMixCardTab
end

function x800160_DealMix(varMap, varPlayer, varWanfaType, varTab, varQuickMixFlag)
	local ItemTab = varTab
	
	-- 检查卡牌等级是否相同
	local KaiPaiColor = 0;
	local KaiPaiNum = 0
	for idx, item in ItemTab do
		local color,start = GetCardInfoByPos(varMap, varPlayer, item.isInCardBag, item.Pos)
	
		if KaiPaiColor == 0 then
			KaiPaiColor = color;
		end
		
		if (color < 0) then
			WriteLog( 1, format("x800160_ProcItemWanfa GetCardInfoByPos err: varMap=%d,PlayerGUID=%X,item.isInCardBag=%d, item.Pos=%d",varMap,GetGUID(varMap,varPlayer),item.isInCardBag, item.Pos) );	
		end
		
		if KaiPaiColor ~= color or color < 0 then
			Msg2Player( varMap, varPlayer, "合成失败，放入将星卡的颜色等级不相同", 0, 3 )
			Msg2Player( varMap, varPlayer, "合成失败，放入将星卡的颜色等级不相同", 0, 2 )
			return 0
		end
		
		KaiPaiNum = KaiPaiNum + item.num
	end
	
	-- 检查卡牌数量
	if (KaiPaiNum ~= 5) then
		Msg2Player( varMap, varPlayer, "请放入将星卡", 0, 3 )
		Msg2Player( varMap, varPlayer, "请放入将星卡", 0, 2 )
		return 0
	end
	
	-- 获取生成的新的物品
	local ItemID, IsTriggerNotisfy, nCostSiller = GetCardMixResultItem(varMap, varPlayer, KaiPaiColor)
	if (ItemID == -1) then
		Msg2Player( varMap, varPlayer, "合成失败，物品错误", 0, 3 )
		Msg2Player( varMap, varPlayer, "合成失败，物品错误", 0, 2 )
		WriteLog( 1, format("x800160_DealMix GetCardInfoByPos err: varMap=%d,PlayerGUID=%X,KaiPaiColor=%d",varMap,GetGUID(varMap,varPlayer),KaiPaiColor) );	
		return 0
	end
	
    -- 需要物品数量
	for idx, item in ItemTab do
		if item.isInCardBag ~= 1 then
			-- 背包中的卡牌
			if GetItemCountInBagPos(varMap, varPlayer, item.Pos) < item.num then
				Msg2Player( varMap, varPlayer, "将星卡数量不足", 0, 3 )
				Msg2Player( varMap, varPlayer, "将星卡数量不足", 0, 2 )
				return 0
			end
		else
			-- 卡牌包中的开牌
			if GetItemCountInBagPos(varMap, varPlayer, item.Pos, 1) < item.num then
				Msg2Player( varMap, varPlayer, "将星卡数量不足", 0, 3 )
				Msg2Player( varMap, varPlayer, "将星卡数量不足", 0, 2 )
				return 0
			end
		end
	end
    
    -- 背包剩余空间
    if GetBagSpace(varMap, varPlayer) <= 0 and GetBagSpace(varMap,varPlayer,1) <= 0 then
    	Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 3 )
		Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 2 )
        return 0
    end
	
	-- 银卡消耗检测
	if GetMoney(varMap, varPlayer, 1) < nCostSiller and GetMoney(varMap, varPlayer, 0) < nCostSiller  then
		Msg2Player( varMap, varPlayer, "银卡不足", 0, 3 )
		Msg2Player( varMap, varPlayer, "银卡不足", 0, 2 )
		return 0
	end
    
	-- 删除物品
	for idx, item in ItemTab do
		if item.isInCardBag ~= 1 then
			-- 背包中的卡牌
			local result = DelItemByIndexInBag(varMap, varPlayer, item.Pos, item.num)
			if 1 ~= result then
				Msg2Player( varMap, varPlayer, "合成失败", 0, 3 )
				Msg2Player( varMap, varPlayer, "合成失败", 0, 2 )
				WriteLog( 1, format("x800160_DealMix DelItemByIndexInBag err: mainbag varMap=%d,PlayerGUID=%X, Pos =%d, num=%d",varMap,GetGUID(varMap,varPlayer),item.Pos,item.num) );	
				return 0
			end
		else
			-- 卡牌包中的卡牌
			local result = DelItemByIndexInBag(varMap, varPlayer, item.Pos, item.num, 63, 1)
			if 1 ~= result then
				Msg2Player( varMap, varPlayer, "合成失败", 0, 3 )
				Msg2Player( varMap, varPlayer, "合成失败", 0, 2 )
				WriteLog( 1, format("x800160_DealMix DelItemByIndexInBag err: mainbag varMap=%d,PlayerGUID=%X, Pos =%d, num=%d",varMap,GetGUID(varMap,varPlayer),item.Pos,item.num) );	
				return 0
			end
		end
	end
	
	-- 扣银卡
	if GetSillerMode( varMap, varPlayer) == 1 then
        if GetMoney(varMap, varPlayer, 0) < nCostSiller then
			CostMoney(varMap, varPlayer, 1, nCostSiller, x800160_var_CostMoney_Whys,x800160_var_FileId)
		else
			CostMoney(varMap, varPlayer, 0, nCostSiller, x800160_var_CostMoney_Whys,x800160_var_FileId)
		end
	else
		if GetMoney(varMap, varPlayer, 1) < nCostSiller then
			CostMoney(varMap, varPlayer, 0, nCostSiller, x800160_var_CostMoney_Whys,x800160_var_FileId)
		else
			CostMoney(varMap, varPlayer, 1, nCostSiller, x800160_var_CostMoney_Whys,x800160_var_FileId)
		end
    end

	local nPos,IsInCardBag = CreateCardItem(varMap, varPlayer, ItemID, x800160_var_CreateCardItem_Whys)
	if (nPos >= 0) then
		--NotifyItemInfo( varMap, varPlayer, nPos )
		
		if (varQuickMixFlag == nil) then
			Msg2Player( varMap, varPlayer, "合成完成", 0, 3 )
			Msg2Player( varMap, varPlayer, "合成完成", 0, 2 )
		end
		
		local NewColor, NewCardStart, NewCardName, NewCardId = GetCardInfoByPos(varMap, varPlayer, IsInCardBag, nPos)
		if NewColor < 0 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, -1 )
		elseif (varQuickMixFlag == nil) then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, NewCardId )
		end
		
		if IsTriggerNotisfy == 1 then
			local Name = GetName(varMap, varPlayer)
			LuaAllScenceM2Wrold (varMap, "恭喜" .. Name .. "顺利合成了将星卡 " .. NewCardName, 5, 1)
		end
	else
		Msg2Player( varMap, varPlayer, "合成失败", 0, 3 )
		Msg2Player( varMap, varPlayer, "合成失败", 0, 2 )
		WriteLog( 1, format("x800160_DealMix CreateCardItem err: mainbag varMap=%d,PlayerGUID=%X, Pos =%d, createitemid=%d",varMap,GetGUID(varMap,varPlayer),nPos,ItemID) );
		return 0
	end
	
	return 1
end
