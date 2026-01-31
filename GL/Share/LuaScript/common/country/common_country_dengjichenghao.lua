


x300661_var_FileId = 300661


x300661_var_CountryToplistTable   = {
                                    67, 69, 71, 73
}

x300661_var_CountryTitleTable     = {
                                    107, 108, 109, 110
}

function x300661_ProcEnumEvent( varMap, varPlayer, varTalknpc)
    TalkAppendButton( varMap, x300661_var_FileId, "【国家】国家封赏", 3, 1)
end

function x300661_ProcEventEntry( varMap, varPlayer, varTalknpc)

	local countryId = GetCurCountry(varMap,varPlayer)
	local countryName = GetCountryName(countryId)
	
    local rank = GetToplistRank( varMap, varPlayer, x300661_var_CountryToplistTable[ GetCurCountry( varMap, varPlayer) + 1] )
	if rank == -1 then
        StartTalkTask( varMap)
        TalkAppendString( varMap, format( "#Y【国家】国家封赏#W#r #r\t勇士，你是我们国家安全的保障。#r\t如果您的等级#G达到60级#W，并且是我国等级排行榜中#G前25位#W的勇士，在#G周一#W的时候都可以在我这里领取封赏！#r #r#G封赏称号：#r#Y先锋勇士#W#r #r#G称号属性：#r#Y命中+3#r闪避+3#r暴击+3#r韧性+3#r #r#R您上周没有进入本国等级排行榜，请再接再厉！") )
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300661_var_FileId, -1)
	else
		StartTalkTask( varMap)
        TalkAppendString( varMap, format( "#Y【国家】国家封赏#W#r #r\t勇士，你是我们国家安全的保障。#r\t如果您的等级#G达到60级#W，并且是我国等级排行榜中#G前25位#W的勇士，在#G周一#W的时候都可以在我这里领取封赏！#r #r#G封赏称号：#r#Y先锋勇士#W#r #r#G称号属性：#r#Y命中+3#r闪避+3#r暴击+3#r韧性+3#r #r#R您上周在本国的等级排名是第#B%d#R名！#r #r是否接受国家的封赏？",rank + 1) )
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300661_var_FileId, -1)
	end
end

function x300661_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

    local day, week = GetWeek()
    if week == GetPlayerGameData( varMap, varPlayer, MD_LEVEL_TITLE[ 1], MD_LEVEL_TITLE[ 2], MD_LEVEL_TITLE[ 3] ) then
        Msg2Player( varMap, varPlayer, "您本周已经接受过国家的封赏了", 8, 3)
		Msg2Player( varMap, varPlayer, "您本周已经接受过国家的封赏了", 8, 2)
        return 0
    end

    local rank = GetToplistRank( varMap, varPlayer, x300661_var_CountryToplistTable[ GetCurCountry( varMap, varPlayer) + 1] )
    if rank == -1 then
	Msg2Player( varMap,varPlayer,"您上周的等级排名未能进入本国前25名",8,3)
	Msg2Player( varMap,varPlayer,"您上周的等级排名未能进入本国前25名",8,2)
		return 0
	end
	
	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 60 then
	Msg2Player( varMap,varPlayer,"等级达到60级才可以接受国家封赏",8,3)
	Msg2Player( varMap,varPlayer,"等级达到60级才可以接受国家封赏",8,2)
		return 0
	end
	
	local week1 = GetWeek()
	if week1 ~= 1 then
	Msg2Player(varMap,varPlayer,"只有周一才可以接受国家封赏",8,3)
	Msg2Player(varMap,varPlayer,"只有周一才可以接受国家封赏",8,2)
		return 0
	end
	
	local varMsg = "恭喜您获得了先锋勇士的荣誉称号"
        
	    Msg2Player( varMap, varPlayer, varMsg, 8, 2)
    
    SetPlayerGameData( varMap, varPlayer, MD_LEVEL_TITLE[ 1], MD_LEVEL_TITLE[ 2], MD_LEVEL_TITLE[ 3], week)
    AwardTitle( varMap, varPlayer, x300661_var_CountryTitleTable[ GetCurCountry( varMap, varPlayer) + 1] )

	return	1
end

function x300661_ProcAccept( varMap, varPlayer )
end
