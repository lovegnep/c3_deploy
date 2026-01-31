x300703_var_scriptId = 300703  --铁人三项
--MD_TIEREN_ACCEPTTIME = MD_TIEREN_ACCEPTTIME--接任务时间
--x300703_var_MD_CommitTime = MD_TIEREN_COMMITTIME--交任务时间
--x300703_var_MD_Abandon = MD_TIEREN_ABANDON	--是否放弃任务
--x300703_var_MD_Circle =     --完成环数
x300703_var_MissionId1 = 7537
x300703_var_MissionId2 = 7538
x300703_var_MissionId3 = 7539

x300703_var_MissionId4 = 7551
x300703_var_MissionId5 = 7552


x300703_var_AcceptMessage		= "您接受了任务:%s"
x300703_var_AbandonMessage	= "您放弃了任务:%s"
x300703_var_CompleteMessage	= "您完成了任务:%s"

x300703_var_TianfuItems				= {11010100,11010101,11010102}

x300703_var_CompleteInfo		= { day = -1, first = -1, second = -1,third = -1 }

--buff个数
x300703_var_ImpactDataIndex_Size = 211
--不能被驱散的buff，包括被动技能产生的buff和双倍经验的buff
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
									 7711};

function x300703_AddLog(varMap, varPlayer, sign, MissionId)
	 --最终写日志
	local gameId=0;
	if sign == 1 then
		if MissionId == x300703_var_MissionId1 then
			gameId = 411
		elseif MissionId == x300703_var_MissionId2 then
			gameId = 421
		elseif MissionId == x300703_var_MissionId3 then
			gameId = 431
		end
	else
		if MissionId == x300703_var_MissionId1 then
			gameId = 412
		elseif MissionId == x300703_var_MissionId2 then
			gameId = 422
		elseif MissionId == x300703_var_MissionId3 then
			gameId = 432
		end
	end

	GamePlayScriptLog(varMap, varPlayer, gameId)

end


function x300703_AwardTitle( varMap,varPlayer )


	--交任务日期和接任务日期不匹配 
	local min = GetMinOfDay()
	if min < (19*60 + 30 ) or min > (23*60 + 59) then
		return
	end
	

	--给奖励
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

function x300703_ProcEnumEvent( varMap, varPlayer, targetId, MissionId )
	if IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId1 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId2 ) > 0 or 
		IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId3 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId4 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId5 ) > 0 then
		return
	end
		
	if QuestCheckAcceptNM( varMap, varPlayer, targetId, MissionId ) > 0 then
		local  missionState = GetQuestStateNM(varMap, varPlayer, targetId, MissionId)
		TalkAppendButtonNM(varMap, varPlayer, targetId, MissionId, missionState);
		return 1
	end
    
	return 0
end

function x300703_DispatchMissionInfo(varMap, varPlayer,targetId, MissionId)
	local Readme_1  = "  我们大元自古尚武，重视对自身体能的训练。在伟大的成吉思汗时期，就曾经制定过“赛达木”大会，激励众人重视体育锻炼，我们现在也有类似的活动。俗称“铁人三项”。我这里发布的是第一项划船比赛。划船对力量以及耐力的综合考验，是一种很好的锻炼方法。"
	local Readme_2  = "#w  铁人三项的比赛包括，划船，跑步，自行车。此活动娱乐之余拉近了彼此之间的距离，锻炼了彼此的协作能力，还将获得丰厚奖励，您还在等什么，赶紧行动起来吧！#r"
	local Readme_3  = "#Y活动规则：#r"
	local Readme_4  = "#W1，40级以上玩家才可参加此活动。#r"
	local Readme_5  = "#W2，每天19:30-24:00可领取此活动。#r"
	local Readme_6  = "#W3，每天可接取一次此活动。#r"
	local Readme_7  = "#w4，完成三项比赛后将会获得丰厚奖励！#r"
	local Readme_8  = "#W5，在整个铁人三项过程中，会遇到不同样子的箱子，您去开启会获得意想不到的效果。#r #r"
	local Readme = Readme_2..Readme_3..Readme_4..Readme_5..Readme_6..Readme_7..Readme_8..Readme_1

	StartTalkTask( varMap);
		--任务信息
		local MissionName = GetQuestNameNM( varMap, varPlayer, MissionId )
		TalkAppendString(varMap, "#Y"..MissionName);
		TalkAppendString(varMap, Readme)

		TalkAppendString(varMap, "")

		--任务目标
		TalkAppendString( varMap, "#Y任务目标：#r  #W胡巧夫")
		
		--奖励信息

		--获得玩家当前等级
		local playerLevel = GetLevel( varMap, varPlayer);
		--获取经验
		local experience1 = playerLevel*100*70
		local experience2 = playerLevel*100*70
		local experience = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			experience = experience1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			experience = experience2;
		end
		AddQuestExpBonus( varMap, experience);
		AddQuestMoneyBonus5(varMap, 200 )

	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, targetId, x300703_var_scriptId, MissionId);


