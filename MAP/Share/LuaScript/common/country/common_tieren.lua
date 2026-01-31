x300703_var_FileId = 300703  




x300703_var_QuestName = "【体】新铁人三项"
x300703_var_QuestId = 7538

x300703_var_SubmitNpc = {{0,139100}, {37,139101}, {37,139102}}

x300703_var_QuestTarget = "  到@npcsp_胡巧夫_139101处参加铁人三项"
x300703_var_QuestTarget1 = "@npc_141544上运动的#G简申#W"

x300703_var_AcceptMessage		= "您接受了任务:%s"
x300703_var_AbandonMessage	= "您放弃了任务:%s"
x300703_var_CompleteMessage	= "您完成了任务:%s"

x300703_var_ContinueQuestInfo = 	" \n接下来的项目跑步这个项目。简单的跑步，却让你的全身得到了锻炼，对强身健体大有益处。\n"
x300703_var_QuestMiddleCompleted = "\t铁人三项是一项集健身、竞争、乐趣于一身的项目。你只要找到在东边@npc_141544不停跑动的#G简申#W，就完成了铁人三项。\n\t\在整个铁人三项过程中，如果你遇到各种不同模样的箱子，开启后可能会获得很多意想不到的效果哦。\n \n#G小提示#W：\n\t如果你在#G非常短的时间#W内完成接下来的任务，你得到#R额外的奖励#W。"
x300703_var_QuestCompleted = "\t恭喜你完成了铁人三项，记得在现实中每天也要花一点时间锻炼身体，能使你更加健康，更能体验到运动的快乐。"

x300703_var_QuestInfo =  "\t在我这里报名，就能去参加新铁人三项的比赛了。\n#W  铁人三项的比赛很简单，只要你能找到一直在大都东郊@npc_141544上走动的简申就可以完成任务。\n#Y活动规则：\n#W1.40级以上玩家才可参加此活动。\n#W2.每天19:30-24:00可领取此活动。\n#W3.每天可接取一次此活动。\n#W4.完成比赛后将会获得丰厚奖励！\n#W5.在整个铁人三项过程中，会遇到不同样子的箱子，您去开启会获得意想不到的效果。\n#Y特别提示：#W只有等级#G小于90级（不包括90级）#W且排名低于排行榜最后一名#G10级（不包括10级）#W的玩家，完成任务时才能获得额外的经验奖励。"


x300703_var_Questruse= "\t铁人三项是一项集健身、竞争、乐趣于一身的项目。从@npcsp_胡巧夫_139101处出发，找到@npc_141544上不停跑动的#G简申#W，就完成了铁人三项。\n\t\在整个铁人三项过程中，会遇到不同样子的箱子，您去开启会获得意想不到的效果。"

x300703_var_CompleteInfo		= { day = -1, first = -1, second = -1,third = -1 }

x300703_var_TianfuItems				= {11010100,11010101,11010102}

x300703_var_BackPos = {122,177}


x300703_var_BufDataIndex_Size = 211

x300703_var_UnDispelImpactDataIndex = {1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,
									 1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,
									 1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,
									 1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,
									 2121,2122,2123,2124,2125,2126,2127,2128,2129,2130,
									 2131,2132,2133,2134,2135,2136,2137,2138,2139,2140,
									 2141,2142,2143,2144,2145,2146,2147,2148,2149,2150,
									 3131,3132,3133,3134,3135,3136,3137,3138,3139,3140,
									 3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,
									 3151,3152,3153,3154,3155,3156,3157,3158,3159,3160,
									 4121,4122,4123,4124,4125,4126,4127,4128,4129,4130,
									 4131,4132,4133,4134,4135,4136,4137,4138,4139,4140,
									 4141,4142,4143,4144,4145,4146,4147,4148,4149,4150,
									 5131,5132,5133,5134,5135,5136,5137,5138,5139,5140,
									 5141,5142,5143,5144,5145,5146,5147,5148,5149,5150,
									 5151,5152,5153,5154,5155,5156,5157,5158,5159,5160,
									 6131,6132,6133,6134,6135,6136,6137,6138,6139,6140,
									 6141,6142,6143,6144,6145,6146,6147,6148,6149,6150,
									 6151,6152,6153,6154,6155,6156,6157,6158,6159,6160,
									 7510,7511,7630,7631,9007,9011,9012,9824,7702,7708,
									 7601,7643, 9013,7646,7647,7648,7649,7650,7709,7710,
									 7711,7066};

