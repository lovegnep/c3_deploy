

x930151_var_FileId 					= 930151

--如果背包内有特殊道具时的倍率
x930151_var_beilu = 4

x930151_var_OrdinarySeedTable         = {
                                        { useCount = 1,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 2,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 3,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 4,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 5,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 6,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 7,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 8,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 9,  deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 10, deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 11, deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 12, deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 13, deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 14, deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 15, deplete = 3, scoreDown = 400, scoreUp = 1000 },
                                        { useCount = 16, deplete = 3, scoreDown = 400, scoreUp = 1000 },
}

x930151_var_SeedTable					= {
                                        { varItem = 11010016, buttonId = 1, maxTimes = 99999, useMode = 0, tableid = x930151_var_OrdinarySeedTable, actName = "黄金许愿",
                                          dayMD = MD_HOPESEED_DAY,     timesMD = MD_GOLDHOPESEED_TIMES, varName = "【活动】黄金节日许愿" },
                                        { varItem = 11010018, buttonId = 2, maxTimes = 1, useMode = 1, tableid = x930151_var_OrdinarySeedTable, actName = "黄金祈福",
                                         dayMD = MD_LUCKSEED_DAY,     timesMD = MD_LUCKSEED_TIMES,     varName = "【活动】黄金节日祈福" },
}
x930151_var_shizhuang = {
    {varItem=       10300000        ,probability=   60     , price=        45       ,varName="练舞服", num = 1, doubleID=12274050},
    {varItem=       10300001        ,probability=   60     , price=        45       ,varName="狂舞服", num = 1, doubleID=12274050},
    {varItem=       10300010        ,probability=   60     , price=        45       ,varName="天舞服", num = 1, doubleID=12274050},
    {varItem=       10300011        ,probability=   60     , price=        45       ,varName="威武2装", num = 1, doubleID=12274050},
    {varItem=       10300100        ,probability=   60     , price=        45       ,varName="王者套装", num = 1, doubleID=12274050},
    {varItem=       10300101        ,probability=   60     , price=        45       ,varName="剑龙超炫外装", num = 1, doubleID=12274050},
    {varItem=       10300102        ,probability=   60     , price=        45       ,varName="绝版成吉思汗套装", num = 1, doubleID=12274050},
    {varItem=       10300103        ,probability=   60     , price=        45       ,varName="屠龙外装", num = 1, doubleID=12274050},
    {varItem=       10300104        ,probability=   60     , price=        45       ,varName="突厥时装", num = 1, doubleID=12274050},
    {varItem=       10300105        ,probability=   60     , price=        45       ,varName="成吉思汗公测纪念装", num = 1, doubleID=12274050},
    {varItem=       10300106        ,probability=   60     , price=        45       ,varName="黄金外装", num = 1, doubleID=12274050},
    {varItem=       10300107        ,probability=   60     , price=        45       ,varName="七夕时装", num = 1, doubleID=12274050},
    {varItem=       10300108        ,probability=   60     , price=        45       ,varName="1天初级攻装", num = 1, doubleID=12274050},
    {varItem=       10300109        ,probability=   60     , price=        45       ,varName="7天初级攻装", num = 1, doubleID=12274050},
    {varItem=       10300110        ,probability=   60     , price=        45       ,varName="30天初级攻装", num = 1, doubleID=12274050},
    {varItem=       10300111        ,probability=   60     , price=        45       ,varName="苗疆时装(1天)", num = 1, doubleID=12274050},
    {varItem=       10300112        ,probability=   60     , price=        45       ,varName="苗疆时装(7天)", num = 1, doubleID=12274050},
    {varItem=       10300113        ,probability=   60     , price=        45       ,varName="苗疆时装(30天)", num = 1, doubleID=12274050},
    {varItem=       10300114        ,probability=   60     , price=        45       ,varName="刺陵时装(1天)", num = 1, doubleID=12274050},
    {varItem=       10300115        ,probability=   60     , price=        45       ,varName="刺陵时装(7天)", num = 1, doubleID=12274050},
}
x930151_var_LuckySeedTable            = {
                                        
                                        { varItem = 11000552, probability = 500, price = 1, varName = "完美星辰",          num = 1},
                                        { varItem = 11000304, probability = 500, price = 1, varName = "残破的神兵之魂",     num = 1     },
                                        { varItem = 11000317, probability = 1500, price = 1, varName = "星魄碎片",    num = 1      },
                                        --{ varItem = 11000334, probability = 5000, price = 45, varName = "战神令",     num = 1       },
                                        { varItem = 11000325, probability = 5000,  price = 1,    varName = "龙之谷晶石",    num = 1     },
                                        { varItem = 11000328, probability = 5000,  price = 1,    varName = "四彩护身符碎片",    num = 1     },
                                        { varItem = 11000339, probability = 5000,  price = 1,    varName = "红心A",     num = 1  },
                                        { varItem = 11000380, probability = 100,  price = 45,    varName = "稀世奇珍兑换卷",     num = 1 , doubleID=12274051 },
                                        { varItem = 11000381, probability = 500,  price = 1,    varName = "暗影四彩护身符碎片",       num = 1   , doubleID=12274051 },
                                        --{ varItem = 11000333, probability = 500,  price = 45,    varName = "战神王牌兑换券",       num = 1   },
                                        { varItem = 12271412, probability = 500,  price = 1,    varName = "迷你坐骑碎片",    num = 1      },
                                        { varItem = 11970023, probability = 600,  price = 1,    varName = "黄金乱士符",     num = 1    },
                                        { varItem = 11000151, probability = 100,  price = 45,    varName = "龙骨解玉钻",    num = 1   , doubleID=12274052  },
                                        { varItem = 11000159, probability = 100,  price = 45,    varName = "天权镶玉钻",    num = 1   , doubleID=12274052   },
                                        { varItem = 11000166, probability = 100,  price = 45,    varName = "绿龙镂玉钻",    num = 1   , doubleID=12274052   },
                                        {varItem=       0        ,probability=   10     , price=        45       ,varName="时装", num = 1, doubleID=12274050},

                                        {varItem=       12400418        ,probability=   10     , price=        45       ,varName="低级鬼兵", num = 100},
}



