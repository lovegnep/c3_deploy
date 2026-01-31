x310819_g_scriptId  		= 310819
x310819_g_GameId				= 1077			--玩法ID
x310819_g_LimitLevel		= 40			--最低级别
x310819_g_MaxCount			= 50			--不能超过127
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

--等级验证
function x310819_CheckGrade(sceneId, selfId)

	local level = GetLevel(sceneId,selfId)
	if level < x310819_g_LimitLevel then
		return -1
	end
	
	return 1
end

----------------------------------------------------------------------------------------------
--判断玩家吃元宵是否次数已满
----------------------------------------------------------------------------------------------
function x310819_IsPlayerGamingFull(sceneId, selfId)
	
	WriteLog(1, format("x310819_IsPlayerGamingFull --- SceneId=%d, SelfId=%d", sceneId, selfId))

	local nDate   = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_CHIYUANXIAO_DATE[1], 
										MD_2011YXHD_CHIYUANXIAO_DATE[2], MD_2011YXHD_CHIYUANXIAO_DATE[3])
										
	local nCount  = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_CHIYUANXIAO_COUNT[1], 
										MD_2011YXHD_CHIYUANXIAO_COUNT[2], MD_2011YXHD_CHIYUANXIAO_COUNT[3])

	local nCurDay = GetDayOfYear() + 1
	
	if nCurDay == nDate then
		if nCount >= x310819_g_MaxCount then
			return 1
		end
	end

	return 0
end

--修改吃元宵的次数
function x310819_ChangeCount(sceneId, selfId)

	WriteLog(1, format("x310819_ChangeCount --- SceneId=%d, SelfId=%d", sceneId, selfId))

	local nDate = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_CHIYUANXIAO_DATE[1], MD_2011YXHD_CHIYUANXIAO_DATE[2], 
										MD_2011YXHD_CHIYUANXIAO_DATE[3])
	
	local nCount = GetPlayerGameData(sceneId,selfId, MD_2011YXHD_CHIYUANXIAO_COUNT[1], MD_2011YXHD_CHIYUANXIAO_COUNT[2], 
										MD_2011YXHD_CHIYUANXIAO_COUNT[3])
										
	local nCurDay = GetDayOfYear() + 1
	
	if nDate ~= nCurDay then 
		SetPlayerGameData(sceneId,selfId, MD_2011YXHD_CHIYUANXIAO_DATE[1], 
										MD_2011YXHD_CHIYUANXIAO_DATE[2], MD_2011YXHD_CHIYUANXIAO_DATE[3], nCurDay)
		nCount = 0			
	end
	
	SetPlayerGameData(sceneId,selfId, MD_2011YXHD_CHIYUANXIAO_COUNT[1], 
										MD_2011YXHD_CHIYUANXIAO_COUNT[2], MD_2011YXHD_CHIYUANXIAO_COUNT[3], nCount + 1)
	
end

--**********************************
--事件交互入口
--**********************************
function x310819_ProcEventEntry(sceneId, selfId, bagIndex)
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x310819_ProcIsSpellLikeScript(sceneId, selfId)
	return 1
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x310819_ProcCancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x310819_ProcConditionCheck( sceneId, selfId )
	WriteLog(1, format("x310819_ProcConditionCheck --- SceneId=%d, SelfId=%d", sceneId, selfId))

--	if GetGameOpenById(x310819_g_scriptId) ~= 1 then
--		WriteLog(1, format("x310819_ProcConditionCheck (GetGameOpenById) Game not opend!!!"))
--		return 0
--	end
	
  return 1
end

function x310819_ProcDeplete( sceneId, selfId )
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x310819_ProcActivateOnce( sceneId, selfId )

	WriteLog(1, format("x310819_OnActivateOnce --- SceneId=%d, SelfId=%d", sceneId, selfId))
	
	local year, month, day = GetYearMonthDay();
	
	if month > 2 or day < 12 then
		Msg2Player( sceneId, selfId, "如意元宵已经过期了", 8, 3)
		Msg2Player( sceneId, selfId, "如意元宵已经过期了", 8, 2)
		return 0
	end		
	
	  --检测等级
	if x310819_CheckGrade(sceneId, selfId) ~= 1 then
	return 0
	end

	--检测当天的次数
	if x310819_IsPlayerGamingFull(sceneId, selfId) == 1 then --次数已达上线
	Msg2Player(sceneId, selfId, "您今天已经吃了50个元宵了，请明天再吃", 8, 2)
	Msg2Player(sceneId, selfId, "您今天已经吃了50个元宵了，请明天再吃", 8, 3)
	return 0
	end

	if(DepletingUsedItem(sceneId, selfId)) == 1 then
	x310819_GiftGiven(sceneId, selfId) --给与礼物
		x310819_ChangeCount(sceneId, selfId)
	else
		StartTalkTask(sceneId)
		TalkAppendString(sceneId,"噎着了，请稍候再吃")
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
	end

	return 1;
end

--给与奖励
function x310819_GiftGiven(sceneId, selfId)
	local level =GetLevel(sceneId, selfId)
	local rate = 0.7
	local suiji = random(1,100)
	if suiji > 0 and suiji <= 20 then
		rate = 0.7
	elseif suiji > 20 and suiji <= 40 then
		rate = 0.8
	elseif suiji > 40 and suiji <= 60 then
		rate = 0.9
	elseif suiji > 60 and suiji <= 80 then
		rate = 1
	elseif suiji > 80 and suiji <= 100 then
		rate = 1.1
	end
	local yuanxiaoexp = 0;
	if level <= 70 then
		yuanxiaoexp = ceil(level*3600*rate)
	elseif level > 70 and level <= 80 then
		yuanxiaoexp = ceil(level*6480*rate)
	elseif level > 80 and level <= 90 then
		yuanxiaoexp = ceil(level*12960*rate)
	elseif level > 90 then
		yuanxiaoexp = ceil(level*16800*rate)
	end

	
	WriteLog(1, format("x310819_AwardGiven (x310819_GiftGiven) ---- SceneId=%d PlayerGUID=%d, rate=%d",
				sceneId, selfId, rate))
	
	AddExp(sceneId, selfId, yuanxiaoexp)
	Msg2Player(sceneId, selfId, "您获得了#R"..yuanxiaoexp.."点经验#o的奖励。", 8, 2)
	Msg2Player(sceneId, selfId, "您获得了#R"..yuanxiaoexp.."点经验#o的奖励。", 8, 3)
	
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x310819_ProcActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
