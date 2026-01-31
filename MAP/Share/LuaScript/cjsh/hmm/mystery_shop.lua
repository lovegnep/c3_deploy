--DECLARE_QUEST_INFO_START--

x930192_var_FileId                  = 930192
x930192_var_QuestId                 = 11103

x930192_var_QuestKind               = 1
x930192_var_LevelLess               = 50

x930192_var_QuestName               = "神秘商城"
x930192_var_QuestTarget             = "从下列物品中选择一件购买"
x930192_var_QuestInfo               = "\t欢迎光临神秘商城！这里有各种珍稀物品等您选购。"
x930192_var_ContinueInfo            = ""
x930192_var_QuestCompleted          = ""
x930192_var_QuestHelp               = "选择心仪的物品进行购买"

x930192_var_strQuestAbandon         = "您取消了神秘商城购买"

x930192_var_ExpBonus                = 0
x930192_var_BonusItem               = {}
x930192_var_BonusMoney1             = 0
x930192_var_BonusMoney2             = 0
x930192_var_BonusMoney3             = 0
x930192_var_BonusMoney4             = 0
x930192_var_BonusMoney5             = 0
x930192_var_BonusMoney6             = 0
x930192_var_BonusChoiceItem         = {}

--DECLARE_QUEST_INFO_STOP--

-- 任务参数索引
x930192_MP_ISCOMPLETE               = 7

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
x930192_var_MaxRefreshTimes         = 126     -- 每日最大刷新次数
x930192_var_MaxBuyTimes             = 126     -- 每日最大购买次数
x930192_var_RefreshCost             = 100*1000   -- 刷新消耗(两)
x930192_var_FirstBuyCost             = 389*1000   -- 第1次购买(两)
x930192_var_BuyCostParam             = 3   -- 越大增长越慢
x930192_var_RefreshCostParam             = 3   -- 越大增长越慢
x930192_var_ItemSlotCount           = 6     -- 商品槽位数量,默认解锁的
x930192_var_ItemSlotNeedLock           = 6     -- 商品槽位数量,需要解锁的

-- 内存缓存
x930192_var_PlayerShopItems         = {}    -- 玩家当前商品列表 (GUID -> {item1, item2, ...})
x930192_var_PlayerNpc               = {}    -- 玩家当前NPC (GUID -> npc)