x300703_var_StateBuff = {{{7610,7607},{7608,7605}}, {{7616,7613},{7614,7611}}, {{7622,7619},{7620,7617}}, {{7628,7625},{7626,7623}}}

function x300703_SendStateBuff(varMap, varPlayer)
	local varCountry = GetCurCountry( varMap, varPlayer )
	local sex = GetSex( varMap, varPlayer )
	
	local buff = x300703_var_StateBuff[varCountry+1][1][sex+1]
	if IsHaveSpecificImpact( varMap, varPlayer, buff ) <= 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff, 0)
	end
	
	buff = x300703_var_StateBuff[varCountry+1][2][sex+1]
	if IsHaveSpecificImpact( varMap, varPlayer, buff ) > 0 then
		CancelSpecificImpact(varMap, varPlayer, buff)
	end
end

function x300703_CancelStateBuff(varMap, varPlayer)
	local varCountry = GetCurCountry( varMap, varPlayer )
	local sex = GetSex( varMap, varPlayer )
	
	local buff = x300703_var_StateBuff[varCountry+1][1][sex+1]
	
	if IsHaveSpecificImpact( varMap, varPlayer, buff ) > 0 then
		CancelSpecificImpact(varMap, varPlayer, buff)
	end
	
	buff = x300703_var_StateBuff[varCountry+1][2][sex+1]
	if IsHaveSpecificImpact( varMap, varPlayer, buff ) > 0 then
		CancelSpecificImpact(varMap, varPlayer, buff)
	end
end

function x300703_AddLog(varMap, varPlayer, sign, varQuest)
	 
	local gameId=0;
	if sign == 1 then
		gameId = 411
	else
		gameId = 412
	end

	GamePlayScriptLog(varMap, varPlayer, gameId)
end

function x300703_AwardTitle( varMap,varPlayer )
	


	
	local min = GetMinOfDay()
	if min < (19*60 + 30 ) or min > (23*60 + 59) then
		return
	end
	

	
	local dt = GetDayTime()
	if x300703_var_CompleteInfo.day ~= dt then
		
		x300703_var_CompleteInfo = { day = dt, first = 1, second = -1,third = -1 }
		AwardTitle(varMap,varPlayer,18)
		return
		
	else
		
		if x300703_var_CompleteInfo.first == -1 then
			
			x300703_var_CompleteInfo.first = 1
			AwardTitle(varMap,varPlayer,18)
			return
		end
		
		if x300703_var_CompleteInfo.second == -1 then
			
			x300703_var_CompleteInfo.second = 1
			AwardTitle(varMap,varPlayer,19)
			return
		end
		
		if x300703_var_CompleteInfo.third == -1 then
			
			x300703_var_CompleteInfo.third = 1
			AwardTitle(varMap,varPlayer,20)
			return
		end
		
	end
end

function x300703_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
	
	
	
	
	
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varMap == x300703_var_SubmitNpc[1][1] and varTalkNpcGUID == x300703_var_SubmitNpc[1][2] then
		
		if IsHaveQuestNM( varMap, varPlayer, x300703_var_QuestId ) <= 0 and QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, x300703_var_QuestId ) > 0 then
			local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300703_var_QuestId)
			TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x300703_var_QuestId, questState)
		end
	elseif varMap == x300703_var_SubmitNpc[2][1] and varTalkNpcGUID == x300703_var_SubmitNpc[2][2] then
	
		if  IsHaveQuestNM( varMap, varPlayer, x300703_var_QuestId ) > 0 and QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, x300703_var_QuestId ) > 0 then 
			
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300703_var_QuestId )
			if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) ~= 1 then
				local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300703_var_QuestId)
				TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x300703_var_QuestId, questState)
			end
		end
	elseif varMap == x300703_var_SubmitNpc[3][1] and varTalkNpcGUID == x300703_var_SubmitNpc[3][2] then
	
		if IsHaveQuestNM( varMap, varPlayer, x300703_var_QuestId ) > 0 and IsQuestHaveDoneNM( varMap, varPlayer, x300703_var_QuestId ) <= 0 then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300703_var_QuestId )
			
			if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) ~= 1 then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			end
			 
			local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300703_var_QuestId)
			TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x300703_var_QuestId, questState)
		end
	end
    
	return 0
