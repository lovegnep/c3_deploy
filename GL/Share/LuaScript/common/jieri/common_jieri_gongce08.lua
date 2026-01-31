

x350007_var_FileId 					= 350007



x350007_var_OrdinarySeedTable         = {
                                        { useCount = 1,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 2,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 3,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 4,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 5,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 6,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 7,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 8,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 9,  deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 10, deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 11, deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 12, deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 13, deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 14, deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 15, deplete = 3, scoreDown = 400, scoreUp = 415 }, 
                                        { useCount = 16, deplete = 3, scoreDown = 400, scoreUp = 415 }, 
}

x350007_var_SeedTable					= {
                                        { varItem = 11010015, buttonId = 1, maxTimes = 16, useMode = 0, tableid = x350007_var_OrdinarySeedTable, actName = "许愿", 
                                          dayMD = MD_HOPESEED_DAY,     timesMD = MD_GOLDHOPESEED_TIMES, varName = "【活动】节日许愿" },
                                        { varItem = 11010017, buttonId = 2, maxTimes = 1, useMode = 1, tableid = x350007_var_OrdinarySeedTable, actName = "祈福", 
                                         dayMD = MD_LUCKSEED_DAY,     timesMD = MD_LUCKSEED_TIMES,     varName = "【活动】节日祈福" },
}

x350007_var_LuckySeedTable            = {
                                        { varItem = 11000552, probability = 1000, price = 45, varName = "完美星辰",         }, 
                                        { varItem = 11000334, probability = 50000, price = 45, varName = "战神令",           }, 
                                        { varItem = 11000325, probability = 50000,  price = 45,    varName = "龙之谷晶石",        }, 
                                        { varItem = 11000328, probability = 50000,  price = 45,    varName = "四彩护身符碎片",        },                          
                                        { varItem = 11000339, probability = 50000,  price = 45,    varName = "红心A",      }, 
                                        { varItem = 11000380, probability = 50000,  price = 45,    varName = "稀世奇珍兑换卷",      }, 
                                        { varItem = 11000381, probability = 50000,  price = 45,    varName = "暗影四彩护身符碎片",          }, 
                                        { varItem = 11000333, probability = 50000,  price = 45,    varName = "战神王牌兑换券",          }, 
                                        { varItem = 12271412, probability = 50000,  price = 45,    varName = "迷你坐骑碎片",         },                                      
                                        { varItem = 11970023, probability = 10000,  price = 45,    varName = "黄金乱士符",         },
}

    x350007_var_Yuebing                   = {
                                            { varItem = 12030251, varName = "三财月饼", lvDown = 30, lvUp = 40       }, 
                                            { varItem = 12030252, varName = "四喜月饼", lvDown = 40, lvUp = 50       }, 
                                            { varItem = 12030253, varName = "五仁月饼", lvDown = 50, lvUp = 60       }, 
                                            { varItem = 12030254, varName = "六味月饼", lvDown = 60, lvUp = 70       }, 
                                            { varItem = 12030255, varName = "七星月饼", lvDown = 70, lvUp = 80       }, 
                                            { varItem = 12030256, varName = "八宝月饼", lvDown = 80, lvUp = 90       }, 
}

x350007_var_MaxScore                  = 99999




function x350007_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetLevel( varMap, varPlayer) < 40 then
        return
    end

    local day = GetDayOfYear()
    if day >= 1 and day <= 366 then
	    for varI, iter in x350007_var_SeedTable do
	        TalkAppendButton( varMap, x350007_var_FileId, iter.varName, 3, iter.buttonId)
	    end
	    TalkAppendButton( varMap, x350007_var_FileId, "【活动】积分查询", 3, 5)
        TalkAppendButton( varMap, x350007_var_FileId, "节日积分商店", 10, 6)
        TalkAppendButton( varMap, x350007_var_FileId, "种子玉佩商店", 10, 7)
    end
    
end