-- 商品池配置
-- varItem: 物品ID
-- price: 价格(文)
-- probability: 概率权重
-- varName: 物品名称
-- num: 数量
-- isBind: 是否绑定 (1=绑定, 0=不绑定)
x930192_var_ItemPool = {
    -- 普通商品 (高概率)
    {varItem = 11010111, price = 50000,     probability = 5000, varName = "一级平衡之书",             num = 1, isBind = 1},
    {varItem = 11000902, price = 50000,     probability = 5000, varName = "高级洗石剂",             num = 1, isBind = 1},
    {varItem = 11000903, price = 50000,     probability = 5000, varName = "圣徒级洗石剂",             num = 1, isBind = 1},
    {varItem = 11000904, price = 50000,     probability = 5000, varName = "大师级洗石剂",             num = 1, isBind = 1},
    {varItem = 11000905, price = 500000,     probability = 1000, varName = "宗师级洗石剂",             num = 1, isBind = 1},
    {varItem = 12052461, price = 50000,     probability = 5000, varName = "骑术秘笈：一级活力",             num = 1, isBind = 1},
    {varItem = 12052451, price = 50000,     probability = 5000, varName = "骑术秘笈：一级悟性",           num = 1, isBind = 1},
    {varItem = 12030405, price = 50000,     probability = 1000, varName = "活力特惠包",           num = 1, isBind = 1},
    {varItem = 12041103, price = 5000,     probability = 5000, varName = "活力丹",           num = 1, isBind = 1},
    {varItem = 12274021, price = 5000,     probability = 5000, varName = "一品幻兽内丹",           num = 10, isBind = 1},
    {varItem = 12274022, price = 10000,    probability = 800,  varName = "二品幻兽内丹",     num = 5,  isBind = 1},
    {varItem = 12274023, price = 15000,    probability = 800,  varName = "三品幻兽内丹",           num = 1,  isBind = 1},
    {varItem = 12273000, price = 20000,    probability = 10000,  varName = "1元充值券",           num = 1,  isBind = 1},
    {varItem = 12273001, price = 30000,    probability = 500,  varName = "5元充值券",           num = 1,  isBind = 1},
    {varItem = 12272432, price = 50000,    probability = 300,  varName = "马币包",             num = 1,  isBind = 1},

    -- 稀有商品 (中概率)
    {varItem = 11000310, price = 80000,    probability = 200,  varName = "北斗碎片",         num = 10,  isBind = 1},
    {varItem = 11010112, price = 80000,    probability = 200,  varName = "二级平衡之书",         num = 1,  isBind = 1},
    {varItem = 11970022, price = 80000,    probability = 200,  varName = "强效乱士符",         num = 1,  isBind = 1},
    {varItem = 12272433, price = 80000,    probability = 200,  varName = "征服包",         num = 1,  isBind = 1},
    {varItem = 11970023, price = 80000,    probability = 150,  varName = "黄金乱士符",         num = 1,  isBind = 1},
    {varItem = 12271406, price = 100000,   probability = 150,  varName = "声望袋",     num = 1,  isBind = 1},
    {varItem = 12050055, price = 120000,   probability = 150,  varName = "一级勇力丹",             num = 1,  isBind = 1},
    {varItem = 12050065, price = 120000,   probability = 150,  varName = "一级追影丹",             num = 1,  isBind = 1},
    {varItem = 12050075, price = 120000,   probability = 150,  varName = "一级心智丹",             num = 1,  isBind = 1},
    {varItem = 12050085, price = 120000,   probability = 150,  varName = "一级强身丹",             num = 1,  isBind = 1},
    {varItem = 12041215, price = 150000,   probability = 100,  varName = "混元丹",       num = 1,  isBind = 1},
    {varItem = 12041098, price = 200000,   probability = 80,   varName = "暴韧神水", num = 1,  isBind = 1},
    {varItem = 12041044, price = 200000,   probability = 80,   varName = "混沌不灭丸", num = 1,  isBind = 1},
    {varItem = 11000934, price = 200000,   probability = 80,   varName = "传说级洗石剂·雪魂", num = 1,  isBind = 1},
    {varItem = 11000935, price = 200000,   probability = 80,   varName = "传说级洗石剂·冰魄", num = 1,  isBind = 1},
    {varItem = 11000906, price = 200000,   probability = 80,   varName = "传说级洗石剂·莲华", num = 1,  isBind = 1},
    {varItem = 11000936, price = 200000,   probability = 80,   varName = "雪山之星", num = 1,  isBind = 1},
    {varItem = 12274091, price = 200000,   probability = 80,   varName = "战神寻宝图", num = 1,  isBind = 1},

    --
    {varItem = 12050326, price = 200000,   probability = 60,   varName = "机械鸟降世符", num = 1,  isBind = 1},
    {varItem = 12050331, price = 200000,   probability = 60,   varName = "九命狸猫降世符", num = 1,  isBind = 1},
    {varItem = 12050347, price = 200000,   probability = 60,   varName = "双头恶犬降世符", num = 1,  isBind = 1},
    {varItem = 12050390, price = 200000,   probability = 60,   varName = "白玉雪猫降世符", num = 1,  isBind = 1},
    {varItem = 10306031, price = 200000,   probability = 60,   varName = "波斯时装(30天)", num = 1,  isBind = 1},
    {varItem = 10306041, price = 200000,   probability = 60,   varName = "情人时装(30天)", num = 1,  isBind = 1},
    {varItem = 10306051, price = 200000,   probability = 60,   varName = "月焰时装(30天)", num = 1,  isBind = 1},
    {varItem = 11000218, price = 200000,   probability = 60,   varName = "海蓝钻石", num = 1,  isBind = 1},
    {varItem = 11000219, price = 200000,   probability = 60,   varName = "水火钻石", num = 1,  isBind = 1},
    {varItem = 11000220, price = 200000,   probability = 60,   varName = "晕光钻石", num = 1,  isBind = 1},
    {varItem = 11000221, price = 200000,   probability = 60,   varName = "炫彩钻石", num = 1,  isBind = 1},
    {varItem = 11000400, price = 200000,   probability = 50,   varName = "海蓝金刚", num = 1,  isBind = 1},
    {varItem = 11000401, price = 200000,   probability = 50,   varName = "水火金刚", num = 1,  isBind = 1},
    {varItem = 11000402, price = 200000,   probability = 50,   varName = "晕光金刚", num = 1,  isBind = 1},
    {varItem = 11000403, price = 200000,   probability = 50,   varName = "炫彩金刚", num = 1,  isBind = 1},
    {varItem = 11000363, price = 200000,   probability = 40,   varName = "青心钻石", num = 1,  isBind = 1},
    {varItem = 11000364, price = 200000,   probability = 40,   varName = "青心金刚", num = 1,  isBind = 1},
    {varItem = 11990122, price = 200000,   probability = 20,   varName = "明亮的彩钻", num = 1,  isBind = 1},
    {varItem = 12050056, price = 200000,   probability = 20,   varName = "二级勇力丹", num = 1,  isBind = 1},
    {varItem = 12050066, price = 200000,   probability = 20,   varName = "二级追影丹", num = 1,  isBind = 1},
    {varItem = 12050076, price = 200000,   probability = 20,   varName = "二级心智丹", num = 1,  isBind = 1},
    {varItem = 12050086, price = 200000,   probability = 20,   varName = "二级强身丹", num = 1,  isBind = 1},

    -- 珍稀商品 (低概率)
    {varItem = 12274095, price = 300000,   probability = 50,   varName = "坐骑图鉴大礼包",         num = 1,  isBind = 1},
    {varItem = 11000381, price = 300000,   probability = 50,   varName = "暗影四彩护身符碎片",         num = 1,  isBind = 1},
    {varItem = 11000333, price = 300000,   probability = 50,   varName = "战神王牌兑换券",         num = 1,  isBind = 1},
    {varItem = 11000334, price = 350000,   probability = 50,   varName = "战神令",           num = 1,  isBind = 1},
    {varItem = 11000335, price = 500000,   probability = 30,   varName = "火焰结晶", num = 1,  isBind = 1},
    {varItem = 11000336, price = 500000,   probability = 30,   varName = "开心币", num = 1,  isBind = 1},
    {varItem = 11000339, price = 500000,   probability = 30,   varName = "红心A", num = 1,  isBind = 1},
    {varItem = 11000332, price = 500000,   probability = 30,   varName = "红玫瑰", num = 1,  isBind = 1},
    {varItem = 11000331, price = 500000,   probability = 30,   varName = "永恒之心", num = 1,  isBind = 1},
    {varItem = 12274000, price = 500000,   probability = 30,   varName = "时装精华", num = 1,  isBind = 1},
    {varItem = 12274041, price = 500000,   probability = 30,   varName = "时装核心", num = 1,  isBind = 1},
    {varItem = 11000370, price = 800000,   probability = 20,   varName = "神话级打磨剂",     num = 1,  isBind = 1},
    {varItem = 11000380, price = 100000,  probability = 10,   varName = "稀世奇珍兑换卷",           num = 1,  isBind = 1},

    --稀有
    {varItem = 11000330, price = 100000,  probability = 5,   varName = "马书残页",           num = 1,  isBind = 1},
    {varItem = 12050057, price = 200000,   probability = 20,   varName = "三级勇力丹", num = 1,  isBind = 1},
    {varItem = 12050067, price = 200000,   probability = 20,   varName = "三级追影丹", num = 1,  isBind = 1},
    {varItem = 12050077, price = 200000,   probability = 20,   varName = "三级心智丹", num = 1,  isBind = 1},
    {varItem = 12050087, price = 200000,   probability = 20,   varName = "三级强身丹", num = 1,  isBind = 1},
}