end


function x300703_DispatchMissionContinueInfo(varMap, varPlayer, targetId, MissionId)
		local Readme;
	 if MissionId == 7537 then
		--local Readme_1 = "#\t接下来的项目跑步这个项目。简单的跑步，却让你的全身得到了锻炼，对强身健体大有益处。#r#W"
	    local Readme_2 = "  #W我是检查铁人三项第一项划船的完成情况的，所有完成第一项比赛的人都要经过我参加第二项比赛。#r"
		--local Readme_3 = "#Y第二项比赛：#r#W"
		local Readme_4 = "  接下来的项目跑步这个项目。简单的跑步，却让你的全身得到了锻炼，对强身健体大有益处。#r"
		local Readme_5 = "#Y任务目标：#r#W"
		local Readme_6 = "  庞大海"
		 Readme = Readme_2..Readme_4..Readme_5..Readme_6

	elseif MissionId == 7538 then
		--local Readme_1 = "#Y【活动】铁人三项#r#W"
	    local Readme_2 = "  #W我是检查铁人三项第二项跑步的完成情况的，所有完成第一项比赛的人都要经过我参加第三项比赛。#r"
		--local Readme_3 = "#Y第三项比赛：#r#W"
		local Readme_4 = "  自行车是民间大众的一种交通工具，将它运用于比赛当中，既能磨练人的意志，也可以更好的锻炼人的体能。#r"
		local Readme_5 = "#Y任务目标：#r#W"
		local Readme_6 = "  杜二元"
		 Readme = Readme_2..Readme_4..Readme_5..Readme_6

	elseif MissionId == 7539 then
		--local Readme_1 = "#Y【活动】铁人三项#r#W"
	    local Readme_2 = "  #W我是检查铁人三项第三项自行车的，快去大都城里找铁人三项中转人简申。#r"
		 Readme = Readme_2
	elseif MissionId == x300703_var_MissionId4 then
		local Readme_2 = "  #W加油！加油！冲刺啦！快去华常志处，完成冲刺！#r"
		 Readme = Readme_2
	elseif MissionId == x300703_var_MissionId5 then
		local Readme_2 = "  #w我既是铁人三项任务中自行车的回复人，也是整个铁人三项任务的交付人，大家可以通过我完成整个铁人三项任务并且获得奖励。#r"
		Readme = Readme_2
	         
	            
	end

	StartTalkTask( varMap);
		--任务信息
		local MissionName = GetQuestNameNM( varMap, varPlayer, MissionId )
		TalkAppendString(varMap, "#Y"..MissionName);
		TalkAppendString(varMap, Readme)

		TalkAppendString(varMap, "")

		--任务目标
		--TalkAppendString( varMap, "#Y任务目标：")
		
		--奖励信息

		--获得玩家当前等级
		local playerLevel = GetLevel( varMap, varPlayer);
		--获取经验
		local experience1 = playerLevel*100*70
		local experience2 = playerLevel*100*70
		local experience = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			experience = experience1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			experience = experience2;
		end
if MissionId == x300703_var_MissionId5 then    
		AddQuestExpBonus( varMap, experience);
		AddQuestMoneyBonus5(varMap, 200 )
end
	StopTalkTask(varMap);

	DeliverTalkContinueNM(varMap, varPlayer, targetId, x300703_var_scriptId, MissionId);
end