end


function x300703_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varMap == x300703_var_SubmitNpc[1][1] and varTalkNpcGUID == x300703_var_SubmitNpc[1][2] then
		
		if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
			x300703_NextDayReset(varMap, varPlayer)
			if  IsNpcHaveQuestNM(varMap, varPlayer, varTalknpc, varQuest) == 1 then
			
				local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
				if varRet > 0 then	
					
					x300703_DispatchQuestInfo(varMap, varPlayer, varTalknpc, varQuest)
				else
					local varText = "未知错误，无法接新的任务"
					if varRet == -1 then
						varText = "等级不足，无法接新的任务"
					elseif varRet == -2 then
						varText = "等级过高，无法接新的任务"
					elseif varRet == -3 then
						varText = "金钱不足，无法接新的任务"
					elseif varRet == -4 then
						varText = "您不是本国玩家，无法接新的任务"
					elseif varRet == -5 then
						varText = "职业类型不符，无法接新的任务"
					elseif varRet == -6 then
						varText = "阵营不符，无法接新的任务"
					elseif varRet == -7 then
						varText = "此人无此任务"
					end
					Msg2Player(varMap,varPlayer,varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
				end
			end
		else 
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300703_var_QuestId )
			if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, x300703_var_QuestId, varQuestIdx ) > 0 then 
				
			else
				QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, x300703_var_QuestId ) 
			end
		end
	elseif varMap == x300703_var_SubmitNpc[2][1] and varTalkNpcGUID == x300703_var_SubmitNpc[2][2] then
		
		x300703_DispatchQuestMiddleCompleted(varMap, varPlayer, varTalknpc, x300703_var_QuestId)
	elseif varMap == x300703_var_SubmitNpc[3][1] and varTalkNpcGUID == x300703_var_SubmitNpc[3][2] then
	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300703_var_QuestId )
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) == 1 then
			x300703_DispatchQuestCompleted(varMap, varPlayer, varTalknpc, x300703_var_QuestId)
		else
			x300703_DispatchQuestContinueInfo(varMap, varPlayer, varTalknpc, x300703_var_QuestId)
		end
	end
end

function x300703_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	
	if varTalkNpcGUID == 139102 then
		SetPatrolNoBreak(varMap,varTalknpc,1)
	end
	if IsHaveQuestNM( varMap, varPlayer, x300703_var_QuestId) == 0 then	
		return
	end
	
end


function x300703_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


function x300703_DispatchQuestMiddleCompleted(varMap, varPlayer,varTalknpc, varQuest)
	
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300703_var_QuestName);
		TalkAppendString(varMap, x300703_var_QuestMiddleCompleted)
		
		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, "找到@npc_141544附近运动的#G简申#W")
		TalkAppendString( varMap, " ")
		
		

		
		local playerLevel = GetLevel( varMap, varPlayer);
		
		local experience1 = playerLevel*100*70
		local experience2 = playerLevel*100*70
		local varExperience = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			varExperience = experience1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			varExperience = experience2;
		end
		AddQuestExpBonus( varMap, varExperience);
		AddQuestMoneyBonus5(varMap, 200 )

	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300703_var_FileId, x300703_var_QuestId)
	
end


