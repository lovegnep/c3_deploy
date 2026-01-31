x800161_var_FileId = 800161

x800161_var_QuestName="将星卡升级"

x800161_var_CostMoney_Whys = 505			-- 扣钱原因
x800161_var_CreateCardItem_Whys = 252		-- 创建卡片原因

function x800161_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800161_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800161_var_FileId,x800161_var_QuestName,3);
end

function x800161_ProcItemWanfa( varMap, varPlayer, varWanfaType )

	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	--WriteLog(1, format("x800161_ProcItemWanfa: wanfaDataTable=%d", dataCount))

	if dataCount ~= 6 then
		WriteLog( 1, format("x800161_ProcItemWanfa dataCount num err: varMap=%d,PlayerGUID=%X,dataCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount) );
		return
	end
	
	WriteLog( 1, format("x800161_ProcItemWanfa: varMap=%d,PlayerGUID=%X,dataCount=%d,d1=%d,d2=%d,d3=%d,d4=%d,d5=%d,d6=%d",varMap,GetGUID(varMap,varPlayer),dataCount,wanfaDataTable[1],wanfaDataTable[2],wanfaDataTable[3],wanfaDataTable[4],wanfaDataTable[5],wanfaDataTable[6]) );
	--for i = 1,6 do
	--	print(wanfaDataTable[i])
	--end
	
	local MainCardIsCardBag = floor(wanfaDataTable[1] / 1000)
	local MainCardPos = mod(wanfaDataTable[1] , 1000)
	local IsUseSafeMoney = wanfaDataTable[2]
	local ItemTab = {}

	for i = 3, dataCount do
		if(wanfaDataTable[i] ~= nil and wanfaDataTable[i] ~= -1) then
			ItemTab[i] = {}
			ItemTab[i].num = floor(wanfaDataTable[i] / 100000)
			ItemTab[i].isInCardBag = floor(mod(wanfaDataTable[i],100000) / 1000)
			ItemTab[i].Pos = mod(wanfaDataTable[i], 1000)
		end
	end
	
	local MainCardColor, MainCardStart, MainCardName, MainCardId = GetCardInfoByPos(varMap, varPlayer, MainCardIsCardBag, MainCardPos)
	if MainCardColor < 0 then
		Msg2Player( varMap, varPlayer, "合成失败，放入道具不是将星卡类型", 0, 3 )
		Msg2Player( varMap, varPlayer, "合成失败，放入道具不是将星卡类型", 0, 2 )
	end
	
	local OtherCardStartCount = 0;
	-- 检查卡片颜色等级
	local KaiPaiNum = 0
	for idx, item in ItemTab do
		local color,start = GetCardInfoByPos(varMap, varPlayer, item.isInCardBag, item.Pos)
		if MainCardColor ~= color or color < 0 then
			Msg2Player( varMap, varPlayer, "升星失败，放入将星卡的颜色等级不相同", 0, 3 )
			Msg2Player( varMap, varPlayer, "升星失败，放入将星卡的颜色等级不相同", 0, 2 )
			return
		end
		
		OtherCardStartCount = OtherCardStartCount + start * item.num
		KaiPaiNum = KaiPaiNum + item.num
	end
	
	--print(KaiPaiNum)
	-- 检查卡牌数量
	if (KaiPaiNum ~= 4) then
		Msg2Player( varMap, varPlayer, "请放入将星卡", 0, 3 )
		Msg2Player( varMap, varPlayer, "请放入将星卡", 0, 2 )
		return
	end
	
	-- 读表获取升级所需
	local Rate, Money, nCostSiller = GetCardLvUpInfo(varMap, varPlayer, MainCardColor, MainCardStart+1, OtherCardStartCount)
	if Rate == -1 then
		Msg2Player( varMap, varPlayer, "升星失败", 0, 3 )
		Msg2Player( varMap, varPlayer, "升星失败", 0, 2 )
		WriteLog( 1, format("x800161_ProcItemWanfa GetCardLvUpInfo err: varMap=%d,PlayerGUID=%X,MainCardColor=%d, MainCardStart+1=%d, OtherCardStartCount=%d",varMap,GetGUID(varMap,varPlayer),MainCardColor, MainCardStart+1, OtherCardStartCount) );	
		return
	end

	-- 金卡消耗检测
    if IsUseSafeMoney > 0 then
		if GetMoney(varMap, varPlayer, 3) < Money and GetMoney(varMap, varPlayer, 2) < Money  then
			Msg2Player( varMap, varPlayer, "金卡不足", 0, 3 )
			Msg2Player( varMap, varPlayer, "金卡不足", 0, 2 )
			return
		end
    end
	
	-- 银卡消耗检测
	if GetMoney(varMap, varPlayer, 1) < nCostSiller and GetMoney(varMap, varPlayer, 0) < nCostSiller  then
		Msg2Player( varMap, varPlayer, "银卡不足", 0, 3 )
		Msg2Player( varMap, varPlayer, "银卡不足", 0, 2 )
		return
	end
    
    -- 需要物品数量
	for idx, item in ItemTab do
		if item.isInCardBag ~= 1 then
			-- 背包中的卡牌
			if GetItemCountInBagPos(varMap, varPlayer, item.Pos) < item.num then
				Msg2Player( varMap, varPlayer, "将星卡数量不足", 0, 3 )
				Msg2Player( varMap, varPlayer, "将星卡数量不足", 0, 2 )
				return
			end
		else
			-- 卡牌包中的卡牌
			if GetItemCountInBagPos(varMap, varPlayer, item.Pos, 1) < item.num then
				Msg2Player( varMap, varPlayer, "将星卡数量不足", 0, 3 )
				Msg2Player( varMap, varPlayer, "将星卡数量不足", 0, 2 )
				return
			end
		end
	end
    
    -- 背包剩余空间
    if GetBagSpace(varMap, varPlayer) <= 0 and GetBagSpace(varMap,varPlayer, 1) <= 0 then
    	Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 3 )
		Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 2 )
        return
    end
    
    -- 扣金卡
	if IsUseSafeMoney > 0 then
		--CostMoney(varMap, varPlayer, 3, Money, x800161_var_CostMoney_Whys)
		
		if GetGoldMode( varMap, varPlayer) == 1 then
            if GetMoney(varMap, varPlayer, 2) < Money then
				CostMoney(varMap, varPlayer, 3, Money, x800161_var_CostMoney_Whys,x800161_var_FileId)
			else
				CostMoney(varMap, varPlayer, 2, Money, x800161_var_CostMoney_Whys,x800161_var_FileId)
            end
        else
            if GetMoney(varMap, varPlayer, 3) < Money then
				CostMoney(varMap, varPlayer, 2, Money, x800161_var_CostMoney_Whys,x800161_var_FileId)
			else
				CostMoney(varMap, varPlayer, 3, Money, x800161_var_CostMoney_Whys,x800161_var_FileId)
            end
        end
	end

	-- 扣银卡
	if GetSillerMode( varMap, varPlayer) == 1 then
        if GetMoney(varMap, varPlayer, 0) < nCostSiller then
			CostMoney(varMap, varPlayer, 1, nCostSiller, x800161_var_CostMoney_Whys,x800161_var_FileId)
		else
			CostMoney(varMap, varPlayer, 0, nCostSiller, x800161_var_CostMoney_Whys,x800161_var_FileId)
		end
	else
		if GetMoney(varMap, varPlayer, 1) < nCostSiller then
			CostMoney(varMap, varPlayer, 0, nCostSiller, x800161_var_CostMoney_Whys,x800161_var_FileId)
		else
			CostMoney(varMap, varPlayer, 1, nCostSiller, x800161_var_CostMoney_Whys,x800161_var_FileId)
		end
    end

	-- 成功计算
	local IsSuccess = 0;
	local lrandom = random(1, 100)
	if Rate >= lrandom then
		IsSuccess = 1
	end

	-- 删除副卡
	for idx, item in ItemTab do
		if item.isInCardBag ~= 1 then
			-- 背包中的卡牌
			if 1 ~= DelItemByIndexInBag( varMap, varPlayer, item.Pos, item.num) then
				WriteLog( 1, format("x800161_ProcItemWanfa DelItemByIndexInBag err: varMap=%d,PlayerGUID=%X, MainBag cardpos=%d, itemnum=%d",varMap,GetGUID(varMap,varPlayer),item.Pos,item.num) );	
				return
			end
		else
			-- 卡牌包中的开牌
			if 1 ~= DelItemByIndexInBag( varMap, varPlayer, item.Pos, item.num, 63, 1) then
				WriteLog( 1, format("x800161_ProcItemWanfa DelItemByIndexInBag err: varMap=%d,PlayerGUID=%X, MainBag cardpos=%d, itemnum=%d",varMap,GetGUID(varMap,varPlayer),item.Pos,item.num) );	
				return
			end
		end
	end
	
	-- 判断是否删除主卡
	if IsSuccess == 0 and IsUseSafeMoney == 1 then
		-- 这里是 失败后且 没有保险的 不做删除主卡的处理
	else
		-- 成功后 或 失败且没有买保险的
		if MainCardIsCardBag ~= 1 then
			-- 背包中的卡牌
			if 1 ~= DelItemByIndexInBag(varMap, varPlayer, MainCardPos, 1) then
				WriteLog( 1, format("x800161_ProcItemWanfa DelItemByIndexInBag err: varMap=%d,PlayerGUID=%X, MainBag cardpos=%d",varMap,GetGUID(varMap,varPlayer),MainCardPos) );	
				return
			end
		else
			-- 卡牌包中的开牌
			if 1 ~= DelItemByIndexInBag(varMap, varPlayer, MainCardPos, 1, 63, 1) then
				WriteLog( 1, format("x800161_ProcItemWanfa DelItemByIndexInBag err: varMap=%d,PlayerGUID=%X, MainBag cardpos=%d",varMap,GetGUID(varMap,varPlayer),MainCardPos) );	
				return
			end
		end
	end
	
	-- 失败后通知
	if IsSuccess == 0 then
		Msg2Player( varMap, varPlayer, "升星失败", 0, 3 )
		Msg2Player( varMap, varPlayer, "升星失败", 0, 2 )
		local nMainID = -1
		if (IsUseSafeMoney == 1) then
			nMainID = MainCardId
		end
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, nMainID )
		return
	end
    
    local nPos, IsInCardBag = CreateCardItem(varMap, varPlayer, MainCardId + 1, x800161_var_CreateCardItem_Whys)
	if (nPos >= 0) then
		NotifyItemInfo( varMap, varPlayer, nPos )
		Msg2Player( varMap, varPlayer, "升星完成", 0, 3 )
		Msg2Player( varMap, varPlayer, "升星完成", 0, 2 )
		
		local NewColor, NewCardStart, NewCardName, NewCardId = GetCardInfoByPos(varMap, varPlayer, IsInCardBag, nPos)
		if NewColor < 0 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, -1 )
		else
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, NewCardId )
		end
		if NewCardStart ==5 then 
			local Name = GetName(varMap, varPlayer)
			LuaAllScenceM2Wrold (varMap, "恭喜" .. Name .. "顺利将将星卡 " ..NewCardName.." 升级到五星", 5, 1)
		end
	else
		Msg2Player( varMap, varPlayer, "升星失败", 0, 3 )
		Msg2Player( varMap, varPlayer, "升星失败", 0, 2 )
		WriteLog( 1, format("x800161_ProcItemWanfa CreateCardItemErr varMap=%d,PlayerGUID=%X, cardresid=%d, npos=%d",varMap,GetGUID(varMap,varPlayer),MainCardId + 1,nPos) );			
	end

end
