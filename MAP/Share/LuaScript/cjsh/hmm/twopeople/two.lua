



x930175_var_FileId 					=   930175
x930175_var_GrowPointScriptId       = 	303104
x930175_var_mapid=94
x930175_var_bosslist = {}--创建的怪物数组
x930175_var_bosslivetime = 60 * 60--怪物生存时间  1小时， 单位秒
x930175_var_Boss = {
    --80级部将
    {id=17021,name="德米特利", posId = 600202,prob=100,price=1,jf=1},
    --18魔君
    {id=3211,name="屈出律", posId = 600202,prob=100,price=1,jf=1},

    --幸运红蜂
    {id=56061,name="幸运红蜂", posId = 600202,prob=100,price=1,jf=1},

    --3F宝箱
    {id=43510,name="3F宝箱", posId = 600202,prob=100,price=1,jf=1},


    {id=18101,name="#G米底亚酋长", posId = 600202,prob=100,price=1,jf=1},--#G米底亚酋长
    {id=18119,name="#G奥托巴姆", posId = 600202,prob=100,price=1,jf=1},--#G奥托巴姆
    {id=18114,name="#G莫里克", posId = 600202,prob=100,price=1,jf=1},--#G莫里克

    --草原精英
    {id=18000,name="#G黑粽狼精英", posId = 600202,prob=100,price=1,jf=1},--#G黑粽狼精英
    {id=11001,name="#R喜兽王", posId = 600202,prob=100,price=2,jf=1},--#喜兽王
    {id=11000,name="#R喜兽", posId = 600202,prob=100,price=1,jf=1},--#喜兽

    --80-110 3f战神
    --{id=27849,name="九旄战神-80级1", posId = 600202,prob=100,price=1,jf=1},
    --{id=27850,name="九旄战神-80级2", posId = 600202,prob=100,price=1,jf=1},
    --{id=27851,name="九旄战神-80级3", posId = 600202,prob=100,price=1,jf=1},
    --{id=27852,name="九旄战神-80级4", posId = 600202,prob=100,price=1,jf=1},
    --
    --{id=27935,name="九旄战神-90级1", posId = 600202,prob=100,price=1,jf=1},
    --{id=27936,name="九旄战神-90级2", posId = 600202,prob=100,price=1,jf=1},
    --{id=27937,name="九旄战神-90级3", posId = 600202,prob=100,price=1,jf=1},
    --{id=27938,name="九旄战神-90级4", posId = 600202,prob=100,price=1,jf=1},
    --
    --{id=27950,name="九旄战神-110级1", posId = 600202,prob=100,price=1,jf=1},
    --{id=27951,name="九旄战神-110级2", posId = 600202,prob=100,price=1,jf=1},
    --{id=27952,name="九旄战神-110级3", posId = 600202,prob=100,price=1,jf=1},
    --{id=27953,name="九旄战神-110级4", posId = 600202,prob=100,price=1,jf=1},

    --{id=18090,name="咆哮战狼", posId = 600202,prob=10,price=100,jf=2},
    {id=18089,name="大猫神兽（牛逼世界boss）", posId = 600202,prob=10,price=90,jf=2},

    {id=18134,name="低调dè凯", posId = 600202,prob=10,price=100,jf=2,zsjy=10},
    {id=18135,name="伊克昭箭客", posId = 600202,prob=10,price=100,jf=2,zsjy=10},
    {id=18136,name="拜占庭风魔", posId = 600202,prob=10,price=100,jf=2},
    {id=20001,name="强·战场之魂", posId = 600202,prob=10,price=100,jf=20},
    {id=20002,name="战场之魄", posId = 600202,prob=10,price=100,jf=1},
    {id=20003,name="战场之灵", posId = 600202,prob=10,price=100,jf=1},

    --战场之魂
    {id=18500,name="#O武士之魂", posId = 600202,prob=10,price=100,jf=2,zsjy=10},
    {id=18501,name="#O剑侠之魂", posId = 600202,prob=10,price=100,jf=2,zsjy=10},
    {id=18502,name="#O骑射之魂", posId = 600202,prob=10,price=100,jf=2,zsjy=10},
    {id=18503,name="#O火枪之魂", posId = 600202,prob=10,price=100,jf=2,zsjy=10},
    {id=18504,name="#O先知之魂", posId = 600202,prob=10,price=100,jf=2,zsjy=10},
    {id=18505,name="#O萨满之魂", posId = 600202,prob=10,price=100,jf=2,zsjy=10},

    --
    {id=18160,name="暗·黑无常", posId = 600202,prob=10,price=100,jf=50,zsjy=100},
    {id=18161,name="暗·白无常", posId = 600202,prob=10,price=100,jf=60,zsjy=110},

    {id=62741,name="恶来", posId = 600202,prob=10,price=10,jf=2,zsjy=3},
    {id=62742,name="冥王", posId = 600202,prob=10,price=10,jf=2,zsjy=3},
}

