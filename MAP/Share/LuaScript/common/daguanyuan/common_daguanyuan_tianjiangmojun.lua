
x310365_var_FileId          = 310365

x310365_var_Name              = "【个人】镇妖除魔"

x310365_var_MinLevel          = 85

x310365_var_LessThanMinLevel  = format( "本活动只对#G%d#cffcc00级以上玩家开放", x310365_var_MinLevel)

x310365_var_MaxTimesInDay     = 20

x310365_var_strOverMaxTimes   = format( "你今天已经为万妖壶增加了#G%d#cffcc00次灵气了，改天再来吧。", x310365_var_MaxTimesInDay)

x310365_var_MinBagSpace       = 1

x310365_var_strNotEnoughBag   = format( "您的背包空间不足#G%d#cffcc00个，请清理后再来。", x310365_var_MinBagSpace)

x310365_var_CostMoney         = 3000

x310365_var_GlobalCount       = 0

x310365_var_ItemTable         = {
                                { varItem = 12041101, varName = "修行草" }, 
                                { varItem = 11000300, varName = "灵魂印" }, 
                                { varItem = 11990011, varName = "三番令" }, 
                                { varItem = 12041103, varName = "活力丹" }, 
                                { varItem = 12030016, varName = "队伍召集令" }, 
                                { varItem = 12030031, varName = "神行符" }, 
                                { varItem = 11990015, varName = "藏宝令" }, 
                                { varItem = 12030213, varName = "强效极乐草" }, 
                                { varItem = 12030013, varName = "芝华士" }, 
                                { varItem = 12030014, varName = "轩尼诗理查" }, 
                                { varItem = 12030017, varName = "哈瓦那雪茄" }, 
                                { varItem = 11000501, varName = "紫檀木炭" }, 
                                { varItem = 12240002, varName = "优质符文布" }, 
                                { varItem = 11000548, varName = "炫彩强化石" }, 
}

x310365_var_strAddItemFailed  = "添加物品失败，请整理背包"

x310365_var_MonsterTableLittle= {                              
                                { monsterId=	17321	,ai=	1	,aiScript=	902, campId = 21, liveTime = -1 },	
																{ monsterId=	17322	,ai=	1	,aiScript=	902, campId = 21, liveTime = -1 },
																{ monsterId=	17323	,ai=	1	,aiScript=	902, campId = 21, liveTime = -1 },	
																{ monsterId=	17324	,ai=	1	,aiScript=	902, campId = 21, liveTime = -1 },	
																{ monsterId=	17325	,ai=	1	,aiScript=	902, campId = 21, liveTime = -1 },	
																{ monsterId=	17326	,ai=	1	,aiScript=	902, campId = 21, liveTime = -1 },	
																{ monsterId=	17327	,ai=	1	,aiScript=	902, campId = 21, liveTime = -1 },							
																{ monsterId=	17328	,ai=	1	,aiScript=	903, campId = 21, liveTime = -1 },	
																{ monsterId=	17329	,ai=	1	,aiScript=	903, campId = 21, liveTime = -1 },
																{ monsterId=	17330	,ai=	1	,aiScript=	903, campId = 21, liveTime = -1 },	
																{ monsterId=	17331	,ai=	1	,aiScript=	903, campId = 21, liveTime = -1 },	
																{ monsterId=	17332	,ai=	1	,aiScript=	903, campId = 21, liveTime = -1 },	
																{ monsterId=	17333	,ai=	1	,aiScript=	903, campId = 21, liveTime = -1	},	
																{ monsterId=	17320	,ai=	1	,aiScript=	903, campId = 21, liveTime = -1	},
                                
}