--选中任务
function x300703_ProcEventEntry( varMap, varPlayer, targetId, MissionId )
	
	if IsHaveQuestNM( varMap, varPlayer, MissionId ) == 0 then	-- 如果没有这个任务
		x300703_NextDayReset(varMap, varPlayer)
		if  IsNpcHaveQuestNM(varMap, varPlayer, targetId, MissionId) == 1 then--这里判断npc身上是否有这个任务，否则会出bug
		--不要给出npc身上没有任务的这个提示！
			local ret = QuestCheckAcceptNM( varMap, varPlayer, targetId, MissionId )
			if ret > 0 then	-- 如果可以接这个任务
				--DeliverTalkAddQuestInfoNM( varMap, varPlayer, targetId, MissionId ) -- 显示接受任务信息
				x300703_DispatchMissionInfo(varMap, varPlayer, targetId, MissionId)
			else
				local strText = "未知错误，无法接新的任务"
				if ret == -1 then
					strText = "等级不足，无法接新的任务"
				elseif ret == -2 then
					strText = "等级过高，无法接新的任务"
				elseif ret == -3 then
					strText = "金钱不足，无法接新的任务"
				elseif ret == -4 then
					strText = "您不是本国玩家，无法接新的任务"
				elseif ret == -5 then
					strText = "职业类型不符，无法接新的任务"
				elseif ret == -6 then
					strText = "阵营不符，无法接新的任务"
				elseif ret == -7 then
					strText = "此人无此任务"
				end
				StartTalkTask(varMap)
				TalkAppendString(varMap, strText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end

	else --如果有这个任务
		local misIndex = GetQuestIndexByID( varMap, varPlayer, MissionId )
		if QuestCheckSubmitNM( varMap, varPlayer, targetId, MissionId, misIndex ) > 0 then -- 如果任务可以完成
			--QuestComplateInfoNM( varMap, varPlayer, targetId, MissionId ) -- 显示完成信息
			x300703_DispatchMissionContinueInfo(varMap, varPlayer, targetId, MissionId)
		else
			QuestNotComplateInfoNM( varMap, varPlayer, targetId, MissionId ) -- 显示任务未完成信息
		end
	end
end

--接受任务
function x300703_ProcQuestAccept( varMap, varPlayer, targetId, MissionId )
  
	local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
	if rounds >= 1 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，您今天已经领取过铁人三项活动，请明日再来。");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，您今天已经领取过铁人三项活动，请明日再来。",8,2)
		return
	end
	
	if x300703_ProcAcceptCheckTime() < 0 then --没在接任务的时间段
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，您不在规定时间内参与活动，请在每日的19：30~24：00间来参与活动");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，您不在规定时间内参与活动，请在每日的19：30~24：00间来参与活动",8,2)
		return 
	end

	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，您扛着旗子不能来参与活动");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，您扛着旗子不能来参与活动",8,2)
		return 
	end

	--有童趣不能接
	if IsHaveQuestNM( varMap, varPlayer, 8066 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8074 ) > 0 or 
		IsHaveQuestNM( varMap, varPlayer, 8067 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8068 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8069 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8070 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8071 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8072 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8073 ) > 0 then

		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，您有童趣任务不能来参与活动");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，您有童趣任务不能来参与活动",8,2)

		return
	end

	if IsBusMember(varMap, varPlayer) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，护送不能来参与活动");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，护送不能来参与活动",8,2)
		return 
	end

	
	
	if IsPlayerStateNormal(varMap,varPlayer) == 1 then
	    if GetChangeSceneState(varMap, varPlayer)==2 then
		    return
		end
	else
	    return
	end
	
	--检查前置任务
	local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer, MissionId )
	if FrontMissiontId1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId1 ) == 0 then
			return 0
		end
	end
	if FrontMissiontId2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId2 ) == 0 then
			return 0
		end
	end
	if FrontMissiontId3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId3 ) == 0 then
			return 0
		end
	end

	local ret = QuestCheckAcceptNM( varMap, varPlayer, targetId, MissionId ) -- 获取接受任务检查信息
	if ret > 0 then -- 如果可以接这个任务
		ret = AddQuestNM( varMap, varPlayer, MissionId ) -- 给玩家添加任务
		if ret > 0 then
			SetQuestParam( varMap, varPlayer, MissionId, 7, 1 )
			x300703_AddLog(varMap, varPlayer, 1, MissionId)

			ReCallHorse( varMap, varPlayer )--强制下马
			--x300703_DispelBuff(varMap, varPlayer)

			x300703_CauseBuff(varMap, varPlayer, MissionId)

			for i = 0, 4 do
				local SceneID, PosX, PosZ, tips = GetAskWayPosNM(varMap, varPlayer, MissionId, i)
				if SceneID ~= -1 then
					LuaCallNoclosure( UTILITY_SCRIPT, "AskTheWayPos", varMap, varPlayer, SceneID, PosX, PosZ, tips )
				end
			end
			
			local MissionName = GetQuestNameNM( varMap, varPlayer, MissionId )
			local message = format(x300703_var_AcceptMessage, MissionName);

			StartTalkTask(varMap)
			TalkAppendString(varMap, message);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer, message,8,2)

			x300703_SetAcceptTime(varMap, varPlayer, MissionId)
			--设置位置
			local pianyi = random(1,3)
			local Pos_1_x = 360 + pianyi
			SetPos(varMap,varPlayer,Pos_1_x,237)
			MarkMutexState(varMap, varPlayer, 18)
			return 1
		elseif ret == 0 then
			local strText = "添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif ret == -1 then
			local strText = "背包已满,请整理后再来接任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif ret == -2 then
			local strText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
	
	return 0