--定时任务上次刷新boss的时间，单位秒
x930175_var_lastrefreshbosstime = 0
--周末一次刷新boss的数量
x930175_var_bosscntweekend = 10
--非周末刷新boss数量
x930175_var_bosscntnoweekend = 5

--每次杀人奖励的战场积分数量
x930175_var_warjifen = 200
x930175_var_mabi = 20
x930175_var_zfd = 20

--杀人奖励的战神降临积分
x930175_var_warjl = 10

x930175_var_bossinited = 0
--死亡多久才能再次进入 单位秒
x930175_var_deathduration = 60*60

--死亡时间记录
x930175_var_deathlist = {}

x930175_var_weekendtimer = 30*60*1000--周末15分钟刷新
x930175_var_notweekendtimer = 60*60*1000--非周末30分钟

x930175_var_EnterScenePos				=	{
    {177, 82}, {169, 103}, {173, 129}, {173, 153},
    {182, 172}, {169, 173}, {147,171}, {125,169},
    {99, 168}, {81, 166}, {80, 140}, {84, 117},
    {86, 102}, {73, 88}, {84, 80}, {96, 88},
    {115, 111}, {134, 115}, {141, 126}, {125, 143},
										}

x930175_var_nMoney1		= 1000	--被击杀获得现金/次
x930175_var_nMoney2		= 20000	--击杀获得现金/次
x930175_var_ReliveDrop					=
{
    { idx = 1, varX = 130, z=103 },
    { idx = 2, varX = 130, z=103 },
    { idx = 3, varX = 130, z=103 },
    { idx = 4, varX = 130, z=103 },
    { idx = 5, varX = 130, z=103 },
}
function x930175_GetScenceDrop(varMap, varPlayer, npos)
    --场景随机复活
    local npos = random(1,56)
    local x1 = x930175_var_ReliveDrop[npos].varX
    local z1 = x930175_var_ReliveDrop[npos].z
    return x1,z1
end

function x930175_ProcMapCreate(varMap)


    ChangeMapRestrictiveMode(varMap, 2) --开
    x930175_var_deathlist = {}
end






function x930175_GetPlayerPos(varMap, varPlayer)
	
	local GUID = GetPlayerGUID(varMap, varPlayer)

	
	return 100,100
end





function x930175_ProcPlayerEnter(varMap, varPlayer)
    if varMap ~= x930175_var_mapid then
        return
    end

    SetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED,0)

    Msg2Player(varMap,varPlayer,format("你进入了地图%d",varMap),8,2)
    Msg2Player(varMap,varPlayer,format("你进入了地图%d",varMap),8,3)
	
    local scenePre = GetPlayerRuntimeData(varMap,varPlayer, RD_HUMAN_SCENE_PRE) - 1
    if scenePre >= 0 then
    
        
        local CurX = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE)
        local CurZ = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE)
        SetPlayerBakSceneInfo(varMap, varPlayer, scenePre, CurX, CurZ)
        
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_SCENE_PRE, 0)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE, 0)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE, 0)
    end

end