x930151_var_MaxScore                  = 999000

--许愿受贵族等级影响系数
x930151_var_VIPNUM = 5


function x930151_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetLevel( varMap, varPlayer) < 40 then
        return
    end

    local day = GetDayOfYear()


    if day >= 1 then
	    for varI, iter in x930151_var_SeedTable do
	        TalkAppendButton( varMap, x930151_var_FileId, iter.varName, 3, iter.buttonId)
	    end
    end
    
end




function x930151_ProcEventEntry( varMap, varPlayer, varTalknpc, varState, varIndex)
    if varIndex >= 1 and varIndex <= 2 then
        local strInfo = ""
        local strInfo1 = ""
        local strInfo2 = ""
        local strInfo3 = ""
        local strTitle = "#Y"..x930151_var_SeedTable[ varIndex].varName

        if GetDayOfYear() ~= GetPlayerGameData( varMap, varPlayer, x930151_var_SeedTable[ varIndex].dayMD[ 1], x930151_var_SeedTable[ varIndex].dayMD[ 2], x930151_var_SeedTable[ varIndex].dayMD[ 3] ) then
            SetPlayerGameData( varMap, varPlayer, x930151_var_SeedTable[ varIndex].timesMD[ 1], x930151_var_SeedTable[ varIndex].timesMD[ 2], x930151_var_SeedTable[ varIndex].timesMD[ 3], 0)
            SetPlayerGameData( varMap, varPlayer, x930151_var_SeedTable[ varIndex].dayMD[ 1],   x930151_var_SeedTable[ varIndex].dayMD[ 2],   x930151_var_SeedTable[ varIndex].dayMD[ 3], GetDayOfYear() )
        end
        if x930151_var_SeedTable[ varIndex].useMode == 0 then
            --贵族等级
            local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
            local maxCount = nLevelPre * x930151_var_VIPNUM + x930151_var_SeedTable[ varIndex].maxTimes
            local oldCount = x930151_var_SeedTable[ varIndex].maxTimes;
            local addCount = nLevelPre * x930151_var_VIPNUM

            local needSeed = GetPlayerGameData( varMap, varPlayer, x930151_var_SeedTable[ varIndex].timesMD[ 1], x930151_var_SeedTable[ varIndex].timesMD[ 2], x930151_var_SeedTable[ varIndex].timesMD[ 3] ) + 1
            if  needSeed > maxCount then
                StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y许愿种子" )
                TalkAppendString( varMap, "\n\t许愿种子，代表着真诚的许诺和美好的愿望，使用黄金许愿种子后，可以让好运一直伴随在你的身边。" )
                TalkAppendString( varMap, format("\n\t许愿种子每天最多可以许愿#R%d#W+#R%d(vip%d级)#W次。#r", oldCount,addCount,nLevelPre ) )
                TalkAppendString( varMap, format("\t您今日已经许愿#R%d#W次了，请明日再来。",maxCount) )
                StopTalkTask()
                DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                return
            end
            strInfo = "\t许愿种子，代表着真诚的许诺和美好的愿望，使用许愿种子后，可以让好运一直伴随在你的身边。"
            strInfo1 = format( "#G小提示:#G\n\t节日许愿每天可进行#R%d#W+#R%d(vip%d级)#W次许愿，每次需要三个黄金许愿种子。\t\n\t#W您现在是第#R%d#W次使用，需要#R3#W个@item_%d#W。", oldCount,addCount,nLevelPre,needSeed, x930151_var_SeedTable[ varIndex].varItem)
            strInfo2 = "#Y奖励内容:#W\n\t活动积分"

            StartTalkTask( varMap)
            TalkAppendString( varMap, strTitle)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo1)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo2)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo3)
            SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)
            StopTalkTask()
            DeliverTalkInfo( varMap, varPlayer, varTalknpc, x930151_var_FileId, -1)
        else
            strInfo = "\t黄金祈福种子，代表着衷心的祈祷和善意的祝福，使用黄金祈福种子之后，有可能会获得神秘的礼物哦。"
            strInfo1 = format( "#G小提示:\n\t#G每天都可以进行祈福，每次祈福需要一个黄金祈福种子，黄金祈福种子可以从活动大使处购得。\t\n\t\n\t#W您是否要使用#R1#W个@item_%d#W?", x930151_var_SeedTable[ varIndex].varItem)
            strInfo2 = "#Y奖励内容:\n\t#W\神秘道具"

            -- 先求总概率
            local totalProb = 0
            for i, iter in x930151_var_LuckySeedTable do
                local prob = iter.probability
                if iter.price >= 45 then
                    if iter.doubleID and iter.doubleID > 0 then
                        local varCount = GetItemCountInBag( varMap, varPlayer, iter.doubleID)
                        if varCount > 0 then
                            prob = prob *x930151_var_beilu
                        end
                    end
                end
                totalProb = totalProb + prob
            end


            local str = ""
            local num = 0


            StartTalkTask( varMap)
            TalkAppendString( varMap, strTitle)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo)
            TalkAppendString( varMap, strInfo1)

            for i, iter in x930151_var_LuckySeedTable do
                if iter.price >= 45 then
                    local prob = iter.probability
                    if iter.doubleID and iter.doubleID > 0 then
                        local varCount = GetItemCountInBag( varMap, varPlayer, iter.doubleID)
                        if varCount > 0 then
                            prob = prob *x930151_var_beilu
                        end
                    end
                    str = str..format("#R%d#W个#G%s#W，概率%d/10000\n", iter.num, iter.varName,floor(prob*10000/totalProb))
                    num = num+1
                    if mod(num,15)==0 then
                        TalkAppendString( varMap, str )
                        str = ""
                    end
                end
            end
            if str ~= "" then
                TalkAppendString( varMap, str )
            end
            SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)
            StopTalkTask()
            DeliverTalkInfo( varMap, varPlayer, varTalknpc, x930151_var_FileId, -1)
        end

    end
