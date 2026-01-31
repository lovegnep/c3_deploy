--DECLARE_QUEST_INFO_START--
--圣诞树 商店
x930201_var_FileId                  = 930201
x930201_var_QuestId                 = 11104

x930201_var_QuestKind               = 1
x930201_var_LevelLess               = 50

x930201_var_QuestName               = "祈福商店"
x930201_var_QuestTarget             = "从下列物品中选择一件购买"
x930201_var_QuestInfo               = "\t欢迎光临祈福积分商店！这里有各种珍稀物品等您选购。"
x930201_var_ContinueInfo            = ""
x930201_var_QuestCompleted          = ""
x930201_var_QuestHelp               = "选择心仪的物品进行购买"

x930201_var_strQuestAbandon         = "您取消了神秘商城购买"

x930201_var_ExpBonus                = 0
x930201_var_BonusItem               = {}
x930201_var_BonusMoney1             = 0
x930201_var_BonusMoney2             = 0
x930201_var_BonusMoney3             = 0
x930201_var_BonusMoney4             = 0
x930201_var_BonusMoney5             = 0
x930201_var_BonusMoney6             = 0
x930201_var_BonusChoiceItem         = {}

--DECLARE_QUEST_INFO_STOP--

-- 任务参数索引
x930201_MP_ISCOMPLETE               = 7

-- 数据存储位置定义
-- 复用2011年已过期活动的MD block (119-121)
-- 原MD: MD_2011CJBC_*, MD_2011CJHD_*, MD_2011YXHD_* 等
MD_MYSTERYSHOP_DATE                 = {119, 0, 9}     -- 日期(9bits)
MD_MYSTERYSHOP_REFRESH              = {119, 9, 7}     -- 刷新次数(7bits,最大127)
MD_MYSTERYSHOP_BUY                  = {119, 16, 7}    -- 购买次数(7bits,最大127)
MD_MYSTERYSHOP_ITEM1                = {119, 23, 8}    -- 商品1索引(8bits,最大255)
MD_MYSTERYSHOP_ITEM2                = {120, 0, 8}     -- 商品2索引
MD_MYSTERYSHOP_ITEM3                = {120, 8, 8}     -- 商品3索引
MD_MYSTERYSHOP_ITEM4                = {120, 16, 8}    -- 商品4索引
MD_MYSTERYSHOP_ITEM5                = {120, 24, 8}    -- 商品5索引
MD_MYSTERYSHOP_ITEM6                = {121, 0, 8}     -- 商品6索引
MD_MYSTERYSHOP_ITEM7                = {121, 8, 8}     -- 商品7索引
MD_MYSTERYSHOP_ITEM8                = {121, 16, 8}    -- 商品8索引
MD_MYSTERYSHOP_ITEM9                = {122, 0, 8}    -- 商品9索引
MD_MYSTERYSHOP_ITEM10                = {122, 8, 8}    -- 商品10索引
MD_MYSTERYSHOP_ITEM11                = {122, 16, 8}    -- 商品11索引
MD_MYSTERYSHOP_ITEM12                = {122, 24, 8}    -- 商品12索引

MD_MYSTERYSHOP_UNLOCKNUM                = {118, 20, 4}    -- 已经解锁的槽位数量

-- 配置参数
x930201_var_MaxRefreshTimes         = 126     -- 每日最大刷新次数
x930201_var_MaxBuyTimes             = 126     -- 每日最大购买次数
x930201_var_RefreshCost             = 480*1000   -- 刷新消耗(两)
x930201_var_FirstBuyCost             = 389*1000   -- 第1次购买(两)
x930201_var_BuyCostParam             = 3   -- 越大增长越慢
x930201_var_RefreshCostParam             = 3   -- 越大增长越慢
x930201_var_ItemSlotCount           = 6     -- 商品槽位数量,默认解锁的
x930201_var_ItemSlotNeedLock           = 6     -- 商品槽位数量,需要解锁的

-- 内存缓存
x930201_var_PlayerShopItems         = {}    -- 玩家当前商品列表 (GUID -> {item1, item2, ...})
x930201_var_PlayerNpc               = {}    -- 玩家当前NPC (GUID -> npc)