function x300703_DispatchQuestCompleted(varMap, varPlayer,varTalknpc, varQuest)
	
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300703_var_QuestName);
		TalkAppendString(varMap, x300703_var_QuestCompleted)
		
		
		
		
		
		
		

		
		local playerLevel = GetLevel( varMap, varPlayer);
		
		local experience1 = playerLevel*100*70
		local experience2 = playerLevel*100*70
		local varExperience = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			varExperience = experience1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			varExperience = experience2;
		end
		AddQuestExpBonus( varMap, varExperience);
		AddQuestMoneyBonus5(varMap, 200 )

	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300703_var_FileId, x300703_var_QuestId)
	
end

function x300703_DispatchQuestInfo(varMap, varPlayer,varTalknpc, varQuest)
	
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300703_var_QuestName);
		TalkAppendString(varMap, x300703_var_QuestInfo)
		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300703_var_QuestTarget)
		TalkAppendString( varMap, " ")

	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300703_var_FileId, x300703_var_QuestId)
end


function x300703_DispatchQuestContinueInfo(varMap, varPlayer, varTalknpc, varQuest)

	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300703_var_QuestName)
		TalkAppendString(varMap, x300703_var_ContinueQuestInfo)
		
		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300703_var_QuestTarget)
		TalkAppendString( varMap, " ")
	StopTalkTask(varMap);

	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300703_var_FileId, varQuest);
end


function x300703_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
	if x300703_ProcAcceptCheckTime() < 0 then 
		Msg2Player(varMap,varPlayer,"很抱歉，您不在规定时间内参与活动，请在每日的19：30~24：00间来参与活动",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"很抱歉，您不在规定时间内参与活动，请在每日的19：30~24：00间来参与活动",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		return 
	end
	

	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
		Msg2Player(varMap,varPlayer,"很抱歉，您扛着旗子不能来参与活动",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"很抱歉，您扛着旗子不能来参与活动",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		return 
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7062 ) > 0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7063 ) >0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7064 ) >0
		or IsHaveSpecificImpact( varMap, varPlayer, 7065 ) >0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "携带龙魂状态不能来参与活动");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"携带龙魂状态不能来参与活动",8,2)
		return 0
	end
	
	if IsInChariot(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，乘坐战车状态不能领取任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end			
	
	if IsHaveQuestNM( varMap, varPlayer, 8066 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8074 ) > 0 or 
		IsHaveQuestNM( varMap, varPlayer, 8067 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8068 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8069 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8070 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8071 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8072 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8073 ) > 0 then

		Msg2Player(varMap,varPlayer,"很抱歉，您有童趣任务不能来参与活动",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"很抱歉，您有童趣任务不能来参与活动",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		return
	end

	if IsBusMember(varMap, varPlayer) > 0 then
		Msg2Player(varMap,varPlayer,"很抱歉，护送不能来参与活动",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"很抱歉，护送不能来参与活动",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		return 
	end
	
	if IsPlayerStateNormal(varMap,varPlayer) == 1 then
		if GetChangeSceneState(varMap, varPlayer)==2 then
			return
		end
	else
		return
	end
			
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	
	if varMap == x300703_var_SubmitNpc[1][1] and varTalkNpcGUID == x300703_var_SubmitNpc[1][2] then
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])

		if rounds >= 1 then
			Msg2Player(varMap,varPlayer,"很抱歉，您今天已经领取过铁人三项活动，请明日再来。",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			Msg2Player(varMap,varPlayer,"很抱歉，您今天已经领取过铁人三项活动，请明日再来。",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
			return
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, x300703_var_QuestId )
		if varFrontQuest1 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
				return 0
			end
		end
		if varFrontQuest2 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
				return 0
			end
		end
		if varFrontQuest3 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
				return 0
			end
		end

		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, x300703_var_QuestId ) 
		if varRet > 0 then 
			varRet = AddQuest( varMap, varPlayer, x300703_var_QuestId, x300703_var_FileId, 0, 0, 0, 1) 
			if varRet > 0 then
				local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300703_var_QuestId )
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
				
				x300703_SetAcceptTime(varMap, varPlayer)
				return 1
			elseif varRet == 0 then
				local varText = "任务获取失败，添加失败"
				Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			elseif varRet == -1 then
				local varText = "背包已满,请整理后再来接任务"
				Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			elseif varRet == -2 then
				local varText = "任务已满，添加任务失败"
				Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			end
		end
	elseif varMap == x300703_var_SubmitNpc[2][1] and varTalkNpcGUID == x300703_var_SubmitNpc[2][2] then
	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300703_var_QuestId )
		
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) ~= 1 then 
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, 1 )
		
			x300703_AddLog(varMap, varPlayer, 1, varQuest)

			ReCallHorse( varMap, varPlayer )
			

			x300703_SendStateBuff(varMap, varPlayer)
			
			
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7716, 0)
				
			local message = format(x300703_var_AcceptMessage, x300703_var_QuestName)
			Msg2Player(varMap,varPlayer, message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			Msg2Player(varMap,varPlayer, message,CHAT_TYPE_SELF,CHAT_RIGHTDOWN)

			x300703_ProcQuestLogRefresh( varMap,varPlayer,x300703_var_QuestId)

			MarkMutexState(varMap, varPlayer, 18)
			return 1
		end
	elseif varMap == x300703_var_SubmitNpc[3][1] and varTalkNpcGUID == x300703_var_SubmitNpc[3][2] then
		x300703_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, x300703_var_QuestId )
	end
	return 0
