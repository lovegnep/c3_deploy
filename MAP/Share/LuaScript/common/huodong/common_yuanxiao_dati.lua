x310818_g_scriptId 		= 310818

--出题相关
x310818_g_MaxCount			= 100			--不能超过127
x310818_g_AnswerBaseNum = 21000   --答案的基本数

x310818_g_GameId				= 1077			--玩法ID
x310818_g_LimitLevel		= 40			--最低级别
x310818_g_LimitSceneId	= 0				--玩法所在场景，必须是在玩法场景，否则一切响应皆为非法

x310818_g_DatiHistory   = {}	--上次玩家答到的题

x310818_g_VigorLimit	= 10  --活力值的下限
x310818_g_CostVigor		= 10  --消耗活力值

----------------------------------------------------------------------------------------------
--以下奖励相关信息
----------------------------------------------------------------------------------------------
x310818_g_ItemID			= 12260008
	  
x310818_g_buff1 								=	9011						-- 江湖请柬buff
x310818_g_buff2 								=	9013						-- 朝廷请柬buff
x310818_g_buff3									=	9012						-- 天江湖请柬buff

----------------------------------------------------------------------------------------------
--检查有效性
----------------------------------------------------------------------------------------------
function x310818_CheckValid( sceneId,selfId)

	local level = GetLevel(sceneId,selfId)
	if level < x310818_g_LimitLevel then
		return -1
	end
	
	if sceneId ~= x310818_g_LimitSceneId then
		return -2
	end
	
	return 1

end

----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x310818_ProcEnumEvent( sceneId, selfId, targetId, MissionId )
	if GetGameOpenById(x310818_g_GameId) ~= 1 then
		return
	end
	
	local year, month, day = GetYearMonthDay();
	
	if month > 2 or day < 12 or day > 18 then
		return 
	end	
	
  TalkAppendButton(sceneId, x310818_g_scriptId, "【元宵节】猜灯谜", 3, x310818_g_scriptId)   
end

--回答后的处理
function x310818_AfterReply(sceneId ,selfId, npcId, idScript, idExt)
	--x310818_g_DatiHistory[selfId].id = nil
	--x310818_g_DatiHistory[selfId].nAnswer = nil
	x310818_g_DatiHistory[selfId] = nil
	
	x310818_ChangeCount(sceneId, selfId)
	
	SetPlayerVigor(sceneId, selfId, GetPlayerVigor(sceneId, selfId) - x310818_g_CostVigor)
	
	x310818_ProcEventEntry(sceneId ,selfId, npcId, idScript, x310818_g_scriptId)
end

--给与奖励
function x310818_AwardGiven(sceneId, selfId, signal)

	local year, month, day = GetYearMonthDay();
	
	if month >= 2 and day > 18 then
		return 
	end	
	
	WriteLog(1, format("x310818_AwardGiven ---- SceneId=%d PlayerGUID=%d, Signal=%d",
				selfId, selfId, signal))
	local suiji = random(1,100)
	local level = GetLevel(sceneId, selfId)
	local expdati =	level * 2000
	local expdati1 =	level * 1000
	if signal == 1 then
		if suiji >50 then
			StartItemTask(sceneId)				
			if IsHaveSpecificImpact(sceneId, selfId, x310818_g_buff1) == 1 or
				IsHaveSpecificImpact(sceneId, selfId, x310818_g_buff2) == 1 or
				IsHaveSpecificImpact(sceneId, selfId, x310818_g_buff3) == 1	then
				ItemAppend(sceneId, x310818_g_ItemID, 1)
				AddExp( sceneId, selfId, expdati)
				WriteLog(1, "添加非绑定道具")
				Msg2Player( sceneId, selfId, "恭喜您，获得#R糯米面粉1袋#o的奖励", 8, 2)			
				Msg2Player( sceneId, selfId, "恭喜您，获得#R糯米面粉1袋#o的奖励", 8, 3)	
				Msg2Player( sceneId, selfId, "恭喜您，获得#R"..expdati.."点经验#o的奖励", 8, 2)			
				Msg2Player( sceneId, selfId, "恭喜您，获得#R"..expdati.."点经验#o的奖励", 8, 3)		
			else
				ItemAppendBind(sceneId, x310818_g_ItemID, 1)
				AddExp( sceneId, selfId, expdati)
				WriteLog(1, "添加绑定道具")
				Msg2Player( sceneId, selfId, "恭喜您，获得#R糯米面粉1袋#o的奖励", 8, 2)			
				Msg2Player( sceneId, selfId, "恭喜您，获得#R糯米面粉1袋#o的奖励", 8, 3)	
				Msg2Player( sceneId, selfId, "恭喜您，获得#R"..expdati.."点经验#o的奖励", 8, 2)			
				Msg2Player( sceneId, selfId, "恭喜您，获得#R"..expdati.."点经验#o的奖励", 8, 3)	
			end
			if StopItemTask(sceneId, selfId) <= 0 then
				return
			else
				DeliverItemListSendToPlayer(sceneId, selfId)
			end
		else
			AddExp( sceneId, selfId, expdati)	
			Msg2Player( sceneId, selfId, "恭喜您，获得#R"..expdati.."点经验#o的奖励", 8, 2)			
			Msg2Player( sceneId, selfId, "恭喜您，获得#R"..expdati.."点经验#o的奖励", 8, 3)			
		end
	end
	if signal == 2 then
			AddExp( sceneId, selfId, expdati1)	
			Msg2Player( sceneId, selfId, "恭喜您，获得#R"..expdati1.."点经验#o的奖励", 8, 2)			
			Msg2Player( sceneId, selfId, "恭喜您，获得#R"..expdati1.."点经验#o的奖励", 8, 3)	
	end