--刷新按钮
x930192_var_refreshitemid = 12274120
--已经购买
x930192_var_buyeditemid = 12274121
x930192_var_lockitemid = 12274122

--钥匙
x930192_var_keys = {
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
function x930192_GetCurrentDay()
    local nYear, nMonth, nDay = GetYearMonthDay()
    return nDay + nMonth * 31
end

-- 检查并重置每日数据
function x930192_CheckAndResetDaily(varMap, varPlayer)
    local storedDay = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_DATE[1], MD_MYSTERYSHOP_DATE[2], MD_MYSTERYSHOP_DATE[3])
    local currentDay = x930192_GetCurrentDay()
    
    if storedDay ~= currentDay then
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_DATE[1], MD_MYSTERYSHOP_DATE[2], MD_MYSTERYSHOP_DATE[3], currentDay)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_REFRESH[1], MD_MYSTERYSHOP_REFRESH[2], MD_MYSTERYSHOP_REFRESH[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_BUY[1], MD_MYSTERYSHOP_BUY[2], MD_MYSTERYSHOP_BUY[3], 0)
        
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM1[1], MD_MYSTERYSHOP_ITEM1[2], MD_MYSTERYSHOP_ITEM1[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM2[1], MD_MYSTERYSHOP_ITEM2[2], MD_MYSTERYSHOP_ITEM2[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM3[1], MD_MYSTERYSHOP_ITEM3[2], MD_MYSTERYSHOP_ITEM3[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM4[1], MD_MYSTERYSHOP_ITEM4[2], MD_MYSTERYSHOP_ITEM4[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM5[1], MD_MYSTERYSHOP_ITEM5[2], MD_MYSTERYSHOP_ITEM5[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM6[1], MD_MYSTERYSHOP_ITEM6[2], MD_MYSTERYSHOP_ITEM6[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM7[1], MD_MYSTERYSHOP_ITEM7[2], MD_MYSTERYSHOP_ITEM7[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM8[1], MD_MYSTERYSHOP_ITEM8[2], MD_MYSTERYSHOP_ITEM8[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM9[1], MD_MYSTERYSHOP_ITEM9[2], MD_MYSTERYSHOP_ITEM9[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM10[1], MD_MYSTERYSHOP_ITEM10[2], MD_MYSTERYSHOP_ITEM10[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM11[1], MD_MYSTERYSHOP_ITEM11[2], MD_MYSTERYSHOP_ITEM11[3], 0)
        SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM12[1], MD_MYSTERYSHOP_ITEM12[2], MD_MYSTERYSHOP_ITEM12[3], 0)


        local guid = GetGUID(varMap, varPlayer)
        x930192_var_PlayerShopItems[guid] = nil
        
        return true
    end
    return false
end

-- 获取刷新次数
function x930192_GetRefreshTimes(varMap, varPlayer)
    return GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_REFRESH[1], MD_MYSTERYSHOP_REFRESH[2], MD_MYSTERYSHOP_REFRESH[3])
end

-- 设置刷新次数
function x930192_SetRefreshTimes(varMap, varPlayer, times)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_REFRESH[1], MD_MYSTERYSHOP_REFRESH[2], MD_MYSTERYSHOP_REFRESH[3], times)
end

-- 获取购买次数
function x930192_GetBuyTimes(varMap, varPlayer)
    return GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_BUY[1], MD_MYSTERYSHOP_BUY[2], MD_MYSTERYSHOP_BUY[3])
end

-- 设置购买次数
function x930192_SetBuyTimes(varMap, varPlayer, times)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_BUY[1], MD_MYSTERYSHOP_BUY[2], MD_MYSTERYSHOP_BUY[3], times)
end
-- 获取解锁次数
function x930192_GetUnlockTimes(varMap, varPlayer)
    return GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_UNLOCKNUM[1], MD_MYSTERYSHOP_UNLOCKNUM[2], MD_MYSTERYSHOP_UNLOCKNUM[3])
end

-- 设置解锁次数
function x930192_SetUnlockTimes(varMap, varPlayer, times)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_UNLOCKNUM[1], MD_MYSTERYSHOP_UNLOCKNUM[2], MD_MYSTERYSHOP_UNLOCKNUM[3], times)
end

-- 获取存储的商品索引列表
function x930192_GetStoredItems(varMap, varPlayer)
    local items = {}
    items[1] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM1[1], MD_MYSTERYSHOP_ITEM1[2], MD_MYSTERYSHOP_ITEM1[3])
    items[2] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM2[1], MD_MYSTERYSHOP_ITEM2[2], MD_MYSTERYSHOP_ITEM2[3])
    items[3] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM3[1], MD_MYSTERYSHOP_ITEM3[2], MD_MYSTERYSHOP_ITEM3[3])
    items[4] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM4[1], MD_MYSTERYSHOP_ITEM4[2], MD_MYSTERYSHOP_ITEM4[3])
    items[5] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM5[1], MD_MYSTERYSHOP_ITEM5[2], MD_MYSTERYSHOP_ITEM5[3])
    items[6] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM6[1], MD_MYSTERYSHOP_ITEM6[2], MD_MYSTERYSHOP_ITEM6[3])
    items[7] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM7[1], MD_MYSTERYSHOP_ITEM7[2], MD_MYSTERYSHOP_ITEM7[3])
    items[8] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM8[1], MD_MYSTERYSHOP_ITEM8[2], MD_MYSTERYSHOP_ITEM8[3])
    items[9] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM9[1], MD_MYSTERYSHOP_ITEM9[2], MD_MYSTERYSHOP_ITEM9[3])
    items[10] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM10[1], MD_MYSTERYSHOP_ITEM10[2], MD_MYSTERYSHOP_ITEM10[3])
    items[11] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM11[1], MD_MYSTERYSHOP_ITEM11[2], MD_MYSTERYSHOP_ITEM11[3])
    items[12] = GetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM12[1], MD_MYSTERYSHOP_ITEM12[2], MD_MYSTERYSHOP_ITEM12[3])
    return items
