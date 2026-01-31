--DECLARE_QUEST_INFO_START--
--圣诞树 商店
x930204_var_FileId                  = 930204
x930204_var_QuestId                 = 11105

x930204_var_QuestKind               = 1
x930204_var_LevelLess               = 50

x930204_var_QuestName               = "万能坐骑碎片商店"
x930204_var_QuestTarget             = "从下列物品中选择一件购买"
x930204_var_QuestInfo               = "\t欢迎光临万能坐骑碎片商店！这里有各种坐骑等您选购。"
x930204_var_ContinueInfo            = ""
x930204_var_QuestCompleted          = ""
x930204_var_QuestHelp               = "选择心仪的物品进行购买"

x930204_var_strQuestAbandon         = "您取消了万能坐骑碎片商城购买"

x930204_var_ExpBonus                = 0
x930204_var_BonusItem               = {}
x930204_var_BonusMoney1             = 0
x930204_var_BonusMoney2             = 0
x930204_var_BonusMoney3             = 0
x930204_var_BonusMoney4             = 0
x930204_var_BonusMoney5             = 0
x930204_var_BonusMoney6             = 0
x930204_var_BonusChoiceItem         = {}

--DECLARE_QUEST_INFO_STOP--

-- 任务参数索引
x930204_MP_ISCOMPLETE               = 7

-- 数据存储位置定义
-- 复用2011年已过期活动的MD block (119-121)
-- 原MD: MD_2011CJBC_*, MD_2011CJHD_*, MD_2011YXHD_* 等


-- 内存缓存
x930204_var_PlayerShopItems         = {}    -- 玩家当前商品列表 (GUID -> {item1, item2, ...})
x930204_var_PlayerNpc               = {}    -- 玩家当前NPC (GUID -> npc)

x930204_var_ItemPool = {
    {varItem = 12050231,horse=1,needid = 12930106,neednum=10, varName = "成年凶豹",num=1, },
    {varItem = 12050232,horse=1,needid = 12930106,neednum=10, varName = "成年奔羚",num=1,  },
    {varItem = 12050233,horse=1,needid = 12930106,neednum=10, varName = "成年天鹅",num=1,  },
    {varItem = 12050234,horse=1,needid = 12930106,neednum=10, varName = "成年河马",num=1,  },

    {varItem = 12050236,horse=1,needid = 12930106,neednum=10, varName = "成年烈狮",num=1,  },
    {varItem = 12050237,horse=1,needid = 12930106,neednum=10, varName = "成年驯鹿",num=1,  },
    {varItem = 12050238,horse=1,needid = 12930106,neednum=10, varName = "成年瑞鹤",num=1,  },
    {varItem = 12050239,horse=1,needid = 12930106,neednum=10, varName = "成年铁犀",num=1,  },

    {varItem = 12050243,horse=1,needid = 12930106,neednum=10, varName = "成年剑齿虎",num=1,  },
    {varItem = 12050244,horse=1,needid = 12930106,neednum=10, varName = "成年蛮牛",num=1,  },
    {varItem = 12050245,horse=1,needid = 12930106,neednum=10, varName = "成年凤凰",num=1,  },
    {varItem = 12050246,horse=1,needid = 12930106,neednum=10, varName = "成年猛犸",num=1,  },

    {varItem = 12050252,horse=1,needid = 12930106,neednum=10, varName = "成年赤磷奎龙",num=1,  },
    {varItem = 12050253,horse=1,needid = 12930106,neednum=10, varName = "成年蛟尾虬龙",num=1,  },
    {varItem = 12050254,horse=1,needid = 12930106,neednum=10, varName = "成年钢髯应龙",num=1,  },
    {varItem = 12050255,horse=1,needid = 12930106,neednum=10, varName = "成年钢齿暴龙",num=1,  },

    {varItem = 12050396,horse=1,needid = 12930106,neednum=10, varName = "成年赤鳞饕餮",num=1,  },
    {varItem = 12050397,horse=1,needid = 12930106,neednum=10, varName = "成年金眼狻猊",num=1,  },
    {varItem = 12050398,horse=1,needid = 12930106,neednum=10, varName = "成年九色毕方",num=1,  },
    {varItem = 12050399,horse=1,needid = 12930106,neednum=10, varName = "成年银脊", num=1, },

}
x930204_var_Selectinfo = {}