function x930175_ProcPlayerLeave(varMap, varPlayer)
    Msg2Player(varMap,varPlayer,format("你离开了地图%d",varMap),8,2)
    Msg2Player(varMap,varPlayer,format("你离开了地图%d",varMap),8,3)
	local nDebug = 1
	
	if nDebug == 1 then
        WriteLog(1, format("MPVPBATTLE:x930175_ProcPlayerLeave 0 varMap=%d Name=%s 2v2 LevelPre = %d", varMap, GetName(varMap,varPlayer), GetPVP2V2Level(varMap,varPlayer)))
	end

	
	--if x930175_SceneInfo[varMap].ISCLOSING > 0 then
	--	return
	--end

	--if x930175_GetPlayerLeaveSceneFlag(varMap, varPlayer) == 0 then
	--
	--	x930175_SetPlayerLeaveSceneFlag(varMap, varPlayer)
	--
	--	local n2v2LevelPre = GetPVP2V2Level(varMap, varPlayer)
	--
	--
	--	x930175_SubPVP2V2Level(varMap, varPlayer, x930175_var_Loser_Bonus_Level)
	--
	--	local n2v2LevelAfter = GetPVP2V2Level(varMap,varPlayer)
    --
    --    WriteLog(1, format("MPVPBATTLE:x930175_ProcPlayerLeave 1 varMap=%d Name=%s 2v2LevelPre = %d 2v2LevelAfter=%d",
    --    	varMap, GetName(varMap, varPlayer), n2v2LevelPre, n2v2LevelAfter))
	--end
end




function x930175_ProcMapTimerTick(varMap, nowTime)

	

end




function x930175_ProcPlayerDie(varMap, varPlayer, varKiller)

    local nKillerType = GetObjType(varMap, varKiller)

    --当杀人者为怪物则返回
    if nKillerType == 2 then
        return
    end

    if nKillerType == 3 then
        varKiller = GetOwnerID(varMap, varKiller)
    end

    local minOfDay = GetMinOfDay()
    local weekIdx = GetWeek()
    local teamid = GetTeamId(varMap, varKiller)
    local teamnum = GetNearTeamCount(varMap, varKiller)

    --击杀玩家
    if varMap ~= x930175_var_mapid then
        return
    end

    local warlevel = GetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY1[1], MD_GETBUFF_DAY1[2], MD_GETBUFF_DAY1[3])

    if warlevel > 10 then
        local meili = GetHotValue( varMap, varPlayer)
        SetHotValue(varMap, varPlayer,meili+x930175_var_zfd)
        Msg2Player(varMap,varPlayer,format("您获得了%d点征服点", x930175_var_zfd),4,3)
        Msg2Player(varMap,varPlayer,format("您获得了%d点征服点", x930175_var_zfd),4,2)

        AddHorseMoney(varMap, varPlayer, x930175_var_mabi )
        Msg2Player(varMap,varPlayer,format("您获得了%d马币的奖励。", x930175_var_mabi),4,3)
        Msg2Player(varMap,varPlayer,format("您获得了%d马币的奖励。", x930175_var_mabi),4,2)

        --奖励战场积分
        local nPVP2V2Mark = x930175_var_warjifen
        AddPVP2V2Mark(varMap, varKiller, nPVP2V2Mark)
        Msg2Player(varMap,varKiller,format("您获得了%d战场积分的奖励。", nPVP2V2Mark),4,3)
        Msg2Player(varMap,varKiller,format("您获得了%d战场积分的奖励。", nPVP2V2Mark),4,2)


        --奖励英勇勋章
        local bonusid = 12266663
        local targetNum = 2
        local targetName = "英勇勋章"
        StartItemTask(varMap)
        ItemAppendBind( varMap, bonusid, targetNum)
        local varRet = StopItemTask(varMap,varPlayer)
        if varRet > 0 then
            DeliverItemListSendToPlayer(varMap,varPlayer)
            Msg2Player(varMap, varPlayer,format("恭喜你获得%d个%s", targetNum, targetName),8,3)
            Msg2Player(varMap, varPlayer,format("恭喜你获得%d个%s", targetNum, targetName),8,2)
        end
    else

        local meili = GetHotValue( varMap, varPlayer)
        SetHotValue(varMap, varPlayer,meili+1)

        AddHorseMoney(varMap, varPlayer, 1 )

        --奖励战场积分
        AddPVP2V2Mark(varMap, varKiller, 1)

    end


    local shi,fen,miao = GetHourMinSec()
    SetPlayerGameData( varMap, varPlayer, MD_DUANWUJIE_COUNT3[ 1], MD_DUANWUJIE_COUNT3[ 2], MD_DUANWUJIE_COUNT3[ 3], GetCurrentTime())

    local nBeKilled = GetPlayerRuntimeData(varMap,varKiller,RD_KING_BATTLE_BEKILLED ) + 1

    AddGold(varMap, varKiller,x930175_var_nMoney2)
    local msg = format("你在#R战场中#O杀死玩家#G#{_MONEY%d}#O现金", x930175_var_nMoney2)
    Msg2Player(varMap, varKiller,msg,8, 2)
    Msg2Player(varMap, varKiller,msg,8, 3)

    SetPlayerRuntimeData(varMap,varKiller,RD_KING_BATTLE_BEKILLED,nBeKilled)

    local jy = x930175_var_warjl
    if warlevel <= 0 then
        jy = 1
    elseif warlevel <= 10 then
        jy = 2
    elseif warlevel <= 20 then
        jy = 3
    else
        jy = x930175_var_warjl
    end
    if jy < x930175_var_warjl then
        Msg2Player(varMap, varKiller,"您杀的玩家战神等级过低，请挑战高等级玩家",8,3)
        Msg2Player(varMap, varKiller,"您杀的玩家战神等级过低，请挑战高等级玩家",8,2)
    end
    x930175_onwarlevelchange(varMap,varKiller,jy)

