x310820_g_scriptId 		= 310820

x310820_g_GameId				= 1077			--玩法ID
x310820_g_LimitLevel		= 40			--最低级别
x310820_g_LimitSceneId	= 0				--玩法所在场景，必须是在玩法场景，否则一切响应皆为非法

----------------------------------------------------------------------------------------------
--以下奖励相关信息
----------------------------------------------------------------------------------------------
--随机物品 					--10
x310820_g_ItemList			= { 			--物品列表, [src需要的源材料,换取的道具]-{道具Id, 数量}
							{12260008, 2}, {12260007, 1}
						  }

----------------------------------------------------------------------------------------------
--检查有效性
----------------------------------------------------------------------------------------------
function x310820_CheckValid( sceneId,selfId)

	local level = GetLevel(sceneId,selfId) --20
	if level < x310820_g_LimitLevel then
		return -1
	end
	
	if sceneId ~= x310820_g_LimitSceneId then
		return -2
	end
	
	return 1
						--30
end

----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x310820_ProcEnumEvent(sceneId, selfId, targetId, MissionId)
	if GetGameOpenById(x310820_g_GameId) ~= 1 then
		return
	end
	local year, month, day = GetYearMonthDay();
	
	if month ~= 2 or day < 12 or day > 25 then
		return 
	end	
  TalkAppendButton(sceneId, x310820_g_scriptId, "【元宵节】兑换元宵", 3, -1)   
end

--道具兑换
function x310820_PropExchange(sceneId, selfId, npcId)
	WriteLog(1, format("x310820_PropExchange ---- SceneId=%u PlayerGUID=%u",
				sceneId, selfId))
	
	local itemNumOnPlayer = GetItemCount(sceneId, selfId, x310820_g_ItemList[1][1])
  
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, format(" #Y【元宵节】兑换元宵\n\t#W您需要拥有#R%d袋#W糯米面粉#W才能兑换#R1个#W如意元宵。#W\n\t目前你现在有#R%d袋#W糯米面粉。",
		x310820_g_ItemList[1][2], itemNumOnPlayer))
		AddQuestItemBonus(sceneId , 12260007,1)
		StopTalkTask(sceneId)	
		DeliverTalkInfo(sceneId, selfId, npcId, x310820_g_scriptId, -1)
end

function x310820_ProcAcceptCheck( sceneId, selfId, targetId )
	return 1
end

function x310820_ProcAccept(sceneId, selfId)
	WriteLog(1, format("x310820_ProcAccept ---- SceneId=%u PlayerGUID=%u",
				sceneId, selfId))

	local itemNumOnPlayer = GetItemCount(sceneId, selfId, x310820_g_ItemList[1][1])
	
	if itemNumOnPlayer < x310820_g_ItemList[1][2] then	--50
		Msg2Player(sceneId, selfId, "您没有足够的糯米面粉", 8, 2)
		Msg2Player(sceneId, selfId, "您没有足够的糯米面粉", 8, 3)
		return
	end
	
	-- 获取该到在背包里的第一个位置
	local BagIndex = FindFirstBagIndexOfItem(sceneId, selfId, x310820_g_ItemList[1][1])
	-- 获取该物品是否绑定
	local Bind = IsItemBind(sceneId, selfId, BagIndex)
	if DelItem(sceneId, selfId, x310820_g_ItemList[1][1], x310820_g_ItemList[1][2]) == 0 then
		Msg2Player(sceneId, selfId, "兑换失败，请稍候重试", 8, 2)
		Msg2Player(sceneId, selfId, "兑换失败，请稍候重试", 8, 3)
		return
	else
		StartItemTask(sceneId)
		if 1 == Bind then
			ItemAppendBind(sceneId, x310820_g_ItemList[2][1], x310820_g_ItemList[2][2])
		else
			ItemAppend(sceneId, x310820_g_ItemList[2][1], x310820_g_ItemList[2][2])
		end
		if StopItemTask(sceneId, selfId) <= 0 then
			Msg2Player(sceneId, selfId, "背包已满", 8, 2)
			Msg2Player(sceneId, selfId, "背包已满", 8, 3)
		else
		  DeliverItemListSendToPlayer(sceneId, selfId)
		end
  end