end


function x930151_CheckUseTimes( varMap, varPlayer, dayMD, timesMD, maxTimes)
    local result = 1

    if GetDayOfYear() == GetPlayerGameData( varMap, varPlayer, dayMD[ 1], dayMD[ 2], dayMD[ 3] ) then
        if GetPlayerGameData( varMap, varPlayer, timesMD[ 1], timesMD[ 2], timesMD[ 3] ) >= maxTimes then
            result = 0
        end
    else
        SetPlayerGameData( varMap, varPlayer, timesMD[ 1], timesMD[ 2], timesMD[ 3], 0)
    end

    return result
end




function x930151_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)



    --贵族等级
    local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
    local maxCount = nLevelPre * x930151_var_VIPNUM

    for varI, iter in x930151_var_SeedTable do
        if varIndex == iter.buttonId then
            
            local varCount = GetItemCountInBag( varMap, varPlayer, iter.varItem)
            if varCount == 0 then
                Msg2Player( varMap, varPlayer, format( "您没有@item_%d", iter.varItem), 8, 3)
                return
            end

            maxCount = maxCount+iter.maxTimes
            if iter.useMode == 0 and x930151_CheckUseTimes( varMap, varPlayer, iter.dayMD, iter.timesMD, maxCount) == 0 then
                Msg2Player( varMap, varPlayer, format( "您今天%s次数已达%d次，不能继续%s", iter.maxTimes,iter.actName, iter.actName), 8, 3)
                return
            end
            local needSeed = GetPlayerGameData( varMap, varPlayer, iter.timesMD[ 1], iter.timesMD[ 2], iter.timesMD[ 3] ) + 1
            if needSeed > 16 then
                needSeed = 1
            end
            if iter.useMode == 0 and varCount < iter.tableid[ needSeed].deplete then
                Msg2Player( varMap, varPlayer, format( "您的@item_%d#cffcc00不足#R%d#cffcc00颗，无法%s", iter.varItem, iter.tableid[ needSeed].deplete, iter.actName), 8, 3)
                return
            end
            local score = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )

            if iter.useMode == 1 then
                -- 祈福获取道具
				for varI = 0, 100 do

					-- 先求总概率
					local totalProb = 0
					for i, iter in x930151_var_LuckySeedTable do
                        local prob = iter.probability
                        if iter.price >= 45 then
                            if iter.doubleID and iter.doubleID > 0 then
                                local varCount1 = GetItemCountInBag( varMap, varPlayer, iter.doubleID)
                                if varCount1 > 0 then
                                    prob = prob *x930151_var_beilu
                                end
                            end
                        end
						totalProb = totalProb + prob
					end
					local result = random( 1, totalProb)
					
					local top = 1
					local bottom = 1
					local itemIndex = 1
					for varI, item in x930151_var_LuckySeedTable do
                        local prob = item.probability
                        if item.price >= 45 then
                            if item.doubleID and item.doubleID > 0 then
                                local varCount2 = GetItemCountInBag( varMap, varPlayer, item.doubleID)
                                if varCount2 > 0 then
                                    prob = prob *x930151_var_beilu
                                end
                            end
                        end

						top = top + prob
						if result >= bottom and result < top then
							itemIndex = varI
							break
						end
						bottom = bottom + prob
					end
                    local itemInfo = x930151_var_LuckySeedTable[ itemIndex]
                    if itemInfo.varItem == 0 then
                        itemInfo = x930151_var_shizhuang[random(1,getn(x930151_var_shizhuang))]
                    end
					local varItem = itemInfo.varItem
					local isBind = 0
					local bagPos = 0
					for varI = 0, 108 do
						local varId = GetItemIDByIndexInBag( varMap, varPlayer, varI)
						if varId == iter.varItem then
							if IsItemBind( varMap, varPlayer, varI) > 0 then
								isBind = 1
								bagPos = varI
								break
							end
						end
					end
					local broadcast = 0
					local itemname = ""
					if itemInfo.price >= 45 then
						broadcast = 1
						itemname = itemInfo.varName
					end
					StartItemTask( varMap)
                    local count = itemInfo.num
					if isBind == 1 then
						ItemAppendBind( varMap, varItem, count)
					else
						ItemAppend( varMap, varItem, count)
					end
					if GetBagSpace( varMap, varPlayer) > 0 and StopItemTask( varMap, varPlayer) > 0 then
						if isBind == 1 then
						if DelItemByIndexInBag( varMap, varPlayer, bagPos, 1) == 0 then
							Msg2Player( varMap, varPlayer, format( "提交@item_%d#cffcc00失败", iter.varItem), 8, 3)
							return
							end
						else
							if DelItem( varMap, varPlayer, iter.varItem, 1) == 0 then
								Msg2Player( varMap, varPlayer, format( "提交@item_%d#cffcc00失败", iter.varItem), 8, 3)
								return
							end
						end
						DeliverItemListSendToPlayer( varMap, varPlayer)
						Msg2Player( varMap, varPlayer, format( "您获得了%d个@item_%d#cffcc00。", count,varItem), 8, 3)
						Msg2Player( varMap, varPlayer, format( "您获得了%d个@item_%d#cffcc00。", count,varItem), 8, 2)
						StartTalkTask( varMap)
                        TalkAppendString( varMap, "#Y"..iter.varName)
                        TalkAppendString( varMap, format( "\n您获得了@item_%d#W。", varItem) )
						StopTalkTask()
						DeliverTalkMenu( varMap, varPlayer, varTalknpc)
						if broadcast == 1 then
							LuaAllScenceM2Wrold( varMap, format( "恭喜%s使用黄金祈福种子获得了%s", GetName( varMap, varPlayer), itemname), 5, 1)
						end

						
						GamePlayScriptLog( varMap, varPlayer, 1372)
					else
						Msg2Player( varMap, varPlayer, "无法获得物品，请整理您的背包", 8, 3)
						return
					end
                end
            else
                -- 许愿获取积分
                for varI = 0, 100 do
                    if iter.useMode == 0 and score >= x930151_var_MaxScore then
                        Msg2Player( varMap, varPlayer, format( "您的积分已达最大值，不能再使用@item_%d", iter.varItem), 8, 3)
                        return
                    end
                    if DelItem( varMap, varPlayer, iter.varItem, iter.tableid[ needSeed].deplete) == 0 then
                        Msg2Player( varMap, varPlayer, format( "提交@item_%d#cffcc00失败", iter.varItem), 8, 3)
                        return
                    end

                    local add = random( iter.tableid[ needSeed].scoreDown, iter.tableid[ needSeed].scoreUp)
                    score = score + add
                    if score > x930151_var_MaxScore then
                        score = x930151_var_MaxScore
                    end
                    SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], score)
                    SetFeastScore( varMap, varPlayer, GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) )
                    Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点积分，总积分#G%d", add, score), 8, 3)
                    StartTalkTask( varMap)
                    TalkAppendString( varMap, "#Y"..iter.varName)
                    TalkAppendString( varMap, format( "\n\t恭喜您获得#R%d#W点积分，总积分为#G%d#W分。", add, score) )
                    StopTalkTask()
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                    GamePlayScriptLog( varMap, varPlayer, 1382)
                end

            end
            break
        end
    end
end




function x930151_ProcAccept( varMap, varPlayer)
end




function x930151_ProcQuestAbandon( varMap, varPlayer, varQuest)

end




function x930151_ProcContinue( varMap, varPlayer, varTalknpc)

end




function x930151_CheckSubmit( varMap, varPlayer)

end




function x930151_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varIndex, varQuest)

end




function x930151_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)

end




function x930151_ProcAreaEntered( varMap, varPlayer, varArea, varQuest)
end




function x930151_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
end


function x930151_UpdateFeastScore( varMap, varPlayer, newScore)
    SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], newScore)
    SetFeastScore( varMap, varPlayer, GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) )
end