end

-- 保存商品索引列表
function x930192_SetStoredItems(varMap, varPlayer, items)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM1[1], MD_MYSTERYSHOP_ITEM1[2], MD_MYSTERYSHOP_ITEM1[3], items[1] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM2[1], MD_MYSTERYSHOP_ITEM2[2], MD_MYSTERYSHOP_ITEM2[3], items[2] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM3[1], MD_MYSTERYSHOP_ITEM3[2], MD_MYSTERYSHOP_ITEM3[3], items[3] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM4[1], MD_MYSTERYSHOP_ITEM4[2], MD_MYSTERYSHOP_ITEM4[3], items[4] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM5[1], MD_MYSTERYSHOP_ITEM5[2], MD_MYSTERYSHOP_ITEM5[3], items[5] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM6[1], MD_MYSTERYSHOP_ITEM6[2], MD_MYSTERYSHOP_ITEM6[3], items[6] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM7[1], MD_MYSTERYSHOP_ITEM7[2], MD_MYSTERYSHOP_ITEM7[3], items[7] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM8[1], MD_MYSTERYSHOP_ITEM8[2], MD_MYSTERYSHOP_ITEM8[3], items[8] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM9[1], MD_MYSTERYSHOP_ITEM9[2], MD_MYSTERYSHOP_ITEM9[3], items[9] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM10[1], MD_MYSTERYSHOP_ITEM10[2], MD_MYSTERYSHOP_ITEM10[3], items[10] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM11[1], MD_MYSTERYSHOP_ITEM11[2], MD_MYSTERYSHOP_ITEM11[3], items[11] or 0)
    SetPlayerGameData(varMap, varPlayer, MD_MYSTERYSHOP_ITEM12[1], MD_MYSTERYSHOP_ITEM12[2], MD_MYSTERYSHOP_ITEM12[3], items[12] or 0)
