

--DECLARE_QUEST_INFO_START--
x570040_var_FileId = 570040
x570040_var_ExtTarget={}
x570040_var_QuestName1 = "荣誉兑换经验"
--DECLARE_QUEST_INFO_STOP--


x570040_var_LevelTable    = {
                            { minLevel = 1,  maxLevel = 75,  coff = 48000},
                            { minLevel = 75, maxLevel = 80,  coff = 70000},
                            { minLevel = 80, maxLevel = 85,  coff = 91000 },
							{ minLevel = 85, maxLevel = 90,  coff = 112000},
                            { minLevel = 90, maxLevel = 95,  coff = 133000},
                            { minLevel = 95, maxLevel = 161, coff = 154000},
}







function x570040_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)	
    local varLevel = GetLevel( varMap, varPlayer)
    local xp = 48000
    for varI, item in x570040_var_LevelTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            xp = item.coff * varLevel
        end
    end

	StartTalkTask( varMap)
	    TalkAppendString( varMap, "#Y荣誉兑换经验" )
        TalkAppendString( varMap, format( "\n\t你所取得的成就有目共睹！#G荣誉#W正是你对国家所做贡献的最好证明。您可以在这里用#R5000点#G荣誉#W兑换#R%d点#G经验#W。但每天只可以兑换一次。\n \n\t您现在有#R%d点#G荣誉#W。", xp, GetHonor( varMap, varPlayer) ) )
        TalkAppendString( varMap, "\n\t你确定要用#G荣誉#W兑换#G经验#W么？" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x570040_var_FileId, -1)
end









function x570040_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x570040_var_FileId, x570040_var_QuestName1, 3, 1)
end

function x570040_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end

function x570040_ProcAccept( varMap, varPlayer)
    local score = GetHonor( varMap, varPlayer)
    if score < 5000 then
        Msg2Player( varMap, varPlayer, "你的荣誉不足5000点，无法兑换经验", 8, 3)
        return
    end

    local day = GetDayOfYear()
    if day == GetPlayerGameData( varMap, varPlayer, MD_CHENGJIOU_RONGYU[ 1], MD_CHENGJIOU_RONGYU[ 2], MD_CHENGJIOU_RONGYU[ 3] ) then
        Msg2Player( varMap, varPlayer, "你今天已经兑换过一次了，请明天再来", 8, 3)
        return
    else
        SetPlayerGameData( varMap, varPlayer, MD_CHENGJIOU_RONGYU[ 1], MD_CHENGJIOU_RONGYU[ 2], MD_CHENGJIOU_RONGYU[ 3], day)
    end

    local varLevel = GetLevel( varMap, varPlayer)
    local xp = 48000
    for varI, item in x570040_var_LevelTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            xp = item.coff * varLevel
        end
    end

    AddExp( varMap, varPlayer, xp)
    Msg2Player( varMap, varPlayer, format( "获得#R%d#cffcc00点经验", xp), 8, 3)
    Msg2Player( varMap, varPlayer, format( "获得#R%d#cffcc00点经验。", xp), 8, 2)
	SubHonor( varMap, varPlayer, 5000)
end

