x300929_var_FileId = 300929
x300929_var_QuestName = "【国家】领地津贴"
x300929_var_GameId =1047
x300929_var_Multiple = 2

function x300929_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
		if GetGuildID( varMap, varPlayer ) == -1 then
			
			return
		end
	if GetGameOpenById(x300929_var_GameId) > 0 then
		TalkAppendButton(varMap,x300929_var_FileId, x300929_var_QuestName, 3)
		
	end
	
end

function x300929_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_SCENEID, x300929_var_FileId,-1,"ProcEventEntry1")		
end

function x300929_ProcEventEntry1(varMap, varPlayer,QuestData,varQuest)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地津贴。",8,2)
		
		return
	end
	
	local money = 0
	local nLaridMoney = 0

	StartTalkTask(varMap)
	local nGuildID = GetGuildID(varMap,varPlayer)
	local pos = GetGuildOfficial(varMap, varPlayer)
	local ding = 0
	local liang =0
	local wen = 0
	if pos == 5 then
		if QuestData ==6 then
			 money = format(4*9*0.5*1000)
		end
		
		if QuestData ==9 then
			 money = format(4*10*0.5*1000)
		end
		
		if QuestData ==13 then
			 money = format(4*11*0.5*1000)
		end
		
		if QuestData ==18 then
			 money = format(4*12*0.5*1000)
		end
		
		
		if QuestData ==21 then
			 money = format(4*13*0.5*1000)
		end
		
		
		if QuestData ==24 then
			 money = format(4*14*0.5*1000)
		end
		
		
		if QuestData ==27 then
			 money = format(4*15*0.5*1000)
		end
		
		
		if QuestData ==31 then
			 money = format(4*16*0.5*1000)
		end
		
		if QuestData ==34 then
			 money = format(4*17*0.5*1000)
		end
	else
		if QuestData ==6 then
			 money = format(9*0.5*1000)
		end
		
		if QuestData ==9 then
			 money = format(10*0.5*1000)
		end
		
		if QuestData ==13 then
			 money = format(11*0.5*1000)
		end
		
		if QuestData ==18 then
			 money = format(12*0.5*1000)
		end
		
		
		if QuestData ==21 then
			 money = format(13*0.5*1000)
		end
		
		
		if QuestData ==24 then
			 money = format(14*0.5*1000)
		end
		
		
		if QuestData ==27 then
			 money = format(15*0.5*1000)
		end
		
		
		if QuestData ==31 then
			 money = format(16*0.5*1000)
		end
		
		if QuestData ==34 then
			 money = format(17*0.5*1000)
		end
	end
	money = money * x300929_var_Multiple
	
	nLaridMoney = money * nLairdLevel/10
	
	local Readme_1 = "#Y【国家】领地津贴#r#W"
	local Readme_2 = "\t您好，尊敬的领地占有者，当您的等级达到#R60级#W时，您可以在每#R周六#W的#R0点-16点#W领取本周的【国家】领地津贴，我们会根据您占有的领地等级，给予您相应的金卡奖励，占领的领地等级越高，获得的奖励越多。 #r"
	local Readme_3 = "\t做为领地的领主，帮主可以领取普通帮会成员四倍的金卡奖励。#r #r"
	local Readme_4 = "您本周可以领取的金卡奖励如下：#r #r"
	local Readme_5 = format("金卡：#Y#{_MONEY%d}#W",money)
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
	TalkAppendString(varMap, varReadme);
	StopTalkTask(varMap);
	DeliverTalkInfo( varMap, varPlayer,-1, x300929_var_FileId, -1 );

end

function x300929_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x300929_ProcAccept( varMap, varPlayer)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地津贴。",8,2)
		
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
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取领地金钱奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取领地金钱奖励。",8,2)
		return
	end
	
	
	
	
	
		
		
		
		
		
		
	
	
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_SCENEID, x300929_var_FileId,-1,"GetGuildLairdSceneId")
end

function x300929_GetGuildLairdSceneId(varMap, varPlayer,QuestData,varQuest)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地津贴。",8,2)
		
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
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取领地金钱奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取领地金钱奖励。",8,2)
		return
	end

	if QuestData > 0 then
		if QuestData ~= 6 and QuestData ~= 9 and QuestData ~= 13 and 
		   QuestData ~= 18 and QuestData ~= 21 and QuestData ~= 24 and 
		   QuestData ~= 27  and QuestData ~= 31 and QuestData ~= 34 then
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
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_JUDIANMONEY_WEEKINDEX[1], MD_JUDIANMONEY_WEEKINDEX[2], MD_JUDIANMONEY_WEEKINDEX[3])
	local lastFortune = GetFortuneLastTime(varMap, varPlayer, 1)
	
	if GetWeekIndex() == varLastday then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您已经领过领地金钱奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您已经领过领地金钱奖励。",8,2)
		return
	end
	GetJoinGuildTime(varMap,varPlayer,x300929_var_FileId)
end

function x300929_ProcMemberJoinTimeReturn( varMap, varPlayer, param )

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地津贴。",8,2)
		
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
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取领地金钱奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取领地金钱奖励。",8,2)
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
	
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_DATE, x300929_var_FileId,-1,"Newqinglong")
end