end

--任务放弃
function x300703_ProcQuestAbandon( varMap, varPlayer, MissionId )
	local ret = 0
	ret = DelQuestNM( varMap, varPlayer, MissionId )
	if ret == 1 then
		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		local country = GetCurCountry( varMap, varPlayer )
		local sex = GetSex( varMap, varPlayer )
		if MissionId == x300703_var_MissionId1 then
			if sex == 1 then
				if country == 0 then
					CancelSpecificImpact(varMap, varPlayer,7606)
				elseif country == 1 then
					CancelSpecificImpact(varMap, varPlayer, 7612)
				elseif country == 2 then
					CancelSpecificImpact(varMap, varPlayer, 7618)
				elseif country == 3 then
					CancelSpecificImpact(varMap, varPlayer, 7624)
				end
			else
				if country == 0 then
					CancelSpecificImpact(varMap, varPlayer, 7609)
				elseif country == 1 then
					CancelSpecificImpact(varMap, varPlayer, 7615)
				elseif country == 2 then
					CancelSpecificImpact(varMap, varPlayer, 7621)
				elseif country == 3 then
					CancelSpecificImpact(varMap, varPlayer, 7627)
				end
			end
		elseif MissionId == x300703_var_MissionId2 then
			if sex == 1 then
				if country == 0 then
					CancelSpecificImpact(varMap, varPlayer, 7607)
				elseif country == 1 then
					CancelSpecificImpact(varMap, varPlayer, 7613)
				elseif country == 2 then
					CancelSpecificImpact(varMap, varPlayer, 7619)
				elseif country == 3 then
					CancelSpecificImpact(varMap, varPlayer, 7625)
				end
			else
				if country == 0 then
					CancelSpecificImpact(varMap, varPlayer, 7610)
				elseif country == 1 then
					CancelSpecificImpact(varMap, varPlayer, 7616)
				elseif country == 2 then
					CancelSpecificImpact(varMap, varPlayer, 7622)
				elseif country == 3 then
					CancelSpecificImpact(varMap, varPlayer, 7628)
				end
			end
		elseif MissionId == x300703_var_MissionId3 or MissionId == x300703_var_MissionId4 or MissionId == x300703_var_MissionId5 then
			if sex == 1 then
				if country == 0 then
					CancelSpecificImpact(varMap, varPlayer, 7605)
				elseif country == 1 then
					CancelSpecificImpact(varMap, varPlayer, 7611)
				elseif country == 2 then
					CancelSpecificImpact(varMap, varPlayer, 7617)
				elseif country == 3 then
					CancelSpecificImpact(varMap, varPlayer, 7623)
				end
			else
				if country == 0 then
					CancelSpecificImpact(varMap, varPlayer, 7608)
				elseif country == 1 then
					CancelSpecificImpact(varMap, varPlayer, 7614)
				elseif country == 2 then
					CancelSpecificImpact(varMap, varPlayer, 7620)
				elseif country == 3 then
					CancelSpecificImpact(varMap, varPlayer, 7626)
				end
			end
		end

		local posX=364
		local posZ=226

		SetPos(varMap,varPlayer,posX,posZ)
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)

		ClearMutexState(varMap, varPlayer, 18)

		local MissionName = GetQuestNameNM( varMap, varPlayer, MissionId )
		local message = format(x300703_var_AbandonMessage, MissionName);
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,8,2)
	end
end

