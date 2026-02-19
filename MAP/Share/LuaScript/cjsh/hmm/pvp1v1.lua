x930213_var_FileId = 930213

x930213_var_Queue = {}

x930213_var_SceneMapNavPath = "zhanchang_mshuangrenzhanchang/zhanchang_mshuangrenzhanchang.nav"
x930213_var_TickTime = 5
x930213_var_LimitTicks = 60
x930213_var_CloseTick = 6
x930213_var_NoUserTime = 10
x930213_var_PrepareTicks = 6

x930213_var_PosX1 = 46
x930213_var_PosZ1 = 64
x930213_var_PosX2 = 82
x930213_var_PosZ2 = 66

x930213_CAMP_1 = 5
x930213_CAMP_2 = 6

x930213_CSP_FUBENTYPE = 0
x930213_CSP_SCRIPTID = 1
x930213_CSP_TICKCOUNT = 2
x930213_CSP_FROMSCENEID = 3
x930213_CSP_ISCLOSING = 4
x930213_CSP_LEAVECOUNTDOWN = 5
x930213_CSP_PLAYER1_GUID = 10
x930213_CSP_PLAYER2_GUID = 11
x930213_CSP_RESULT = 12

x930213_var_WinnerMark = 20
x930213_var_LoserMark = 5
x930213_var_DrawMark = 7
x930213_var_MinLevel = 60

x930213_var_BackX = 259
x930213_var_BackZ = 192


-- ============================================================
-- Queue Management
-- ============================================================

function x930213_InitQueue(varMap)
    if x930213_var_Queue[varMap] == nil then
        x930213_var_Queue[varMap] = {}
    end
end

function x930213_AddToQueue(varMap, varPlayer)
    x930213_InitQueue(varMap)
    local guid = GetPlayerGUID(varMap, varPlayer)
    for varI, item in x930213_var_Queue[varMap] do
        if item.GUID == guid then
            return -1
        end
    end
    tinsert(x930213_var_Queue[varMap], {GUID = guid, OBJID = varPlayer})
    return getn(x930213_var_Queue[varMap])
end

function x930213_RemoveFromQueue(varMap, varPlayer)
    x930213_InitQueue(varMap)
    local guid = GetPlayerGUID(varMap, varPlayer)
    local newQueue = {}
    local ni = 1
    for varI, item in x930213_var_Queue[varMap] do
        if item.GUID ~= guid then
            newQueue[ni] = item
            ni = ni + 1
        end
    end
    x930213_var_Queue[varMap] = newQueue
end

function x930213_IsInQueue(varMap, varPlayer)
    x930213_InitQueue(varMap)
    local guid = GetPlayerGUID(varMap, varPlayer)
    for varI, item in x930213_var_Queue[varMap] do
        if item.GUID == guid then
            return 1
        end
    end
    return 0
end

function x930213_TryMatch(varMap)
    x930213_InitQueue(varMap)
    if getn(x930213_var_Queue[varMap]) < 2 then
        return
    end

    local p1 = x930213_var_Queue[varMap][1]
    local p2 = x930213_var_Queue[varMap][2]

    local newQueue = {}
    local ni = 1
    for varI = 3, getn(x930213_var_Queue[varMap]) do
        newQueue[ni] = x930213_var_Queue[varMap][varI]
        ni = ni + 1
    end
    x930213_var_Queue[varMap] = newQueue

    local obj1 = Guid2ObjId(varMap, p1.GUID)
    local obj2 = Guid2ObjId(varMap, p2.GUID)
    if obj1 == nil or obj2 == nil or obj1 < 0 or obj2 < 0 then
        if obj1 ~= nil and obj1 >= 0 then
            tinsert(x930213_var_Queue[varMap], 1, p1)
        end
        if obj2 ~= nil and obj2 >= 0 then
            tinsert(x930213_var_Queue[varMap], 1, p2)
        end
        return
    end

    Msg2Player(varMap, obj1, "#G[1v1竞技] 匹配成功！正在创建战场...", 8, 2)
    Msg2Player(varMap, obj1, "#G[1v1竞技] 匹配成功！正在创建战场...", 8, 3)
    Msg2Player(varMap, obj2, "#G[1v1竞技] 匹配成功！正在创建战场...", 8, 2)
    Msg2Player(varMap, obj2, "#G[1v1竞技] 匹配成功！正在创建战场...", 8, 3)

    x930213_CreateBattle(varMap, p1.GUID, p2.GUID)
end


-- ============================================================
-- Fuben Creation
-- ============================================================

