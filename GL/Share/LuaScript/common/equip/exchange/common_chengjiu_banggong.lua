

--DECLARE_QUEST_INFO_START--
x570041_var_FileId = 570041
x570041_var_ExtTarget={}
x570041_var_QuestName1 = "帮贡兑换经验"
--DECLARE_QUEST_INFO_STOP--


x570041_var_LevelTable    = {
                            { minLevel = 1,  maxLevel = 75,  coff = 48000},
                            { minLevel = 75, maxLevel = 80,  coff = 70000},
                            { minLevel = 80, maxLevel = 85,  coff = 91000 },
							{ minLevel = 85, maxLevel = 90,  coff = 112000},
                            { minLevel = 90, maxLevel = 95,  coff = 133000},
                            { minLevel = 95, maxLevel = 161, coff = 154000},
}







function x570041_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)	
    local varLevel = GetLevel( varMap, varPlayer)
    local xp = 48000
    for varI, item in x570041_var_LevelTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            xp = item.coff * varLevel
        end
    end

	StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y帮贡兑换经验" )
		TalkAppendString( varMap, format( "\n\t你所取得的成就有目共睹！#G帮贡#W正是你对帮会所做贡献的最好证明。您可以在这里用#R2000点#G帮贡#W兑换#R%d点#G经验#W。但每天只可以兑换一次。\n \n\t您现在有#R%d点#G帮贡#W。", xp, GetGuildUserPoint( varMap, varPlayer) ) )
        TalkAppendString( varMap, "\n\t你确定要用#G帮贡#W兑换#G经验#W么？" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x570041_var_FileId, -1)
end









function x570041_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x570041_var_FileId, x570041_var_QuestName1, 3, 1)
end

function x570041_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end

function x570041_ProcAccept( varMap, varPlayer)
    local score = GetGuildUserPoint( varMap, varPlayer)
    if score < 2000 then
        Msg2Player( varMap, varPlayer, "你的帮贡不足2000点，无法兑换经验", 8, 3)
        return
    end

    local day = GetDayOfYear()
    if day == GetPlayerGameData( varMap, varPlayer, MD_CHENGJIOU_BANGGONG[ 1], MD_CHENGJIOU_BANGGONG[ 2], MD_CHENGJIOU_BANGGONG[ 3] ) then
        Msg2Player( varMap, varPlayer, "你今天已经兑换过一次了，请明天再来", 8, 3)
        return
    else
        SetPlayerGameData( varMap, varPlayer, MD_CHENGJIOU_BANGGONG[ 1], MD_CHENGJIOU_BANGGONG[ 2], MD_CHENGJIOU_BANGGONG[ 3], day)
    end

    local varLevel = GetLevel( varMap, varPlayer)
    local xp = 48000
    for varI, item in x570041_var_LevelTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            xp = item.coff * varLevel
        end
    end

    AddExp( varMap, varPlayer, xp)
    Msg2Player( varMap, varPlayer, format( "获得#R%d#cffcc00点经验", xp), 8, 3)
    Msg2Player( varMap, varPlayer, format( "获得#R%d#cffcc00点经验。", xp), 8, 2)
	SubGuildUserPoint( varMap, varPlayer, 2000)
end