end




function x930175_ProcPlayerRelive(varMap, varPlayer, varReliveOp)
    local minOfDay = GetMinOfDay()
    local weekIdx = GetWeek()

    local nian, yue, ri = GetYearMonthDay()
    local shi,fen,miao = GetHourMinSec()

    if varMap ~= x930175_var_mapid then
        return
    end

    if varMap == x930175_var_mapid then
        --x930175_var_deathlist[GetName(varMap, varPlayer)] = GetCurrentTime()


        local varStr = format("#R【玩家】#G%s#o在#R战场场景#o中死亡被迫离开战场。",GetName(varMap,varPlayer ))
        LuaAllScenceM2Wrold(varMap,varStr,3,1)
        NewWorld(varMap, varPlayer, 0, 285, 191, x930175_var_FileId)--返回大都
        return
    end



    local nBeKilled = GetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED ) + 1
    if nBeKilled <= 10 then
        local varStr = format("#R【玩家】#G%s#o在#R战场场景#o中被杀死%d次。",GetName(varMap,varPlayer ),nBeKilled)
        LuaAllScenceM2Wrold(varMap,varStr,3,1)
        AddGold(varMap, varPlayer,x930175_var_nMoney1)
        Msg2Player(varMap, varPlayer,format("你在#R战场中#O被击杀只能#G获得%d文现金 %d", x930175_var_nMoney1, nBeKilled),8, 2)
        Msg2Player(varMap, varPlayer,format("你在#R战场中#O被击杀只能#G获得%d文现金 %d", x930175_var_nMoney1, nBeKilled),8, 3)
    end

    if nBeKilled == 10 then

    end
    SetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED,nBeKilled)
end




function x930175_DoPlayerRelive(varMap, varPlayer, value)

	
	local nHp = GetHp(varMap, varPlayer)
	if nHp <= 0 then
	
		ClearRageRecoverTick(varMap, varPlayer)
		RestoreHp(varMap, varPlayer, value)
		RestoreRage(varMap, varPlayer, value)
		ClearMutexState(varMap, varPlayer, 6)
		SendReliveResult(varMap, varPlayer,1)
	end
	
	
	LastMount(varMap, varPlayer)
	RestoreHp(varMap, varPlayer, 0)
end




function x930175_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end