function x930213_CreateBattle(varMap, guid1, guid2)
    SetSceneLoad_Map(varMap, x930213_var_SceneMapNavPath)
    SetFubenData_TeamLeader(varMap, guid1)
    SetFubenData_NoUserCloseTime(varMap, x930213_var_NoUserTime * 1000)
    SetFubenData_Timer(varMap, x930213_var_TickTime * 1000)
    SetFubenData_Param(varMap, x930213_CSP_FUBENTYPE, FUBEN_BIWULEITAI)
    SetFubenData_Param(varMap, x930213_CSP_SCRIPTID, x930213_var_FileId)
    SetFubenData_Param(varMap, x930213_CSP_TICKCOUNT, 0)
    SetFubenData_Param(varMap, x930213_CSP_FROMSCENEID, varMap)
    SetFubenData_Param(varMap, x930213_CSP_ISCLOSING, 0)
    SetFubenData_Param(varMap, x930213_CSP_LEAVECOUNTDOWN, 0)
    SetFubenData_Param(varMap, x930213_CSP_PLAYER1_GUID, guid1)
    SetFubenData_Param(varMap, x930213_CSP_PLAYER2_GUID, guid2)
    SetFubenData_Param(varMap, x930213_CSP_RESULT, -1)

    local varSelectMap = CreateFuben(varMap)

    if varSelectMap <= 0 then
        local obj1 = Guid2ObjId(varMap, guid1)
        local obj2 = Guid2ObjId(varMap, guid2)
        if obj1 ~= nil and obj1 >= 0 then
            Msg2Player(varMap, obj1, "#R[1v1竞技] 创建失败，请稍后再试！", 8, 2)
        end
        if obj2 ~= nil and obj2 >= 0 then
            Msg2Player(varMap, obj2, "#R[1v1竞技] 创建失败，请稍后再试！", 8, 2)
        end
        WriteLog(1, format("PVP1V1: CreateFuben failed varMap=%d", varMap))
    else
        WriteLog(1, format("PVP1V1: CreateFuben success varMap=%d destMap=%d", varMap, varSelectMap))
    end
end


-- ============================================================
-- Fuben Callbacks (dispatched by systemmain hooks)
-- ============================================================

function x930213_ProcFubenReady(varMap, destsceneId)
    SetFubenData_Param(destsceneId, x930213_CSP_FROMSCENEID, varMap)
    SetFubenData_Param(destsceneId, x930213_CSP_SCRIPTID, x930213_var_FileId)
    SetFubenData_Param(destsceneId, x930213_CSP_FUBENTYPE, FUBEN_BIWULEITAI)
    SetFubenData_Param(destsceneId, x930213_CSP_TICKCOUNT, 0)
    SetFubenData_Param(destsceneId, x930213_CSP_ISCLOSING, 0)
    SetFubenData_Param(destsceneId, x930213_CSP_LEAVECOUNTDOWN, 0)
    SetFubenData_Param(destsceneId, x930213_CSP_RESULT, -1)

    local guid1 = GetFubenData_Param(varMap, x930213_CSP_PLAYER1_GUID)
    local guid2 = GetFubenData_Param(varMap, x930213_CSP_PLAYER2_GUID)

    SetFubenData_Param(destsceneId, x930213_CSP_PLAYER1_GUID, guid1)
    SetFubenData_Param(destsceneId, x930213_CSP_PLAYER2_GUID, guid2)

    local obj1 = Guid2ObjId(varMap, guid1)
    local obj2 = Guid2ObjId(varMap, guid2)

    if obj1 ~= nil and obj1 >= 0 then
        local scenePre = varMap + 1
        local curX = GetPosX(varMap, obj1)
        local curZ = GetPosZ(varMap, obj1)
        SetPlayerRuntimeData(varMap, obj1, RD_HUMAN_SCENE_PRE, scenePre)
        SetPlayerRuntimeData(varMap, obj1, RD_HUMAN_POSX_PRE, curX)
        SetPlayerRuntimeData(varMap, obj1, RD_HUMAN_POSZ_PRE, curZ)
        SetCurCamp(varMap, obj1, x930213_CAMP_1)
        NewWorld(varMap, obj1, destsceneId, x930213_var_PosX1, x930213_var_PosZ1, x930213_var_FileId)
    end

    if obj2 ~= nil and obj2 >= 0 then
        local scenePre = varMap + 1
        local curX = GetPosX(varMap, obj2)
        local curZ = GetPosZ(varMap, obj2)
        SetPlayerRuntimeData(varMap, obj2, RD_HUMAN_SCENE_PRE, scenePre)
        SetPlayerRuntimeData(varMap, obj2, RD_HUMAN_POSX_PRE, curX)
        SetPlayerRuntimeData(varMap, obj2, RD_HUMAN_POSZ_PRE, curZ)
        SetCurCamp(varMap, obj2, x930213_CAMP_2)
        NewWorld(varMap, obj2, destsceneId, x930213_var_PosX2, x930213_var_PosZ2, x930213_var_FileId)
    end

    WriteLog(1, format("PVP1V1: FubenReady varMap=%d dest=%d", varMap, destsceneId))