function x350007_ProcEventEntry( varMap, varPlayer, varTalknpc, varState, varIndex)
    if varIndex >= 1 and varIndex <= getn( x350007_var_SeedTable) then  
        local strInfo = ""
        local strInfo1 = ""
        local strInfo2 = ""
        local strTitle = "#Y"..x350007_var_SeedTable[ varIndex].varName

        if GetDayOfYear() ~= GetPlayerGameData( varMap, varPlayer, x350007_var_SeedTable[ varIndex].dayMD[ 1], x350007_var_SeedTable[ varIndex].dayMD[ 2], x350007_var_SeedTable[ varIndex].dayMD[ 3] ) then
            SetPlayerGameData( varMap, varPlayer, x350007_var_SeedTable[ varIndex].timesMD[ 1], x350007_var_SeedTable[ varIndex].timesMD[ 2], x350007_var_SeedTable[ varIndex].timesMD[ 3], 0)
            SetPlayerGameData( varMap, varPlayer, x350007_var_SeedTable[ varIndex].dayMD[ 1],   x350007_var_SeedTable[ varIndex].dayMD[ 2],   x350007_var_SeedTable[ varIndex].dayMD[ 3], GetDayOfYear() )
        end
        if x350007_var_SeedTable[ varIndex].useMode == 0 then
            local needSeed = GetPlayerGameData( varMap, varPlayer, x350007_var_SeedTable[ varIndex].timesMD[ 1], x350007_var_SeedTable[ varIndex].timesMD[ 2], x350007_var_SeedTable[ varIndex].timesMD[ 3] ) + 1
            if  needSeed > x350007_var_SeedTable[ varIndex].maxTimes then
                StartTalkTask( varMap)
                    TalkAppendString( varMap, "#Y许愿种子" )
                    TalkAppendString( varMap, "\n\t许愿种子，代表着真诚的许诺和美好的愿望，使用许愿种子后，可以让好运一直伴随在你的身边。" )
                    TalkAppendString( varMap, "\n\t许愿种子每天最多可以许愿#R十六#W次。#r" )
                    TalkAppendString( varMap, "\t您今日已经许愿十六次了，请明日再来。" )
                StopTalkTask()
                DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                return
            end
            strInfo = "\t许愿种子，代表着真诚的许诺和美好的愿望，使用许愿种子后，可以让好运一直伴随在你的身边。"
            strInfo1 = format( "#G小提示:#G\n\t节日许愿每天可进行十六次许愿，每次需要三个许愿种子。\t\n\t#W您现在是第#R%d#W次使用，需要#R3#W个@item_%d#W。", needSeed, x350007_var_SeedTable[ varIndex].varItem)
            strInfo2 = "#Y奖励内容:#W\n\t活动积分"
        else
            strInfo = "\t祈福种子，代表着衷心的祈祷和善意的祝福，使用祈福种子之后，有可能会获得神秘的礼物哦。"
            strInfo1 = format( "#G小提示:\n\t#G每天都可以进行祈福，每次祈福需要一个祈福种子，祈福种子可以从领奖大使处购得。\t\n\t\n\t#W您是否要使用#R1#W个@item_%d#W?", x350007_var_SeedTable[ varIndex].varItem)
            strInfo2 = "#Y奖励内容:\n\t#W\神秘道具"
        end
        StartTalkTask( varMap)
            
            TalkAppendString( varMap, strTitle)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo1)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo2)
            TalkAppendString( varMap, " " )
            SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x350007_var_FileId, -1)
    end

    if varIndex == 5 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【活动】积分查询" )
            TalkAppendString( varMap, format( "\n\t您目前的节日积分为#G%d#W。", GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) ) )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    end

    if varIndex == 6 then
        DispatchShopItem( varMap, varPlayer, varTalknpc, 1104)
    end
    if varIndex == 7 then
        DispatchShopItem( varMap, varPlayer, varTalknpc, 1105)
    end
end


function x350007_CheckUseTimes( varMap, varPlayer, dayMD, timesMD, maxTimes)
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




