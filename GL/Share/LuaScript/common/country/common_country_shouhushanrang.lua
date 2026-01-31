
x300305_var_FileId              = 300305

x300305_var_QuestName           = "【国家】守护禅让"


function x300305_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    local isQingLong = IsQinglongZhuque( varMap, varPlayer, 0)
    local isZhuQue = IsQinglongZhuque( varMap, varPlayer, 1)
	if isQingLong ~= 1 and isZhuQue ~= 1 then
		return
	end

	TalkAppendButton( varMap, x300305_var_FileId, x300305_var_QuestName, 3, 1)
end

function x300305_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)	
    if idExt == 1 then
        local Readme_1 = "#Y【国家】守护禅让#W#r #r"
        local Readme_2 = "\t您真的愿意将您所在的守护位置禅让给您的副帮主吗？#r"
        local Readme_3 = "\t如果你因为一时不快不再想担任守护了，那么我建议你冷静下来再做决定，如果你已经经过了#G深思熟虑#W，那么我可以帮你办理禅让守护的手续。#r"
        local Readme_4 = "\t每周#G除周日以外#W的任何时间，您都可以在我这里进行禅让，但是#G每天#W只能禅让#G一次#W，您需要将您的守护位置和大权#G交给#W您的#G副帮主#W吗？#r"
        local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
        StartTalkTask( varMap)
        TalkAppendString( varMap, varReadme)
        StopTalkTask( varMap)
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300305_var_FileId, -1)
    end
end

function x300305_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    
    local isQingLong = IsQinglongZhuque( varMap, varPlayer, 0)
    local isZhuQue = IsQinglongZhuque( varMap, varPlayer, 1)
	if isQingLong ~= 1 and isZhuQue ~= 1 then
        Msg2Player( varMap, varPlayer, "你不是青龙或朱雀守护", 8, 3)
		return 0
	end

    local day, week = GetWeek()
    if day == 0 then
        Msg2Player( varMap, varPlayer, "守护周日不能禅让", 8, 3)
		return 0
    end

	return 1
end

function x300305_ProcAccept( varMap, varPlayer)
    
    CountryGuildDemise( varMap, varPlayer)
end


