--DECLARE_QUEST_INFO_START--
--圣诞树 商店
x930205_var_FileId                  = 930205
x930205_var_QuestId                 = 11106

x930205_var_QuestKind               = 1
x930205_var_LevelLess               = 50

x930205_var_QuestName               = "兑换商店"
x930205_var_QuestTarget             = "从下列物品中选择一件购买"
x930205_var_QuestInfo               = "\t欢迎光临兑换商店！这里有各种珍贵材料等您选购。"
x930205_var_ContinueInfo            = ""
x930205_var_QuestCompleted          = ""
x930205_var_QuestHelp               = "选择心仪的物品进行购买"

x930205_var_strQuestAbandon         = "您取消了兑换商城购买"

x930205_var_ExpBonus                = 0
x930205_var_BonusItem               = {}
x930205_var_BonusMoney1             = 0
x930205_var_BonusMoney2             = 0
x930205_var_BonusMoney3             = 0
x930205_var_BonusMoney4             = 0
x930205_var_BonusMoney5             = 0
x930205_var_BonusMoney6             = 0
x930205_var_BonusChoiceItem         = {}

--DECLARE_QUEST_INFO_STOP--

-- 任务参数索引
x930205_MP_ISCOMPLETE               = 7

-- 数据存储位置定义
-- 复用2011年已过期活动的MD block (119-121)
-- 原MD: MD_2011CJBC_*, MD_2011CJHD_*, MD_2011YXHD_* 等


-- 内存缓存
x930205_var_PlayerShopItems         = {}    -- 玩家当前商品列表 (GUID -> {item1, item2, ...})
x930205_var_PlayerNpc               = {}    -- 玩家当前NPC (GUID -> npc)


x930205_var_Selectinfo = {}
x930205_var_objs = {
    {index=1,name="包治百病",items={
        {index = 1 ,id=19010011, name="雕翎锦线包【36格】", num=1, need={
            {name="金丝锦绣包", id=19010033, num=2},
            {id=11000816,name="完整的素色绸包图样",num=1}
        }},
        {index = 2 ,id=19010034, name="巨无霸【36格】",  num=1, need={
            {name="金丝锦绣包", id=19010033, num=2},
            {id=11000816,name="完整的素色绸包图样",num=1}
        }},
        {index = 3 ,id=19010033, name="金丝锦绣包【35格】",  num=1, need={
            {name="银边锦绣包", id=19010032, num=2},
            {id=11000815,name="完整的绒面皮包图样",num=1}
        }},
        {index = 4 ,id=19010032, name="银边锦绣包【34格】",  num=1, need={
            {name="星纹缎包", id=19010031, num=2},
            {id=11000814,name="完整的翻毛皮包图样",num=1}
        }},
        {index = 5 ,id=19010031, name="星纹缎包【33格】",  num=1, need={
            {name="特染缎包", id=19010030, num=2},
            {id=11000813,name="完整的硝制皮包图样",num=1}
        }},
        {index = 6 ,id=19010030, name="特染缎包【32格】",  num=1, need={
            {name="双面缎包", id=19010029, num=2},
            {id=11000812,name="完整的棉布包图样",num=1}
        }},
        {index = 7 ,id=19010029, name="双面缎包【31格】",  num=1, need={
            {name="闪色绸包", id=19010028, num=2},
            {id=11000811,name="完整的粗布包图样",num=1},
        }},
        {index = 8 ,id=19010028, name="闪色绸包【30格】",  num=1, need={
            {name="印花绸包", id=19010027, num=2},
            {id=11000810,name="残破的背包图样",num=3},
        }},
        {index = 9 ,id=19010027, name="印花绸包【29格】",  num=1, need={
            {name="素色绸包", id=19010026, num=2},
            {id=11000809,name="完整的碎布包图样",num=1}
        }},
        {index = 10 ,id=19010026, name="素色绸包【28格】",  num=1, need={
            {name="羊皮包", id=19010003, num=2}
        }},

    }},
    {index=2,name="四彩护身符",items={
        {index = 1 ,id=10340029, name="四彩护身符·战神",num=1,need={
            {id=11000328,name="四彩护身符碎片",num=500},
        }},
        {index = 2 ,id=10340030, name="四彩护身符·剑魔",num=1,need={
            {id=11000328,name="四彩护身符碎片",num=500},
        }},
        {index = 3 ,id=10340031, name="四彩护身符·追风",num=1,need={
            {id=11000328,name="四彩护身符碎片",num=500},
        }},
        {index = 4 ,id=10340032, name="四彩护身符·灭神",num=1,need={
            {id=11000328,name="四彩护身符碎片",num=500},
        }},
        {index = 5 ,id=10340033, name="四彩护身符·狂魔",num=1,need={
            {id=11000328,name="四彩护身符碎片",num=500},
        }},
        {index = 6 ,id=10340034, name="四彩护身符·医仙",num=1,need={
            {id=11000328,name="四彩护身符碎片",num=500},
        }},
    }},
    {index=3,name="肝帝活跃积分",items={
        {index = 1 ,id=12041103, name="活力丹",num=1,need={
            {id=200,name="肝帝活跃积分",num=30},
        }},
        {index = 1 ,id=12273004, name="100元充值券",num=1,need={
            {id=200,name="肝帝活跃积分",num=600},
        }},

    }},
}