end


function x300703_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, x300703_var_QuestId )
	if varRet == 1 then
		
		x300703_CancelStateBuff(varMap, varPlayer)

		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)

		ClearMutexState(varMap, varPlayer, 18)

		local message = format(x300703_var_AbandonMessage, x300703_var_QuestName)
		Msg2Player(varMap,varPlayer, message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer, message,CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
	end
end



function x300703_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varMap == x300703_var_SubmitNpc[3][1] and varTalkNpcGUID == x300703_var_SubmitNpc[3][2] then
	
		
		return 1
	end
	return 0
end

function x300703_AddTianfuItem( varMap, varPlayer)
	local varLevel = GetLevel( varMap, varPlayer)
	if varLevel >= 80 then
		if random( 1, 100) <= 22 then
			local varIndex = random(1,3)
			StartItemTask( varMap)
	        ItemAppend( varMap, x300703_var_TianfuItems[varIndex], 1)
	        if StopItemTask( varMap, varPlayer) <= 0 then
	            Msg2Player( varMap, varPlayer, "由于你的背包已满，无法获得天赋道具奖励。", 8, 2)
	        else
	            DeliverItemListSendToPlayer( varMap, varPlayer)
	        end
		end
	end
end

function x300703_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	local varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then 
		x300703_AddLog(varMap, varPlayer, 0, varQuest)
		
		
		local varLevel = GetLevel(varMap, varPlayer)
		local award1 = floor(100*varLevel*70)
		local award2 = floor(100*varLevel*70)
		local award = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			award = award1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			award = award2;
		end
		ClearMutexState(varMap, varPlayer, 18)

		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x300703_var_CompleteMessage, varQuestName)
		Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		local varLevel = GetLevel(varMap, varPlayer)
		if IsHaveSpecificImpact( varMap, varPlayer, 7716 ) > 0 then
			award = award + varLevel*7000
			AddExp(varMap, varPlayer, award)
			message = format("#Y获得#R经验%d#Y的奖励", award/2)
			message1 = format("#Y您非常迅速的完成了【体】铁人三项，额外奖励#R经验%d点", award/2)
			Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SYSTEM,CHAT_RIGHTDOWN)
			Msg2Player(varMap,varPlayer,message1,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			Msg2Player(varMap,varPlayer,message1,CHAT_TYPE_SYSTEM,CHAT_RIGHTDOWN)
			
			--【个人】铁人三项的挑战完成记次
		    if IsHaveQuestNM( varMap, varPlayer, 1401 ) > 0 then
		        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, 1401)                                                  
				local QuestNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)       
		        SetQuestByIndex(varMap,varPlayer,varQuestIdx, 3, QuestNum + 1)
		        if GetQuestParam( varMap, varPlayer, varQuestIdx, 3) >= 1 then
		        	SetQuestByIndex(varMap,varPlayer,varQuestIdx, 7, 1)  
		        	SetQuestByIndex(varMap,varPlayer,varQuestIdx, 0, 1)		        	      
		        end 
		        LuaCallNoclosure( 330050, "ProcQuestLogRefresh", varMap, varPlayer)  	
		    end			
			
			
			
			  local multi = x300703_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(award*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(award*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(award*multi)), 8, 3)
        	end 				
		else
			AddExp(varMap, varPlayer, award)
			
			message = format("#Y获得#R经验%d#Y的奖励", award)
			Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SYSTEM,CHAT_RIGHTDOWN)
					local multi = x300703_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(award*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(award*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(award*multi)), 8, 3)
        	end 
		end
		
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + 200
		SetShengWang( varMap, varPlayer, varShengWang )
		message = format("获得声望%d的奖励。", 200)
		Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SYSTEM,CHAT_RIGHTDOWN)
		LuaCallNoclosure( 256224, "Finishtiesan", varMap, varPlayer)	
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)

        
        StartItemTask( varMap)
        ItemAppend( varMap, 11990117, 10)
        if StopItemTask( varMap, varPlayer) <= 0 then
            Msg2Player( varMap, varPlayer, "你完成了【体】大都嘉年华。由于你的背包已满，无法获得#{_ITEM11990117}奖励。", CHAT_TYPE_SELF, CHAT_RIGHTDOWN)
        else
            DeliverItemListSendToPlayer( varMap, varPlayer)
        end
        
        x300703_AddTianfuItem( varMap, varPlayer)
	
		local varRandbai = random( 1, 10)--10%获得百宝囊
		if varRandbai == 1 then
			local varBai40 = 12030028
			local varBai60 = 12030143
			local varBai80 = 12030144
			local varBai = 0
			local varLevel = GetLevel( varMap, varPlayer)
			StartItemTask( varMap)
			if varLevel >=40 and varLevel <60 then
				varBai = varBai40
			elseif 	varLevel <80 then
				varBai = varBai60
			else
				varBai = varBai80
			end	
			ItemAppendBind( varMap, varBai, 1)	
			if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
				Msg2Player( varMap, varPlayer,format( "你完成了【体】铁人三项，幸运的获得了1个@item_%d", varBai), 8, 3)
			else
				Msg2Player( varMap, varPlayer, format( "你的背包已满，无法获得@item_%d奖励", varBai), 8, 3)
			end
    end 			
		
		local hour,minute,second = GetHourMinSec()
		local val = 0;
		val = val + (hour-19)*3600
		val = val + (minute-30)*60
		val = val + second
		SendToplistKeyValue2GL(varMap,varPlayer,TIEREN_TOPLIST,val)
		
		
		x300703_AwardTitle(varMap,varPlayer)

		local j = random(1,5)
		local buff 	=	9011
		local buff1 =	9013
		local buff2 =	9012
		if j ==1 then
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1  or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
				ItemAppend( varMap, 12030107, 1 )
			else
				ItemAppendBind( varMap, 12030107, 1 )
			end
			local result = StopItemTask( varMap, varPlayer )
			if result > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local varCountry = LuaCallNoclosure(888888, "GetCountryName", varMap, varPlayer )
				
				
				
			else
				Msg2Player(varMap,varPlayer,"很抱歉，背包已满，无法得到物品！",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			end
		end

		x300703_CancelStateBuff(varMap, varPlayer)
		
		return 1 
		
	else 
		StartTalkTask(varMap)
		local varText = "未知错误，无法完成任务"
		if varRet == -2 then
			varText = "请选择奖励物品"
		elseif varRet == -3 then
			varText = "背包已满,请整理后再来交任务"
		elseif varRet == -4 then
			varText = "扣除任务物品失败"
		end
		Msg2Player(varMap,varPlayer,varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		return 0
	end
	return 0
end

function x300703_ProcAcceptCheckTime(  )

	local minute = GetMinOfDay()
	if (minute >= 19*60+30 and minute <24*60) then
		return 1
	end

	return -1
end

function x300703_SetAcceptTime(varMap, varPlayer)
	
	local day = GetDayOfYear()
	local minute = GetMinOfDay()
	
	SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
	SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3], minute)