function x300703_ProcQuestAttach( varMap, varPlayer, targetId, npcGuid, misIndex, MissionId )
    
	if IsHaveQuestNM( varMap, varPlayer, MissionId ) == 0 then	-- 如果没有这个任务
		return
	end

	local npcName = GetName( varMap, targetId )
	if npcName == "" then	--NPC名字会是空的么
		return
	end

	local guid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, misIndex )
	local  missionState = GetQuestStateNM(varMap, varPlayer, targetId, MissionId)
	if guid ~= -1 then --这个任务有完成的NPC
		if guid == npcGuid then	--点击的NPC的名字和任务中NPC的名字相同，场景也判断过了
			TalkAppendButtonNM( varMap, varPlayer, targetId, MissionId, missionState, -1 ) -- 显示任务信息
		end
	else
		TalkAppendButtonNM( varMap, varPlayer, targetId, MissionId, missionState, -1 ) -- 显示任务信息
	end
end

--完成任务
--返回1代表成功，0代表交任务失败
function x300703_ProcQuestSubmit( varMap, varPlayer, targetId, selectId, MissionId )

	if IsHaveQuestNM( varMap, varPlayer, MissionId ) == 0 then	-- 如果没这个任务直接退出
		return 0
	end

	local misIndex = GetQuestIndexByID( varMap, varPlayer, MissionId )
	local ret = QuestCheckSubmitNM( varMap, varPlayer, targetId, MissionId, misIndex ) -- 获取完成任务检查信息
	if ret > 0 then -- 如果可以完成
		return x300703_MissionComplate( varMap, varPlayer, targetId, selectId, MissionId )
	end
	return 0
end

--任务完成
function x300703_MissionComplate( varMap, varPlayer, targetId, selectId, MissionId )
	--x300703_SetCommitTime(varMap, varPlayer, MissionId)
	if MissionId == x300703_var_MissionId5 then
		-- 粉丝先锋团
		local ret = LuaCallNoclosure( 302510, "CheckMission", varMap, varPlayer, 300703)
		if ret == 0 then
			return 0
		elseif ret == 2 then
			LuaCallNoclosure( 302510, "FinishMission", varMap, varPlayer, 300703)
		end
	end
	
	local ret = DelQuestNM( varMap, varPlayer, MissionId )
	if ret == 1 then -- 如果成功完成
		x300703_AddLog(varMap, varPlayer, 0, MissionId)
		if MissionId == x300703_var_MissionId5 then
			--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
			--这里给的奖励未定
			local Level = GetLevel(varMap, varPlayer)
		local award1 = floor(100*Level*70)
		local award2 = floor(100*Level*70)
			local award = 0
			if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
				award = award1;
			elseif GetLevel(varMap, varPlayer) >=70 then
				award = award2;
			end
			ClearMutexState(varMap, varPlayer, 18)
		
			local MissionName = GetQuestNameNM( varMap, varPlayer, MissionId )
			local message = format(x300703_var_CompleteMessage, MissionName);
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, message,8,2)

			AddExp(varMap, varPlayer, award)
			
			local multi = x300703_IsMulti( varMap, varPlayer)
        	if multi > 0 then
        		AddExp( varMap, varPlayer, floor(award*multi))
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(award*multi)), 8, 2)
        		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(award*multi)), 8, 3)
        	end 
			
			
			local message = format("#Y获得#R经验%d#Y的奖励", award)
			StartTalkTask(varMap);
			TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, message,4,2)

			local nShengWang = GetShengWang( varMap, varPlayer )
			nShengWang = nShengWang + 200
			SetShengWang( varMap, varPlayer, nShengWang )
			message = format("获得声望%d的奖励。", 200)
			StartTalkTask(varMap);
			TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer,message,4,2)
			LuaCallNoclosure( 256224, "Finishtiesan", varMap, varPlayer)	
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)

            -- 添加一枚大都嘉年华娱乐币
            StartItemTask( varMap)
            ItemAppend( varMap, 11990117, 10)
            if StopItemTask( varMap, varPlayer) <= 0 then
                Msg2Player( varMap, varPlayer, "你完成了【体】大都嘉年华。由于你的背包已满，无法获得#{_ITEM11990117}奖励。", 8, 2)
            else
                DeliverItemListSendToPlayer( varMap, varPlayer)
            end
		
			--添加排名
			local hour,minute,second = GetHourMinSec()
			local val = 0;
			val = val + (hour-19)*3600
			val = val + (minute-30)*60
			val = val + second
			SendToplistKeyValue2GL(varMap,varPlayer,TIEREN_TOPLIST,val)
			
			--奖励称号
			x300703_AwardTitle(varMap,varPlayer)
			
			--奖励天赋
			x300703_AddTianfuItem( varMap, varPlayer)
			
		end

		local j = random(1,5)
		if j ==1 then
			StartItemTask( varMap )
			if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
				ItemAppend( varMap, 12030107, 1 )
			else
				ItemAppendBind( varMap, 12030107, 1 )
			end	
			local result = StopItemTask( varMap, varPlayer )
			if result > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local Country = LuaCallNoclosure(888888, "GetCountryName", varMap, varPlayer )
				local selfName = GetName(varMap, varPlayer)
				local msg = format("#G恭喜#Y%s#G在铁人三项活动中获得#R神龙藏宝图#G一张。", selfName)
				--LuaAllScenceM2Wrold(varMap, msg, 1, 1)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"很抱歉，背包已满，无法得到物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end

		x300703_CancelBuff(varMap, varPlayer, MissionId)
		--提示玩家任务完成
		x300703_PushAfterMission(varMap, varPlayer, MissionId)
		
		return 1 -- 返回成功
		
	else -- 如果未成功完成
		StartTalkTask(varMap)
		local strText = "未知错误，无法完成任务"
		if ret == -2 then
			strText = "请选择奖励物品"
		elseif ret == -3 then
			strText = "背包已满,请整理后再来交任务"
		elseif ret == -4 then
			strText = "扣除任务物品失败"
		end
		TalkAppendString(varMap,strText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
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

function x300703_SetAcceptTime(varMap, varPlayer, MissionId)
	if MissionId == x300703_var_MissionId1 then
		local day = GetDayOfYear()
		local minute = GetMinOfDay()
		
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3], minute)	
	end
