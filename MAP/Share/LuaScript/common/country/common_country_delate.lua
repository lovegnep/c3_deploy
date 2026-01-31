






x300316_var_FileId 					= 300316
x300316_var_QuestName				= "【国家】弹劾国王"
x300316_var_NeedMoney = 20000
x300316_var_GameId						= 1023 
x300316_var_GameOpenId				= 1031 






function x300316_ProcEnumEvent(varMap, varPlayer, varTalknpc, eventId, varIndex)
	if GetGameOpenById(x300316_var_GameOpenId) <= 0 then
		return
	end
	if CountryGetOfficial(varMap,varPlayer)==8 then
		return
	end
	TalkAppendButton(varMap, x300316_var_FileId, x300316_var_QuestName,3);
end







function x300316_ProcEventEntry(varMap, varPlayer, varTalknpc)
	StartTalkTask(varMap);
	local Readme1 = "#Y【国家】弹劾国王#W#r\t当等级排行榜第一名超过70级时，每周二晚#R20：00-21：00之间#W，在本国#R排名前5名非国王帮帮会#W的#G任意帮主#W可以在我这里发起弹劾国王。"
	local Readme2 =  "如果除#G发起者之外#W的另外#G四位帮主中的二位#W同意发起#R弹劾国王#W。#G40级以#W上线上国民将会收到#G弹劾框#W，如果线上国民低于150人，则弹劾自动失败。#G回应弹劾#W的国民超过#R70%#W，则#R国王自动下台#W，同时#R国王帮自动下台#W，发起弹劾的帮会自动成为#G新国王帮#W，该帮帮主成为#G新的国王#W。"
	local varReadme  =  Readme1..Readme2
	TalkAppendString(varMap, varReadme);
	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300316_var_FileId, -1);
end







function x300316_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end







function x300316_ProcAccept(varMap, varPlayer, varTalknpc)
	local varStr = x300316_DoCountryDelate(varMap, varPlayer, varTalknpc)
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		Msg2Player(varMap,varPlayer,varStr,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
	end
end

function x300316_DoCountryDelate(varMap, varPlayer, varTalknpc)
	
	local guildId = GetGuildID(varMap, varPlayer)
	if 0 > guildId then
		return "很抱歉，您还没有加入帮会。"
	end
	
	local guildLevel,memNum,guidEXP = GetGuildSimpleData(guildId)
	if 2 > guildLevel then
		return "很抱歉，您的帮会等级太低。"
	end
	
	if 5 ~= GetGuildOfficial(varMap, varPlayer) then
		return "很抱歉，只有帮主才能发起弹劾。"
	end
	
	if 30 > GetLevel(varMap, varPlayer) then
		return "很抱歉，您的等级太低。"
	end
	
	local week = GetWeek()
	local hour,minute,second = GetHourMinSec()
	if (2 == week and hour >= 20 and hour < 21) then
	else
		return "很抱歉，请在周二20：00-21：00时前来进行弹劾。"
	end
	
	
		
	
	
	local remainTime = ((20 - hour)*3600 + (59 - minute)*60)*1000
	CountryDelateReq(varMap, varPlayer, remainTime)
	
	return nil
	
end

function x300316_ProcCountryDelateRet(varMap, varPlayer, retCode)
	if 0 == retCode then
		Msg2Player(varMap,varPlayer,"弹劾申请完成提交。",8,3)
		Msg2Player(varMap,varPlayer,"弹劾申请完成提交。",8,2)
	elseif 1 == retCode then
		Msg2Player(varMap,varPlayer,"不能弹劾自己。",8,3)
		Msg2Player(varMap,varPlayer,"不能弹劾自己。",8,2)
	elseif 2 == retCode then
		Msg2Player(varMap,varPlayer,"已经在弹劾中。",8,3)
		Msg2Player(varMap,varPlayer,"已经在弹劾中。",8,2)
	elseif 3 == retCode then
		Msg2Player(varMap,varPlayer,"没有足够的帮主线上。",8,3)
		Msg2Player(varMap,varPlayer,"没有足够的帮主线上。",8,2)
	elseif 4 == retCode then
		Msg2Player(varMap,varPlayer,"没有国王。",8,3)
		Msg2Player(varMap,varPlayer,"没有国王。",8,2)
	elseif 5 == retCode then
		Msg2Player(varMap,varPlayer,"需要更高的帮会排名。",8,3)
		Msg2Player(varMap,varPlayer,"需要更高的帮会排名。",8,2)
	end
	return 1
end


function x300316_SetClose( param0, varParam1, varParam2)
    SetCountryQuestData( param0, 1, CD_INDEX_MOJUN_KILL_COUNT1, 0)
    SetGameOpenById( 1021, 0)
    SetGameOpenById( 1023, 0)
    SetGameOpenById( 1031, 0)
end
