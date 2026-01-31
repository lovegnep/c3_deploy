--##############################################
--##情人节活动 by wy##
--##############################################

x310815_g_ScriptId          		= 310815				--脚本ID

x310815_g_Title									= 100

-- 活动时间列表
x310815_g_DateList							= {
																		{y = 2011, m = 1, d= 20},
																		{y = 2011, m = 1, d= 21},
																		{y = 2011, m = 1, d= 22},
																		{y = 2011, m = 1, d= 23},
																		{y = 2011, m = 1, d= 24},
																		{y = 2011, m = 1, d= 25},
																		{y = 2011, m = 1, d= 26},
																		{y = 2011, m = 1, d= 27},
																		{y = 2011, m = 1, d= 28},
																		{y = 2011, m = 1, d= 29},
																		{y = 2011, m = 1, d= 30},
																		{y = 2011, m = 1, d= 31},
																		{y = 2011, m = 2, d= 1},
																		{y = 2011, m = 2, d= 2},
																		{y = 2011, m = 2, d= 3},
																		{y = 2011, m = 2, d= 4},
																		{y = 2011, m = 2, d= 5},
																		{y = 2011, m = 2, d= 6},
																		{y = 2011, m = 2, d= 7},
																		{y = 2011, m = 2, d= 8},
																		{y = 2011, m = 2, d= 9},
																		{y = 2011, m = 2, d= 10},
																		{y = 2011, m = 2, d= 11},
																		{y = 2011, m = 2, d= 12},
																		{y = 2011, m = 2, d= 13},
																		{y = 2011, m = 2, d= 14},
																		{y = 2011, m = 2, d= 15},
																		{y = 2011, m = 2, d= 16},
																		{y = 2011, m = 2, d= 17},
																		{y = 2011, m = 2, d= 18},
																		{y = 2011, m = 2, d= 19},
																		{y = 2011, m = 2, d= 20},
																		{y = 2011, m = 2, d= 21},																	
																		}
																		
x310815_g_StartTime 						= 1200								-- 获取开始时间
x310815_g_EndTime 							= 1230						-- 活动结束时间
x310815_g_Level									= 40							-- 领取等级
x310815_g_AwardItemID						= 12260003				-- 礼包的ID

x310815_g_buff1 								=	9011						-- 江湖请柬buff
x310815_g_buff2 								=	9013						-- 朝廷请柬buff
x310815_g_buff3									=	9012						-- 天江湖请柬buff
----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x310815_ProcEnumEvent(sceneId, selfId, targetId, MissionId)
	local year, month, day = GetYearMonthDay();
	
	if month >= 2 and day > 21 then
		return 
	end	
		TalkAppendButton(sceneId, x310815_g_ScriptId, "【情人节】领取礼物", 3, 100)
end


----------------------------------------------------------------------------------------------
--默认事件
----------------------------------------------------------------------------------------------
function x310815_ProcEventEntry(sceneId, selfId, targetId, idScript, idExt)
	
	if idExt == x310815_g_Title then
		StartTalkTask( sceneId)
        TalkAppendString( sceneId, "#Y【情人节】领取礼物")
		TalkAppendString( sceneId, "\t在活动期间，每天的#R20：00-20：30#W都可以在我这里领取情人节礼物。现在要领取吗？")
		AddQuestItemBonus(sceneId , 12260003,1)
        StopTalkTask()
        DeliverTalkInfo( sceneId, selfId, targetId, x310815_g_ScriptId, -1)
	end

end


