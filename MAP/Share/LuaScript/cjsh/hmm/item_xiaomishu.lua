





x930170_var_FileId 		= 930170

x930170_var_LevelMin		=	-1

x930170_var_userec={}




function x930170_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930170_ProcIsSpellLikeScript( varMap, varPlayer)
    return 1;
end






function x930170_ProcCancelImpacts( varMap, varPlayer )
    return 0;
end






function x930170_ProcConditionCheck( varMap, varPlayer )



    if(1~=VerifyUsedItem(varMap, varPlayer)) then
        return 0
    end
    return 1;
end



function x930170_auto(varMap, varPlayer)

    --处理各种材料，初级矿石 甘草
    local cailiao = {11020001,11020002,11020006,11020007,11020010,11020011,11020014,11020015,11020501,11020502,11030001,11030003,11030005,11030007,
                     11030401,11030402,11030403,11030404,11030405,11030406,11030501,11030502}
    for varI, item in cailiao do
        local Num = GetItemCount( varMap, varPlayer, item )
        if Num > 0 and Num < 100 then
            DelItem(varMap,varPlayer,item,Num)
        end
    end

    --处理银锭
    local bHaveImpact1 = IsHaveSpecificImpact( varMap, varPlayer, 9011 )
    local bHaveImpact2 = IsHaveSpecificImpact( varMap, varPlayer, 9012 )
    local bHaveImpact3 = IsHaveSpecificImpact( varMap, varPlayer, 9013 )
    local yindin = {11960011,11960012}
    for varI, item in yindin do
        local Num = GetItemCount( varMap, varPlayer, item )
        if Num > 0 then
            if DelItem(varMap,varPlayer,item,Num) == 1 then
                if bHaveImpact1 >0 or bHaveImpact2 >0 or bHaveImpact3 > 0 then
                    --现银
                    AddMoney( varMap, varPlayer, 0, 5*Num*1000)
                    Msg2Player(varMap,varPlayer,format("获得现银%d两",5*Num),8,2)
                    Msg2Player(varMap,varPlayer,format("获得现银%d两",5*Num),8,3)
                else
                    --银卡
                    AddMoney( varMap, varPlayer, 1, 5*Num*1000)
                    Msg2Player(varMap,varPlayer,format("获得银卡%d两",5*Num),8,2)
                    Msg2Player(varMap,varPlayer,format("获得银卡%d两",5*Num),8,3)
                end


            end
        end
    end

    --处理各种换银道具
    local yindj = {
        {id=11960001,price=93},
        {id=11960002,price=140},
        {id=11960003,price=233},
        {id=11960004,price=373},
        {id=11960005,price=513},
        {id=11960006,price=653},
        {id=11960007,price=793},
        {id=11960008,price=933},
        {id=11960009,price=1167},
        {id=11960010,price=1540},
    }
    for varI, item in yindj do
        local Num = GetItemCount( varMap, varPlayer, item.id )
        if Num > 0 then
            if DelItem(varMap,varPlayer,item.id,Num) == 1 then
                local nMoney = Num*item.price
                AddMoney(varMap, varPlayer, 0, nMoney)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现银", nMoney),4,3)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现银", nMoney),4,2)
            end
        end
    end

    --处理金卡
    local jinsha = {12030044,12030094,12030056}--金砂
    local jintiao = {12030045,12030057,12030095}--金条
    local jinyuanbao = {12030046,12030058,12030096}--金元宝
    local jinzhuan = {12030047,12030059,12030097}--金砖
    local baijin = {12030048}--百两金卡红包

    for varI, item in jinsha do
        local Num = GetItemCount( varMap, varPlayer, item )
        if Num > 0 then
            if DelItem(varMap,varPlayer,item,Num) == 1 then
                local nMoney = 1*Num*1000
                AddMoney(varMap, varPlayer, 3, nMoney)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,2)
            end
        end
    end
    for varI, item in jintiao do
        local Num = GetItemCount( varMap, varPlayer, item )
        if Num > 0 then
            if DelItem(varMap,varPlayer,item,Num) == 1 then
                local nMoney = 2*Num*1000
                AddMoney(varMap, varPlayer, 3, nMoney)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,2)
            end
        end
    end
    for varI, item in jinyuanbao do
        local Num = GetItemCount( varMap, varPlayer, item )
        if Num > 0 then
            if DelItem(varMap,varPlayer,item,Num) == 1 then
                local nMoney = 5*Num*1000
                AddMoney(varMap, varPlayer, 3, nMoney)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,2)
            end
        end
    end
    for varI, item in jinzhuan do
        local Num = GetItemCount( varMap, varPlayer, item )
        if Num > 0 then
            if DelItem(varMap,varPlayer,item,Num) == 1 then
                local nMoney = 10*Num*1000
                AddMoney(varMap, varPlayer, 3, nMoney)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,2)
            end
        end
    end
    for varI, item in baijin do
        local Num = GetItemCount( varMap, varPlayer, item )
        if Num > 0 then
            if DelItem(varMap,varPlayer,item,Num) == 1 then
                local nMoney = 100*Num*1000
                AddMoney(varMap, varPlayer, 3, nMoney)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
                Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,2)
            end
        end
    end

    --处理现金5两
    LuaCallNoclosure( 588046, "Procautousexj4", varMap, varPlayer)

    --处理现金10两
    LuaCallNoclosure( 588038, "Procautousexj1", varMap, varPlayer)

    --处理现金500两
    LuaCallNoclosure( 588039, "Procautousexj2", varMap, varPlayer)

    --处理小帮会经验包
    LuaCallNoclosure( 930138, "Procautouseguildbao", varMap, varPlayer)

    --初级荣誉卡
    LuaCallNoclosure( 418570, "Procautouseryk", varMap, varPlayer)

    --声望卡
    LuaCallNoclosure( 417006, "Procautouseshengwang", varMap, varPlayer)

    --马币包
    LuaCallNoclosure( 930131, "Procautousemabibao", varMap, varPlayer)

    --征服包
    LuaCallNoclosure( 930132, "Procautousezhenfbao", varMap, varPlayer)

    --初级威望卡
    LuaCallNoclosure( 418569, "Procautouseweiwbao", varMap, varPlayer)

    --先兑换羊皮包
    LuaCallNoclosure( 570106, "Autoexchange", varMap, varPlayer)

    --宾利大礼包
    LuaCallNoclosure( 310930, "Procautousebinli", varMap, varPlayer)


end



function x930170_ProcDeplete( varMap, varPlayer )

    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    local result = 1

    if curTimes <= 1 then

        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end

    else

        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
        result = 0
    end

    x930170_auto(varMap, varPlayer)

    return result
end









function x930170_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x930170_ProcActivateEachTick( varMap, varPlayer)
    return 1;
end