-- 商品池配置
-- varItem: 物品ID
-- price: 价格(文)
-- probability: 概率权重
-- varName: 物品名称
-- num: 数量
-- isBind: 是否绑定 (1=绑定, 0=不绑定)
x930201_var_ItemPool = {
    -- 普通商品 (高概率)
    {varItem = 12036609, price = 100,     probability = 1000, varName = "琼浆玉露（1天）",             num = 1, isBind = 1},
    {varItem = 12036610, price = 500,     probability = 1000, varName = "琼浆玉露（10天）",             num = 1, isBind = 1},
    {varItem = 12036611, price = 1000,     probability = 1000, varName = "琼浆玉露（30天）",             num = 1, isBind = 1},
    {varItem = 12036625, price = 100,     probability = 1000, varName = "无限千里符（1天）",             num = 1, isBind = 1},
    {varItem = 12036626, price = 500,     probability = 1000, varName = "无限千里符（10天）",             num = 1, isBind = 1},
    {varItem = 12036627, price = 1000,     probability = 1000, varName = "无限千里符（30天）",             num = 1, isBind = 1},
    {varItem = 12036615, price = 100,     probability = 1000, varName = "初级骑术强化符：健体",             num = 1, isBind = 1},
    {varItem = 12036616, price = 100,     probability = 1000, varName = "初级骑术强化符：蛮力",             num = 1, isBind = 1},
    {varItem = 12036617, price = 100,     probability = 1000, varName = "初级骑术强化符：追影",             num = 1, isBind = 1},
    {varItem = 12036618, price = 100,     probability = 1000, varName = "初级骑术强化符：聪慧",             num = 1, isBind = 1},
    {varItem = 12036619, price = 100,     probability = 1000, varName = "初级骑术强化符：全能",             num = 1, isBind = 1},
    {varItem = 12036620, price = 500,     probability = 1000, varName = "高级骑术强化符：健体",             num = 1, isBind = 1},
    {varItem = 12036621, price = 500,     probability = 1000, varName = "高级骑术强化符：蛮力",             num = 1, isBind = 1},
    {varItem = 12036622, price = 500,     probability = 1000, varName = "高级骑术强化符：追影",             num = 1, isBind = 1},
    {varItem = 12036623, price = 500,     probability = 1000, varName = "高级骑术强化符：聪慧",             num = 1, isBind = 1},
    {varItem = 12036624, price = 500,     probability = 1000, varName = "高级骑术强化符：全能",             num = 1, isBind = 1},

    {varItem = 12271325, price = 200000,     probability = 1000, varName = "狩魔猎人时装礼包（30天）",             num = 1, isBind = 1},
    {varItem = 12271326, price = 150000,     probability = 1000, varName = "决战八方时装（14天）",             num = 1, isBind = 1},
    {varItem = 12271327, price = 10000,     probability = 1000, varName = "战车装备大礼包",             num = 1, isBind = 1},
    {varItem = 12035252, price = 10,     probability = 1000, varName = "魔君附身石（5分钟）",             num = 1, isBind = 1},
    {varItem = 12035253, price = 50,     probability = 1000, varName = "魔君附身石（10分钟）",             num = 1, isBind = 1},
    {varItem = 12035254, price = 100,     probability = 1000, varName = "魔君附身石（1小时）",             num = 1, isBind = 1},

}
x930201_var_Selectinfo = {}
x930201_var_PlayerNpc               = {}    -- 玩家当前NPC (GUID -> npc)


--刷新按钮
x930201_var_refreshitemid = 12274120
--已经购买
x930201_var_buyeditemid = 12274121
x930201_var_lockitemid = 12274122

--钥匙
x930201_var_keys = {
    {index=1,id=12274130,name="神秘钥匙一"},
    {index=2,id=12274131,name="神秘钥匙二"},
    {index=3,id=12274132,name="神秘钥匙三"},
    {index=4,id=12274133,name="神秘钥匙四"},
    {index=5,id=12274134,name="神秘钥匙五"},
    {index=6,id=12274135,name="神秘钥匙六"},
}

-- ============================================================================
-- 工具函数
-- ============================================================================

-- 获取当前日期(年内天数)
function x930201_GetCurrentDay()
    local nYear, nMonth, nDay = GetYearMonthDay()
    return nDay + nMonth * 31
end

-- 根据物品ID找到商品池中的索引
function x930201_FindItemPoolIndex(itemId)
    for i, item in x930201_var_ItemPool do
        if item.varItem == itemId then
            return i
        end
    end
    return nil
end

