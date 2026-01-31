
x800137_var_FileId = 800137

x800137_var_QuestName="战车宝石合成"

x800137_var_EQUIP_WANFA_SUCC			        = 1
x800137_var_EQUIP_WANFA_FAIL                    = 2
x800137_var_EQUIP_WANFA_ITEM_ISLOCK             = 3
x800137_var_EQUIP_WANFA_NEEDITEM_NOTENOUGH      = 4
x800137_var_EQUIP_WANFA_OTHERITEM_NOTENOUGH     = 5
x800137_var_EQUIP_WANFA_NOT_GEM                 = 6
x800137_var_EQUIP_WANFA_NOT_ALLOW_CHARIOT_GEM   = 7
x800137_var_EQUIP_WANFA_MONEY_NOT_ENOUGH        = 8
x800137_var_EQUIP_WANFA_OUT_OF_SPACE            = 9
x800137_var_EQUIP_WANFA_TYPE_INV                = 10
x800137_var_EQUIP_WANFA_NO_GUILD                = 11
x800137_var_EQUIP_WANFA_PROTECTED               = 12
x800137_var_EQUIP_WANFA_FAIL_NORMAL             = 13

x800137_var_ITEM_CHARIOT_GEM_TYPE_BEGIN         = 10
x800137_var_ITEM_CHARIOT_GEM_TYPE_END		    = 20
	
function x800137_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800137_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800137_var_FileId,x800137_var_QuestName,3);
end

function x800137_ProcItemWanfa( varMap, varPlayer, varWanfaType )

    WriteLog( 1, format("x800137_ProcItemWanfa(%d, %d, %d)", varMap, varPlayer,varWanfaType))
    
	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	if dataCount ~= 2 then
		WriteLog( 1, format("x800137_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount))
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_FAIL )
		return
	end
	
	local nGemIndex = wanfaDataTable[1]
	local nGemReworkType = wanfaDataTable[2]
	
	local nIndex            = 0
	local nNeedNum          = 0
	local nOtherNeedItem    = 0
	local nOtherNeedNum     = 0
	local nNeedMoney        = 0
	local nNewItem          = 0
	local nNewItemNum       = 0
	
	local varRet            = 0

    -- 获取合成秘方
    nIndex, nNeedNum, nOtherNeedItem, nOtherNeedNum, nNeedMoney, nNewItem, nNewItemNum = GetChariotGemComposeInfo(varMap, varPlayer, nGemIndex, nGemReworkType)
    WriteLog( 1, format("x800137_ProcItemWanfa param : nGemIndex = %d, nIndex = %d, nNeedNum = %d, nOtherNeedItem = %d, nOtherNeedNum = %d, nNeedMoney = %d, nNewItem = %d, nNewItemNum = %d", nGemIndex, nIndex, nNeedNum, nOtherNeedItem, nOtherNeedNum, nNeedMoney, nNewItem, nNewItemNum))
    
    if nIndex == 0 or nNeedNum == 0 or nOtherNeedItem == 0 or nOtherNeedNum == 0 or nNeedMoney == 0 or nNewItem == 0 or nNewItemNum == 0 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_FAIL )
        return
    end
    
    -- 宝石类型
    if GetItemType(nGemIndex) < x800137_var_ITEM_CHARIOT_GEM_TYPE_BEGIN or GetItemType(nGemIndex) > x800137_var_ITEM_CHARIOT_GEM_TYPE_END or GetItemType(nNewItem) < x800137_var_ITEM_CHARIOT_GEM_TYPE_BEGIN or GetItemType(nNewItem) > x800137_var_ITEM_CHARIOT_GEM_TYPE_END then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_FAIL )
        return
    end

    -- 原料数量
    if GetItemCountInBag(varMap, varPlayer, nGemIndex) < nNeedNum or GetItemCountInBag(varMap, varPlayer, nOtherNeedItem) < nOtherNeedNum then
        Msg2Player( varMap, varPlayer, "合成材料不足", 8, 3)
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_NEEDITEM_NOTENOUGH )
        return
    end
    
    -- 材料一
    StartItemTask(varMap)
    ItemAppend( varMap, nGemIndex, nNeedNum )
    varRet = StopItemTask(varMap, varPlayer)
    varRet = CanEraseItemList(varMap, varPlayer)
    if varRet <= 0 then
        Msg2Player( varMap, varPlayer, "合成材料不足", 8, 3)
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_FAIL )
        return
    end
    
    -- 材料二
    StartItemTask(varMap)
    ItemAppend( varMap, nOtherNeedItem, nOtherNeedNum )
    varRet = StopItemTask(varMap, varPlayer)
    varRet = CanEraseItemList(varMap, varPlayer)
    if varRet <= 0 then
        Msg2Player( varMap, varPlayer, "合成材料不足", 8, 3)
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_FAIL )
        return
    end
    
    if GetBagSpace( varMap, varPlayer) < nNewItemNum then
        Msg2Player( varMap, varPlayer, "背包空间不足", 8, 3)
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_OUT_OF_SPACE )
        return
    end
    
    -- 清理
    if DelItemByIDInBag(varMap, varPlayer, nGemIndex, nNeedNum) ~= 1 or DelItemByIDInBag(varMap, varPlayer, nOtherNeedItem, nOtherNeedNum) ~= 1 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_FAIL )
        return
    end
    
    -- 金钱
    if IsEnoughMoney(varMap, varPlayer, nNeedMoney) ~= 1 then
        Msg2Player( varMap, varPlayer, "金钱不足", 8, 3)
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_MONEY_NOT_ENOUGH )
        return
    end
    
    -- 扣钱
    local tmpRet, type = SpendMoney(varMap, varPlayer, nNeedMoney)
    if tmpRet <= 0 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_FAIL )
        return
    end
    
    -- 背包空间
    StartItemTask(varMap)
    if GetSillerMode(varMap, varPlayer) == 1 then
        ItemAppend( varMap, nNewItem, nNewItemNum )
    else
        ItemAppendBind( varMap, nNewItem, nNewItemNum )
    end
    
    local varRet = StopItemTask(varMap, varPlayer)
    if varRet <= 0 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_OUT_OF_SPACE )
        return
    end
    
    -- 合成
    DeliverItemListSendToPlayer(varMap, varPlayer)
    
    Msg2Player( varMap, varPlayer, "战车宝石合成完成", 8, 3)
    
    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800137_var_EQUIP_WANFA_SUCC )
    
end