function x930175_ProcAccept( varMap, varPlayer )

    local varguo=GetCurCountry(varMap, varPlayer)
    local teamid = GetTeamId(varMap, varPlayer)
    local teamnum = GetTeamSize(varMap, varPlayer)

    local nian, yue, ri = GetYearMonthDay()
    local shi,fen,miao = GetHourMinSec()

    if teamid >= 0 then
        Msg2Player( varMap, varPlayer, "禁止组队进入战场", 8, 3)
        Msg2Player( varMap, varPlayer, "禁止组队进入战场", 8, 2)
        return
    end

    local lastDeadTime = GetPlayerGameData( varMap, varPlayer, MD_DUANWUJIE_COUNT3[ 1], MD_DUANWUJIE_COUNT3[ 2], MD_DUANWUJIE_COUNT3[ 3])
    if GetCurrentTime() - lastDeadTime <= x930175_var_deathduration then
        local remain = x930175_var_deathduration - (GetCurrentTime() - lastDeadTime)
        Msg2Player( varMap, varPlayer, format("由于您近期死亡过，请等待%d秒才能再次进入", remain), 8, 3)
        Msg2Player( varMap, varPlayer, format("由于您近期死亡过，请等待%d秒才能再次进入", remain), 8, 2)
        return
    end


    if IsHaveSpecificImpact( varMap, varPlayer, 7730) == 1 then
        CancelSpecificImpact( varMap, varPlayer, 7730)
    end
    SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 7730, 0)

    NewWorld(varMap,varPlayer,x930175_var_mapid,82,127,x930175_var_FileId)
end




function x930175_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,seleteId)
    local lastDeadTime = GetPlayerGameData( varMap, varPlayer, MD_DUANWUJIE_COUNT3[ 1], MD_DUANWUJIE_COUNT3[ 2], MD_DUANWUJIE_COUNT3[ 3])


    if seleteId == -1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#R【传送】战场")
        TalkAppendString(varMap,"\t战场内禁止组队进入，地图非安全\n\t每隔20分钟刷新各种怪物，消灭后会获得对应积分，周末刷新间隔10分钟\n")
        TalkAppendString(varMap,"\t战场内每隔10秒会获得一些经验，同时如果你足够幸运还会获得各种代币和珍稀道具，周末幸运翻倍\n\t记住，战场内不要死亡，否则就要等待1小时才能再次进入\n")
        if GetCurrentTime() - lastDeadTime <= x930175_var_deathduration then
            local remain = x930175_var_deathduration - (GetCurrentTime() - lastDeadTime)
            TalkAppendString(varMap,format("由于您近期死亡过，请等待%d秒才能再次进入", remain))
        end
        StopTalkTask()
        DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930175_var_FileId, -1)
    end

    if seleteId == 1 then
        if getn(x930175_var_bosslist) >= 1 or x930175_var_bossinited == 1 then
            Msg2Player( varMap, varPlayer, "boss已经在刷新了，请稍等", 8, 3)
            Msg2Player( varMap, varPlayer, "boss已经在刷新了，请稍等", 8, 2)
            return
        else
            x930175_var_bossinited = 1
            Msg2Player( varMap, varPlayer, "boss成功刷新", 8, 3)
            Msg2Player( varMap, varPlayer, "boss成功刷新", 8, 2)
            SetSystemTimerTick( varMap, x930175_var_FileId, "TwohmmTimer", 328, 1000)
        end

    end

    if seleteId == 2 then
        --传送回大都
        NewWorld(varMap,varPlayer,0,259,191,930175)
    end

end

function x930175_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local level = GetLevel(varMap, varPlayer)
    if level < 40 then
        return
    end

    local lastDeadTime = GetPlayerGameData( varMap, varPlayer, MD_DUANWUJIE_COUNT3[ 1], MD_DUANWUJIE_COUNT3[ 2], MD_DUANWUJIE_COUNT3[ 3])

    local maxBosscnt = 0
    local weekIdx = GetWeek()
    if weekIdx == 6 or weekIdx == 0 then
        maxBosscnt = x930175_var_bosscntweekend
    else
        maxBosscnt = x930175_var_bosscntnoweekend
    end
    local curbossnum = x930175_getvalidbossnum(varMap, varPlayer)
    local nextRefreshTime =x930175_var_lastrefreshbosstime
    if weekIdx == 6 or weekIdx == 0 then
        nextRefreshTime =x930175_var_lastrefreshbosstime+x930175_var_weekendtimer/1000
    else
        nextRefreshTime =x930175_var_lastrefreshbosstime+x930175_var_notweekendtimer/1000
    end
    local remainrefre = nextRefreshTime-GetCurrentTime()

    if varMap == x930175_var_mapid then
        StartTalkTask(varMap)
        TalkAppendString(varMap,format("#Y乱斗战场\n\t当前地图剩余boss数量%d\n\t你上次死亡时间%d",x930175_getvalidbossnum(varMap, varPlayer),lastDeadTime))
        --local validbosslist = x930175_getvalidbosslist(varMap, varPlayer)
        --for vari, boss in validbosslist do
        --    TalkAppendString(varMap, format())
        --end


        if maxBosscnt - curbossnum > 0 then
            if x930175_var_lastrefreshbosstime == 0 then
                --说明从未刷新过
                TalkAppendString(varMap,format("\t下次刷新 #G%d#W 个boss",maxBosscnt - curbossnum))
            else
                TalkAppendString(varMap,format("\t距离下次刷新 #G%d#W 个boss，剩余 #G%d#W 秒 ",maxBosscnt - curbossnum, remainrefre))
            end
        end
        TalkAppendButton(varMap,x930175_var_FileId, "#R【传送】大都",3,2)
        if x930175_var_bossinited ~= 1 then
            TalkAppendButton(varMap,x930175_var_FileId, "#R【刷新】boss",3,1)
        end

        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    else
        TalkAppendButton(varMap,x930175_var_FileId, "#R【传送】战场",3,-1)
    end