----------------------------------------------------------------------------------------------
--检测接受条件
----------------------------------------------------------------------------------------------
function x310815_ProcAcceptCheck(sceneId, selfId, npcId)
		if x310815_CheckDateValid() == 0 then
			 Msg2Player( sceneId, selfId, "活动时间为1月20日—2月21日", 8, 3)
			 Msg2Player( sceneId, selfId, "活动时间为1月20日—2月21日", 8, 2)
			return
		end
		-- 判断时间
		if x310815_CheckTimeValid() == 0 then
			Msg2Player( sceneId, selfId, "20：00—20：30才可领取礼包", 8, 3)
			Msg2Player( sceneId, selfId, "20：00—20：30才可领取礼包", 8, 2)
			return
		end
		-- 判断是否领取过
		if x310815_Checkobtain(sceneId, selfId) == 0 then
			Msg2Player( sceneId, selfId, "你今天已经领取过了", 8, 3)
			Msg2Player( sceneId, selfId, "你今天已经领取过了", 8, 2)
			return
		end
		
		-- 添加礼包
		x310815_AddAwardItem(sceneId, selfId)		
end

function x310815_ProcAccept(sceneId, selfId)

end
----------------------------------------------------------------------------------------------
--检测是否在活动日期内
----------------------------------------------------------------------------------------------
function x310815_CheckDateValid()
	--获取日期
	local y,m,d = GetYearMonthDay()
	
	for i,item in x310815_g_DateList do
	
		if y == item.y and m == item.m and d == item.d then
			return 1
		end
	end
	
	return 0
end

----------------------------------------------------------------------------------------------
--检测是否在活动时间内
----------------------------------------------------------------------------------------------
function x310815_CheckTimeValid()
	-- 获取当前时间
	local minute = GetMinOfDay()
	
	if minute >= x310815_g_StartTime and minute <= x310815_g_EndTime then
		return 1
	end
	
	return 0
end

----------------------------------------------------------------------------------------------
--检测是否领取过
----------------------------------------------------------------------------------------------
function x310815_Checkobtain(sceneId,selfId)
	-- 获取当前日期
	local nCurDay = GetDayOfYear()
	
	local nDate = GetPlayerGameData(sceneId,selfId,MD_2011QRJHD_GAIN_DATE[1], MD_2011QRJHD_GAIN_DATE[2], MD_2011QRJHD_GAIN_DATE[3] )
	
	if nCurDay == nDate then
		return 0
	end

	return 1
end

----------------------------------------------------------------------------------------------
--设置领取时间
----------------------------------------------------------------------------------------------
function x310815_SetObtainTime(sceneId,selfId)
	local today = GetDayOfYear()

	SetPlayerGameData(sceneId,selfId,MD_2011QRJHD_GAIN_DATE[1],MD_2011QRJHD_GAIN_DATE[2],MD_2011QRJHD_GAIN_DATE[3], today)
end

----------------------------------------------------------------------------------------------
--添加奖励物品
----------------------------------------------------------------------------------------------
function x310815_AddAwardItem(sceneId, selfId)
		StartItemTask(sceneId)
		if IsHaveSpecificImpact(sceneId, selfId, x310815_g_buff1) == 1 or
			 IsHaveSpecificImpact(sceneId, selfId, x310815_g_buff2) == 1 or
			 IsHaveSpecificImpact(sceneId, selfId, x310815_g_buff3) == 1	then
			 ItemAppend(sceneId, x310815_g_AwardItemID, 1)
		else
			 ItemAppendBind(sceneId, x310815_g_AwardItemID, 1)
		end
		-- 添加物品
		if StopItemTask(sceneId, selfId) > 0 then	
			 DeliverItemListSendToPlayer(sceneId,selfId)
		     
		   WriteLog(1, format("x310815_AddAwardItem  ItemAppendBind OK: SceneId(%d) GUID(%d) ItemAppend(%d) AddtemNum(%d)", 
			sceneId, GetGUID(sceneId, selfId), x310815_g_AwardItemID, 1))
			Msg2Player( sceneId, selfId, "顺利领取", 8, 2)			
			Msg2Player( sceneId, selfId, "顺利领取", 8, 3)
			-- 记录领取奖励的时间
			x310815_SetObtainTime(sceneId, selfId)
		else
			Msg2Player( sceneId, selfId, "背包空间不足,无法领取", 8, 2)
			Msg2Player( sceneId, selfId, "背包空间不足,无法领取", 8, 3)
		end
end