end

function x300703_TieSanOnDie(varMap, varPlayer)
	
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3])
	local lastMin = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3])

	local nowTime = GetDayOfYear()*1440 + GetMinOfDay()
	local lastTime = varLastday*1440 + lastMin

	if IsHaveQuestNM( varMap, varPlayer, x300703_var_QuestId ) > 0 then
		if nowTime - lastTime < 120 then
			
			
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300703_var_QuestId )
			if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) == 1 then 
			
				ReCallHorse( varMap, varPlayer )
				
	
				x300703_SendStateBuff(varMap, varPlayer)
	
				MarkMutexState(varMap, varPlayer, 18) 
			end
			return 
		end

		
		x300703_CancelStateBuff(varMap, varPlayer)
		
		DelQuestNM( varMap, varPlayer, x300703_var_QuestId )
		ClearMutexState(varMap, varPlayer, 18)
		Msg2Player(varMap,varPlayer,"您的铁人三项任务已失败，请重新领取！",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"您的铁人三项任务已失败，请重新领取！",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
		
		if varMap ~= 0 then
			NewWorld(varMap, varPlayer, 0, x300703_var_BackPos[1], x300703_var_BackPos[2], x300703_var_FileId)
		else
			SetPos(varMap,varPlayer, x300703_var_BackPos[1], x300703_var_BackPos[2])
		end
	end

end

function x300703_NextDayReset(varMap, varPlayer)
	
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3])

	local varToday = GetDayOfYear()
	if varToday ~= varLastday then 
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], 0)
	end
