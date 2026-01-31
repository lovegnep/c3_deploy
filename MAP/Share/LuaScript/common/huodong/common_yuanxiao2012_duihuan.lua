
x310838_g_scriptId 		= 310838

x310838_g_GameId				= 1077			--玩法ID
x310838_g_LimitLevel		= 40			--最低级别
x310838_g_LimitSceneId	= 0				--玩法所在场景，必须是在玩法场景，否则一切响应皆为非法
x310838_g_Exchange1Button = 1				--兑换元宵选项编号
x310838_g_Exchange5Button = 5--兑换元宵选项编号
x310838_g_Exchange20Button = 20     --兑换元宵选项编号
x310838_g_CountLimit = 20
----------------------------------------------------------------------------------------------
--以下奖励相关信息
----------------------------------------------------------------------------------------------
--随机物品 					--10
x310838_g_ItemList			= { 			--物品列表, [src需要的源材料,换取的道具]-{道具Id, 数量}
							{12041237, 1}, {12041238, 1}, {12041234, 1}, {12041235, 1}, {12041236, 1}
						  }

----------------------------------------------------------------------------------------------
--检查有效性
----------------------------------------------------------------------------------------------

function x310838_CheckValid( sceneId,selfId)

	local level = GetLevel(sceneId,selfId) --20
	if level < x310838_g_LimitLevel then
		Msg2Player(sceneId, selfId, "您还没有达到40级，不能兑换", 8, 2)
		Msg2Player(sceneId, selfId, "您还没有达到40级，不能兑换", 8, 3)
	
		return -1
	end
	
	if sceneId ~= x310838_g_LimitSceneId then
		return -2
	end
	
	return 1
						--30
end

----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x310838_ProcEnumEvent(sceneId, selfId, targetId, MissionId)
	if GetGameOpenById(x310838_g_GameId) ~= 1 then
		
		return
	end
	local year, month, day = GetYearMonthDay();
	
	if month ~= 2 or day < 6 or day > 13 then
		return 
	end	
  TalkAppendButton(sceneId, x310838_g_scriptId, "【元宵节】兑换元宵", 3, -1)   
end

--道具兑换
function x310838_PropExchange(sceneId, selfId, npcId)
	WriteLog(1, format("x310838_PropExchange ---- SceneId=%u PlayerGUID=%u",
				sceneId, selfId))
	
	local itemNumOnPlayer = GetItemCount(sceneId, selfId, x310838_g_ItemList[1][1])
  local itemNumOnPlayer1 = GetItemCount(sceneId, selfId, x310838_g_ItemList[2][1])
  local countlimit =nil
  if itemNumOnPlayer >= itemNumOnPlayer1 then
  	countlimit = itemNumOnPlayer1
  else
  	countlimit = itemNumOnPlayer
  end	
  
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, format(" #Y【元宵节】兑换元宵\n\t#W您需要拥有#R%d个#W元宵皮和#R%d个#W元宵皮才能兑换#R1个#W元宵。每天最多可以兑换20个元宵。#W\n\t目前您现在有#R%d个#W元宵皮#R%d个#W元宵馅",
		x310838_g_ItemList[1][2],x310838_g_ItemList[2][2], itemNumOnPlayer, itemNumOnPlayer1))
		TalkAppendString(sceneId,"您现在就要兑换元宵吗？")
		if countlimit == 0 then
			TalkAppendButton(sceneId, x310838_g_scriptId, "#d兑换1个元宵", 3, x310838_g_Exchange1Button)   
		else
			TalkAppendButton(sceneId, x310838_g_scriptId, "兑换1个元宵", 3, x310838_g_Exchange1Button)
		end
		
		if countlimit < 5 then
			TalkAppendButton(sceneId, x310838_g_scriptId, "#d兑换5个元宵", 3, x310838_g_Exchange5Button)   
		else
			TalkAppendButton(sceneId, x310838_g_scriptId, "兑换5个元宵", 3, x310838_g_Exchange5Button)
		end
		
		if countlimit < 20 then
			TalkAppendButton(sceneId, x310838_g_scriptId, "#d兑换20个元宵", 3, x310838_g_Exchange20Button)   
		else
			TalkAppendButton(sceneId, x310838_g_scriptId, "兑换20个元宵", 3, x310838_g_Exchange20Button)
		end
		StopTalkTask(sceneId)	
		DeliverTalkMenu(sceneId, selfId, npcId, x310838_g_scriptId, -1)
end