-- ============================================================================
-- 工具函数
-- ============================================================================

-- 获取当前日期(年内天数)
function x930205_GetCurrentDay()
    local nYear, nMonth, nDay = GetYearMonthDay()
    return nDay + nMonth * 31
end

-- 根据物品ID找到商品池中的索引
function x930205_FindItemPoolIndex(varMap,varPlayer,itemId)
    local si = x930205_var_Selectinfo[GetGUID(varMap, varPlayer)]
    for i, item in x930205_var_objs[si.index].items do
        if item.id == itemId then
            return item
        end
    end
    return nil
end

-- 根据物品ID找到玩家商品列表中的槽位
function x930205_FindPlayerSlotByItemId(items, itemId)
    for i = 1, x930205_var_ItemSlotCount+x930205_var_ItemSlotNeedLock do
        local poolIndex = items[i]
        if poolIndex and poolIndex > 0 then
            local itemData = x930205_var_ItemPool[poolIndex]
            if itemData and itemData.varItem == itemId then
                return i
            end
        end
    end
    return nil
end

-- 格式化价格显示
function x930205_FormatPrice(price)
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
function x930205_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    DelQuest(varMap, varPlayer, x930205_var_QuestId)
    TalkAppendButton(varMap, x930205_var_FileId, x930205_var_QuestName, 3, -1)
end

-- 事件入口（玩家点击后的处理）
function x930205_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, seleteId)

    local nLevel = GetLevel(varMap, varPlayer)
    if nLevel < x930205_var_LevelLess then
        Msg2Player(varMap, varPlayer, format("人物等级不足%d",x930205_var_LevelLess), 8, 2)
        Msg2Player(varMap, varPlayer, format("人物等级不足%d",x930205_var_LevelLess), 8, 3)
        return
    end


    
    local guid = GetGUID(varMap, varPlayer)

    if seleteId == -1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x930205_var_QuestName)
        for vari, item in x930205_var_objs do
            TalkAppendButton(varMap, x930205_var_FileId, item.name, 3, item.index)
        end
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)

        return
    end

    x930205_var_Selectinfo[GetGUID(varMap, varPlayer)] = {index=seleteId}
    if seleteId ~= -1 then
        -- 检查背包空间
        if GetBagSpace(varMap, varPlayer) < 1 then
            Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 2)
            Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 3)
            return
        end

        -- 删除可能存在的旧任务
        if IsHaveQuestNM(varMap, varPlayer, x930205_var_QuestId) > 0 then
            DelQuest(varMap, varPlayer, x930205_var_QuestId)
        end

        -- 创建伪任务
        AddQuestNM(varMap, varPlayer, x930205_var_QuestId)
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930205_var_QuestId)
        SetQuestParam(varMap, varPlayer, varQuestIdx, x930205_MP_ISCOMPLETE, 1)

        -- 保存NPC引用
        x930205_var_PlayerNpc[guid] = varTalknpc

        -- 显示商品选择界面
        x930205_DeliverTalkInfo(varMap, varPlayer, varTalknpc)
        return

    end