function x300929_Newqinglong(varMap, varPlayer,QuestData,varQuest)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地津贴。",8,2)
		
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
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取领地金钱奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取领地金钱奖励。",8,2)
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
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_REDEEM_DATE, x300929_var_FileId,-1,"CheckHasRedeem")
end

function x300929_CheckHasRedeem( varMap, varPlayer, param )

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地津贴。",8,2)
		
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
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取领地金钱奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取领地金钱奖励。",8,2)
		return
	end

	local nGuildID = GetGuildID(varMap,varPlayer)
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos == 5 then
		if param == GetDayOfYear() then
			Msg2Player(varMap,varPlayer,"很抱歉，您已经领取过金钱奖励。",8,3)
			Msg2Player(varMap,varPlayer,"很抱歉，您已经领取过金钱奖励。",8,2)
			return		
		end
	else
		GetPlayerGameData(varMap, varPlayer, MD_JUDIANMONEY_WEEKINDEX[1], MD_JUDIANMONEY_WEEKINDEX[2], MD_JUDIANMONEY_WEEKINDEX[3])
	end
	GetGuildQuestData(varMap,varPlayer,GD_GUILD_LAIRDBATTLE_SCENEID, x300929_var_FileId,-1,"GetGuildLairdSceneId2")
end


function x300929_GetGuildLairdSceneId2(varMap, varPlayer,QuestData,varQuest)

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有领地帮会成员才能领取领地津贴。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，只有领地帮会成员才能领取领地津贴。",8,2)
		
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
		TalkAppendString(varMap, "很抱歉，达到60级才可以领取领地金钱奖励。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，达到60级才可以领取领地金钱奖励。",8,2)
		return
	end

	local nGuildID = GetGuildID(varMap,varPlayer)
	local nLairdMapId,_,_,_,nLairdLevel = GetGuildLairdSceneId(nGuildID)
	if nLairdMapId <= 0 then
		return
	end
	
	local money = 0
	local money1 = 0
	local nLaridMoney = 0
	
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos == 5 then
		if QuestData ==6 then
			 money1 = format(4*9*0.5*1000)
		end
		
		if QuestData ==9 then
			 money1 = format(4*10*0.5*1000)
		end
		
		if QuestData ==13 then
			 money1 = format(4*11*0.5*1000)
		end
		
		if QuestData ==18 then
			 money1 = format(4*12*0.5*1000)
		end
		
		
		if QuestData ==21 then
			 money1= format(4*13*0.5*1000)
		end
		
		
		if QuestData ==24 then
			 money1 = format(4*14*0.5*1000)
		end
		
		
		if QuestData ==27 then
			 money1 = format(4*15*0.5*1000)
		end
		
		
		if QuestData ==31 then
			 money1 = format(4*16*0.5*1000)
		end
		
		if QuestData ==34 then
			 money1 = format(4*17*0.5*1000)
		end
		money1 = money1 * x300929_var_Multiple
		AddMoney( varMap, varPlayer, 3, money1 )
		SetGuildQuestData( varMap,GetGuildID( varMap, varPlayer ),GD_GUILD_LAIRDBATTLE_REDEEM_DATE,GetDayOfYear() )
		
		nLaridMoney = money1 * nLairdLevel/10
		AddMoney( varMap, varPlayer, 3, nLaridMoney )
		
		
		local award = format("您领取了#R#{_MONEY%d}#o金卡", money1)
		local awardLaird = format("领地等级加成额外获得#R#{_MONEY%d}#o金卡", nLaridMoney)
		
		Msg2Player(varMap,varPlayer,award,4,3)
		Msg2Player(varMap,varPlayer,awardLaird,4,3)
		
		GamePlayScriptLog(varMap,varPlayer,1481)
	end
	
	if  pos ~= 5 then
		if QuestData ==6 then
			 money = format(9*0.5*1000)
		end
		
		if QuestData ==9 then
			 money = format(10*0.5*1000)
		end
		
		if QuestData ==13 then
			 money = format(11*0.5*1000)
		end
		
		if QuestData ==18 then
			 money = format(12*0.5*1000)
		end
		
		
		if QuestData ==21 then
			 money = format(13*0.5*1000)
		end
		
		
		if QuestData ==24 then
			 money = format(14*0.5*1000)
		end
		
		
		if QuestData ==27 then
			 money = format(15*0.5*1000)
		end
		
		
		if QuestData ==31 then
			 money = format(16*0.5*1000)
		end
		
		if QuestData ==34 then
			 money = format(17*0.5*1000)
		end
		
		money = money * x300929_var_Multiple
		AddMoney( varMap, varPlayer, 3, money )
		SetPlayerGameData(varMap, varPlayer, MD_JUDIANMONEY_WEEKINDEX[1], MD_JUDIANMONEY_WEEKINDEX[2], MD_JUDIANMONEY_WEEKINDEX[3], GetWeekIndex())	
		
		nLaridMoney = money * nLairdLevel/10
		AddMoney( varMap, varPlayer, 3, nLaridMoney )
		
		
		local award = format("您领取了#R#{_MONEY%d}#o金卡", money)
		local awardLaird = format("领地等级加成额外获得#R#{_MONEY%d}#o金卡", nLaridMoney)
		
		Msg2Player(varMap,varPlayer,award,4,3)
		Msg2Player(varMap,varPlayer,awardLaird,4,3)
		
		GamePlayScriptLog(varMap,varPlayer,1481)
	end
end