end

-- 根据概率随机选择一个商品索引
function x930192_RandomSelectItem()
    local totalProb = 0
    for i, item in x930192_var_ItemPool do
        totalProb = totalProb + item.probability
    end
    
    local randValue = random(1, totalProb)
    local cumProb = 0
    
    for i, item in x930192_var_ItemPool do
        cumProb = cumProb + item.probability
        if randValue <= cumProb then
            return i
        end
    end
    
    return 1
end

--获取用户的槽位数量
function x930192_getslotnum(varMap, varPlayer)
    local hasUnlock = x930192_GetUnlockTimes(varMap, varPlayer)
    return x930192_var_ItemSlotCount + (hasUnlock or 0)
end

-- 刷新商品列表
function x930192_RefreshShopItems(varMap, varPlayer)
    local items = {}
    local usedIndices = {}
    
    for i = 1, x930192_getslotnum(varMap, varPlayer) do
        local itemIndex = x930192_RandomSelectItem()
        local tryCount = 0
        while usedIndices[itemIndex] and tryCount < 100 do
            itemIndex = x930192_RandomSelectItem()
            tryCount = tryCount + 1
        end
        usedIndices[itemIndex] = true
        items[i] = itemIndex
    end
    local maxcnt = x930192_var_ItemSlotCount + x930192_var_ItemSlotNeedLock
    if getn(items) < maxcnt then
        for i = getn(items)+1, maxcnt do
            items[i] = -1
        end
    end
    
    x930192_SetStoredItems(varMap, varPlayer, items)
    
    local guid = GetGUID(varMap, varPlayer)
    x930192_var_PlayerShopItems[guid] = items
    
    return items
end

-- 获取玩家当前商品列表
function x930192_GetPlayerShopItems(varMap, varPlayer)
    local guid = GetGUID(varMap, varPlayer)
    
    if x930192_var_PlayerShopItems[guid] then
        return x930192_var_PlayerShopItems[guid]
    end
    
    local items = x930192_GetStoredItems(varMap, varPlayer)
    
    local hasValidData = false
    for i = 1, x930192_getslotnum(varMap, varPlayer) do
        if items[i] and items[i] > 0 then
            hasValidData = true
            break
        end
    end
    
    if hasValidData then
        x930192_var_PlayerShopItems[guid] = items
        return items
    end
    
    return nil
end

-- 根据物品ID找到商品池中的索引
function x930192_FindItemPoolIndex(itemId)
    for i, item in x930192_var_ItemPool do
        if item.varItem == itemId then
            return i
        end
    end
    return nil
end

-- 根据物品ID找到玩家商品列表中的槽位
function x930192_FindPlayerSlotByItemId(items, itemId)
    for i = 1, x930192_var_ItemSlotCount+x930192_var_ItemSlotNeedLock do
        local poolIndex = items[i]
        if poolIndex and poolIndex > 0 then
            local itemData = x930192_var_ItemPool[poolIndex]
            if itemData and itemData.varItem == itemId then
                return i
            end
        end
    end
    return nil
