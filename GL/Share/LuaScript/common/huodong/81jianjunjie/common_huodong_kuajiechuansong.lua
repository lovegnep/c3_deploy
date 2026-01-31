--DECLARE_QUEST_INFO_START--
x302543_var_FileId = 302543

x302543_var_Info = {
			{ levelMin = 70, levelMax = 160,  info = "前往跨服中兴府", map = 544, gamelog = 11083, server = 8 },
			{ levelMin = 40, levelMax = 160,  info = "前往中兴府", map = 3, gamelog = 11083, server = -1 },
}



--DECLARE_QUEST_INFO_STOP--

function x302543_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	
	if x302543_IsNewServer( varMap, varPlayer ) == 1 then
		local level = GetLevel( varMap, varPlayer )
		if ( level < 40 ) then
			Msg2Player(varMap,varPlayer,"只有40级以上的玩家才能使用此功能",8,3)
			return
		end
		if ( level >= x302543_var_Info[2].levelMin and level <= x302543_var_Info[2].levelMax ) then
			TalkAppendButton(varMap, x302543_var_FileId, x302543_var_Info[2].info, 14, 2 )
		end
	elseif x302543_IsNewServer( varMap, varPlayer ) == 0 then
		local level = GetLevel( varMap, varPlayer )
		if ( level < 70 ) then
			Msg2Player(varMap,varPlayer,"只有70级以上的玩家才能使用此功能",8,3)
			return
		end
		if ( level >= x302543_var_Info[1].levelMin and level <= x302543_var_Info[1].levelMax ) then
			TalkAppendButton(varMap, x302543_var_FileId, x302543_var_Info[1].info, 14, 1 )
		end
	end
end

function x302543_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, index)
	
	local mintime = GetMinOfDay() 
	if mintime < 22*60 or mintime > 23*60 then
		Msg2Player(varMap,varPlayer,"演习时间为22：00~23：00，现在不是演习时间",8,3)
		return
	end
	
	local varNum = GetMapServerCurUserNum(x302543_var_Info[index].server)
	if varNum == -1 and x302543_IsNewServer( varMap, varPlayer ) == 0  then
		Msg2Player(varMap,varPlayer,"跨服服务器忙",8,3)
		return
	end
         
	local selfType = GetObjType(varMap, varPlayer)
	if selfType == 1 then 
		if IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法使用马车夫",8,2)
			return
		end
	end
	
	local varText = ""
	local CanTrans = IsCashboxState(varMap,varPlayer)	
	if CanTrans == 1 then
		StartTalkTask(varMap)
			varText = "#Y运镖或者护送状态中，不允许传送"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local level = GetLevel( varMap, varPlayer )
	local country = GetCurCountry( varMap, varPlayer )
	local X = 0
	local Y = 0
	if ( country == 0 ) then
		X = 53
		Y = 178
	elseif ( country == 1 ) then
		X = 206
		Y = 179
	elseif ( country == 2 ) then
		X = 57 
		Y = 94 
	elseif ( country == 3 ) then
		X = 201
		Y = 77
	else
		return
	end
	if ( level >= x302543_var_Info[index].levelMin and level <= x302543_var_Info[index].levelMax ) then
		GamePlayScriptLog( varMap, varPlayer, x302543_var_Info[index].gamelog )
		NewWorld(varMap, varPlayer, x302543_var_Info[index].map, X+random(-5,5), Y+random(-5,5), 302543)
	end
	
end

function x302543_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x302543_CheckPushList(varMap, varPlayer, varTalknpc)
end

function x302543_ProcAccept(varMap, varPlayer)
end

function x302543_ProcQuestAbandon(varMap, varPlayer, varQuest)
end

function x302543_CheckSubmit( varMap, varPlayer, varTalknpc)
end

function x302543_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end

function x302543_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end

function x302543_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end

function x302543_IsNewServer( varMap, varPlayer )
	local oldServerList =	{
15	,21	,23	,31	,44	,53	,62	,73	,84	,106	,121	,138	,150	,151	,156	,161	,167	,196	,201	,211	,216	,220	,241	,284	,300	,316	,321	,323	,344	,353	,364	,390	,424	,1002	,1122	,1172	,1222	,1242	,1272	,1302	,1332	,1342	,1352	,1372	,1402	,1432	,1442	,1452	,1462	,1472	,
1502	,1512	,1522	,1532	,1542	,1602	,1612	,1622	,1632	,1642	,1652	,1662	,3002	,3052	,3142	,3152	,3202	,3222	,3232	,3242	,3252	,3262	,3272	,3302	,3312	,3322	,3332	,2702,2712,2722,2732,2742,2752,2762,2772,2782,2792,2802,2812,2822,2832,2842,2852,2862,2872,2882,2892,2902,2912,2922,
2932,2942,2952,2962,2972,2982,2992,																	
2002,2012,2022,2032,2062,2072,2082,2102,2112,2132,  --双线一区
2152,2192,2162,2182,2172,2202,2212,2222,2232,2242,  --双线二区
										}
	local IsNewServer = 1
	local ServeriId = GetWorldIdEx()
	for varI , item in oldServerList do
		if ServeriId == item then
			IsNewServer = 0
			break
		end
	end
	
	return IsNewServer
end