end

--回答问题
function x310818_Reply(sceneId, selfId, npcId, idExt)
	local id, nAnswer = x310818_GetIdAndAnswer(x310818_g_DatiHistory[selfId].id)
	if (nAnswer + x310818_g_AnswerBaseNum) == idExt then
		Msg2Player( sceneId, selfId, "恭喜您，回答正确", 8, 2)			
		Msg2Player( sceneId, selfId, "恭喜您，回答正确", 8, 3)		
		x310818_AwardGiven(sceneId, selfId, 1) 
	else
		Msg2Player( sceneId, selfId, "很遗憾，回答错误", 8, 2)			
		Msg2Player( sceneId, selfId, "很遗憾，回答错误", 8, 3)	
		x310818_AwardGiven(sceneId, selfId, 2) 
	end
end

--获取指定题目的Id和答案
function x310818_GetIdAndAnswer(itemNum)
	local id, strDesc, strAnswer1, strAnswer2, strAnswer3, strAnswer4, nAnswer = QuestDengmi_GetQuestionInfo(itemNum)
	return id, nAnswer
end

--生成题目
function x310818_ProduceItem(sceneId, selfId, npcId, idExt)

	if x310818_g_DatiHistory[selfId] == nil then
		local nCount = QuestDengmi_GetQuestionCount()
		x310818_g_DatiHistory[selfId] = {}
		x310818_g_DatiHistory[selfId].id = random(1, nCount - 1)
	end
	
	local id, strDesc, strAnswer1, strAnswer2, strAnswer3, strAnswer4, nAnswer = QuestDengmi_GetQuestionInfo(x310818_g_DatiHistory[selfId].id)
	x310818_g_DatiHistory[selfId].nAnswer = nAnswer
	
	local nDate   = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_DATI_DATE[1], 
										MD_2011YXHD_DATI_DATE[2], MD_2011YXHD_DATI_DATE[3])
										
	local nCount  = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_DATI_COUNT[1], 
										MD_2011YXHD_DATI_COUNT[2], MD_2011YXHD_DATI_COUNT[3])

	local nCurDay = GetDayOfYear() + 1
	
	if nCurDay ~= nDate then
		nCount = 0
	end
	
	StartTalkTask(sceneId)
	TalkAppendString(sceneId, format("你今天是你第%d道题,还可以再答%d次 \n", 
												nCount + 1, (x310818_g_MaxCount - nCount)))
	TalkAppendString(sceneId, strDesc)
	x310818_AddAnswerOption(sceneId, strAnswer1, strAnswer2, strAnswer3, strAnswer4)
	StopTalkTask(sceneId)
	DeliverTalkMenu(sceneId,selfId,npcId)