x310365_var_MonsterTableBig   = {
                                { monsterId = 17340, ai = 1, aiScript = 971, campId = 21, liveTime = -1 }, 
                                { monsterId = 17341, ai = 1, aiScript = 970, campId = 21, liveTime = -1 },
                                { monsterId = 17342, ai = 1, aiScript = 973, campId = 21, liveTime = -1 },
                                { monsterId = 17343, ai = 1, aiScript = 977, campId = 21, liveTime = -1 },
                                { monsterId = 17344, ai = 1, aiScript = 970, campId = 21, liveTime = -1 },
                                
}
x310365_var_BossA             = { monsterId = 17350, ai = 1, aiScript = 973, campId = 21, liveTime = -1 }
x310365_var_BossB             = { monsterId = 17351, ai = 1, aiScript = 973, campId = 21, liveTime = -1 }

x310365_var_MonsterPosTable   = {
                                { varX = 88 , z = 90  }, 
                                { varX = 100, z = 131 }, 
                                { varX = 90 , z = 157 }, 
                                { varX = 97 , z = 203 }, 
                                { varX = 151, z = 197 }, 
                                { varX = 192, z = 215 }, 
                                { varX = 201, z = 178 }, 
                                { varX = 149, z = 160 }, 
                                { varX = 170, z = 84  },     
                                { varX = 216, z = 120 }, 
                                { varX = 127, z = 120 }, 
                                { varX = 117, z = 223 }, 
                                { varX = 65 , z = 129 }, 
                                { varX = 205, z = 50  },     
                                { varX = 55 , z = 192 },                                                           
}

x310365_var_IsEnableId        = 1046

x310365_var_RewardTable           = { 11010100, 11010101, 11010102 }


function x310365_ProcMapPlayerNewConnectEnter( varMap, varPlayer)

	local varToday = GetDayOfYear()
    local hour = GetHourMinSec()
    
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_DAGUANYUAN_DATE[1], MD_DAGUANYUAN_DATE[2], MD_DAGUANYUAN_DATE[3])
	if hour == 23 or hour < 9 or varToday ~= varLastday then

		
		
		
		
		
		SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 8400, 0)
	end
end

function x310365_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetGameOpenById( x310365_var_IsEnableId) <= 0 then
        return
    end

		local day, week = GetWeek()
		if day ~=6 and day ~=0 then
        return
    end
        		
    TalkAppendButton( varMap, x310365_var_FileId, "我要给万妖壶增加灵气", 3, 1)
    TalkAppendButton( varMap, x310365_var_FileId, "查询万妖壶的灵气指数", 3, 2)
    if x310365_GetMD( varMap, varPlayer, MD_TJMJ_DATE) ~= GetDayOfYear() then
        x310365_SetMD( varMap, varPlayer, MD_TJMJ_TIMES, 0)
    end
end

function x310365_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    if GetGameOpenById( x310365_var_IsEnableId) <= 0 then
        return
    end
    
		local day, week = GetWeek()
		if day ~=6 and day ~=0 then
        return
    end
    
    if idExt == 1 then
        local varExp =GetLevel( varMap, varPlayer)*25920
        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 1)
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x310365_var_Name)
            TalkAppendString( varMap, "\t看见这个神奇的万妖壶了吗？这里面可有无数的千年老妖。\n\t你可以在我这里选择给万妖壶增加灵气，每次给万妖壶增加灵气，你都会获得丰厚的经验奖励，有时也会得到稀罕的宝贝。" )
            TalkAppendString( varMap, format("\n#Y奖励内容#W：\n经验值：%d点\n有几率获得#G双倍经验#W和#G修行草#W、#G灵魂印#W、#G三番令#W、#G活力丹#W、#G队伍召集令#W、#G定位符#W、#G藏宝令#W、#G强效极乐草#W、#G芝华士#W、#G轩尼诗理查#W、#G哈瓦那雪茄#W、#G紫檀木炭#W、#G优质符文布#W、#G炫彩强化石#W等珍稀道具。\n \n#G小提示：\n每人每天第一次给万妖壶增加灵气免费，其后每次需要消耗#R3两#G金卡/现金，灵气增加2点。\n \n当万妖壶的灵气指数到达#R100#G或#R100#G的整数倍时，魔王将会被释放在天上人间·梦聊内，消灭魔王更会获得大量的奖励！\n \n当万妖壶的灵气指数到达#R400#G或#R400#G的整数倍时，带有更多奖励的魔王将会被释放在天上人间·梦聊内！\n \n当万妖壶的灵气指数到达#R10000#G时，带有#R特有坐骑#G的魔王将会被释放在天上人间·梦聊内！\n \n当万妖壶的灵气指数到达#R20000#G时，带有#R绝世坐骑#G的魔王将会被释放在天上人间·梦聊内！）",varExp))
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310365_var_FileId, -1)
    elseif idExt == 2 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x310365_var_Name)
            local rtimes = x310365_var_MaxTimesInDay
            if x310365_GetMD( varMap, varPlayer, MD_TJMJ_DATE) == GetDayOfYear() then
                rtimes = x310365_var_MaxTimesInDay - x310365_GetMD( varMap, varPlayer, MD_TJMJ_TIMES)
            end
            TalkAppendString( varMap, format( "\t现在万妖壶的灵气指数为#R%d#W点，你今天还可以给万妖壶增加#R%d#W次灵气。", x310365_var_GlobalCount, rtimes) )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    end