end

function x300703_CanDispel(dataIndex)
	for j=0, x300703_var_BufDataIndex_Size-1 do
		if dataIndex == x300703_var_UnDispelImpactDataIndex[j+1] then
			return -1
		end
	end
	return 1
end

function x300703_DispelBuff(varMap, varPlayer)
	local varCount = GetImpactListCount( varMap, varPlayer )
	for varI=0, varCount-1 do
		local dataIndex = GetImpactDataIndex( varMap, varPlayer, varI )
		if x300703_CanDispel(dataIndex) > 0 then
			DispelSpecificImpact( varMap, varPlayer, dataIndex )
		end
	end
end

function x300703_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	
	local target = x300703_var_QuestTarget
	local target1 = x300703_var_QuestTarget1
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300703_var_QuestId )
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) == 1 then
		target = "  找到东方@npc_141544附近运动的#G简申#W"
	end
	
    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    
                                x300703_var_QuestName,                 
                                target,               
                                target1,                         
                                x300703_var_Questruse,                   
                                "\t我们大元自古尚武，重视对自身体能的训练。在伟大的成吉思汗时期，就曾经制定过“赛达木”大会，激励众人重视体育锻炼，我们现在也有类似的活动。俗称“铁人三项”。在我这里报名，就能去大都东郊参加比赛了。\n#W  铁人三项的比赛很简单，出发后找到目标就算完成。此活动娱乐之余拉近了彼此之间的距离，锻炼了彼此的协作能力，还将获得丰厚奖励，您还在等什么，赶紧行动起来吧！",                
                                ""        
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, x300703_var_QuestId);
end
function x300703_IsMulti( varMap, varPlayer)
local MaxLevel = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
local MinLevel = GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
local Level = GetLevel( varMap, varPlayer)
local Dislevel = MinLevel - Level - 10
	if MaxLevel >= 75 then
		if Dislevel > 0 then
			if Level < 50 then
				local multi50 = Dislevel/10
				return multi50
			elseif Level >= 50 and Level < 60 then
				local multi60 = Dislevel*2/10
				return multi60
			elseif Level >= 60 and Level < 75 then
				local multi70 = Dislevel*4/10
				return multi70
			elseif Level >= 75 and Level < 90 then
				local multi80 = Dislevel*8/10
				return multi80
			else 
				return 0
			end
		end
		return 0
	end
	return 0
end
