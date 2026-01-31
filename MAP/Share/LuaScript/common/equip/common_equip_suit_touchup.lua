x800140_var_FileId = 800140

x800140_var_QuestName="时装刺绣"

x800140_var_NeedMoney     = 10000;

x800140_var_ICLASS_EQUIP = 10
x800140_var_ICLASS_GEM = 14
x800140_var_ITEM_GEM_SUIT_TOUCH_UP = 15
x800140_var_EQUIP_SUIT = 30

x800140_var_EQUIP_WANFA_SUCC			        = 1
x800140_var_EQUIP_WANFA_FAIL                    = 2
x800140_var_EQUIP_WANFA_ITEM_ISLOCK             = 3
x800140_var_EQUIP_WANFA_NEEDITEM_NOTENOUGH      = 4
x800140_var_EQUIP_WANFA_OTHERITEM_NOTENOUGH     = 5
x800140_var_EQUIP_WANFA_NOT_GEM                 = 6
x800140_var_EQUIP_WANFA_NOT_ALLOW_CHARIOT_GEM   = 7
x800140_var_EQUIP_WANFA_MONEY_NOT_ENOUGH        = 8
x800140_var_EQUIP_WANFA_OUT_OF_SPACE            = 9
x800140_var_EQUIP_WANFA_TYPE_INV                = 10
x800140_var_EQUIP_WANFA_NO_GUILD                = 11
x800140_var_EQUIP_WANFA_PROTECTED               = 12
x800140_var_EQUIP_WANFA_FAIL_NORMAL             = 13


function x800140_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end

function x800140_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800140_var_FileId,x800140_var_QuestName,3);
end

function x800140_ProcItemWanfa( varMap, varPlayer, varWanfaType )

	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	if dataCount ~= 2 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_FAIL )
		return
	end
	
	local nSuitBagPos = wanfaDataTable[1]
	local nGemBagPos = wanfaDataTable[2]
	
	local nSuitTableIndex = GetItemTableIndexByIndex(varMap, varPlayer, nSuitBagPos)
	local nGemTableIndex = GetItemTableIndexByIndex(varMap, varPlayer, nGemBagPos)
	
	WriteLog( 1, format("x800140_ProcItemWanfa param : nSuitBagPos = %d, nGemBagPos = %d, nSuitTableIndex = %d, nGemTableIndex = %d", nSuitBagPos, nGemBagPos, nSuitTableIndex, nGemTableIndex))
	
	-- 绑定
--	if IsItemBind(nSuitBagPos) == 1 or IsItemBind(nGemBagPos) == 1 then
--		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_ITEM_ISLOCK )
--        return
--	end
	
	-- 时装类型
	if GetItemClass(nSuitTableIndex) ~= x800140_var_ICLASS_EQUIP or GetItemType(nSuitTableIndex) ~= x800140_var_EQUIP_SUIT then
	    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_FAIL )
        return
	end
	
	-- 宝石类型
	--if GetItemClass(nGemTableIndex) ~= x800140_var_ICLASS_GEM or GetItemType(nGemTableIndex) ~= x800140_var_ITEM_GEM_SUIT_TOUCH_UP then
	--    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_FAIL )
 --       return
	--end

    local nReqLevel, nReqInherenceLevel, nReqPersionLevel = GetItemReqLevel(varMap, varPlayer, nGemBagPos)
    local nLevel = GetLevel(varMap, varPlayer)
    
    if nReqLevel > nLevel then
    	NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_FAIL )
        return
    end
	
	-- 宝石信息Buff
	local nKey0, nValue0 = GetSuitTouchUpInfo(varMap, varPlayer, nGemTableIndex, 0)
	local nKey1, nValue1 = GetSuitTouchUpInfo(varMap, varPlayer, nGemTableIndex, 1)
	local nKey2, nValue2 = GetSuitTouchUpInfo(varMap, varPlayer, nGemTableIndex, 2)
	local nKey3, nValue3 = GetSuitTouchUpInfo(varMap, varPlayer, nGemTableIndex, 3)
	local nKey4, nValue4 = GetSuitTouchUpInfo(varMap, varPlayer, nGemTableIndex, 4)
	local nKey5, nValue5 = GetSuitTouchUpInfo(varMap, varPlayer, nGemTableIndex, 5)
	local nKey6, nValue6 = GetSuitTouchUpInfo(varMap, varPlayer, nGemTableIndex, 6)
	local nKey7, nValue7 = GetSuitTouchUpInfo(varMap, varPlayer, nGemTableIndex, 7)
	----WriteLog( 1, format("x800140_ProcItemWanfa 宝石信息Buff : nBuff0 = %d, nBuff1 = %d, nBuff2 = %d, nBuff3 = %d", nBuff0, nBuff1, nBuff2, nBuff3))
	
	if nKey0 <= 0 and nKey1 <= 0 and nKey2 <= 0 and nKey3 <= 0 and nKey4 <= 0 and nKey5 <= 0 and nKey6 <= 0 and nKey7 <= 0 then
	    return
	end
	
	-- 清理
    if EraseItem(varMap, varPlayer, nGemBagPos, 0) ~= 1 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_FAIL )
        return
    end
	
	-- 金钱
    if IsEnoughMoney(varMap, varPlayer, x800140_var_NeedMoney) ~= 1 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_MONEY_NOT_ENOUGH )
        return
    end
    
    -- 扣钱
    local tmpRet, type = SpendMoney(varMap, varPlayer, x800140_var_NeedMoney)
    if tmpRet <= 0 then
        NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_FAIL )
        return
    end
    
    -- 刺绣
    ClearSuitTouchupInfo(varMap, varPlayer, nSuitBagPos)
    
    if nKey0 > 0 then
        DoSuitTouchup(varMap, varPlayer, nSuitBagPos, nKey0, nValue0)
    end

    if nKey1 > 0 then
        DoSuitTouchup(varMap, varPlayer, nSuitBagPos, nKey1, nValue1)
    end

    if nKey2 > 0 then
        DoSuitTouchup(varMap, varPlayer, nSuitBagPos, nKey2, nValue2)
    end

    if nKey3 > 0 then
        DoSuitTouchup(varMap, varPlayer, nSuitBagPos, nKey3, nValue3)
    end
        
    if nKey4 > 0 then
        DoSuitTouchup(varMap, varPlayer, nSuitBagPos, nKey4, nValue4)
    end

    if nKey5 > 0 then
        DoSuitTouchup(varMap, varPlayer, nSuitBagPos, nKey5, nValue5)
    end

    if nKey6 > 0 then
        DoSuitTouchup(varMap, varPlayer, nSuitBagPos, nKey6, nValue6)
    end

    if nKey7 > 0 then
        DoSuitTouchup(varMap, varPlayer, nSuitBagPos, nKey7, nValue7)
    end
    
    BindItem(varMap, varPlayer, nSuitBagPos)
    
    NotifyItemInfo( varMap, varPlayer, nSuitBagPos )
    
    NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800140_var_EQUIP_WANFA_SUCC )

end