end

function x300703_CauseBuff(varMap, varPlayer, MissionId)
	local country = GetCurCountry( varMap, varPlayer )
	local sex = GetSex( varMap, varPlayer )

	if MissionId == x300703_var_MissionId1 then
		--CreateHorseToPlayer(varMap, varPlayer, x300703_var_HorseId1, -1);
		--Mount( varMap, varPlayer, x300703_var_HorseId1 )
		if sex == 1 then
			if country == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7606, 0)
			elseif country == 1 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7612, 0)
			elseif country == 2 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7618, 0)
			elseif country == 3 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7624, 0)
			end
		else
			if country == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7609, 0)
			elseif country == 1 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7615, 0)
			elseif country == 2 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7621, 0)
			elseif country == 3 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7627, 0)
			end
		end
		--SetImmuneAbsForLater( varMap, varPlayer, 1 ) --设置绝对免疫
	elseif MissionId == x300703_var_MissionId2 then
		--CreateHorseToPlayer(varMap, varPlayer, x300703_var_HorseId2, -1);
		--Mount( varMap, varPlayer, x300703_var_HorseId2 )
		if sex == 1 then
			if country == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7607, 0)
			elseif country == 1 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7613, 0)
			elseif country == 2 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7619, 0)
			elseif country == 3 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7625, 0)
			end
		else
			if country == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7610, 0)
			elseif country == 1 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7616, 0)
			elseif country == 2 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7622, 0)
			elseif country == 3 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7628, 0)
			end
		end
		--SetImmuneAbsForLater( varMap, varPlayer, 1 ) --设置绝对免疫
	elseif MissionId == x300703_var_MissionId3 then
		--CreateHorseToPlayer(varMap, varPlayer, x300703_var_HorseId3, -1);
		--Mount( varMap, varPlayer, x300703_var_HorseId3 )
		if sex == 1 then
			if country == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7605, 0)
			elseif country == 1 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7611, 0)
			elseif country == 2 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7617, 0)
			elseif country == 3 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7623, 0)
			end
		else
			if country == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7608, 0)
			elseif country == 1 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7614, 0)
			elseif country == 2 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7620, 0)
			elseif country == 3 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7626, 0)
			end
		end
		--SetImmuneAbsForLater( varMap, varPlayer, 1 ) --设置绝对免疫
	end
	
end

function x300703_CancelBuff(varMap, varPlayer, MissionId)
	local country = GetCurCountry( varMap, varPlayer )
	local sex = GetSex( varMap, varPlayer )

	if MissionId == x300703_var_MissionId1 then
		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		if sex == 1 then
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer,7606)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7612)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7618)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7624)
			end
		else
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7609)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7615)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7621)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7627)
			end
		end
	elseif MissionId == x300703_var_MissionId2 then
		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		if sex == 1 then
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7607)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7613)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7619)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7625)
			end
		else
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7610)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7616)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7622)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7628)
			end
		end
	elseif MissionId == x300703_var_MissionId5  then
		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		if sex == 1 then
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7605)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7611)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7617)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7623)
			end
		else
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7608)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7614)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7620)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7626)
			end
		end
	end
	