function x310838_ProcAcceptCheck( sceneId, selfId, targetId )
	return 1
end

function x310838_ProcAccept(sceneId, selfId, idExt)
	WriteLog(1, format("x310838_ProcAccept ---- SceneId=%u PlayerGUID=%u",
				sceneId, selfId))
				
	local year, month, day = GetYearMonthDay();
	
	if month ~= 2 or day < 6 or day > 13 then
		return 
	end					

	local itemNumOnPlayer = GetItemCount(sceneId, selfId, x310838_g_ItemList[1][1])
	local itemNumOnPlayer1 = GetItemCount(sceneId, selfId, x310838_g_ItemList[2][1])
	
	if itemNumOnPlayer < idExt then	
		Msg2Player(sceneId, selfId, "您没有足够的元宵皮", 8, 2)
		Msg2Player(sceneId, selfId, "您没有足够的元宵皮", 8, 3)
		return
	end
		if itemNumOnPlayer1 < idExt then	
		Msg2Player(sceneId, selfId, "您没有足够的元宵馅", 8, 2)
		Msg2Player(sceneId, selfId, "您没有足够的元宵馅", 8, 3)
		return
	end
	
	local lastday = GetPlayerGameData( sceneId, selfId, MD_2012YXHD_DUIYUANXIAO_DATE[ 1], MD_2012YXHD_DUIYUANXIAO_DATE[ 2], MD_2012YXHD_DUIYUANXIAO_DATE[ 3] )
  local varToday = GetDayOfYear()
  local daycount = GetPlayerGameData( sceneId, selfId, MD_2012YXHD_DUIYUANXIAO_COUNT[ 1], MD_2012YXHD_DUIYUANXIAO_COUNT[ 2], MD_2012YXHD_DUIYUANXIAO_COUNT[ 3] )
  
	if varToday == lastday then
		if daycount + idExt > x310838_g_CountLimit then
			Msg2Player(sceneId, selfId, "您今天已经兑换"..daycount.."个元宵了", 8, 3)
			return
		end
	else
		SetPlayerGameData(sceneId,selfId,MD_2012YXHD_DUIYUANXIAO_DATE[1],MD_2012YXHD_DUIYUANXIAO_DATE[2],MD_2012YXHD_DUIYUANXIAO_DATE[3],varToday)
		SetPlayerGameData(sceneId,selfId,MD_2012YXHD_DUIYUANXIAO_COUNT[1],MD_2012YXHD_DUIYUANXIAO_COUNT[2],MD_2012YXHD_DUIYUANXIAO_COUNT[3],0 )	
		daycount = 0
	end
			
	  if GetBagSpace( sceneId, selfId) < 3 then
        Msg2Player( sceneId, selfId, "背包空间不足3个，请整理后再来", 8, 3)
        return
    end
	
	
	-- 获取该到在背包里的第一个位置
	local BagIndex = FindFirstBagIndexOfItem(sceneId, selfId, x310838_g_ItemList[1][1])
	-- 获取该物品是否绑定
	local Bind = IsItemBind(sceneId, selfId, BagIndex)
	local itemcount1 = 0
	local itemcount2 = 0
	local itemcount3 = 0
	if DelItem(sceneId, selfId, x310838_g_ItemList[1][1], idExt) == 0 or DelItem(sceneId, selfId, x310838_g_ItemList[2][1], idExt) == 0 then
		Msg2Player(sceneId, selfId, "兑换失败，请稍候重试", 8, 2)
		Msg2Player(sceneId, selfId, "兑换失败，请稍候重试", 8, 3)
		return
	else
		StartItemTask(sceneId)
		for varI = 1, idExt do
			local ran =random(1,100)
			if ran<=60 then
				ItemAppend(sceneId, x310838_g_ItemList[3][1], x310838_g_ItemList[3][2])
				itemcount1 =itemcount1 +1
		  end
		  if ran>60 and ran<=90 then
				ItemAppend(sceneId, x310838_g_ItemList[4][1], x310838_g_ItemList[4][2])
					itemcount2 = itemcount2 +1
		  end
		   if ran>90 and ran<=100 then
				ItemAppend(sceneId, x310838_g_ItemList[5][1], x310838_g_ItemList[5][2])
					itemcount3 = itemcount3 +1
		  end
		end  
		if StopItemTask(sceneId, selfId) <= 0 then
			Msg2Player(sceneId, selfId, "背包已满", 8, 2)
			Msg2Player(sceneId, selfId, "背包已满", 8, 3)
		else
		  DeliverItemListSendToPlayer(sceneId, selfId)
		  local str = "兑换完成，获得"
		  if itemcount1 > 0 then
		  	str =str..itemcount1.."个豆沙元宵"
		  end	
		  if itemcount2 > 0 then
		  	str =str.."和"..itemcount2.."个巧克力元宵"
		  end	
		  if itemcount3 > 0 then
		  	str =str.."和"..itemcount3.."个抹茶元宵"
		  end			
			Msg2Player(sceneId, selfId, str, 8, 2)
			Msg2Player(sceneId, selfId, str, 8, 3)	
			local logid 
			if idExt ==x310838_g_Exchange1Button then
				logid = 3050
			elseif idExt ==x310838_g_Exchange5Button then
				logid = 3051
			elseif 	idExt ==x310838_g_Exchange20Button then
				logid = 3052
			end
			
			if logid ~=nil then
				GamePlayScriptLog( sceneId,selfId, logid)
			end		
			SetPlayerGameData(sceneId,selfId,MD_2012YXHD_DUIYUANXIAO_COUNT[1],MD_2012YXHD_DUIYUANXIAO_COUNT[2],MD_2012YXHD_DUIYUANXIAO_COUNT[3],daycount + idExt )		  
		end
  end
