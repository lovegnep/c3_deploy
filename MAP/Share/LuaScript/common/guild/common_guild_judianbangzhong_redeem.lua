x300931_var_FileId = 300931
x300931_var_QuestName = "【国家】领地经验"
x300931_var_GameId =1048

function x300931_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
		if GetGuildID( varMap, varPlayer ) == -1 then
			
			return
		end
	if GetGameOpenById(x300931_var_GameId) > 0 then
		TalkAppendButton(varMap,x300931_var_FileId, x300931_var_QuestName, 3)
		
	end
	
end

function x300931_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_SCENEID, x300931_var_FileId,-1,"ProcEventEntry1")		
end

function x300931_ProcEventEntry1(varMap, varPlayer,QuestData,varQuest)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地经验。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地经验。",8,2)
		
		return
	end

	StartTalkTask(varMap)
	local nGuildID = GetGuildID(varMap,varPlayer)
	local pos = GetGuildOfficial(varMap, varPlayer)
	local varLevel = GetLevel(varMap,varPlayer)
	local varExpBonus = 0
	if pos == 5 then
		if QuestData ==6 then
			 varExpBonus	= format (varLevel*70000*9)
		end
		
		if QuestData ==9 then
			 varExpBonus	= format (varLevel*70000*10)
		end
		
		if QuestData ==13 then
			 varExpBonus	= format (varLevel*70000*11)
		end
		
		if QuestData ==18 then
			 varExpBonus	= format (varLevel*70000*12)
		end
		
		
		if QuestData ==21 then
			 varExpBonus	= format (varLevel*70000*13)
		end
		
		if QuestData ==24 then
			varExpBonus	= format (varLevel*70000*14)
		end
		
		
		if QuestData ==27 then
			varExpBonus	= format (varLevel*70000*15)
		end
		
		
		if QuestData ==31 then
			varExpBonus	= format (varLevel*70000*16)
		end
		
		if QuestData ==34 then
			varExpBonus	= format (varLevel*70000*17)
		end
	else
		if QuestData ==6 then
			 varExpBonus	= format ((varLevel*70000*9)/4)
		end
		
		if QuestData ==9 then
			 varExpBonus	= format ((varLevel*70000*10)/4)
		end
		
		if QuestData ==13 then
			  varExpBonus	= format ((varLevel*70000*11)/4)
		end
		
		if QuestData ==18 then
			 varExpBonus	= format ((varLevel*70000*12)/4)
		end
		
		
		if QuestData ==21 then
			  varExpBonus	= format ((varLevel*70000*13)/4)
		end
		
		
		if QuestData ==24 then
			 varExpBonus	= format ((varLevel*70000*14)/4)
		end
		
		
		if QuestData ==27 then
			 varExpBonus	= format ((varLevel*70000*15)/4)
		end
		
		
		if QuestData ==31 then
			 varExpBonus	= format ((varLevel*70000*16)/4)
		end
		
		if QuestData ==34 then
			 varExpBonus	= format ((varLevel*70000*17)/4)
		end
		
	end
	
	
	
	local nLairdExp =  varExpBonus * nLairdLevel/10
	
	
	local Readme_1 = "#Y【国家】领地经验#r#W"
	local Readme_2 = "\t您好，尊敬的领地占有者，当您的等级达到#R60级#W时，您可以在每#R周六#W的#R0点-16点#W领取本周的领地经验奖励，我们会根据您占有的领地等级不同，给予您相应经验奖励，占领的领地等级越高，获得的奖励越多。 #r"
	local Readme_3 = "\t做为领地的领主，帮主可以领取普通帮会成员四倍的经验奖励。#r #r"
	local Readme_4 = "您本周可以领取的经验奖励如下：#r #r"
	local Readme_5 = "#Y经验："..varExpBonus.."点"
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
	TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, -1, x300931_var_FileId, -1 )

end
function x300931_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x300931_ProcAccept( varMap, varPlayer)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地经验。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地经验。",8,2)
		
		return
	end

	local hour,minute,second = GetHourMinSec()
    local curTime = GetMinOfDay()
	if GetWeek() ~= 6 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只能在周六领取。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只能在周六领取。",8,2)
		return
	end
	if curTime >= 960 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只能在周六的0点-16点间领取。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只能在周六的0点-16点间领取。",8,2)
		return
	end	
	if	GetLevel(varMap, varPlayer) < 60 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取领地经验奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取领地经验奖励。",8,2)
		return
	end
	
	
		
		
		
			
			
			
			
			
			
		
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_SCENEID, x300931_var_FileId,-1,"GetGuildLairdSceneId")
end

function x300931_GetGuildLairdSceneId(varMap, varPlayer,QuestData,varQuest)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地经验。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地经验。",8,2)
		
		return
	end

	if QuestData > 0 then
	
		if QuestData ~= 6  and QuestData ~= 9  and QuestData ~= 13 and 
		   QuestData ~= 18 and QuestData ~= 21 and QuestData ~= 24 and 
		   QuestData ~= 27 and QuestData ~= 31 and QuestData ~= 34 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "很抱歉，您不是该领地占领者");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"很抱歉，您不是该领地占领者",4,2)		
			return
		end
	
	else
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，您没有占领任何领地");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，您没有占领任何领地",4,2)	
		return
	end
		local lastWeekIndex = GetPlayerGameData(varMap, varPlayer, MD_JUDIANEXP_WEEKINDEX[1], MD_JUDIANEXP_WEEKINDEX[2], MD_JUDIANEXP_WEEKINDEX[3])
		local lastFortune = GetFortuneLastTime(varMap, varPlayer, 1)
		
		if GetWeekIndex() == lastWeekIndex then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您已经领过领地经验奖励。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您已经领过领地经验奖励。",8,2)
			return
		end
	GetJoinGuildTime(varMap,varPlayer,x300931_var_FileId)