end

--通知客户端清楚数据
function x310818_NotifyClientClearData(sceneId, selfId)
		QuestDengmi_SendDengmiInfo(sceneId, selfId, -1, -1 )
end

--向客户端发送相应消息
function x310818_SendClientMsg(sceneId, selfId, npcId, msg)
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, msg)
		StopTalkTask(sceneId)
		DeliverTalkMenu(sceneId,selfId,npcId)
end

----------------------------------------------------------------------------------------------
--取得有效的时间,在这里，做时间检查，如果两次取时间的差超过5秒或者小于0，则认定无效，重新取
--帮会战曾在取时间的问题上出过错，所以在这里做相同的检查
----------------------------------------------------------------------------------------------
function x310818_GetValidTime()

	local n1 = GetCurrentTime()
	local n2 = GetCurrentTime()
	
	local nResult = n2 - n1 
	while nResult > 5 or nResult < 0 do
		n1 = GetCurrentTime()
		n2 = GetCurrentTime()
		
		nResult = n2 - n1 
		
		--记录日志
		WriteLog(1, format("DML:<Error>x310818_GetValidTime n1=%d,n2=%d", n1, n2))	
		
	end
	return n2
end

----------------------------------------------------------------------------------------------
--取得有效的小时分钟
----------------------------------------------------------------------------------------------
function x310818_GetValidTimeHourMin()

	local h,m,s = GetHourMinSec()	
	return h,m

end

----------------------------------------------------------------------------------------------
--检查启动时间是否有效
----------------------------------------------------------------------------------------------
function x310818_IsTimeValid()

	local year, month, day = GetYearMonthDay();
	
	if month >= 2 and day > 18 then
		return 0
	end
	
	local h,m 			= x310818_GetValidTimeHourMin()
	
	local cur  			= h*60 + m
	local sartTime1 = 12*60 + 00 --第一个开始时间
	local endTime1  = 13*60 + 00 --第一个结束时间
	
	local sartTime2 = 20*60 + 00 --第二个开始时间
	local endTime2  = 21*60 + 00 --第二个结束时间
	
	if (cur >= sartTime1 and cur <= endTime1) or (cur >= sartTime2 and cur <= endTime2) then
		return 1
	end
	
  WriteLog( 1, format("DML:<Info>x310160_IsStartTimeValid starttime invalid started  h=%d,m=%d", h, m ))
	return 0
end

----------------------------------------------------------------------------------------------
--判断玩家猜灯谜是否次数已满
----------------------------------------------------------------------------------------------
function x310818_IsPlayerGamingFull(sceneId, selfId)
	
	local nDate   = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_DATI_DATE[1], 
										MD_2011YXHD_DATI_DATE[2], MD_2011YXHD_DATI_DATE[3])
										
	local nCount  = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_DATI_COUNT[1], 
										MD_2011YXHD_DATI_COUNT[2], MD_2011YXHD_DATI_COUNT[3])

	local nCurDay = GetDayOfYear() + 1
	
	if nCurDay == nDate then
		if nCount >= x310818_g_MaxCount then
			return 1
		end
	end

	return 0
end

--修改答题的次数
function x310818_ChangeCount(sceneId, selfId)

	local nCount = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_DATI_COUNT[1], MD_2011YXHD_DATI_COUNT[2], 
										MD_2011YXHD_DATI_COUNT[3])
	
	local nDate = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_DATI_DATE[1], MD_2011YXHD_DATI_DATE[2], 
										MD_2011YXHD_DATI_DATE[3])
										
	local nCurDay = GetDayOfYear() + 1
	
	if nDate ~= nCurDay then 
		SetPlayerGameData(sceneId,selfId, MD_2011YXHD_DATI_DATE[1], 
										MD_2011YXHD_DATI_DATE[2], MD_2011YXHD_DATI_DATE[3], nCurDay)
		nCount = 0			
	end
	
	SetPlayerGameData(sceneId,selfId, MD_2011YXHD_DATI_COUNT[1], 
										MD_2011YXHD_DATI_COUNT[2], MD_2011YXHD_DATI_COUNT[3], nCount + 1)
	