end

--向客户端发送相应消息
function x310838_SendClientMsg(sceneId, selfId, npcId, msg)
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, msg)
		StopTalkTask(sceneId)
		DeliverTalkMenu(sceneId,selfId,npcId)
end

----------------------------------------------------------------------------------------------
--取得有效的时间,在这里，做时间检查，如果两次取时间的差超过5秒或者小于0，则认定无效，重新取
--帮会战曾在取时间的问题上出过错，所以在这里做相同的检查
----------------------------------------------------------------------------------------------
function x310838_GetValidTime()

	local n1 = GetCurrentTime()
	local n2 = GetCurrentTime()
	
	local nResult = n2 - n1 
	while nResult > 5 or nResult < 0 do
		n1 = GetCurrentTime()
		n2 = GetCurrentTime()
		
		nResult = n2 - n1 
		
		--记录日志
		WriteLog(1, format("DML:<Error>x310838_GetValidTime n1=%d,n2=%d", n1, n2))	
		
	end
	return n2
end

----------------------------------------------------------------------------------------------
--取得有效的小时分钟
----------------------------------------------------------------------------------------------
function x310838_GetValidTimeHourMin()

	local h,m,s = GetHourMinSec()	
	return h,m
end

----------------------------------------------------------------------------------------------
--检查启动时间是否有效
----------------------------------------------------------------------------------------------
function x310838_IsTimeValid()

	local year, month, day = GetYearMonthDay();
	
	if month ~= 2 or day < 6 or day > 13 then
		return 0
	end
	
	local h,m 			= x310838_GetValidTimeHourMin()
	
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
function x310838_CheckConditions(sceneId ,selfId, npcId)
	----------------------------------------------------------------------------------------------
	--验证游戏是否开启
	----------------------------------------------------------------------------------------------
	if GetGameOpenById(x310838_g_GameId) ~= 1 then
		x310838_SendClientMsg(sceneId, selfId, npcId, "兑换模块暂未开放！")
		return 0
	end
	
	----------------------------------------------------------------------------------------------
	--检查玩家有效性
	----------------------------------------------------------------------------------------------
	if x310838_CheckValid(sceneId, selfId) ~= 1 then
		WriteLog(1, format("x310838_CheckConditions (x310838_CheckValid) --- SceneId=%d PlayerGUID=%d NpcId=%d",
				selfId, selfId, npcId))
		return 0
	end
	return 1
end


----------------------------------------------------------------------------------------------
--脚本默认事件
----------------------------------------------------------------------------------------------
function x310838_ProcEventEntry(sceneId, selfId, npcId, idScript, idExt)
	
	WriteLog(1, format("x310838_ProcEventEntry --- SceneId=%d PlayerGUID=%u NpcId=%u idExt=%u",
				selfId, selfId, npcId, idExt))

	if x310838_CheckConditions(sceneId ,selfId, npcId) == 0 then
		return 
	end
	
	if idExt == x310838_g_Exchange1Button or idExt == x310838_g_Exchange5Button or idExt == x310838_g_Exchange20Button then
		x310838_ProcAccept(sceneId, selfId,idExt)
		return
	end
	x310838_PropExchange(sceneId, selfId, npcId);
	
end
