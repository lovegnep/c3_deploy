--DECLARE_QUEST_INFO_START--
x302524_var_FileId = 302524



x302524_var_QuestName1="#Y龙舟飞渡大赛"
x302524_var_QuestName2="龙舟飞渡大赛结果"
x302524_var_QuestName3="领取奖励"
x302524_var_QuestInfo1="\n\t#W龙舟飞渡大赛结束后，如果你的支持队伍夺得冠军，你可在每日#R20#W点以后在我这里领取奖励，当日奖励当日领取，超过当天晚上#R24#W点则无法再领取奖励！"
--DECLARE_QUEST_INFO_STOP--
function x302524_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
		TalkAppendButton(varMap, x302524_var_FileId, x302524_var_QuestName2,13,2)
end


function x302524_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	local mintime =GetMinOfDay()
	if mintime <19*60 + 50  then 
		Msg2Player(varMap, varPlayer, "龙舟飞渡大赛尚未开始，无法查询结果", 0, 3)
		return 
	elseif mintime <20*60  then 
		Msg2Player(varMap, varPlayer, "龙舟飞渡大赛尚未结束，无法查询结果", 0, 3)
		return 
	end
	if extid == 2 then
		--if x302524_IsAward(varMap,varPlayer) == 1 then
		local winteam = GetCountryParam(varMap, 0, CD_COUNTRY_CAIPIAO_COUNT1)
		if winteam <=0 or winteam>4 then return 0 end
		local teamname= {"烈火队","宝蓝队","翠杉队","岩峰队"}
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x302524_var_QuestName1)
		TalkAppendString(varMap,x302524_var_QuestInfo1.."\n\t本日龙舟飞渡大赛冠军为#R"..teamname[winteam].."#W！")
		TalkAppendButton(varMap, x302524_var_FileId, x302524_var_QuestName3,13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x302524_var_FileId, x302524_var_QuestName1)
		--end

	elseif  extid == 1 then
		if x302524_IsAward(varMap,varPlayer) == 1 then
			local currentday = GetDayOfYear()
			local playerday = x302524_GetMD(varMap, varPlayer,MD_DUANWUJIE_DATE)
			local winteam = GetCountryParam(varMap, 0, CD_COUNTRY_CAIPIAO_COUNT1)
			local mdtemptab = {MD_DUANWUJIE_COUNT1,MD_DUANWUJIE_COUNT2,MD_DUANWUJIE_COUNT3,MD_DUANWUJIE_COUNT4}
			local playercount = x302524_GetMD(varMap, varPlayer,mdtemptab[winteam] )
			AddMoney(varMap, varPlayer,3,playercount*500)	
			for i = 1,playercount,1 do
				if country == 0 then
				GamePlayScriptLog( varMap, varPlayer, 3812)
				elseif country == 1 then
				GamePlayScriptLog( varMap, varPlayer, 3813)
				elseif country == 2 then
				GamePlayScriptLog( varMap, varPlayer, 3814)
				elseif country == 3 then
				GamePlayScriptLog( varMap, varPlayer, 3815)
				end
			end
			Msg2Player(varMap, varPlayer, format("你支持队伍勇夺冠军，获得了#{_MONEY%d}金卡奖励",playercount*500), 0, 3)
			x302524_SetMD(varMap, varPlayer,mdtemptab[winteam],0)
			
		else
			Msg2Player(varMap, varPlayer, "你当前没有可领取的奖励！", 0, 3)
		end
	end
end

function x302524_IsAward(varMap,varPlayer)
	
	local currentday = GetDayOfYear()
	local playerday = x302524_GetMD(varMap, varPlayer,MD_DUANWUJIE_DATE)
	local winteam = GetCountryParam(varMap, 0, CD_COUNTRY_CAIPIAO_COUNT1)
	local mdtemptab = {MD_DUANWUJIE_COUNT1,MD_DUANWUJIE_COUNT2,MD_DUANWUJIE_COUNT3,MD_DUANWUJIE_COUNT4}
	
	if winteam <=0 or winteam>4 then return 0 end
	local playercount = x302524_GetMD(varMap, varPlayer,mdtemptab[winteam] )
	if currentday == playerday and playercount > 0  then
		return 1
	end
	return 0
end

function x302524_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x302524_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