end

function x310365_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    if GetGameOpenById( x310365_var_IsEnableId) <= 0 then
        return
    end

    local step = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)
    local varToday = GetDayOfYear()
    if step == 1 then
        if GetLevel( varMap, varPlayer) < x310365_var_MinLevel then
            Msg2Player( varMap, varPlayer, x310365_var_LessThanMinLevel, 8, 3)
            return 0
        end

        local times = x310365_GetMD( varMap, varPlayer, MD_TJMJ_TIMES)
        
        if x310365_GetMD( varMap, varPlayer, MD_TJMJ_DATE) == varToday then
            if times >= x310365_var_MaxTimesInDay then
                Msg2Player( varMap, varPlayer, x310365_var_strOverMaxTimes, 8, 3)
                return 0
            end
        else
            x310365_SetMD( varMap, varPlayer, MD_TJMJ_TIMES, 0)
            x310365_SetMD( varMap, varPlayer, MD_TJMJ_DATE, varToday)
            local weekIndex = GetWeekIndex()
            if weekIndex ~= x310365_GetMD( varMap, varPlayer, MD_MOJUN_WEEK) then
            	x310365_SetMD( varMap, varPlayer, MD_MOJUN_DUIHUAN, 0)
            end
            times = 0
        end

        if GetBagSpace( varMap, varPlayer) < 1 then
            Msg2Player( varMap, varPlayer, x310365_var_strNotEnoughBag, 8, 3)
            return 0
        end

        if times == 0 then
            
            x310365_GiveReward( varMap, varPlayer)
        else
            
            SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 2)
            StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y"..x310365_var_Name)
                TalkAppendString( varMap, "\t本次给万妖壶增加灵气需要花费3两金卡或现金，是否继续？" )
            StopTalkTask()
            DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310365_var_FileId, -1)
        end
    elseif step == 2 then
        if GetBagSpace( varMap, varPlayer) < 1 then
            Msg2Player( varMap, varPlayer, x310365_var_strNotEnoughBag, 8, 3)
            return 0
        end

        if x310365_GetMD( varMap, varPlayer, MD_TJMJ_DATE) == varToday then
            if GetMoney( varMap, varPlayer, 2) < x310365_var_CostMoney and GetMoney( varMap, varPlayer, 3) < x310365_var_CostMoney then
                Msg2Player( varMap, varPlayer, "你的金卡或现金不足", 8, 3)
                return 0
            end

            if GetGoldMode( varMap, varPlayer) == 1 then
                if CostMoney( varMap, varPlayer, 2, x310365_var_CostMoney,323) ~= 1 then
                    if CostMoney( varMap, varPlayer, 3, x310365_var_CostMoney) ~= 1 then
                        Msg2Player( varMap, varPlayer, "扣除金卡/现金失败，请稍候再试", 8, 3)
                        return 0
                    end
                end
            else
                if CostMoney( varMap, varPlayer, 3, x310365_var_CostMoney) ~= 1 then
                    if CostMoney( varMap, varPlayer, 2, x310365_var_CostMoney,323) ~= 1 then
                        Msg2Player( varMap, varPlayer, "扣除金卡/现金失败，请稍候再试", 8, 3)
                        return 0
                    end
                end
            end
        else
            x310365_SetMD( varMap, varPlayer, MD_TJMJ_TIMES, 0)
            x310365_SetMD( varMap, varPlayer, MD_TJMJ_DATE, varToday)
        end

        x310365_GiveReward( varMap, varPlayer)
        GamePlayScriptLog(varMap, varPlayer, 1681)
    end

    return 1