end

function x300703_PushAfterMission(varMap, varPlayer, MissionId)
	local mission=-1;
	if MissionId == x300703_var_MissionId1 then
		mission = x300703_var_MissionId2
	elseif MissionId == x300703_var_MissionId2 then
		mission = x300703_var_MissionId3
	elseif MissionId == x300703_var_MissionId3 then
		mission = x300703_var_MissionId4
	elseif MissionId == x300703_var_MissionId4 then
		mission = x300703_var_MissionId5
	end

	if mission ~= -1 then
		--检查前置任务
		local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer, mission )
		if FrontMissiontId1 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId1 ) == 0 then
				return 0
			end
		end
		if FrontMissiontId2 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId2 ) == 0 then
				return 0
			end
		end
		if FrontMissiontId3 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId3 ) == 0 then
				return 0
			end
		end
		
		local ret =AddQuestNM(varMap, varPlayer, mission )

		if ret > 0 then
			SetQuestParam( varMap, varPlayer, mission, 7, 1 )
			x300703_AddLog(varMap, varPlayer, 1, MissionId)
			x300703_ProcQuestLogRefresh( varMap, varPlayer, mission)
			x300703_CauseBuff(varMap, varPlayer, mission)
			if mission == x300703_var_MissionId2 then
				local pianyi = random(1,3)
				local Pos_1_x = 425 + pianyi
				SetPos(varMap,varPlayer,Pos_1_x,448)
			end
		elseif ret == 0 then
			local strText = "添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif ret == -1 then
			local strText = "背包已满,请整理后再来接任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif ret == -2 then
			local strText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end

function x300703_TieSanOnDie(varMap, varPlayer)
	local country = GetCurCountry( varMap, varPlayer )
	local sex = GetSex( varMap, varPlayer )

	local posX=366
	local posZ=226

	local lastDay = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3])
	local lastMin = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3])

	local nowTime = GetDayOfYear()*1440 + GetMinOfDay()
	local lastTime = lastDay*1440 + lastMin

	if IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId1 ) > 0 then
		if nowTime - lastTime < 120 then
			--SetImmuneAbsForLater( varMap, varPlayer, 1 ) --设置绝对免疫
			MarkMutexState(varMap, varPlayer, 18)
			return 
		end

		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		if sex == 1 then
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer,7606)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7612)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7618)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7624)
			end
		else
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7609)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7615)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7621)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7627)
			end
		end
		DelQuestNM( varMap, varPlayer, x300703_var_MissionId1 )
		SetPos(varMap,varPlayer,posX,posZ)
		ClearMutexState(varMap, varPlayer, 18)
		StartTalkTask(varMap);TalkAppendString(varMap,"您的铁人三项任务已失败，请重新领取！");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"您的铁人三项任务已失败，请重新领取！",8,2)
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)

	elseif IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId2 ) > 0 then
		if nowTime - lastTime < 120 then
			--SetImmuneAbsForLater( varMap, varPlayer, 1 ) --设置绝对免疫
			MarkMutexState(varMap, varPlayer, 18)
			return 
		end

		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		if sex == 1 then
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7607)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7613)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7619)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7625)
			end
		else
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7610)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7616)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7622)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7628)
			end
		end
		DelQuestNM( varMap, varPlayer, x300703_var_MissionId2 )
		SetPos(varMap,varPlayer,posX,posZ)
		ClearMutexState(varMap, varPlayer, 18)
		StartTalkTask(varMap);TalkAppendString(varMap,"您的铁人三项任务已失败，请重新领取！");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"您的铁人三项任务已失败，请重新领取！",8,2)
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
	elseif IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId3 ) > 0 then
		if nowTime - lastTime < 120 then
			--SetImmuneAbsForLater( varMap, varPlayer, 1 ) --设置绝对免疫
			MarkMutexState(varMap, varPlayer, 18)
			return 
		end

		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		if sex == 1 then
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7605)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7611)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7617)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7623)
			end
		else
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7608)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7614)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7620)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7626)
			end
		end
		DelQuestNM( varMap, varPlayer, x300703_var_MissionId3 )
		SetPos(varMap,varPlayer,posX,posZ)
		ClearMutexState(varMap, varPlayer, 18)
		StartTalkTask(varMap);TalkAppendString(varMap,"您的铁人三项任务已失败，请重新领取！");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"您的铁人三项任务已失败，请重新领取！",8,2)
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
	elseif IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId4 ) > 0 then
		if nowTime - lastTime < 120 then
			--SetImmuneAbsForLater( varMap, varPlayer, 1 ) --设置绝对免疫
			MarkMutexState(varMap, varPlayer, 18)
			return 
		end

		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		if sex == 1 then
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7605)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7611)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7617)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7623)
			end
		else
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7608)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7614)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7620)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7626)
			end
		end
		DelQuestNM( varMap, varPlayer, x300703_var_MissionId4 )
		SetPos(varMap,varPlayer,posX,posZ)
		ClearMutexState(varMap, varPlayer, 18)
		StartTalkTask(varMap);TalkAppendString(varMap,"您的铁人三项任务已失败，请重新领取！");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"您的铁人三项任务已失败，请重新领取！",8,2)
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
	elseif IsHaveQuestNM( varMap, varPlayer, x300703_var_MissionId5 ) > 0 then
		if nowTime - lastTime < 120 then
			--SetImmuneAbsForLater( varMap, varPlayer, 1 ) --设置绝对免疫
			MarkMutexState(varMap, varPlayer, 18)
			return 
		end

		--SetImmuneAbsForLater( varMap, varPlayer, 0 ) --设置绝对免疫
		if sex == 1 then
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7605)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7611)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7617)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7623)
			end
		else
			if country == 0 then
				CancelSpecificImpact(varMap, varPlayer, 7608)
			elseif country == 1 then
				CancelSpecificImpact(varMap, varPlayer, 7614)
			elseif country == 2 then
				CancelSpecificImpact(varMap, varPlayer, 7620)
			elseif country == 3 then
				CancelSpecificImpact(varMap, varPlayer, 7626)
			end
		end
		DelQuestNM( varMap, varPlayer, x300703_var_MissionId5 )
		SetPos(varMap,varPlayer,posX,posZ)
		ClearMutexState(varMap, varPlayer, 18)
		StartTalkTask(varMap);TalkAppendString(varMap,"您的铁人三项任务已失败，请重新领取！");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"您的铁人三项任务已失败，请重新领取！",8,2)
		x300703_NextDayReset(varMap, varPlayer)
		local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
	end