end

-- 显示商品选择对话框（使用AddQuestRadioItemBonus）
function x930205_DeliverTalkInfo(varMap, varPlayer, varTalknpc)
    local si = x930205_var_Selectinfo[GetGUID(varMap, varPlayer)]

    Msg2Player(varMap, varPlayer, format("x930205_DeliverTalkInfo %d", varTalknpc), 8, 2)
    StartTalkTask(varMap)
    
    TalkAppendString(varMap, "#Y" .. x930205_var_QuestName .. "\n" .. x930205_var_QuestInfo)

    -- 使用AddQuestRadioItemBonus添加可选商品
    for k, item in x930205_var_objs[si.index].items do
        AddQuestRadioItemBonus(varMap, item.id, item.num)
    end

    StopTalkTask()
    DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x930205_var_FileId, x930205_var_QuestId)
end

-- 接受检查
function x930205_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
    return 1
end

-- 接受处理
function x930205_ProcAccept(varMap, varPlayer,varTalknpc)
    varTalknpc = x930205_var_PlayerNpc[GetGUID(varMap, varPlayer)]
    local si = x930205_var_Selectinfo[GetGUID(varMap, varPlayer)]
    local selectedItemId = si.itemid

    -- 找到对应的商品池索引
    local itemData = x930205_FindItemPoolIndex(varMap, varPlayer,selectedItemId)
    if itemData == nil then
        DelQuest(varMap, varPlayer, x930205_var_QuestId)
        Msg2Player(varMap, varPlayer, "所选物品不存在！", 8, 2)
        return
    end

    -- 检查背包空间
    if GetBagSpace(varMap, varPlayer) < 1 then
        DelQuest(varMap, varPlayer, x930205_var_QuestId)
        Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 2)
        Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 3)
        return
    end

    local jf = GetPlayerGameData(varMap,varPlayer,MD_SHANXIN_TIME2[1],MD_SHANXIN_TIME2[2],MD_SHANXIN_TIME2[3])


    --先检查数量
    for vari, need in itemData.need do
        if need.id > 100000 then
            --说明需要具体的道具
            if GetItemCount( varMap, varPlayer, need.id ) < need.num then
                Msg2Player(varMap, varPlayer,format("道具@item_%d 不足%d个",need.id, need.num),8,2)
                Msg2Player(varMap, varPlayer,format("道具@item_%d 不足%d个",need.id, need.num),8,3)
                x930205_ProcEventEntry(varMap, varPlayer,varTalknpc, 0, si.index)
                return 0
            end
        elseif need.id == 200 then
            --肝帝活跃积分
            if jf < need.num then
                Msg2Player(varMap, varPlayer,format("%s不足%d",need.name, need.num),8,2)
                Msg2Player(varMap, varPlayer,format("%s不足%d",need.name, need.num),8,3)
                x930205_ProcEventEntry(varMap, varPlayer,varTalknpc, 0, si.index)
                return 0
            end
        else
            --
        end
    end

    for vari, need in itemData.need do
        if need.id > 100000 then
            --说明需要具体的道具
            if DelItem(varMap,varPlayer,need.id,need.num) ~= 1 then
                Msg2Player(varMap, varPlayer,format("扣除道具@item_%d %d个失败",need.id, need.num),8,2)
                Msg2Player(varMap, varPlayer,format("扣除道具@item_%d %d个失败",need.id, need.num),8,3)
                x930205_ProcEventEntry(varMap, varPlayer,varTalknpc, 0, si.index)
                return 0
            end
        elseif need.id == 200 then
            --肝帝活跃积分
            SetPlayerGameData(varMap,varPlayer,MD_SHANXIN_TIME2[1],MD_SHANXIN_TIME2[2],MD_SHANXIN_TIME2[3], jf-need.num)
        else
            --
        end
    end



    -- 发放物品
    StartItemTask(varMap)
    ItemAppendBind(varMap, itemData.id, itemData.num)

    local varRet = StopItemTask(varMap, varPlayer)
    if varRet > 0 then
        DeliverItemListSendToPlayer(varMap, varPlayer)
        Msg2Player(varMap, varPlayer, format("购买成功！获得@item_%d", itemData.id), 8, 2)
        Msg2Player(varMap, varPlayer, format("购买成功！获得@item_%d", itemData.id), 8, 3)

        GamePlayScriptLog(varMap, varPlayer, 930205)
    else
        -- 退还现金
        Msg2Player(varMap, varPlayer, "物品购买失败！", 8, 2)
        Msg2Player(varMap, varPlayer, "物品购买失败！", 8, 3)
        return
    end

    -- 删除伪任务
    DelQuest(varMap, varPlayer, x930205_var_QuestId)

    x930205_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, si.index)