end

function x310365_GiveReward( varMap, varPlayer)
    
    local varLevel = GetLevel( varMap, varPlayer)
    local Probability = random( 1, 100)
    local xp = 0
    if Probability <= 75 then
        xp = varLevel*25920
    else
        xp = varLevel*25920*2
    end
    AddExp( varMap, varPlayer, xp)
    Msg2Player( varMap, varPlayer, format( "获得#R%d#cffcc00点经验。", xp), 8, 2)
	if Probability == 100 then
		LuaAllScenceM2Wrold( varMap, format( "真是幸运！%s在天上人间·梦聊镇妖除魔的活动中意外的获得了%d点的超级经验奖励。", GetName( varMap, varPlayer), varLevel*25920*3, 1, 1))
	end
    

    local varIndex = 0
    local varItem = 0
    Probability = random( 1, 2000)
      if  Probability <=772 then
    		if Probability > 50 and Probability <= 52 then
    		    varIndex = 2
    		elseif Probability > 52 and Probability <= 102 then
    		    varIndex = 3
    		elseif Probability > 102 and Probability <= 152 then
    		    varIndex = 4
    		elseif Probability > 152 and Probability <= 177 then
    		    varIndex = 5
    		elseif Probability > 177 and Probability <= 187 then
    		    varIndex = 6
    		elseif Probability > 187 and Probability <= 287 then
    		    varIndex = 7
    		elseif Probability > 287 and Probability <= 337 then
    		    varIndex = 8
    		elseif Probability > 337 and Probability <= 387 then
    		    varIndex = 9
    		elseif Probability > 387 and Probability <= 412 then
    		    varIndex = 10
    		elseif Probability > 412 and Probability <= 437 then
    		    varIndex = 11
    		elseif Probability > 437 and Probability <= 462 then
    		    varIndex = 12
    		elseif Probability > 462 and Probability <= 512 then
    		    varIndex = 13
    		elseif Probability > 512 and Probability <= 772 then
    		    varIndex = 14
            else
                varIndex = 1
            end
        if varIndex ~= 0 then
            varItem = x310365_var_ItemTable[ varIndex].varItem
        end
    elseif Probability >= 1000 and Probability < 1340 then
        varItem = 11000598
    end
    if varItem ~= 0 then
    		StartItemTask( varMap)
        ItemAppend( varMap, varItem, 1)
    		local bRes = StopItemTask( varMap, varPlayer)
    		if bRes == 0 then
    		    Msg2Player( varMap, varPlayer, x310365_var_strAddItemFailed, 8, 3)
    		    return
    		else
    		    DeliverItemListSendToPlayer( varMap, varPlayer)
    		    if varIndex == 15 then
            LuaThisScenceM2Wrold( varMap, format( "真是幸运！%s在天上人间·梦聊镇妖除魔的活动中意外的获得了一个@item_%d。", GetName( varMap, varPlayer), varItem), 1, 1)
    		    end
    		end
     end
     
    
    x310365_var_GlobalCount = x310365_var_GlobalCount + 2
    if mod( x310365_var_GlobalCount, 20000) == 0 then
        
        local pos = x310365_var_MonsterPosTable[ random( 1, getn( x310365_var_MonsterPosTable) ) ]
        CreateMonster( varMap, x310365_var_BossB.monsterId, pos.varX, pos.z, x310365_var_BossB.ai, x310365_var_BossB.aiScript, x310365_var_FileId, -1, x310365_var_BossB.campId, x310365_var_BossB.liveTime)
        LuaThisScenceM2Wrold( varMap, format( "在大家的努力下，威力无比的大魔头被万妖壶释放出来，在天上人间·梦聊内（%s，%d）出现了！各位英雄速去将其剿灭！", pos.varX, pos.z), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "大魔头出现！（%s，%d）", pos.varX, pos.z), 5, 1)
    elseif mod( x310365_var_GlobalCount, 10000) == 0 then
        
        local pos = x310365_var_MonsterPosTable[ random( 1, getn( x310365_var_MonsterPosTable) ) ]
        CreateMonster( varMap, x310365_var_BossA.monsterId, pos.varX, pos.z, x310365_var_BossA.ai, x310365_var_BossA.aiScript, x310365_var_FileId, -1, x310365_var_BossA.campId, x310365_var_BossA.liveTime)
        LuaThisScenceM2Wrold( varMap, format( "在大家的努力下，威力无比的大魔头被万妖壶释放出来，在天上人间·梦聊内（%s，%d）出现了！各位英雄速去将其剿灭！", pos.varX, pos.z), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "大魔头出现！（%s，%d）", pos.varX, pos.z), 5, 1)
    elseif mod( x310365_var_GlobalCount, 400) == 0 then
        
        local boss = x310365_var_MonsterTableBig[ random( 1, getn( x310365_var_MonsterTableBig) ) ]
        local pos = x310365_var_MonsterPosTable[ random( 1, getn( x310365_var_MonsterPosTable) ) ]
        CreateMonster( varMap, boss.monsterId, pos.varX, pos.z, boss.ai, boss.aiScript, x310365_var_FileId, -1, boss.campId, boss.liveTime)
        LuaThisScenceM2Wrold( varMap, format( "在大家的努力下，威力无比的大魔头被万妖壶释放出来，在天上人间·梦聊内（%s，%d）出现了！各位英雄速去将其剿灭！", pos.varX, pos.z), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "大魔头出现！（%s，%d）", pos.varX, pos.z), 5, 1)
    elseif mod( x310365_var_GlobalCount, 100) == 0 then
        
        local boss = x310365_var_MonsterTableLittle[ random( 1, getn( x310365_var_MonsterTableLittle) ) ]
        local pos = x310365_var_MonsterPosTable[ random( 1, getn( x310365_var_MonsterPosTable) ) ]
        CreateMonster( varMap, boss.monsterId, pos.varX, pos.z, boss.ai, boss.aiScript, x310365_var_FileId, -1, boss.campId, boss.liveTime)
        LuaThisScenceM2Wrold( varMap, format( "在大家的努力下，威力无比的大魔头被万妖壶释放出来，在天上人间·梦聊内（%s，%d）出现了！各位英雄速去将其剿灭！", pos.varX, pos.z), 1, 1)
        LuaThisScenceM2Wrold( varMap, format( "大魔头出现！（%s，%d）", pos.varX, pos.z), 5, 1)
    end

    x310365_SetMD( varMap, varPlayer, MD_TJMJ_TIMES, x310365_GetMD( varMap, varPlayer, MD_TJMJ_TIMES) + 1)

    if random( 1, 100) <= 5 then
        StartItemTask( varMap)
        ItemAppend( varMap, x310365_var_RewardTable[ random( 1, 3) ], 1)
        if StopItemTask( varMap, varPlayer) == 0 then
            Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
        else
            DeliverItemListSendToPlayer( varMap, varPlayer)
        end
    end

    Msg2Player( varMap, varPlayer, format( "灵气增加完成(%d/%d)", x310365_GetMD( varMap, varPlayer, MD_TJMJ_TIMES), x310365_var_MaxTimesInDay), 8, 3)
end

function x310365_ProcAccept( varMap, varPlayer, varTalknpc)
end

function x310365_ProcDie( varMap, varPlayer, varKiller)
end

function x310365_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310365_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x310365_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    if varMap ~= 40 then
        return
    end

    x310365_var_GlobalCount = 0
end