end

-- 格式化价格显示
function x930192_FormatPrice(price)
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
function x930192_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    

    
    TalkAppendButton(varMap, x930192_var_FileId, x930192_var_QuestName, 3, -1)
end

-- 事件入口（玩家点击后的处理）
function x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, seleteId)
    local nLevel = GetLevel(varMap, varPlayer)
    if nLevel < x930192_var_LevelLess then
        Msg2Player(varMap, varPlayer, format("人物等级不足%d",x930192_var_LevelLess), 8, 2)
        Msg2Player(varMap, varPlayer, format("人物等级不足%d",x930192_var_LevelLess), 8, 3)
        return
    end

    x930192_CheckAndResetDaily(varMap, varPlayer)
    
    local guid = GetGUID(varMap, varPlayer)
    local refreshTimes = x930192_GetRefreshTimes(varMap, varPlayer)
    local buyTimes = x930192_GetBuyTimes(varMap, varPlayer)
    
    -- 主菜单
    if seleteId == -1 then
        local items = x930192_GetPlayerShopItems(varMap, varPlayer)
        if items then

            -- 检查购买次数
            if buyTimes >= x930192_var_MaxBuyTimes then
                Msg2Player(varMap, varPlayer, "今日购买次数已用完！", 8, 2)
                Msg2Player(varMap, varPlayer, "今日购买次数已用完！", 8, 3)
                return
            end

            -- 检查背包空间
            if GetBagSpace(varMap, varPlayer) < 1 then
                Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 2)
                Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 3)
                return
            end

            -- 删除可能存在的旧任务
            if IsHaveQuestNM(varMap, varPlayer, x930192_var_QuestId) > 0 then
                DelQuest(varMap, varPlayer, x930192_var_QuestId)
            end

            -- 创建伪任务
            AddQuestNM(varMap, varPlayer, x930192_var_QuestId)
            local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930192_var_QuestId)
            SetQuestParam(varMap, varPlayer, varQuestIdx, x930192_MP_ISCOMPLETE, 1)

            -- 保存NPC引用
            x930192_var_PlayerNpc[guid] = varTalknpc

            -- 显示商品选择界面
            x930192_DeliverTalkInfo(varMap, varPlayer, varTalknpc)
            return
        else
            x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, 100)
            return
        end

    end
    
    -- 刷新商品
    if seleteId == 100 then
        if refreshTimes >= x930192_var_MaxRefreshTimes then
            Msg2Player(varMap, varPlayer, "今日刷新次数已用完！", 8, 2)
            Msg2Player(varMap, varPlayer, "今日刷新次数已用完！", 8, 3)
            return
        end

        local refreshCostYin = floor(x930192_var_RefreshCost*(1+refreshTimes/x930192_var_RefreshCostParam))
        if refreshTimes > 0 then--非第1次，要扣钱
            if GetMoney(varMap, varPlayer, 2) < refreshCostYin then
                Msg2Player(varMap, varPlayer, "现金不足，无法刷新！", 8, 2)
                Msg2Player(varMap, varPlayer, "现金不足，无法刷新！", 8, 3)
                return
            end

            if CostMoney(varMap, varPlayer, 2, refreshCostYin) ~= 1 then
                Msg2Player(varMap, varPlayer, "扣除现金失败！", 8, 2)
                Msg2Player(varMap, varPlayer, "扣除现金失败！", 8, 3)
                return
            end
        end

        
        x930192_RefreshShopItems(varMap, varPlayer)
        x930192_SetRefreshTimes(varMap, varPlayer, refreshTimes + 1)
        
        Msg2Player(varMap, varPlayer, "商品已刷新！", 8, 2)
        Msg2Player(varMap, varPlayer, "商品已刷新！", 8, 3)
        
        x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, -1)
        return
    end
end