end



function x930175_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x930175_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end




function x930175_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)
    if varMap ~= x930175_var_mapid then
        return
    end
    if getn(x930175_var_bosslist) >= 1 then
        return
    end
    local weekIdx = GetWeek()
    SetSystemTimerTick( varMap, x930175_var_FileId, "TwohmmTimer", varAct, 10000)


    local strLog = format( "Timer %d active varScript %d. ", varAct, x930175_var_FileId)
    WriteLog( 1, strLog)
end

function x930175_TwohmmTimer( varMap, varAct, varTime)
    if varMap ~= x930175_var_mapid then
        return
    end

    local maxBosscnt = 0
    local weekIdx = GetWeek()
    if weekIdx == 6 or weekIdx == 0 then
        maxBosscnt = x930175_var_bosscntweekend
    else
        maxBosscnt = x930175_var_bosscntnoweekend
    end

    local addnum = maxBosscnt - getn(x930175_var_bosslist)

    local newbosslist = {}
    local ni = 1
    for vari, item in x930175_var_bosslist do
        if item.objid == nil or GetCurrentTime() - item.createTime >= x930175_var_bosslivetime then
            --被杀了或者过期了
            addnum = addnum + 1

        else
            --正常的转移到新数组
            newbosslist[ni]=item
            ni = ni+1
        end
    end

    x930175_var_lastrefreshbosstime = GetCurrentTime()
    x930175_var_bossinited = 1

    if addnum >0 then
        for varI = 1, addnum do
            --随机选一个boss
            local bid = x930175_var_Boss[random(1,getn(x930175_var_Boss))]

            --随机选一个位置
            local pos = x930175_var_EnterScenePos[random(1,getn(x930175_var_EnterScenePos))]

            local varObj, objGuid =CreateMonster( varMap, bid.id, pos[1], pos[2], 1, 754, x930175_var_FileId, -1, 21, x930175_var_bosslivetime*1000, 0, bid.name)
            local varmsg = format("战场boss刷新了！ 位置[%d,%d]", pos[1], pos[2])
            LuaAllScenceM2Wrold(varMap, varmsg, CHAT_PLANE_SCROLL, 1)
            LuaAllScenceM2Wrold(varMap, varmsg, CHAT_LEFTDOWN, 1)
            LuaAllScenceM2Wrold(varMap, varmsg, CHAT_MAIN_RIGHTDOWN, 1)

            newbosslist[ni] = {id = bid.id, objid=tostring(varObj),createTime = GetCurrentTime(),x=pos[1],z=pos[2]}
            ni = ni+1
        end
        x930175_var_bosslist = newbosslist
    end

    if weekIdx == 6 or weekIdx == 0 then
        SetSystemTimerTick( varMap, x930175_var_FileId, "TwohmmTimer", varAct, x930175_var_weekendtimer)
    else
        SetSystemTimerTick( varMap, x930175_var_FileId, "TwohmmTimer", varAct, x930175_var_notweekendtimer)
    end
end

