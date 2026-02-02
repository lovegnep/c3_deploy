


x930208_var_FileId 					= 930208


--胜利方奖励的道具
x930208_var_winneritems = {
    {id=11000380,name="稀世奇珍兑换卷",num=1},
    {id=12266663,name="英勇勋章",num=5},
    {id=12266664,name="王者勋章",num=5},
    {id=12266663,name="英勇勋章",num=5},
    {id=12266664,name="王者勋章",num=5},
    {id=12266663,name="英勇勋章",num=5},
    {id=12266664,name="王者勋章",num=5},
}
function x930208_ProcWin( varMap, varPlayer)
    -- 发放物品
    local item = x930208_var_winneritems[random(1,getn(x930208_var_winneritems))]

    StartItemTask(varMap)
    ItemAppendBind(varMap, item.id, item.num)

    local varRet = StopItemTask(varMap, varPlayer)
    if varRet > 0 then
        DeliverItemListSendToPlayer(varMap, varPlayer)
        Msg2Player(varMap, varPlayer, format("获得%d个@item_%d", item.num, item.id), 8, 2)
        Msg2Player(varMap, varPlayer, format("获得%d个@item_%d", item.num, item.id), 8, 3)
    end
end


