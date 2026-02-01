-- 脚本ID，需要与配方表中的 m_ScriptID 对应
x930207_var_FileId = 930207

x930207_var_item = {
    id=14030001,name="初级黄刚玉",num=1,presid=53,abilityid=2,abilitylevel=1,energy=30,exp=9,need={
        {id=11030001,num=9},
        {id=11030601,num=1},
    }
}

-- 检查是否可以制作
--为什么要检查两次？
--第1次检查（CanUseSkill 函数，行96-103）：
--玩家点击制作按钮时检查
--验证是否满足制作条件才开始读条
--第2次检查（OnEvent_ProcOver 函数，行229-236）：
--玩家读条完成后再次检查
--防止在读条期间条件发生变化（比如：材料被丢弃、背包满了、活力不足等）
--所以该函数会被调用2次
function x930207_AbilityCheck(varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "x930207_AbilityCheck", 8, 3)
    Msg2Player( varMap, varPlayer, "x930207_AbilityCheck", 8, 2)

    for k, item in x930207_var_item.need do
        if GetItemCount( varMap, varPlayer, item.id ) < item.num then
            --不可以制作
            return 1
        end
    end

    if GetPlayerVigor(varMap, varPlayer) < x930207_var_item.energy then
        return 1
    end

    -- 检查条件
    return 0  -- 返回0表示可以制作
end

-- 消耗材料
function x930207_AbilityConsume(varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "x930207_AbilityConsume", 8, 3)
    Msg2Player( varMap, varPlayer, "x930207_AbilityConsume", 8, 2)
    -- 自定义消耗逻辑
    for k, item in x930207_var_item.need do
        DelItem(varMap,varPlayer,item.id,item.num)
    end

    local cur = GetPlayerVigor(varMap, varPlayer)
    cur = cur - x930207_var_item.energy
    SetPlayerVigor(varMap, varPlayer,  cur )

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

    StartItemTask(varMap)
    ItemAppendBind( varMap, x930207_var_item.id, x930207_var_item.num)
    local ret = StopItemTask(varMap,varPlayer)
    if ret > 0 then
        varMsg =format("成功制作出%d个@item_%d",x930207_var_item.num,  x930207_var_item.id)
        Msg2Player( varMap,varPlayer,varMsg,8,2) ;
        Msg2Player( varMap,varPlayer,varMsg,8,3) ;
        DeliverItemListSendToPlayer( varMap, varPlayer)
    else
        Msg2Player( varMap, varPlayer, "无法获得物品，请整理道具栏", 8, 3)
    end

    -- ★★★ 关键：发送成功消息，否则无法批量制作 ★★★
    local abilityId = 7   -- 生活技能ID（珠宝术=7）
    local presId = xxx    -- 配方ID
    SendAbilitySuccessMsg(varMap, varPlayer, x930207_var_item.abilityid, x930207_var_item.presid, x930207_var_item.id)


    TipsToPlayer(varMap, varPlayer, "#Y制作成功")
    return 0
end
