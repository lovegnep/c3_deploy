





x930154_var_FileId 		= 930154

x930154_var_LevelMin		=	30


x930154_var_items = {
    {id = 10301000, num = 1, name = "狩魔猎人（1小时）",prob=1000,price=1},
    {id = 10301003, num = 1, name = "决战八方（1小时）",prob=1000,price=1},
    {id = 10301004, num = 1, name = "决战八方（10小时）",prob=500,price=1},
    {id = 10301001, num = 1, name = "狩魔猎人（10小时）",prob=500,price=1},
    {id = 10306099, num = 1, name = "龙胆经验时装（14天）",prob=500,price=10},
    {id = 10306103, num = 1, name = "经验时装（7天）",prob=500,price=10},
    {id = 10301002, num = 1, name = "狩魔猎人（1天）",prob=100,price=10},
    {id = 10301005, num = 1, name = "决战八方（1天）",prob=100,price=10},
    {id = 10306147, num = 1, name = "决战八方（15天）",prob=50,price=10},
    {id = 10306150, num = 1, name = "狩魔猎人（15天）",prob=50,price=10},
    {id = 10306146, num = 1, name = "狩魔猎人（30天）",prob=10,price=100},
    {id = 10306145, num = 1, name = "狩魔猎人（60天）",prob=10,price=1000},
}



function x930154_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930154_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930154_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930154_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930154_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930154_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930154_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then

        -- 先求总概率
        local totalProb = 0
        for i, iter in x930154_var_items do
            local prob = iter.prob
            totalProb = totalProb + prob
        end
        local result = random( 1, totalProb)

        local top = 1
        local bottom = 1
        local itemIndex = 1
        for varI, item in x930154_var_items do
            local prob = item.prob
            top = top + prob
            if result >= bottom and result < top then
                itemIndex = varI
                break
            end
            bottom = bottom + prob
        end

        local itemselect = x930154_var_items[itemIndex]

        StartItemTask(varMap)
        ItemAppendBind( varMap, itemselect.id, itemselect.num)

        local varRet = StopItemTask(varMap,varPlayer)
        if varRet > 0 then
            DeliverItemListSendToPlayer(varMap,varPlayer)
            Msg2Player(varMap, varPlayer,"发放奖励完成",8,3)
            GamePlayScriptLog( varMap, varPlayer, 2670)

            if itemselect.price >= 10 then
                --上电视
                LuaAllScenceM2Wrold( varMap, format( "恭喜%s打开绝世时装大礼包获得了%s", GetName( varMap, varPlayer), itemselect.name), 5, 1)
            end

        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"物品栏已满，无法获得物品！")
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
        end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x930154_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
