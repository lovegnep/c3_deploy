






x300616_var_FileId 					= 300616
x300616_var_QuestName				= "【世界杯】上缴龙珠"
x300616_var_strDescription            = "\t你要上缴龙珠么？"
x300616_var_Score                     = 50
x300616_var_Score_Crystal             = 1
x300616_var_ItemId                    = 13080024

function x300616_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    local varState = GetWorldCupState( varMap)
    if varState == STATE_GUILD_WORLDCUP_START then
        TalkAppendButton( varMap, x300616_var_FileId, x300616_var_QuestName, 3, 1)
        TalkAppendButton( varMap, x300616_var_FileId, "【世界杯】上缴幽谷玄冰", 3, 2)
    end
    return 1
end

function x300616_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDBATTLE_BEKILLED, 0)
    if idExt == 1 then
        if IsHaveSpecificImpact( varMap, varPlayer, 7801) == 0 then
            Msg2Player( varMap, varPlayer, "你没有夺取龙珠，无法上缴", 8, 3)
            return
        end
        StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x300616_var_QuestName)
        TalkAppendString( varMap, x300616_var_strDescription)
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300616_var_FileId, -1)
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDBATTLE_BEKILLED, idExt)
    elseif idExt == 2 then
        if GetItemCountInBag( varMap, varPlayer, x300616_var_ItemId) <= 0 then
            Msg2Player( varMap, varPlayer, "你没有夺取幽谷玄冰，无法上缴", 8, 3)
            return
        end
        StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x300616_var_QuestName)
        TalkAppendString( varMap, "\t你要上缴幽谷玄冰么？")
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300616_var_FileId, -1)
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDBATTLE_BEKILLED, idExt)
    end
end

function x300616_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local commitType = GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDBATTLE_BEKILLED)
    local nGuildA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local nGuildB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)
    local nGuildId = GetGuildID( varMap, varPlayer)

    if commitType == 1 then
        if IsHaveSpecificImpact( varMap, varPlayer, 7801) == 0 then
            Msg2Player( varMap, varPlayer, "你没有夺取龙珠，无法上缴", 8, 3)
            return 0
        end

        local growPointid = GetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID)
        if nGuildA == nGuildId then
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE) + x300616_var_Score)
        elseif nGuildB == nGuildId then
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE) + x300616_var_Score)
        end

        CancelSpecificImpact( varMap, varPlayer, 7801)
        CancelSpecificImpact( varMap, varPlayer, 7802)
        
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_ASSIST, GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_ASSIST) + 1)
        
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_SCORE, GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_SCORE) + x300616_var_Score)
        Msg2Player( varMap, varPlayer, format( "#G%s#cffcc00上缴一颗龙珠。", GetName( varMap, varPlayer) ), 6, 2)
        Msg2Player( varMap, varPlayer, "你上缴一颗龙珠。", 8, 2)

        SetGrowPointPos( varMap, growPointid, 126, 124)
        SetGrowPointIntervalContainer( varMap, growPointid, 1000)
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY, -1)
    elseif commitType == 2 then
        if GetItemCountInBag( varMap, varPlayer, x300616_var_ItemId) <= 0 then
            Msg2Player( varMap, varPlayer, "你没有夺取幽谷玄冰，无法上缴", 8, 3)
            return 0
        end

        if DelItem( varMap, varPlayer, x300616_var_ItemId, 1) <= 0 then
            Msg2Player( varMap, varPlayer, "提交幽谷玄冰失败", 8, 3)
            return 0
        end

        if nGuildA == nGuildId then
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE) + x300616_var_Score_Crystal)
        elseif nGuildB == nGuildId then
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE) + x300616_var_Score_Crystal)
        end

        
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_FAMILY, GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_FAMILY) + 1)
        
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_SCORE, GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_SCORE) + 1)

        Msg2Player( varMap, varPlayer, format( "#G%s#cffcc00上缴一块@item_%d#cffcc00。", GetName( varMap, varPlayer), x300616_var_ItemId), 6, 2)
        Msg2Player( varMap, varPlayer, format( "你上缴一块@item_%d#cffcc00。", x300616_var_ItemId), 8, 2)
    end

    SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDBATTLE_BEKILLED, 0)

	return 1;
end

function x300616_ProcAccept( varMap, varPlayer, varTalknpc)
    
	
	
		
		
	
end