-- 根据物品ID找到玩家商品列表中的槽位
function x930201_FindPlayerSlotByItemId(items, itemId)
    for i = 1, x930201_var_ItemSlotCount+x930201_var_ItemSlotNeedLock do
        local poolIndex = items[i]
        if poolIndex and poolIndex > 0 then
            local itemData = x930201_var_ItemPool[poolIndex]
            if itemData and itemData.varItem == itemId then
                return i
            end
        end
    end
    return nil
end

-- 格式化价格显示
function x930201_FormatPrice(price)
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
function x930201_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    TalkAppendButton(varMap, x930201_var_FileId, x930201_var_QuestName, 3, -1)
end

-- 事件入口（玩家点击后的处理）
function x930201_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, seleteId)
    local nLevel = GetLevel(varMap, varPlayer)
    if nLevel < x930201_var_LevelLess then
        Msg2Player(varMap, varPlayer, format("人物等级不足%d",x930201_var_LevelLess), 8, 2)
        Msg2Player(varMap, varPlayer, format("人物等级不足%d",x930201_var_LevelLess), 8, 3)
        return
    end


    
    local guid = GetGUID(varMap, varPlayer)
    x930201_var_PlayerNpc[GetGUID(varMap, varPlayer)] = varTalknpc

    
    -- 主菜单
    if seleteId == -1 then
        -- 检查背包空间
        if GetBagSpace(varMap, varPlayer) < 1 then
            Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 2)
            Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 3)
            return
        end

        -- 删除可能存在的旧任务
        if IsHaveQuestNM(varMap, varPlayer, x930201_var_QuestId) > 0 then
            DelQuest(varMap, varPlayer, x930201_var_QuestId)
        end

        -- 创建伪任务
        AddQuestNM(varMap, varPlayer, x930201_var_QuestId)
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930201_var_QuestId)
        SetQuestParam(varMap, varPlayer, varQuestIdx, x930201_MP_ISCOMPLETE, 1)

        -- 保存NPC引用
        x930201_var_PlayerNpc[guid] = varTalknpc

        -- 显示商品选择界面
        x930201_DeliverTalkInfo(varMap, varPlayer, varTalknpc)
        return

    end
end

-- 显示商品选择对话框（使用AddQuestRadioItemBonus）
function x930201_DeliverTalkInfo(varMap, varPlayer, varTalknpc)
    local guid = GetGUID(varMap, varPlayer)

    local allscore = GetPlayerGameData( varMap, varPlayer, MD_COUNTRY_NEIZHENG_WEEK[ 1], MD_COUNTRY_NEIZHENG_WEEK[ 2], MD_COUNTRY_NEIZHENG_WEEK[ 3] )

    StartTalkTask(varMap)
    
    TalkAppendString(varMap, "#Y" .. x930201_var_QuestName .. "\n" .. x930201_var_QuestInfo)
    TalkAppendString(varMap, format("当前您的祈福积分数量：#G%d#W", allscore))

    -- 使用AddQuestRadioItemBonus添加可选商品
    for k, item in x930201_var_ItemPool do
        AddQuestRadioItemBonus(varMap, item.varItem, item.num)
    end

    StopTalkTask()
    DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x930201_var_FileId, x930201_var_QuestId)
end

-- 接受检查
function x930201_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
    return 1
end