end

function x300931_ProcMemberJoinTimeReturn( varMap, varPlayer, param )

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地经验。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地经验。",8,2)
		
		return
	end
	
	if param == -1 or GetCurrentTime()-param<24*3600 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您加入该领地占领帮的时间低于24小时，不能领取奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您加入该领地占领帮的时间低于24小时，不能领取奖励。",8,2)
		return		
	end
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_DATE,x300931_var_FileId,-1,"Newqinglong")
end

function x300931_Newqinglong(varMap, varPlayer,QuestData,varQuest)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地经验。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地经验。",8,2)
		
		return
	end

	local curDay = GetDayTime()
		if curDay == QuestData then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "很抱歉，当天上台的领地占领者不能领取工资");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,"很抱歉，当天上台的领地占领者不能领取工资",4,2)
			return
		end
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_SCENEID, x300931_var_FileId,-1,"GetGuildLairdSceneId2")
end

function x300931_GetGuildLairdSceneId2(varMap, varPlayer,QuestData,varQuest)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地经验。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地经验。",8,2)
		
		return
	end


	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		return
	end

	local nGuildID = GetGuildID(varMap,varPlayer)
	local pos = GetGuildOfficial(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = 0
	local ExpBonus1 = 0
	if pos == 5 then
		if QuestData ==6 then
			 ExpBonus1	= format (varLevel*70000*9)
		end
		
		if QuestData ==9 then
			 ExpBonus1	= format (varLevel*70000*10)
		end
		
		if QuestData ==13 then
			 ExpBonus1	= format (varLevel*70000*11)
		end
		
		if QuestData ==18 then
			 ExpBonus1	= format (varLevel*70000*12)
		end
		
		if QuestData ==21 then
			 ExpBonus1	= format (varLevel*70000*13)
		end
		
		if QuestData ==24 then
			 ExpBonus1	= format (varLevel*70000*14)
		end
		
		if QuestData ==27 then
			 ExpBonus1	= format (varLevel*70000*15)
		end
		
		if QuestData ==31 then
			 ExpBonus1	= format (varLevel*70000*16)
		end
		
		if QuestData ==34 then
			 ExpBonus1	= format (varLevel*70000*17)
		end
		
		
		
		AddExp( varMap, varPlayer, ExpBonus1 )
		StartTalkTask(varMap)
		TalkAppendString(varMap, "顺利领取");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"获得#R经验"..ExpBonus1.."点#o的奖励",8,2)
		
		local nLairdExpBonus1 =  ExpBonus1 * nLairdLevel/10
		AddExp( varMap, varPlayer, nLairdExpBonus1 )
		Msg2Player(varMap,varPlayer,"领地等级加成额外获得#R经验"..nLairdExpBonus1.."点#o的奖励",8,2)
		
		SetPlayerGameData(varMap, varPlayer, MD_JUDIANEXP_WEEKINDEX[1], MD_JUDIANEXP_WEEKINDEX[2], MD_JUDIANEXP_WEEKINDEX[3], GetWeekIndex())
		GamePlayScriptLog(varMap,varPlayer,1491)
	end
	
	if pos ~= 5 then
		if QuestData ==6 then
			 varExpBonus	= format ((varLevel*70000*9)/4)
		end
		
		if QuestData ==9 then
			 varExpBonus	= format ((varLevel*70000*10)/4)
		end
		
		if QuestData ==13 then
			 varExpBonus	= format ((varLevel*70000*11)/4)
		end
		
		if QuestData ==18 then
			 varExpBonus	= format ((varLevel*70000*12)/4)
		end
		
		if QuestData ==21 then
			 varExpBonus	= format ((varLevel*70000*13)/4)
		end
		
		if QuestData ==24 then
			 varExpBonus	= format ((varLevel*70000*14)/4)
		end
		
		if QuestData ==27 then
			 varExpBonus	= format ((varLevel*70000*15)/4)
		end
		
		if QuestData ==31 then
			 varExpBonus	= format ((varLevel*70000*16)/4)
		end
		
		if QuestData ==34 then
			 varExpBonus	= format ((varLevel*70000*17)/4)
		end
		
		AddExp( varMap, varPlayer, varExpBonus )
		StartTalkTask(varMap)
		TalkAppendString(varMap, "顺利领取");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"获得#R经验"..varExpBonus.."点#o的奖励",8,2)
		
		local nLairdExpBonus1 =  varExpBonus * nLairdLevel/10
		AddExp( varMap, varPlayer, nLairdExpBonus1 )
		Msg2Player(varMap,varPlayer,"领地等级加成额外获得#R经验"..nLairdExpBonus1.."点#o的奖励",8,2)
		
		SetPlayerGameData(varMap, varPlayer, MD_JUDIANEXP_WEEKINDEX[1], MD_JUDIANEXP_WEEKINDEX[2], MD_JUDIANEXP_WEEKINDEX[3], GetWeekIndex())
		GamePlayScriptLog(varMap,varPlayer,1491)
	end
end