-- ============================================================================
-- 工具函数
-- ============================================================================

-- 获取当前日期(年内天数)
function x930204_GetCurrentDay()
    local nYear, nMonth, nDay = GetYearMonthDay()
    return nDay + nMonth * 31
end

-- 根据物品ID找到商品池中的索引
function x930204_FindItemPoolIndex(itemId)
    for i, item in x930204_var_ItemPool do
        if item.varItem == itemId then
            return i
        end
    end
    return nil
end

-- 根据物品ID找到玩家商品列表中的槽位
function x930204_FindPlayerSlotByItemId(items, itemId)
    for i = 1, x930204_var_ItemSlotCount+x930204_var_ItemSlotNeedLock do
        local poolIndex = items[i]
        if poolIndex and poolIndex > 0 then
            local itemData = x930204_var_ItemPool[poolIndex]
            if itemData and itemData.varItem == itemId then
                return i
            end
        end
    end
    return nil
end

-- 格式化价格显示
function x930204_FormatPrice(price)
    local liang = floor(price / 1000)
    local wen = mod(price, 1000)
    if wen > 0 then
        return format("%d两%d文", liang, wen)
    else
        return format("%d两", liang)
    end
end

-- ============================================================================
-- NPC对话入口函数
-- ============================================================================

-- 枚举事件（显示NPC选项按钮）
function x930204_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    TalkAppendButton(varMap, x930204_var_FileId, x930204_var_QuestName, 3, -1)
end

-- 事件入口（玩家点击后的处理）
function x930204_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, seleteId)
    local nLevel = GetLevel(varMap, varPlayer)
    if nLevel < x930204_var_LevelLess then
        Msg2Player(varMap, varPlayer, format("人物等级不足%d",x930204_var_LevelLess), 8, 2)
        Msg2Player(varMap, varPlayer, format("人物等级不足%d",x930204_var_LevelLess), 8, 3)
        return
    end


    
    local guid = GetGUID(varMap, varPlayer)

    
    -- 主菜单
    if seleteId == -1 then
        -- 检查背包空间
        if GetBagSpace(varMap, varPlayer) < 1 then
            Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 2)
            Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 3)
            return
        end

        -- 删除可能存在的旧任务
        if IsHaveQuestNM(varMap, varPlayer, x930204_var_QuestId) > 0 then
            DelQuest(varMap, varPlayer, x930204_var_QuestId)
        end

        -- 创建伪任务
        AddQuestNM(varMap, varPlayer, x930204_var_QuestId)
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930204_var_QuestId)
        SetQuestParam(varMap, varPlayer, varQuestIdx, x930204_MP_ISCOMPLETE, 1)

        -- 保存NPC引用
        x930204_var_PlayerNpc[guid] = varTalknpc

        -- 显示商品选择界面
        x930204_DeliverTalkInfo(varMap, varPlayer, varTalknpc)
        return

    end
end

-- 显示商品选择对话框（使用AddQuestRadioItemBonus）
function x930204_DeliverTalkInfo(varMap, varPlayer, varTalknpc)
    local guid = GetGUID(varMap, varPlayer)


    StartTalkTask(varMap)
    
    TalkAppendString(varMap, "#Y" .. x930204_var_QuestName .. "\n" .. x930204_var_QuestInfo)

    -- 使用AddQuestRadioItemBonus添加可选商品
    for k, item in x930204_var_ItemPool do
        AddQuestRadioItemBonus(varMap, item.varItem, item.num)
    end

    StopTalkTask()
    DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x930204_var_FileId, x930204_var_QuestId)
end

-- 接受检查
function x930204_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
    return 1
end