end


function x930213_ProcPlayerEnter(varMap, varPlayer)
    if GetSceneType(varMap) ~= 1 then
        return
    end

    local scenePre = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_SCENE_PRE) - 1
    if scenePre >= 0 then
        local CurX = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE)
        local CurZ = GetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE)
        SetPlayerBakSceneInfo(varMap, varPlayer, scenePre, CurX, CurZ)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_SCENE_PRE, 0)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE, 0)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE, 0)
    end

    Msg2Player(varMap, varPlayer, "#Y[1v1竞技] 欢迎进入竞技场！战斗将在#R30秒#Y后开始！", 8, 2)
    SetPlayerMutexState(varMap, varPlayer, PLAYER_STATE_READYFUBEN, 0)
end


function x930213_ProcPlayerDie(varMap, varPlayer, varKiller)
    if GetFubenData_Param(varMap, x930213_CSP_ISCLOSING) == 1 then
        return
    end

    local guid1 = GetFubenData_Param(varMap, x930213_CSP_PLAYER1_GUID)
    local guid2 = GetFubenData_Param(varMap, x930213_CSP_PLAYER2_GUID)
    local deadGuid = GetPlayerGUID(varMap, varPlayer)

    local winnerFlag = 2
    if NumberCastIntToUInt(deadGuid) == NumberCastIntToUInt(guid1) then
        winnerFlag = 1
    elseif NumberCastIntToUInt(deadGuid) == NumberCastIntToUInt(guid2) then
        winnerFlag = 0
    end

    SetFubenData_Param(varMap, x930213_CSP_RESULT, winnerFlag)
    WriteLog(1, format("PVP1V1: PlayerDie varMap=%d winner=%d", varMap, winnerFlag))
    x930213_EndBattle(varMap)
end


function x930213_ProcPlayerRelive(varMap, varPlayer, varReliveOp)
    Msg2Player(varMap, varPlayer, "#R[1v1竞技] 比赛结束前不能复活，请耐心等待！", 8, 2)
end


function x930213_ProcPlayerLeave(varMap, varPlayer)
    if GetFubenData_Param(varMap, x930213_CSP_ISCLOSING) == 1 then
        return
    end
    WriteLog(1, format("PVP1V1: PlayerLeave varMap=%d name=%s", varMap, GetName(varMap, varPlayer)))
end


-- ============================================================
-- Battle Result & Rewards
-- ============================================================

function x930213_EndBattle(varMap)
    if GetFubenData_Param(varMap, x930213_CSP_ISCLOSING) == 1 then
        return
    end
    SetFubenData_Param(varMap, x930213_CSP_ISCLOSING, 1)

    local result = GetFubenData_Param(varMap, x930213_CSP_RESULT)
    x930213_GiveRewards(varMap, result)
    WriteLog(1, format("PVP1V1: EndBattle varMap=%d result=%d", varMap, result))
end


function x930213_GiveRewards(varMap, result)
    local guid1 = GetFubenData_Param(varMap, x930213_CSP_PLAYER1_GUID)
    local guid2 = GetFubenData_Param(varMap, x930213_CSP_PLAYER2_GUID)

    local humancount = GetFuben_PlayerCount(varMap)
    for varI = 0, humancount - 1 do
        local humanId = GetFuben_PlayerObjId(varMap, varI)
        if humanId ~= nil and humanId >= 0 and IsPlayerStateNormal(varMap, humanId) == 1 then
            local humanGuid = GetPlayerGUID(varMap, humanId)
            local isP1 = (NumberCastIntToUInt(humanGuid) == NumberCastIntToUInt(guid1))
            local isP2 = (NumberCastIntToUInt(humanGuid) == NumberCastIntToUInt(guid2))

            if result == 0 and isP1 then
                Msg2Player(varMap, humanId, format("#G恭喜你获胜！获得#R%d#G点战场积分", x930213_var_WinnerMark), 8, 2)
                Msg2Player(varMap, humanId, format("#G恭喜你获胜！获得#R%d#G点战场积分", x930213_var_WinnerMark), 8, 3)
                AddPVP2V2Mark(varMap, humanId, x930213_var_WinnerMark)
            elseif result == 1 and isP2 then
                Msg2Player(varMap, humanId, format("#G恭喜你获胜！获得#R%d#G点战场积分", x930213_var_WinnerMark), 8, 2)
                Msg2Player(varMap, humanId, format("#G恭喜你获胜！获得#R%d#G点战场积分", x930213_var_WinnerMark), 8, 3)
                AddPVP2V2Mark(varMap, humanId, x930213_var_WinnerMark)
            elseif result == 2 then
                Msg2Player(varMap, humanId, format("#Y平局！获得#R%d#Y点战场积分", x930213_var_DrawMark), 8, 2)
                AddPVP2V2Mark(varMap, humanId, x930213_var_DrawMark)
            else
                Msg2Player(varMap, humanId, format("#R你输了！获得#R%d#W点战场积分", x930213_var_LoserMark), 8, 2)
                AddPVP2V2Mark(varMap, humanId, x930213_var_LoserMark)
            end
        end
    end