-- 接受处理
function x930201_ProcAccept(varMap, varPlayer,varTalknpc)
    varTalknpc = x930201_var_PlayerNpc[GetGUID(varMap, varPlayer)]
    local varRadioSelected = x930201_var_Selectinfo[GetGUID(varMap, varPlayer)]
    local guid = GetGUID(varMap, varPlayer)


    -- varRadioSelected 是玩家选择的物品ID
    local selectedItemId = varRadioSelected

    -- 找到对应的商品池索引
    local poolIndex = x930201_FindItemPoolIndex(selectedItemId)
    if not poolIndex then
        DelQuest(varMap, varPlayer, x930201_var_QuestId)
        Msg2Player(varMap, varPlayer, "所选物品不存在！", 8, 2)
        return
    end


    local itemData = x930201_var_ItemPool[poolIndex]

    -- 检查背包空间
    if GetBagSpace(varMap, varPlayer) < 1 then
        DelQuest(varMap, varPlayer, x930201_var_QuestId)
        Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 2)
        Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 3)
        return
    end


    local allscore = GetPlayerGameData( varMap, varPlayer, MD_COUNTRY_NEIZHENG_WEEK[ 1], MD_COUNTRY_NEIZHENG_WEEK[ 2], MD_COUNTRY_NEIZHENG_WEEK[ 3] )
    if allscore == nil or allscore <= 0 then
        allscore = 0
    end



    -- 检查现金是否足够
    if allscore < itemData.price then
        DelQuest(varMap, varPlayer, x930201_var_QuestId)
        Msg2Player(varMap, varPlayer, format("积分不足！需要#R%d#W", itemData.price), 8, 2)
        Msg2Player(varMap, varPlayer, format("积分不足！需要#R%d#W", itemData.price), 8, 3)
        x930201_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, -1)
        return
    end

    -- 扣除现金
    SetPlayerGameData( varMap, varPlayer, MD_COUNTRY_NEIZHENG_WEEK[ 1], MD_COUNTRY_NEIZHENG_WEEK[ 2], MD_COUNTRY_NEIZHENG_WEEK[ 3], allscore -itemData.price )


    -- 发放物品
    StartItemTask(varMap)
    if itemData.isBind == 1 then
        ItemAppendBind(varMap, itemData.varItem, itemData.num)
    else
        ItemAppend(varMap, itemData.varItem, itemData.num)
    end

    local varRet = StopItemTask(varMap, varPlayer)
    if varRet > 0 then
        DeliverItemListSendToPlayer(varMap, varPlayer)


        Msg2Player(varMap, varPlayer, format("购买成功！花费%d积分，获得%s x%d", itemData.price, itemData.varName, itemData.num), 8, 2)
        Msg2Player(varMap, varPlayer, format("购买成功！花费%d积分，获得%s x%d", itemData.price, itemData.varName, itemData.num), 8, 3)

        GamePlayScriptLog(varMap, varPlayer, 930201)
    else
        -- 退还现金
        Msg2Player(varMap, varPlayer, "物品购买失败！", 8, 2)
        Msg2Player(varMap, varPlayer, "物品购买失败！", 8, 3)
    end

    -- 删除伪任务
    DelQuest(varMap, varPlayer, x930201_var_QuestId)

    x930201_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, -1)
end
function x930201_ProcQuestAttach(varMap, varPlayer)
end

function x930187_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


end


-- 检查提交
function x930201_CheckSubmit(varMap, varPlayer, varTalknpc)
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930201_var_QuestId)
    if varHaveQuest > 0 then
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930201_var_QuestId)
        return GetQuestParam(varMap, varPlayer, varQuestIdx, x930201_MP_ISCOMPLETE)
    end
    return 0
end




-- 任务提交处理（核心：处理玩家选择的商品）
function x930201_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
    x930201_var_PlayerNpc[GetGUID(varMap, varPlayer)] = varTalknpc
    x930201_var_Selectinfo[GetGUID(varMap, varPlayer)] = varRadioSelected
    local guid = GetGUID(varMap, varPlayer)

    
    -- varRadioSelected 是玩家选择的物品ID
    local selectedItemId = varRadioSelected

    -- 找到对应的商品池索引
    local poolIndex = x930201_FindItemPoolIndex(selectedItemId)
    if not poolIndex then
        DelQuest(varMap, varPlayer, x930201_var_QuestId)
        Msg2Player(varMap, varPlayer, "所选物品不存在！", 8, 2)
        return
    end

    
    local itemData = x930201_var_ItemPool[poolIndex]

    StartTalkTask(varMap)
    TalkAppendString(varMap,"#Y"..format("【购买】#R%s#W需要祈福积分#R%d#W",itemData.varName,itemData.price))
    AddQuestItemBonus(varMap, itemData.varItem, itemData.num)
    StopTalkTask()
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930201_var_FileId, -1);

end

-- 任务放弃
function x930201_ProcQuestAbandon(varMap, varPlayer, varQuest)
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930201_var_QuestId)
    if varHaveQuest > 0 then
        DelQuest(varMap, varPlayer, x930201_var_QuestId)
        Msg2Player(varMap, varPlayer, x930201_var_strQuestAbandon, 8, 2)
    end
end

-- ============================================================================
-- 其他必要的空函数
-- ============================================================================

function x930201_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x930201_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end

function x930201_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end

function x930201_ProcContinue(varMap, varPlayer, varTalknpc)
end
