




--DECLARE_QUEST_INFO_START--


x350005_var_FileId = 350005
x350005_var_QuestName = "【国家】国王争霸赛奖励领取"
x350005_var_LevelLess = 30
x350005_var_DayCountLimited = 1

function x350005_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	local week = GetWeek()
	local hour,minute,second = GetHourMinSec()
	if (week == 0 and hour >= 21 and hour < 23) then
		TalkAppendButton(varMap, x350005_var_FileId, x350005_var_QuestName,3);
	else
		return
	end


	
end





function x350005_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	local varExperience = 0
	local varName = ""
	local varCountry = GetCurCountry(varMap, varPlayer)
	local nRank = GetCountryRank(varCountry)
	local Rank = nRank + 1
	local varLevel = GetLevel(varMap, varPlayer)
	if  nRank == 0 then
		varExperience = varLevel*30000*1
	elseif nRank == 1 then
		varExperience = varLevel*30000*0.9
	elseif nRank == 2 then
		varExperience = varLevel*30000*0.8
	elseif nRank == 3 then
		varExperience = varLevel*30000*0.7
	end
	if  varCountry == 0 then
		varName = "楼兰王国"
	elseif varCountry == 1 then
		varName = "天山王国"
	elseif varCountry == 2 then
		varName = "昆仑王国"
	elseif varCountry == 3 then
		varName = "敦煌王国"
	end
	
	StartTalkTask(varMap);
	local Readme1 = format("\t#G所属国家：#Y%s#r", varName)
	local Readme2 = format("\t#G上周排名：第#Y%s#G名#r", Rank)
	local Readme3 = " #r"
	local Readme4 = format("\t#G由于#Y%s#G在上周的出色表现，您可以领取到丰厚奖励，希望您为国家多做贡献，提升国家实力。#r", varName)
	local Readme5 = " #r"
	local Readme6 = "\t#G您获得的国王争霸赛的奖励如下：#r"
	local Readme7 = " #r"
	local Readme8 = " #r"
	local Readme9 = format( "\t#Y经验：%d", varExperience)
	local varReadme  =  Readme1..Readme2..Readme3..Readme4..Readme5..Readme6..Readme7..Readme8..Readme9
	TalkAppendString(varMap, varReadme);
	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x350005_var_FileId, -1);
end


function x350005_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < 30 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "30级以下不能领取国王争霸赛奖励！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "30级以下不能领取国王争霸赛奖励！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	return 1;

end

function x350005_CheckRequest(varMap, varPlayer)
	
	
		
		
		
		
		
		
		
	

	if x350005_var_DayCountLimited >0 then
		local varDayCount = x350005_GetDayCount(varMap, varPlayer)
		if varDayCount >= x350005_var_DayCountLimited then
			x350005_ShowTips(varMap, varPlayer, "很抱歉，【国家】国王争霸赛的奖励每周只能领取一次。")
			return 0;
		end
	end

	return 1;

end

function x350005_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
	TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x350005_ProcAccept( varMap, varPlayer )
	x350005_CheckRequest(varMap, varPlayer)
	x350005_GiveReward(varMap,varPlayer)	
end


function x350005_GiveReward(varMap,varPlayer)
	
	local varExperience = 0
	local varCountry = GetCurCountry(varMap, varPlayer)
	local nRank = GetCountryRank(varCountry)
	local varLevel = GetLevel(varMap, varPlayer)
	if  nRank == 0 then
		varExperience = varLevel*30000*1
	elseif nRank == 1 then
		varExperience = varLevel*30000*0.9
	elseif nRank == 2 then
		varExperience = varLevel*30000*0.8
	elseif nRank == 3 then
		varExperience = varLevel*30000*0.7
	end
	
	local varDayCount = x350005_GetDayCount(varMap, varPlayer)
	if varDayCount < x350005_var_DayCountLimited then
		AddExp(varMap, varPlayer, varExperience);
		
		local varStr = "#o获得#R经验"..varExperience.."点#o的奖励"
		x350005_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,4,2)
		
		x350005_SetDayCount(varMap,varPlayer)
	end
		
end




function x350005_GetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear() + 1	
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_COUNTRY_TOPLIST_PRISE_DATE[1], MD_COUNTRY_TOPLIST_PRISE_DATE[2],MD_COUNTRY_TOPLIST_PRISE_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end
	
	return 1;

end




function x350005_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear() + 1
	SetPlayerGameData(varMap, varPlayer, MD_COUNTRY_TOPLIST_PRISE_DATE[1], MD_COUNTRY_TOPLIST_PRISE_DATE[2], MD_COUNTRY_TOPLIST_PRISE_DATE[3], varToday)
end