-- 接受处理
function x930204_ProcAccept(varMap, varPlayer,varTalknpc)
    local varRadioSelected = x930204_var_Selectinfo[GetGUID(varMap, varPlayer)]
    local guid = GetGUID(varMap, varPlayer)


    -- varRadioSelected 是玩家选择的物品ID
    local selectedItemId = varRadioSelected

    -- 找到对应的商品池索引
    local poolIndex = x930204_FindItemPoolIndex(selectedItemId)
    if not poolIndex then
        DelQuest(varMap, varPlayer, x930204_var_QuestId)
        Msg2Player(varMap, varPlayer, "所选物品不存在！", 8, 2)
        return
    end


    local itemData = x930204_var_ItemPool[poolIndex]

    -- 检查背包空间
    if GetBagSpace(varMap, varPlayer) < 1 then
        DelQuest(varMap, varPlayer, x930204_var_QuestId)
        Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 2)
        Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 3)
        return
    end

    if itemData.needid > 100000 then
        --说明需要具体的道具
        if DelItem(varMap,varPlayer,itemData.needid,itemData.neednum) ~= 1 then
            Msg2Player(varMap, varPlayer,format("扣除道具@item_%d %d个失败",itemData.needid, itemData.neednum),8,2)
            Msg2Player(varMap, varPlayer,format("扣除道具@item_%d %d个失败",itemData.needid, itemData.neednum),8,3)
            return 0
        end

    end


    -- 发放物品
    StartItemTask(varMap)
    ItemAppendBind(varMap, itemData.varItem, 1)

    local varRet = StopItemTask(varMap, varPlayer)
    if varRet > 0 then
        DeliverItemListSendToPlayer(varMap, varPlayer)
        Msg2Player(varMap, varPlayer, format("购买成功！获得@item_%d", itemData.varItem), 8, 2)
        Msg2Player(varMap, varPlayer, format("购买成功！获得@item_%d", itemData.varItem), 8, 3)

        GamePlayScriptLog(varMap, varPlayer, 930204)
    else
        -- 退还现金
        Msg2Player(varMap, varPlayer, "物品购买失败！", 8, 2)
        Msg2Player(varMap, varPlayer, "物品购买失败！", 8, 3)
        return
    end

    -- 删除伪任务
    DelQuest(varMap, varPlayer, x930204_var_QuestId)

    x930204_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, -1)
end
function x930204_ProcQuestAttach(varMap, varPlayer)
end

function x930187_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


end


-- 检查提交
function x930204_CheckSubmit(varMap, varPlayer, varTalknpc)
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930204_var_QuestId)
    if varHaveQuest > 0 then
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930204_var_QuestId)
        return GetQuestParam(varMap, varPlayer, varQuestIdx, x930204_MP_ISCOMPLETE)
    end
    return 0
end




-- 任务提交处理（核心：处理玩家选择的商品）
function x930204_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
    x930204_var_Selectinfo[GetGUID(varMap, varPlayer)] = varRadioSelected
    local guid = GetGUID(varMap, varPlayer)

    
    -- varRadioSelected 是玩家选择的物品ID
    local selectedItemId = varRadioSelected

    -- 找到对应的商品池索引
    local poolIndex = x930204_FindItemPoolIndex(selectedItemId)
    if not poolIndex then
        DelQuest(varMap, varPlayer, x930204_var_QuestId)
        Msg2Player(varMap, varPlayer, "所选物品不存在！", 8, 2)
        return
    end

    
    local itemData = x930204_var_ItemPool[poolIndex]

    StartTalkTask(varMap)
    if itemData.needid > 100000 then
        --需要道具兑换
        TalkAppendString(varMap,"#Y"..format("【购买】#R@item_%d#W需要道具#G@item_%d#W#R%d#W个",itemData.varItem,itemData.needid,itemData.neednum))
    end
    AddQuestItemBonus(varMap, itemData.varItem, itemData.num)
    StopTalkTask()
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930204_var_FileId, -1);

end

-- 任务放弃
function x930204_ProcQuestAbandon(varMap, varPlayer, varQuest)
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930204_var_QuestId)
    if varHaveQuest > 0 then
        DelQuest(varMap, varPlayer, x930204_var_QuestId)
        Msg2Player(varMap, varPlayer, x930204_var_strQuestAbandon, 8, 2)
    end
end

-- ============================================================================
-- 其他必要的空函数
-- ============================================================================

function x930204_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x930204_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end

function x930204_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end

function x930204_ProcContinue(varMap, varPlayer, varTalknpc)
end