end


-- ============================================================
-- Fuben Timer
-- ============================================================

function x930213_ProcFubenTimer(varMap, nowTime)
    local nowTickCount = GetFubenData_Param(varMap, x930213_CSP_TICKCOUNT) + 1
    SetFubenData_Param(varMap, x930213_CSP_TICKCOUNT, nowTickCount)

    local leaveFlag = GetFubenData_Param(varMap, x930213_CSP_ISCLOSING)

    if leaveFlag > 0 then
        local leaveCountDown = GetFubenData_Param(varMap, x930213_CSP_LEAVECOUNTDOWN) + 1
        SetFubenData_Param(varMap, x930213_CSP_LEAVECOUNTDOWN, leaveCountDown)

        if leaveCountDown >= x930213_var_CloseTick then
            local humancount = GetFuben_PlayerCount(varMap)
            for varI = 0, humancount - 1 do
                local humanId = GetFuben_PlayerObjId(varMap, varI)
                if humanId ~= nil and humanId >= 0 then
                    x930213_KickPlayer(varMap, humanId)
                end
            end
        else
            local remainSec = (x930213_var_CloseTick - leaveCountDown) * x930213_var_TickTime
            local humancount = GetFuben_PlayerCount(varMap)
            for varI = 0, humancount - 1 do
                local humanId = GetFuben_PlayerObjId(varMap, varI)
                if humanId ~= nil and humanId >= 0 then
                    Msg2Player(varMap, humanId, format("#Y竞技场将在#R%d秒#Y后关闭", remainSec), 8, 2)
                end
            end
        end
    else
        local humancount = GetFuben_PlayerCount(varMap)

        if nowTickCount > x930213_var_PrepareTicks and humancount <= 1 then
            if humancount == 1 then
                local humanId = GetFuben_PlayerObjId(varMap, 0)
                local humanGuid = GetPlayerGUID(varMap, humanId)
                local guid1 = GetFubenData_Param(varMap, x930213_CSP_PLAYER1_GUID)
                if NumberCastIntToUInt(humanGuid) == NumberCastIntToUInt(guid1) then
                    SetFubenData_Param(varMap, x930213_CSP_RESULT, 0)
                else
                    SetFubenData_Param(varMap, x930213_CSP_RESULT, 1)
                end
                Msg2Player(varMap, humanId, "#G对手已离开，你获胜！", 8, 2)
            else
                SetFubenData_Param(varMap, x930213_CSP_RESULT, 2)
            end
            x930213_EndBattle(varMap)
            return
        end

        if nowTickCount >= x930213_var_LimitTicks then
            SetFubenData_Param(varMap, x930213_CSP_RESULT, 2)
            for varI = 0, humancount - 1 do
                local humanId = GetFuben_PlayerObjId(varMap, varI)
                if humanId ~= nil and humanId >= 0 then
                    Msg2Player(varMap, humanId, format("#Y比赛时间已到，平局！将于#R%d秒#Y后关闭", x930213_var_CloseTick * x930213_var_TickTime), 8, 2)
                end
            end
            x930213_EndBattle(varMap)
            return
        end

        local remainTicks = x930213_var_LimitTicks - nowTickCount
        if remainTicks == 12 then
            for varI = 0, humancount - 1 do
                local humanId = GetFuben_PlayerObjId(varMap, varI)
                if humanId ~= nil and humanId >= 0 then
                    Msg2Player(varMap, humanId, "#R警告：比赛还有60秒结束！", 8, 2)
                end
            end
        elseif remainTicks == 6 then
            for varI = 0, humancount - 1 do
                local humanId = GetFuben_PlayerObjId(varMap, varI)
                if humanId ~= nil and humanId >= 0 then
                    Msg2Player(varMap, humanId, "#R警告：比赛还有30秒结束！", 8, 2)
                end
            end
        end
    end