end
function x930205_ProcQuestAttach(varMap, varPlayer)
end

function x930187_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


end


-- 检查提交
function x930205_CheckSubmit(varMap, varPlayer, varTalknpc)
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930205_var_QuestId)
    if varHaveQuest > 0 then
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930205_var_QuestId)
        return GetQuestParam(varMap, varPlayer, varQuestIdx, x930205_MP_ISCOMPLETE)
    end
    return 0
end




-- 任务提交处理（核心：处理玩家选择的商品）
function x930205_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
    local si = x930205_var_Selectinfo[GetGUID(varMap, varPlayer)]
    x930205_var_Selectinfo[GetGUID(varMap, varPlayer)].itemid=varRadioSelected
    local guid = GetGUID(varMap, varPlayer)

    
    -- varRadioSelected 是玩家选择的物品ID
    local selectedItemId = varRadioSelected

    -- 找到对应的商品池索引
    local itemData = x930205_FindItemPoolIndex(varMap, varPlayer, selectedItemId)
    if itemData == nil then
        DelQuest(varMap, varPlayer, x930205_var_QuestId)
        Msg2Player(varMap, varPlayer, "所选物品不存在！", 8, 2)
        return
    end

    x930205_var_PlayerNpc[GetGUID(varMap, varPlayer)] = varTalknpc

    StartTalkTask(varMap)
    for vari, need in itemData.need do
        if need.id > 100000 then
            --需要道具兑换
            TalkAppendString(varMap,"#Y"..format("【购买】#R@item_%d#W需要道具#G@item_%d#W#R%d#W个",itemData.id,need.id,need.num))
        elseif need.id == 200 then
            --肝帝活跃积分
            TalkAppendString(varMap,"#Y"..format("【购买】#R@item_%d#W需要#G%s#W#R%d#W",itemData.id,need.name,need.num))
        else
            --
        end
    end

    AddQuestItemBonus(varMap, itemData.id, itemData.num)
    StopTalkTask()
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930205_var_FileId, -1);

end

-- 任务放弃
function x930205_ProcQuestAbandon(varMap, varPlayer, varQuest)
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930205_var_QuestId)
    if varHaveQuest > 0 then
        DelQuest(varMap, varPlayer, x930205_var_QuestId)
        Msg2Player(varMap, varPlayer, x930205_var_strQuestAbandon, 8, 2)
    end
end

-- ============================================================================
-- 其他必要的空函数
-- ============================================================================

function x930205_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x930205_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end

function x930205_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end

function x930205_ProcContinue(varMap, varPlayer, varTalknpc)
end