function x930175_ProcDie(varMap, varPlayer, varKiller)
    local nKillerType = GetObjType(varMap, varKiller)
    if IsObjValid( varMap,varKiller ) ~=1 then
        return
    end

    --当杀人者为怪物则返回
    if nKillerType == 2 then
        return
    end


    if nKillerType == 3 then
        varKiller = GetMasterObjId(varMap, varKiller)
        if varKiller == nil then
            return
        end
    end



    local mguid = GetMonsterGUID(varMap, varPlayer)
    local TargetObjID = GetMonsterDataID(varMap, varPlayer)

    local title = GetName(varMap,varPlayer)
    local killerName = GetName(varMap,varKiller)
    local countryId = GetCurCountry(varMap, varKiller)
    local countryName = GetCountryName(countryId)
    local scenename = GetSceneInfo(varMap,"NAME")
    local varMsg1 = "【战场BOSS】"..title.."#kY#K已经被"..countryName..killerName.."#c8000FF在"..scenename.."#kj#K击败！"


    LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)--左下角系统栏


    --处理怪物被杀
    local bossid=0
    for vari, item in x930175_var_bosslist do
        if item.objid == tostring(varPlayer) then
            item.objid = nil
            bossid = item.id
        end
    end

    if bossid > 0 then
        for vari, item in x930175_var_Boss do
            if item.id == bossid then
                if item.zsjy ~= nil and item.zsjy > 0 then
                    x930175_onwarlevelchange(varMap,varKiller,item.zsjy)
                end
                if item.jf ~= nil and item.jf > 0 then
                    x930175_onzfllevelchange(varMap,varKiller,item.jf)
                end

                break
            end
        end
    end



    GamePlayScriptLog(varMap, varKiller, 501)
end
function x930175_Getmonsterinfo(varMap, varPlayer)
    local item = x930175_var_Boss[random(1,getn(x930175_var_Boss))]
    return item.id, item.name,item.posId
end
function x930175_Getmonsterbyid(varMap, varPlayer,objid)

    local item = nil
    for vari, elem in x930175_var_Boss do
        if elem.id == objid then
            item = elem
            break
        end
    end
    return item.id, item.name,item.posId
end
function x930175_Getmonstercnt(varMap, varPlayer)
    return getn(x930175_var_Boss)
end
function x930175_getvalidbossnum(varMap, varPlayer)
    local validnum = 0
    for vari, item in x930175_var_bosslist do
        if item.objid ~= nil and GetCurrentTime() - item.createTime < x930175_var_bosslivetime then

            validnum = validnum+1
        end
    end
    return validnum
end
function x930175_getvalidbosslist(varMap, varPlayer)
    local list = {}
    local i = 1
    for vari, item in x930175_var_bosslist do
        if item.objid ~= nil and GetCurrentTime() - item.createTime < x930175_var_bosslivetime then

            list[i] = item
        end
    end
    return list
end

function x930175_onwarlevelchange(varMap, varPlayer, change)
    local warlevel = GetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY1[1], MD_GETBUFF_DAY1[2], MD_GETBUFF_DAY1[3])
    SetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY1[1], MD_GETBUFF_DAY1[2], MD_GETBUFF_DAY1[3],warlevel+change)

    Msg2Player(varMap, varPlayer,format("获得战神降临积分#R%d#W",change),8,3)
    Msg2Player(varMap, varPlayer,format("获得战神降临积分#R%d#W",change),8,2)


    --if change > 0 then
    --    LuaCallNoclosure(930179, "Upwaronleveladd", varMap, varPlayer, change)
    --else
    --    LuaCallNoclosure(930179, "Upwaronleveldec", varMap, varPlayer, change)
    --end
end
function x930175_onzfllevelchange(varMap, varPlayer, change)
    local warlevel = GetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3])
    SetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3],warlevel+change)

    Msg2Player(varMap, varPlayer,format("获得万族征伐录积分#R%d#W",change),8,3)
    Msg2Player(varMap, varPlayer,format("获得万族征伐录积分#R%d#W",change),8,2)


    --if change > 0 then
    --    LuaCallNoclosure(930179, "Upwaronleveladd", varMap, varPlayer, change)
    --else
    --    LuaCallNoclosure(930179, "Upwaronleveldec", varMap, varPlayer, change)
    --end
end


