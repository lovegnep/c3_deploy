x800142_var_FileId = 800142

x800142_var_QuestName="冥装升级"

x800142_var_EQUIP_WANFA_SUCC			        = 1
x800142_var_EQUIP_WANFA_FAIL                    = 2
x800142_var_EQUIP_WANFA_ITEM_ISLOCK             = 3
x800142_var_EQUIP_WANFA_NEEDITEM_NOTENOUGH      = 4
x800142_var_EQUIP_WANFA_OTHERITEM_NOTENOUGH     = 5
x800142_var_EQUIP_WANFA_NOT_GEM                 = 6
x800142_var_EQUIP_WANFA_NOT_ALLOW_CHARIOT_GEM   = 7
x800142_var_EQUIP_WANFA_MONEY_NOT_ENOUGH        = 8
x800142_var_EQUIP_WANFA_OUT_OF_SPACE            = 9
x800142_var_EQUIP_WANFA_TYPE_INV                = 10
x800142_var_EQUIP_WANFA_NO_GUILD                = 11
x800142_var_EQUIP_WANFA_PROTECTED               = 12
x800142_var_EQUIP_WANFA_FAIL_NORMAL             = 13

function x800142_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800142_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800142_var_FileId,x800142_var_QuestName,3);
end

function x800142_ProcItemWanfa( varMap, varPlayer, varWanfaType )
        
    local nAddLevel1 = 10    -- 装备等级
    local nAddLevel2 = 10    -- 需求天赋等级
    local nAddLevel3 = 10    -- 需求玩家等级

	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	WriteLog(1, format("x800142_ProcItemWanfa: wanfaDataTable=%d", dataCount))
	
	if dataCount ~= 1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_FAIL )
		return
	end
	
	local nSrcBagPos = wanfaDataTable[1]
	
	if GetGemEmbededCount(varMap, varPlayer, nSrcBagPos) > 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，该装备有宝石镶嵌无法进行升级！", 0, 3)
		return
	end
	
	--2011-07-26 by rj 增加生成装备------------------------------------------------------------------------------
	local bLevelPass1 = 1
	local bLevelPass2 = 1
	local nPlayerLevel = GetLevel(varMap, varPlayer)
	local equipLevel = GetEquipNeedLevelByBagPos(varMap, varPlayer, nSrcBagPos)
	
	if equipLevel ~= -1 and nPlayerLevel < equipLevel + nAddLevel1 then
		bLevelPass1 = 0
	end

	if GetInherenceLevel(varMap, varPlayer) < 60 then
		bLevelPass2 = 0
	end

	if equipLevel ~= -1 and nPlayerLevel < equipLevel - 10 + nAddLevel3 then
		bLevelPass2 = 0
	end

	if bLevelPass1 == 0 and bLevelPass2 == 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，您现在的等级或天赋无法装备升级后的玄级装备，无法升级！", 0, 3)
		return
	end	
	-----------------------------------------------------------------------------------------------------------
	
	WriteLog(1, format("x800142_ProcItemWanfa: nSrcBagPos=%d", nSrcBagPos))
	
	local HellEquipLevelupInfo = GetHellEquipLevelupInfo(varMap, varPlayer, nSrcBagPos)
	dataCount = getn( HellEquipLevelupInfo )
	
	WriteLog(1, format("x800142_ProcItemWanfa: HellEquipLevelupInfo=%d", dataCount))
	
	if dataCount ~= 5 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_FAIL )
		return
	end
	
	local bType         = HellEquipLevelupInfo[1]
    local nNewIndex     = HellEquipLevelupInfo[2]
    local nNeedIndex    = HellEquipLevelupInfo[3]
    local nNeedCount    = HellEquipLevelupInfo[4]
    local nMoney        = HellEquipLevelupInfo[5]
    
    WriteLog(1, "x800142_ProcItemWanfa: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
	
	if bType == -1 or nNewIndex == -1 or nNeedIndex == -1 or nNeedCount == -1 or nMoney == -1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_FAIL )
		return
	end
	
	-- 金钱
    if IsEnoughMoney(varMap, varPlayer, nMoney) ~= 1 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_MONEY_NOT_ENOUGH )
        Msg2Player( varMap, varPlayer, "金钱不足", 0, 3 )
        return
    end
    
    -- 需要物品数量
    if GetItemCount(varMap, varPlayer, nNeedIndex) < nNeedCount then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_MONEY_NOT_ENOUGH )
        return
    end
    
    -- 背包剩余空间
    if GetBagSpace(varMap, varPlayer) <= 0 then
    	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_FAIL )
    	Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 3 )
        return
    end
    
    -- 扣钱
    local tmpRet, type = SpendMoney(varMap, varPlayer, nMoney)
    if tmpRet <= 0 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_FAIL )
        Msg2Player( varMap, varPlayer, "扣钱失败", 0, 3 )
        return
    end
    
    if 0 == DelItem(varMap, varPlayer, nNeedIndex, nNeedCount) then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_FAIL )
        return
    end  	

	local nDesBagPos = DoHellEquipLevelup(varMap, varPlayer, nSrcBagPos, nAddLevel1, nAddLevel2, nAddLevel3 )
		
	WriteLog(1, format(" DoHellEquipLevelup:%d", nDesBagPos))
		
	if nDesBagPos < 0 then
	    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_FAIL )
	    Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 3 )
        return
	end

	BindItem(varMap, varPlayer, nDesBagPos)
   
    NotifyItemInfo( varMap, varPlayer, nDesBagPos )
	
	-- 清理
    --if EraseItem(varMap, varPlayer, nSrcBagPos, 0) ~= 1 then
    --    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_FAIL )
    --    return
    --end
    
    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800142_var_EQUIP_WANFA_SUCC )

end
