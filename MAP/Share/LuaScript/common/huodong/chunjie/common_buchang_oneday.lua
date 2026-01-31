-- 脚本号
x310812_g_ScriptId 				= 310812
x310812_g_SwitchLogout			= 100
x310812_g_exp			= {
								{level = 60,  sanhuanexp = 4821120, shengshanexp = 4354000, lunhuiexp = 96000, neizhengexp = 25000, highexp = 360000, highshengwang = 28800, highweiwang = 28800},
								{level = 65,  sanhuanexp = 5209920, shengshanexp = 4354000, lunhuiexp = 96000, neizhengexp = 25000, highexp = 360000, highshengwang = 28800, highweiwang = 28800},
								{level = 70,  sanhuanexp = 5598720, shengshanexp = 5070000, lunhuiexp = 96000, neizhengexp = 25000, highexp = 648000, highshengwang = 28800, highweiwang = 28800},
								{level = 75,  sanhuanexp = 20124720, shengshanexp = 13186800, lunhuiexp = 128000, neizhengexp = 25000, highexp = 648000, highshengwang = 28800, highweiwang = 28800},
								{level = 80,  sanhuanexp = 21431520, shengshanexp = 14018400, lunhuiexp = 128000, neizhengexp = 25000, highexp = 1296000, highshengwang = 28800, highweiwang = 28800},
								{level = 85,  sanhuanexp = 22738320, shengshanexp = 14850000, lunhuiexp = 160000, neizhengexp = 25000, highexp = 1296000, highshengwang = 28800, highweiwang = 28800},
								{level = 90,  sanhuanexp = 24045120, shengshanexp = 15674900, lunhuiexp = 160000, neizhengexp = 25000, highexp = 1684800, highshengwang = 28800, highweiwang = 28800},
								{level = 95,  sanhuanexp = 25351920, shengshanexp = 16508240, lunhuiexp = 160000, neizhengexp = 25000, highexp = 1684800, highshengwang = 28800, highweiwang = 28800},
								{level = 100, sanhuanexp = 26658720, shengshanexp = 17337120, lunhuiexp = 160000, neizhengexp = 25000, highexp = 1684800, highshengwang = 28800, highweiwang = 28800},
								{level = 105, sanhuanexp = 27965520, shengshanexp = 17337120, lunhuiexp = 160000, neizhengexp = 25000, highexp = 1684800, highshengwang = 28800, highweiwang = 28800},
								{level = 110, sanhuanexp = 29272320, shengshanexp = 17337120, lunhuiexp = 160000, neizhengexp = 25000, highexp = 1684800, highshengwang = 28800, highweiwang = 28800},
						  }



function x310812_ProcEnumEvent(sceneId, selfId, targetId, MissionId)
	local level = GetLevel(sceneId,selfId)
	if level < 60 then
		return
	end	
	TalkAppendButton(sceneId, x310812_g_ScriptId, "【领奖】免费领取新春奖励", 3, 100)
end