end

--向客户端发送相应消息
function x310820_SendClientMsg(sceneId, selfId, npcId, msg)
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, msg)
		StopTalkTask(sceneId)
		DeliverTalkMenu(sceneId,selfId,npcId)
end

----------------------------------------------------------------------------------------------
--取得有效的时间,在这里，做时间检查，如果两次取时间的差超过5秒或者小于0，则认定无效，重新取
--帮会战曾在取时间的问题上出过错，所以在这里做相同的检查
----------------------------------------------------------------------------------------------
function x310820_GetValidTime()

	local n1 = GetCurrentTime()
	local n2 = GetCurrentTime()
	
	local nResult = n2 - n1 
	while nResult > 5 or nResult < 0 do
		n1 = GetCurrentTime()
		n2 = GetCurrentTime()
		
		nResult = n2 - n1 
		
		--记录日志
		WriteLog(1, format("DML:<Error>x310820_GetValidTime n1=%d,n2=%d", n1, n2))	
		
	end
	return n2
end

----------------------------------------------------------------------------------------------
--取得有效的小时分钟
----------------------------------------------------------------------------------------------
function x310820_GetValidTimeHourMin()

	local h,m,s = GetHourMinSec()	
	return h,m
end

----------------------------------------------------------------------------------------------
--检查启动时间是否有效
----------------------------------------------------------------------------------------------
function x310820_IsTimeValid()

	local year, month, day = GetYearMonthDay();
	
	if month ~= 2 or day < 16 or day > 18 then
		return 0
	end
	
	local h,m 			= x310820_GetValidTimeHourMin()
	
	local cur  			= h*60 + m
	local sartTime1 = 12*60 + 00 --第一个开始时间
	local endTime1  = 13*60 + 00 --第一个结束时间
	
	local sartTime2 = 20*60 + 00 --第二个开始时间
	local endTime2  = 21*60 + 00 --第二个结束时间
	
	if (cur > sartTime1 and cur < endTime1) or (cur > sartTime2 and cur < endTime2) then
		return 1
	end
	
  WriteLog( 1, format("DML:<Info>x310160_IsStartTimeValid starttime invalid started  h=%d,m=%d", h, m ))
	return 0
end
	
--条件验证集合
function x310820_CheckConditions(sceneId ,selfId, npcId)
	----------------------------------------------------------------------------------------------
	--验证游戏是否开启
	----------------------------------------------------------------------------------------------
	if GetGameOpenById(x310820_g_GameId) ~= 1 then
		x310820_SendClientMsg(sceneId, selfId, npcId, "兑换模块暂未开放！")
		return 0
	end
	
	----------------------------------------------------------------------------------------------
	--检查玩家有效性
	----------------------------------------------------------------------------------------------
	if x310820_CheckValid(sceneId, selfId) ~= 1 then
		WriteLog(1, format("x310820_CheckConditions (x310820_CheckValid) --- SceneId=%d PlayerGUID=%d NpcId=%d",
				selfId, selfId, npcId))
		return 0
	end
	return 1
end


----------------------------------------------------------------------------------------------
--脚本默认事件
----------------------------------------------------------------------------------------------
function x310820_ProcEventEntry(sceneId, selfId, npcId, idScript, idExt)
	
	WriteLog(1, format("x310820_ProcEventEntry --- SceneId=%d PlayerGUID=%u NpcId=%u idExt=%u",
				selfId, selfId, npcId, idExt))

	if x310820_CheckConditions(sceneId ,selfId, npcId) == 0 then
		return 
	end
	
	x310820_PropExchange(sceneId, selfId, npcId);
	
end
