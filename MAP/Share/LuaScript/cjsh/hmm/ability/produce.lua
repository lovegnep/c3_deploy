-- 脚本ID，需要与配方表中的 m_ScriptID 对应
x930207_var_FileId = 930207

-- 检查是否可以制作
function x930207_AbilityCheck(varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "x930207_AbilityCheck", 8, 3)
    Msg2Player( varMap, varPlayer, "x930207_AbilityCheck", 8, 2)

    -- 检查条件
    return 0  -- 返回0表示可以制作
end

-- 消耗材料
function x930207_AbilityConsume(varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "x930207_AbilityConsume", 8, 3)
    Msg2Player( varMap, varPlayer, "x930207_AbilityConsume", 8, 2)
    -- 自定义消耗逻辑
end

-- ★ 制作成功后的回调 - 这里添加你的处理逻辑
function x930207_AbilityProduce(varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "x930207_AbilityProduce", 8, 3)
    Msg2Player( varMap, varPlayer, "x930207_AbilityProduce", 8, 2)
    -- 获取制作出的道具
    -- 增加活力恢复速度或活力上限
    -- 例如:
    -- local currentVigorMax = GetPlayerVigorMax(varMap, varPlayer)
    -- SetPlayerVigorMax(varMap, varPlayer, currentVigorMax + 10)

    TipsToPlayer(varMap, varPlayer, "#Y制作成功！活力上限提升了！")
    return 0
end