-- 显示商品选择对话框（使用AddQuestRadioItemBonus）
function x930192_DeliverTalkInfo(varMap, varPlayer, varTalknpc)
    local guid = GetGUID(varMap, varPlayer)
    local items = x930192_GetPlayerShopItems(varMap, varPlayer)
    local refreshTimes = x930192_GetRefreshTimes(varMap, varPlayer)
    local buyTimes = x930192_GetBuyTimes(varMap, varPlayer)
    
    if not items then
        return
    end

    local nextrefreshCostYin = floor(x930192_var_RefreshCost*(1+refreshTimes/x930192_var_RefreshCostParam))
    local nextBufyCost = floor(x930192_var_FirstBuyCost * (1+buyTimes/x930192_var_BuyCostParam))
    
    StartTalkTask(varMap)
    
    TalkAppendString(varMap, "#Y" .. x930192_var_QuestName .. "\n" .. x930192_var_QuestInfo)

    TalkAppendString(varMap, format("\t您的钱袋有：现金#R#{_MONEY%d}#W\n\t今日已刷新：#R%d/%d#W次",GetMoney(varMap, varPlayer, 2),refreshTimes, x930192_var_MaxRefreshTimes))
    TalkAppendString(varMap, format("\t今日已购买：#R%d/%d#W次", buyTimes, x930192_var_MaxBuyTimes))
    TalkAppendString(varMap, format("点击【确定】后#R[购买]#W将扣除对应现金#R#{_MONEY%d}#W；#G[刷新]#W将扣除对应现金#R#{_MONEY%d}#W",nextBufyCost,nextrefreshCostYin))

    -- 使用AddQuestRadioItemBonus添加可选商品
    for i = 1, x930192_var_ItemSlotCount+x930192_var_ItemSlotNeedLock do
        local poolIndex = items[i]
        if poolIndex and poolIndex > 0 then
            local itemData = x930192_var_ItemPool[poolIndex]
            if itemData then
                AddQuestRadioItemBonus(varMap, itemData.varItem, itemData.num)
            end
        end
        if poolIndex and poolIndex == 0 then--说明已经买过了
            AddQuestRadioItemBonus(varMap, x930192_var_buyeditemid, 1)
        end
        if poolIndex and poolIndex == -1 then--说明未解锁
            AddQuestRadioItemBonus(varMap, x930192_var_lockitemid, 1)
        end
    end
    AddQuestRadioItemBonus(varMap, x930192_var_refreshitemid, 1)
    
    StopTalkTask()
    DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x930192_var_FileId, x930192_var_QuestId)
end

-- 接受检查
function x930192_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
    return 1
end

-- 接受处理
function x930192_ProcAccept(varMap, varPlayer)
end
function x930192_ProcQuestAttach(varMap, varPlayer)
end

function x930187_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    Msg2Player(varMap, varPlayer,"x930187_ProcQuestAccept",8,3)
    Msg2Player(varMap, varPlayer,"x930187_ProcQuestAccept",8,2)

end


-- 检查提交
function x930192_CheckSubmit(varMap, varPlayer, varTalknpc)
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930192_var_QuestId)
    if varHaveQuest > 0 then
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930192_var_QuestId)
        return GetQuestParam(varMap, varPlayer, varQuestIdx, x930192_MP_ISCOMPLETE)
    end
    return 0
end


--解锁格子
function x930192_unlockslot(varMap, varPlayer)
    local hasUnlock = x930192_GetUnlockTimes(varMap, varPlayer) or 0
    local items = x930192_GetPlayerShopItems(varMap, varPlayer)
    if hasUnlock >= getn(x930192_var_keys) then
        Msg2Player(varMap, varPlayer, "您已经全部解锁了！", 8, 2)
        Msg2Player(varMap, varPlayer, "您已经全部解锁了！", 8, 3)
        return
    end

    local keyitem = x930192_var_keys[hasUnlock+1]
    if GetItemCount( varMap, varPlayer, keyitem.id ) < 1 then
        Msg2Player(varMap, varPlayer, format("您没有%s无法解锁",keyitem.name), 8, 2)
        Msg2Player(varMap, varPlayer, format("您没有%s无法解锁",keyitem.name), 8, 3)
        return
    end

    if DelItem(varMap,varPlayer,keyitem.id,1) ~= 1 then
        Msg2Player(varMap, varPlayer, format("扣除%s失败",keyitem.name), 8, 2)
        Msg2Player(varMap, varPlayer, format("扣除%s失败",keyitem.name), 8, 3)
        return
    end
    x930192_SetUnlockTimes(varMap, varPlayer, hasUnlock+1)

    -- 标记该商品为已购买（设为0）
    items[x930192_var_ItemSlotCount+hasUnlock+1] = 0
    x930192_SetStoredItems(varMap, varPlayer, items)
    x930192_var_PlayerShopItems[GetGUID(varMap, varPlayer)] = items

end