function x310812_ProcEventEntry(sceneId, selfId, targetId, idScript, idExt)
	local num = x310812_GetMD( sceneId, selfId, MD_2011CJBC_TINGJI_BUCHANG)
	local level = GetLevel( sceneId, selfId)
	local exp1 = 0
	local exp2 = 0
	local exp3 = 0
	local exp4 = 0
	local exp5 = 0
	local shengwang6 = 0
	local weiwang7 = 0
	local exp8 = 0
	if num > 0 then
		Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)
		Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
		return
	end

	for i, item in x310812_g_exp do
		if level >= item.level then
			exp1 = item.sanhuanexp*3
			exp2 = item.shengshanexp
			exp3 = item.lunhuiexp*level
			exp4 = item.neizhengexp*level
			exp5 = item.highexp*level
			shengwang6 = item.highshengwang
			weiwang7 =item.highweiwang
			exp8 = exp1+exp2+exp3+exp4+exp5
			if idExt == x310812_g_SwitchLogout then

				StartTalkTask( sceneId)
		        TalkAppendString( sceneId, "#Y【领奖】免费领取新春奖励")
				TalkAppendString( sceneId, format("\t为了答谢玩家对成吉思汗3 恶狼传说的厚爱，同时为了补偿2月15日停机维护对各位玩家造成的损失，现在所有玩家可以在我这里免费领取一天如下活动的经验：\n #G\n1.三番副本：%d经验\n2.圣山地宫：%d经验\n3.轮回台：%d经验\n4.国家内政：%d经验\n5.舞厅8倍芝华士：%d经验\n6.舞厅8倍轩尼诗理查：%d声望\n7.舞厅哈瓦那雪茄：%d威望\n \n#W\t以上共计#R%d点#W经验，#R%d点#W声望，#R%d点#W威望，领取的奖励不会计入玩家玩法的次数。",exp1,exp2,exp3,exp4,exp5,shengwang6,weiwang7,exp8,shengwang6,weiwang7))
		        StopTalkTask()
		        DeliverTalkInfo( sceneId, selfId, targetId, x310812_g_ScriptId, -1)
			end
		end
	end
end

function x310812_ProcAcceptCheck(sceneId, selfId, targetId)
	local num = x310812_GetMD( sceneId, selfId, MD_2011CJBC_TINGJI_BUCHANG)
	if num > 0 then
		Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)
		Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
		return
	end
	
	local level = GetLevel( sceneId, selfId)
	local exp1 = 0
	local exp2 = 0
	local exp3 = 0
	local exp4 = 0
	local exp5 = 0
	local shengwang6 = 0
	local weiwang7 = 0
	local exp8 = 0
	local oldshengwang = GetShengWang( sceneId, selfId)
	local newshengwang = 0
	local oldweiwang = GetPlayerGoodBadValue( sceneId, selfId)
	local newweiwang = oldweiwang + weiwang7
	for i, item in x310812_g_exp do
		if level >= item.level then
			exp1 = item.sanhuanexp*3
			exp2 = item.shengshanexp
			exp3 = item.lunhuiexp*level
			exp4 = item.neizhengexp*level
			exp5 = item.highexp*level
			shengwang6 = item.highshengwang
			weiwang7 =item.highweiwang
			exp8 = exp1+exp2+exp3+exp4+exp5
			newshengwang = oldshengwang + shengwang6	
			newweiwang	 = oldweiwang + weiwang7		
		end
	end
	
	if exp8 > 0 and shengwang6 > 0 and weiwang7 > 0 then
		AddExp(sceneId, selfId, exp8)		
		SetShengWang( sceneId, selfId, newshengwang)	
		SetPlayerGoodBadValue( sceneId, selfId, newweiwang)				
		Msg2Player( sceneId, selfId, format("你获得了#R%u点经验#o的奖励", exp8), 8, 2)
		Msg2Player( sceneId, selfId, format("你获得了#R%u点经验#o的奖励", exp8), 8, 3)
		Msg2Player( sceneId, selfId, format("你获得了#R%u点声望#o的奖励", shengwang6), 8, 2)
		Msg2Player( sceneId, selfId, format("你获得了#R%u点声望#o的奖励", shengwang6), 8, 3)
		Msg2Player( sceneId, selfId, format("你获得了#R%u点威望#o的奖励", weiwang7), 8, 2)
		Msg2Player( sceneId, selfId, format("你获得了#R%u点威望#o的奖励", weiwang7), 8, 3)
		x310812_SetMD( sceneId, selfId, MD_2011CJBC_TINGJI_BUCHANG, 1)	
	end
end

function x310812_GetMD( sceneId, selfId, mdName)
    return GetPlayerGameData( sceneId, selfId, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310812_SetMD( sceneId, selfId, mdName, value)
    SetPlayerGameData( sceneId, selfId, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