end

----------------------------------------------------------------------------------------------
--添加灯谜答案选项
----------------------------------------------------------------------------------------------
function x310818_AddAnswerOption(sceneId, strAnswer1, strAnswer2, strAnswer3, strAnswer4)

	--随机添加选项
	local arr_answer = {
				{strAnswer1, (x310818_g_AnswerBaseNum + 1), 0}, 
				{strAnswer2, (x310818_g_AnswerBaseNum + 2), 0},
				{strAnswer3, (x310818_g_AnswerBaseNum + 3), 0},
				{strAnswer4, (x310818_g_AnswerBaseNum + 4), 0},
			}
			
	for i=1,4 do
		local nCount = getn(arr_answer)
		local n = random(1, nCount)
		while arr_answer[n][3] == 1 do
			n = random(1, nCount)
		end
		
		arr_answer[n][3] = 1

		TalkAppendButton(sceneId, x310818_g_scriptId, arr_answer[n][1], 3, arr_answer[n][2] )
	end
end
--条件验证集合
function x310818_CheckConditions(sceneId ,selfId, npcId)
	----------------------------------------------------------------------------------------------
	--验证游戏是否开启
	----------------------------------------------------------------------------------------------
	local h, m = x310818_GetValidTimeHourMin()
	if GetGameOpenById(x310818_g_GameId) ~= 1 then
		x310818_NotifyClientClearData(sceneId, selfId);
		x310818_SendClientMsg(sceneId, selfId, npcId, "猜灯谜活动已经关闭！")
		return 0
	end
	
		----------------------------------------------------------------------------------------------
	--检查玩家有效性
	----------------------------------------------------------------------------------------------
	if x310818_CheckValid(sceneId, selfId) ~= 1 then
		WriteLog(1, format("x310818_CheckConditions 无效玩家 --- SceneId=%d PlayerGUID=%d NpcId=%d",
				selfId, selfId, npcId))
		return 0
	end
	
	----------------------------------------------------------------------------------------------
	--验证活动是否在开启时间内
	----------------------------------------------------------------------------------------------
	if x310818_IsTimeValid() == 0 then
		x310818_NotifyClientClearData(sceneId, selfId);
		x310818_SendClientMsg(sceneId, selfId, npcId, "#Y【元宵节】猜灯谜 \n\t#W很抱歉，现在还不是猜灯谜的时间。请记住下面的日期、时间，准时来参加。 \n \n#G活动日期：\n#W1月20日-2月18日\n \n#G开放时间：#W\n12：00～13：00\n20：00～21：00")
		return 0
	end

	if GetPlayerVigor(sceneId, selfId) < x310818_g_VigorLimit then
		x310818_NotifyClientClearData(sceneId, selfId);
		x310818_SendClientMsg(sceneId, selfId, npcId, "#Y【元宵节】猜灯谜 \n\t#W您的活力值不够,无法继续答题！")
		return 0
	end
	return 1

end

----------------------------------------------------------------------------------------------
--脚本默认事件
----------------------------------------------------------------------------------------------
function x310818_ProcEventEntry(sceneId ,selfId, npcId, idScript, idExt)
	
	WriteLog(1, format("x310818_ProcEventEntry --- SceneId=%d PlayerGUID=%d NpcId=%d idExt=%d",
				selfId, selfId, npcId, idExt))

	if x310818_CheckConditions(sceneId ,selfId, npcId) == 0 then
		return 
	end
	
	if idExt == x310818_g_scriptId then --选择答题
		if x310818_IsPlayerGamingFull(sceneId, selfId) == 0 then -- 答题次数未满
			x310818_ProduceItem(sceneId, selfId, npcId, idExt) 
		else
			x310818_NotifyClientClearData(sceneId, selfId)
			x310818_SendClientMsg(sceneId, selfId, npcId, "#Y【元宵节】猜灯谜 \n\t#W今天你已经答完100次题了，明天这个时候再来吧。")
		end
	elseif idExt >= 21001 and idExt <= 21004 then --做出选择
		x310818_Reply(sceneId, selfId, npcId, idExt)
		x310818_AfterReply(sceneId ,selfId, npcId, idScript, idExt)
	end
	
end