end

function x300703_NextDayReset(varMap, varPlayer)
	
	local lastDay = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3])

	local today = GetDayOfYear()
	if today ~= lastDay then 
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], 0)
	end
end

function x300703_CanDispel(dataIndex)
	for j=0, x300703_var_ImpactDataIndex_Size-1 do
		if dataIndex == x300703_var_UnDispelImpactDataIndex[j+1] then
			return -1
		end
	end
	return 1
end

function x300703_DispelBuff(varMap, varPlayer)
	local count = GetImpactListCount( varMap, varPlayer )
	for i=0, count-1 do
		local dataIndex = GetImpactDataIndex( varMap, varPlayer, i )
		if x300703_CanDispel(dataIndex) > 0 then
			DispelSpecificImpact( varMap, varPlayer, dataIndex )
		end
	end
end

function x300703_ProcQuestLogRefresh( varMap,varPlayer,missionId)
	local str2;
	local str;
	str = GetQuestNameNM(varMap, varPlayer, missionId);
	local maxcircle = 5;
	local circle = 1;
	if missionId == x300703_var_MissionId2 then
		circle = 2;
	elseif missionId == x300703_var_MissionId3 then
		circle = 3;
	elseif missionId == x300703_var_MissionId4 then
		circle = 4;
	elseif missionId == x300703_var_MissionId5 then
		circle = 5;
	end
	
	str = str.."("..circle;
	str = str.."/"..maxcircle;
	str = str..")";

	if missionId == x300703_var_MissionId1 then
		str2 = "胡巧夫"
	elseif missionId == x300703_var_MissionId2 then
		str2 = "庞大海"
	elseif missionId == x300703_var_MissionId3 then
		str2 = "杜二元"
	elseif missionId == x300703_var_MissionId4 then
		str2 = "简申"
	elseif missionId == x300703_var_MissionId5 then
		str2 = "华常志"
	end

    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    -- 标题
                                str,                 -- 任务名字
                                str2,               --任务目标
                                str2,                         --任务NPC
                                "",                   --任务攻略
                                "",                --任务描述
                                ""        --任务小提示
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, missionId);
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