end


-- ============================================================
-- Helper
-- ============================================================

function x930213_KickPlayer(varMap, varPlayer)
    local nHp = GetHp(varMap, varPlayer)
    if nHp <= 0 then
        ClearRageRecoverTick(varMap, varPlayer)
        RestoreHp(varMap, varPlayer, 100)
        RestoreRage(varMap, varPlayer, 100)
        ClearMutexState(varMap, varPlayer, 6)
        SendReliveResult(varMap, varPlayer, 1)
    end

    SetPlayerMutexState(varMap, varPlayer, PLAYER_STATE_DIE, 0)

    local nCountryId = GetCurCountry(varMap, varPlayer)
    SetCurCamp(varMap, varPlayer, nCountryId)

    local nBakSceneId, varX, z = GetPlayerBakSceneInfo(varMap, varPlayer)
    if nBakSceneId >= 0 then
        NewWorld(varMap, varPlayer, nBakSceneId, varX, z, x930213_var_FileId)
        return
    end

    local varCountry = GetCurCountry(varMap, varPlayer)
    local nDestSceneId = 0
    if varCountry == 0 then
        nDestSceneId = 50
    elseif varCountry == 1 then
        nDestSceneId = 150
    elseif varCountry == 2 then
        nDestSceneId = 250
    elseif varCountry == 3 then
        nDestSceneId = 350
    end
    NewWorld(varMap, varPlayer, nDestSceneId, x930213_var_BackX, x930213_var_BackZ, x930213_var_FileId)
end


-- ============================================================
-- NPC Interaction (main maps only)
-- ============================================================

function x930213_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    if varMap ~= 0 and varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 then
        return
    end
    local level = GetLevel(varMap, varPlayer)
    if level < x930213_var_MinLevel then
        return
    end
    TalkAppendButton(varMap, x930213_var_FileId, "#O【竞技】1v1竞技场", 3, -1)
end


function x930213_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, seleteId)
    if varMap ~= 0 and varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 then
        return
    end

    if seleteId == -1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap, "#Y【 1v1竞技场 】")
        TalkAppendString(varMap, "\t单人报名，系统自动匹配对手")
        TalkAppendString(varMap, "\t击杀对手或时间结束后平局")
        TalkAppendString(varMap, format("\t等级要求：%d级以上", x930213_var_MinLevel))
        TalkAppendString(varMap, format("\t奖励：胜者%d积分 / 败者%d积分", x930213_var_WinnerMark, x930213_var_LoserMark))
        if x930213_IsInQueue(varMap, varPlayer) == 1 then
            TalkAppendString(varMap, "\t#G你已在排队中...")
            TalkAppendButton(varMap, x930213_var_FileId, "#R【取消】取消报名", 3, 2)
        else
            TalkAppendButton(varMap, x930213_var_FileId, "#G【报名】参加1v1竞技场", 3, 1)
        end
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)

    elseif seleteId == 1 then
        local level = GetLevel(varMap, varPlayer)
        if level < x930213_var_MinLevel then
            Msg2Player(varMap, varPlayer, format("等级不足，需要%d级以上！", x930213_var_MinLevel), 8, 2)
            return
        end
        local teamid = GetTeamId(varMap, varPlayer)
        if teamid >= 0 then
            Msg2Player(varMap, varPlayer, "#R请先退队后再报名！", 8, 2)
            return
        end
        local result = x930213_AddToQueue(varMap, varPlayer)
        if result == -1 then
            Msg2Player(varMap, varPlayer, "你已经在排队中！", 8, 2)
        else
            Msg2Player(varMap, varPlayer, format("#G报名成功！当前排队人数：%d，等待匹配中...", result), 8, 2)
            Msg2Player(varMap, varPlayer, format("#G报名成功！当前排队人数：%d，等待匹配中...", result), 8, 3)
            x930213_TryMatch(varMap)
        end

    elseif seleteId == 2 then
        x930213_RemoveFromQueue(varMap, varPlayer)
        Msg2Player(varMap, varPlayer, "已取消1v1竞技场报名！", 8, 2)
        Msg2Player(varMap, varPlayer, "已取消1v1竞技场报名！", 8, 3)
    end
end


function x930213_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
    return 1
end

function x930213_ProcAccept(varMap, varPlayer)
end

function x930213_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end

function x930213_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end