function x350007_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)

    for varI, iter in x350007_var_SeedTable do
        if varIndex == iter.buttonId then
            
            local varCount = GetItemCountInBag( varMap, varPlayer, iter.varItem)
            if varCount == 0 then
                Msg2Player( varMap, varPlayer, format( "您没有@item_%d", iter.varItem), 8, 3)
                return
            end
            
            if iter.useMode == 0 and x350007_CheckUseTimes( varMap, varPlayer, iter.dayMD, iter.timesMD, iter.maxTimes) == 0 then
                Msg2Player( varMap, varPlayer, format( "您今天%s次数已达十六次，不能继续%s", iter.actName, iter.actName), 8, 3)
                return
            end
            local needSeed = GetPlayerGameData( varMap, varPlayer, iter.timesMD[ 1], iter.timesMD[ 2], iter.timesMD[ 3] ) + 1
            if iter.useMode == 0 and varCount < iter.tableid[ needSeed].deplete then
                Msg2Player( varMap, varPlayer, format( "您的@item_%d#cffcc00不足#R%d#cffcc00颗，无法%s", iter.varItem, iter.tableid[ needSeed].deplete, iter.actName), 8, 3)
                return
            end
            local score = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
            if iter.useMode == 0 and score >= x350007_var_MaxScore then
                Msg2Player( varMap, varPlayer, format( "您的积分已达最大值，不能再使用@item_%d", iter.varItem), 8, 3)
                return
            end
            if iter.useMode == 1 then
                
                local result = random( 1, 1000000)
                
                local top = 1
                local bottom = 1
                local itemIndex = 1
                for varI, item in x350007_var_LuckySeedTable do
                    top = top + item.probability
                    if result >= bottom and result < top then
                        itemIndex = varI
                        break
                    end
                    bottom = bottom + item.probability
                end
                local varItem = x350007_var_LuckySeedTable[ itemIndex].varItem
            
            
            
            
            
            
            
            
            
            
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
                if x350007_var_LuckySeedTable[ itemIndex].price >= 45 then
                    broadcast = 1
                    itemname = x350007_var_LuckySeedTable[ itemIndex].varName
                end
                StartItemTask( varMap) 
                if isBind == 1 then
                	ItemAppendBind( varMap, varItem, 1)
                else
	                ItemAppend( varMap, varItem, 1)
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
                    Msg2Player( varMap, varPlayer, format( "您获得了@item_%d#cffcc00。", varItem), 8, 2)
                    StartTalkTask( varMap)
                        TalkAppendString( varMap, "#Y"..iter.varName)
                        TalkAppendString( varMap, format( "\n您获得了@item_%d#W。", varItem) )
                    StopTalkTask()
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                    if broadcast == 1 then
                        LuaAllScenceM2Wrold( varMap, format( "恭喜%s使用祈福种子获得了%s", GetName( varMap, varPlayer), itemname), 5, 1)
                    end

                    
                    GamePlayScriptLog( varMap, varPlayer, 1372)
                else
                    Msg2Player( varMap, varPlayer, "无法获得物品，请整理您的背包", 8, 3)
                    return
                end
            else
                if DelItem( varMap, varPlayer, iter.varItem, iter.tableid[ needSeed].deplete) == 0 then
                    Msg2Player( varMap, varPlayer, format( "提交@item_%d#cffcc00失败", iter.varItem), 8, 3)
                    return
                end
                
                local add = random( iter.tableid[ needSeed].scoreDown, iter.tableid[ needSeed].scoreUp)
                score = score + add
                if score > x350007_var_MaxScore then
                    score = x350007_var_MaxScore
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
            local times = GetPlayerGameData( varMap, varPlayer, iter.timesMD[ 1], iter.timesMD[ 2], iter.timesMD[ 3] )
            SetPlayerGameData( varMap, varPlayer, iter.timesMD[ 1], iter.timesMD[ 2], iter.timesMD[ 3], times + 1)
            break
        end
    end
end




function x350007_ProcAccept( varMap, varPlayer)
end




function x350007_ProcQuestAbandon( varMap, varPlayer, varQuest)

end




function x350007_ProcContinue( varMap, varPlayer, varTalknpc)

end




function x350007_CheckSubmit( varMap, varPlayer)

end




function x350007_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varIndex, varQuest)

end




function x350007_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)

end




function x350007_ProcAreaEntered( varMap, varPlayer, varArea, varQuest)
end




function x350007_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
end


function x350007_UpdateFeastScore( varMap, varPlayer, newScore)
    SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], newScore)
    SetFeastScore( varMap, varPlayer, GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) )
end