-- 任务提交处理（核心：处理玩家选择的商品）
function x930192_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

    local guid = GetGUID(varMap, varPlayer)
    local items = x930192_GetPlayerShopItems(varMap, varPlayer)
    
    if not items then
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        Msg2Player(varMap, varPlayer, "商品数据异常，请重新刷新！", 8, 2)
        return
    end
    
    -- varRadioSelected 是玩家选择的物品ID
    local selectedItemId = varRadioSelected

    if selectedItemId == x930192_var_refreshitemid then
        --选择了最后一个，需要刷新
        -- 删除伪任务
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, 100)
        return
    end

    if selectedItemId == x930192_var_buyeditemid then
        --选择了已经购买的
        Msg2Player(varMap, varPlayer, "已经买过了", 8, 2)
        Msg2Player(varMap, varPlayer, "已经买过了", 8, 3)
        x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, -1)
        return
    end

    if selectedItemId == x930192_var_lockitemid then
        --要解锁格子
        DelQuest(varMap, varPlayer, x930192_var_QuestId)

        x930192_unlockslot(varMap, varPlayer)
        x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, -1)
        return
    end

    -- 找到对应的商品池索引
    local poolIndex = x930192_FindItemPoolIndex(selectedItemId)
    if not poolIndex then
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        Msg2Player(varMap, varPlayer, "所选物品不存在！", 8, 2)
        return
    end
    
    -- 检查该物品是否在玩家当前商品列表中
    local slotIndex = x930192_FindPlayerSlotByItemId(items, selectedItemId)
    if not slotIndex then
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        Msg2Player(varMap, varPlayer, "该商品已售罄或不在当前列表中！", 8, 2)
        return
    end
    
    local itemData = x930192_var_ItemPool[poolIndex]
    
    -- 再次检查购买次数
    local buyTimes = x930192_GetBuyTimes(varMap, varPlayer)
    if buyTimes >= x930192_var_MaxBuyTimes then
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        Msg2Player(varMap, varPlayer, "今日购买次数已用完！", 8, 2)
        Msg2Player(varMap, varPlayer, "今日购买次数已用完！", 8, 3)
        return
    end
    
    -- 检查背包空间
    if GetBagSpace(varMap, varPlayer) < 1 then
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 2)
        Msg2Player(varMap, varPlayer, "背包空间不足！", 8, 3)
        return
    end

    local nextBufyCost = floor(x930192_var_FirstBuyCost * (1+buyTimes/x930192_var_BuyCostParam))
    
    -- 检查现金是否足够
    if GetMoney(varMap, varPlayer, 2) < nextBufyCost then
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        Msg2Player(varMap, varPlayer, format("现金不足！需要#R#{_MONEY%d}#W", nextBufyCost), 8, 2)
        Msg2Player(varMap, varPlayer, format("现金不足！需要#R#{_MONEY%d}#W", nextBufyCost), 8, 3)
        x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, -1)
        return
    end
    
    -- 扣除现金
    if CostMoney(varMap, varPlayer, 2, nextBufyCost) ~= 1 then
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        Msg2Player(varMap, varPlayer, "扣除现金失败！", 8, 2)
        Msg2Player(varMap, varPlayer, "扣除现金失败！", 8, 3)
        x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, -1)
        return
    end
    
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
        
        -- 增加购买次数
        x930192_SetBuyTimes(varMap, varPlayer, buyTimes + 1)
        
        -- 标记该商品为已购买（设为0）
        items[slotIndex] = 0
        x930192_SetStoredItems(varMap, varPlayer, items)
        x930192_var_PlayerShopItems[guid] = items
        
        Msg2Player(varMap, varPlayer, format("购买成功！花费%s，获得%s x%d", x930192_FormatPrice(itemData.price), itemData.varName, itemData.num), 8, 2)
        Msg2Player(varMap, varPlayer, format("购买成功！花费%s，获得%s x%d", x930192_FormatPrice(itemData.price), itemData.varName, itemData.num), 8, 3)
        
        GamePlayScriptLog(varMap, varPlayer, 930192)
    else
        -- 退还现金
        AddMoney(varMap, varPlayer, 2, nextBufyCost)
        Msg2Player(varMap, varPlayer, "物品发放失败，已退还现金！", 8, 2)
    end
    
    -- 删除伪任务
    DelQuest(varMap, varPlayer, x930192_var_QuestId)

    x930192_ProcEventEntry(varMap, varPlayer, varTalknpc, 0, -1)
end

-- 任务放弃
function x930192_ProcQuestAbandon(varMap, varPlayer, varQuest)
    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930192_var_QuestId)
    if varHaveQuest > 0 then
        DelQuest(varMap, varPlayer, x930192_var_QuestId)
        Msg2Player(varMap, varPlayer, x930192_var_strQuestAbandon, 8, 2)
    end
end

-- ============================================================================
-- 其他必要的空函数
-- ============================================================================

function x930192_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x930192_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end

function x930192_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end

function x930192_ProcContinue(varMap, varPlayer, varTalknpc)
end
