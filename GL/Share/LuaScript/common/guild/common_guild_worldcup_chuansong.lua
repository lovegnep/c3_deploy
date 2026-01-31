--DECLARE_QUEST_INFO_START-- 
x300835_var_FileId 					= 	300835
x300835_var_QuestName				= 	"世界杯战场规则"
x300835_var_QuestInfo				= 	"巡按任务信息"
--DECLARE_QUEST_INFO_STOP--


x300835_var_UpRedX                    = 202
x300835_var_UpRedZ                    = 79
x300835_var_UpBlueX                   = 64
x300835_var_UpBlueZ                   = 88
x300835_var_DownRedX                  = 202
x300835_var_DownRedZ                  = 169
x300835_var_DownBlueX                 = 64
x300835_var_DownBlueZ                 = 175
x300835_var_CenterRedX                = 215
x300835_var_CenterRedZ                = 108
x300835_var_CenterBlueX               = 35
x300835_var_CenterBlueZ               = 111

x300835_var_RedNPCUp                  = 129734
x300835_var_RedNPCDown                = 129733
x300835_var_RedNPCCenter              = 129732
x300835_var_BlueNPCUp                 = 129735
x300835_var_BlueNPCDown               = 129736
x300835_var_BlueNPCCenter             = 129739
x300835_var_RedNPCLeave               = 129730
x300835_var_BlueNPCLeave              = 129737

function x300835_ProcEnumEvent( varMap, varPlayer, varTalknpc)
    local guid = GetMonsterGUID( varMap, varTalknpc)

    if guid == x300835_var_RedNPCCenter then
        TalkAppendButton( varMap, x300835_var_FileId, "【右卫军】传送", 13, 1)
        TalkAppendButton( varMap, x300835_var_FileId, "【左卫军】传送", 13, 2)
    elseif guid == x300835_var_BlueNPCCenter then
        TalkAppendButton( varMap, x300835_var_FileId, "【左翼军】传送", 13, 7)
        TalkAppendButton( varMap, x300835_var_FileId, "【右翼军】传送", 13, 8)
    elseif guid == x300835_var_RedNPCUp then
        TalkAppendButton( varMap, x300835_var_FileId, "【本阵】传送", 13, 3)
        TalkAppendButton( varMap, x300835_var_FileId, "【左卫军】传送", 13, 4)
    elseif guid == x300835_var_BlueNPCUp then
        TalkAppendButton( varMap, x300835_var_FileId, "【本阵】传送", 13, 9)
        TalkAppendButton( varMap, x300835_var_FileId, "【右翼军】传送", 13, 10)
    elseif guid == x300835_var_RedNPCDown then
        TalkAppendButton( varMap, x300835_var_FileId, "【右卫军】传送", 13, 5)
        TalkAppendButton( varMap, x300835_var_FileId, "【本阵】传送", 13, 6)
    elseif guid == x300835_var_BlueNPCDown then
        TalkAppendButton( varMap, x300835_var_FileId, "【左翼军】传送", 13, 11)
        TalkAppendButton( varMap, x300835_var_FileId, "【本阵】传送", 13, 12)
    elseif guid == x300835_var_RedNPCLeave or guid == x300835_var_BlueNPCLeave then
        TalkAppendButton( varMap, x300835_var_FileId, "离开战场", 13, 13)
    end
end

function x300835_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, indexId)
    local nGuildA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local nGuildB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)
    local nGuildId = GetGuildID( varMap, varPlayer)
    local rx = random( 2, 5)
    local rz = random( 2, 5)

    if indexId == 13 then
        LuaCallNoclosure( 300615,"ProcPlayerAskLeave", varMap, varPlayer)
        return
    end

    local varState = GetWorldCupState( varMap)
    if varState ~= STATE_GUILD_WORLDCUP_START then
        Msg2Player( varMap, varPlayer, "比赛尚未开始，无法传送", 8, 3)
        return
    end

    if indexId == 1 then
        SetPos( varMap, varPlayer, x300835_var_UpRedX + rx, x300835_var_UpRedZ + rz)
    elseif indexId == 2 then
        SetPos( varMap, varPlayer, x300835_var_DownRedX + rx, x300835_var_DownRedZ + rz)
    elseif indexId == 3 then
        SetPos( varMap, varPlayer, x300835_var_CenterRedX + rx, x300835_var_CenterRedZ + rz)
    elseif indexId == 4 then
        SetPos( varMap, varPlayer, x300835_var_DownRedX + rx, x300835_var_DownRedZ + rz)
    elseif indexId == 5 then
        SetPos( varMap, varPlayer, x300835_var_UpRedX + rx, x300835_var_UpRedZ + rz)
    elseif indexId == 6 then
        SetPos( varMap, varPlayer, x300835_var_CenterRedX + rx, x300835_var_CenterRedZ + rz)
    elseif indexId == 7 then
        SetPos( varMap, varPlayer, x300835_var_UpBlueX + rx, x300835_var_UpBlueZ + rz)
    elseif indexId == 8 then
        SetPos( varMap, varPlayer, x300835_var_DownBlueX + rx, x300835_var_DownBlueZ + rz)
    elseif indexId == 9 then
        SetPos( varMap, varPlayer, x300835_var_CenterBlueX + rx, x300835_var_CenterBlueZ + rz)
    elseif indexId == 10 then
        SetPos( varMap, varPlayer, x300835_var_DownBlueX + rx, x300835_var_DownBlueZ + rz)
    elseif indexId == 11 then
        SetPos( varMap, varPlayer, x300835_var_UpBlueX + rx, x300835_var_UpBlueZ + rz)
    elseif indexId == 12 then
        SetPos( varMap, varPlayer, x300835_var_CenterBlueX + rx, x300835_var_CenterBlueZ + rz)
    end
end

function x300835_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

end

function x300835_ProcDie( varMap, varPlayer, varKiller)
end

function x300835_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300835_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end




function x300835_ProcAccept( varMap, varPlayer)
end



function x300835_ProcQuestAbandon( varMap, varPlayer, varQuest)
end



function x300835_ProcContinue( varMap, varPlayer, varTalknpc)
end



function x300835_CheckSubmit( varMap, varPlayer)
end



function x300835_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest)
end



function x300835_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end



function x300835_ProcAreaEntered( varMap, varPlayer, varArea, varQuest)
end



function x300835_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
end
