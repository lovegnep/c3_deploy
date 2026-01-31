--五一节日馈赠

x310825_var_ScriptId 		= 310825
x310825_var_MissionKind 	= 	1                       --任务类型
x310825_var_MissionName	= "【个人】庆典坐骑 烈焰狮鹫线上抽"

-- 玩法开关id
x310825_var_IsEnableId    = 1091
x310825_var_LimitLevel	= 60			--最低级别

x310825_var_MaxCount		= 50

x310825_var_lingjiangBUFF = 30577
x310825_var_BonusItem 	= {itemid = 12500302 , count = 1}


----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x310825_ProcEnumEvent( varMap, varPlayer, varTalknpc, MissionId )
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	local curTime = GetMinOfDay()
	if year ~= 2012 or varday < 186 or varday > 200 then
				return
	end
	if  curTime < 1140 or curTime > 1380 then
		return
	end

	local level = GetLevel(varMap, varPlayer)
	if GetGameOpenById( x310825_var_IsEnableId) <= 0 then
        return
  end

  if level < x310825_var_LimitLevel then
  		return
  end
		TalkAppendButton(varMap,x310825_var_ScriptId, x310825_var_MissionName, 3, -1)
		TalkAppendButton(varMap, x310825_var_ScriptId, "庆典活动说明", 13, 7)
end

----------------------------------------------------------------------------------------------
--脚本默认事件
----------------------------------------------------------------------------------------------
function x310825_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	if GetGameOpenById( x310825_var_IsEnableId) <= 0 then
     return
  end

    if idExt < 0 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x310825_var_MissionName)
    	TalkAppendString(varMap,"\t为了答谢所有支持成吉思汗的玩家,7月5日到7月19日期间所有等级不低于60级玩家在活动期间都可以领取一个开测庆典活动礼包,打开节日礼包有几率获得烈焰狮鹫降世符等极品道具奖励。")
    	TalkAppendButton(varMap, x310825_var_ScriptId, "领取节日礼包", 3, 1)
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    elseif  idExt == 1 then
    	StartTalkTask(varMap)
			TalkAppendString(varMap, "每一次领奖后必须再线累计1小时才能再次领取礼包，#B@myname#W你现在就要领取么?")
    	StopTalkTask()
    	DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x310825_var_ScriptId, -1)
    elseif 	idExt == 7 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap, "#Y".."活动说明".."#W\n")
			TalkAppendString(varMap, "1、活动开放时间：\n\t7月5日-7月19号期间，19:00-23:00期间的任意时间均可以参与馈赠活动。\n2、活动开放等级：\n\t所有不低于60级的玩家均可以参与此活动。\n3、活动内容：\n\t活动开放时间，玩家可以领取#G开测庆典礼包#W，每次领取将获得一个已经领过奖计时状态，只有当玩家继续累计线上1小时此状态消失才可以再次领取奖品。每名角色每天最多能够领取4个“开测庆典礼包”。\n\t打开礼包能够增加玩家所属国家的国家积分，所属帮会的帮会经验以及玩家个人经验，更有几率获得稀世极品道具#G烈焰麒麟降世符#W。")
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    end
end

function x310825_ProcAcceptCheck( varMap, varPlayer, NPCId )
    return 1
end

----------------------------------------------------------------------------------------------
--接受
----------------------------------------------------------------------------------------------
function x310825_ProcAccept( varMap, varPlayer )
	local year, month, day = GetYearMonthDay();
	local curday = GetDayOfYear()
	local curTime = GetMinOfDay()

	if year ~= 2012 or curday < 186 or curday > 200 then
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 3)
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 2)
		return
	end

	if  curTime < 1140 or curTime > 1380 then
		return
	end

	local level = GetLevel(varMap, varPlayer)
	if level < x310825_var_LimitLevel then
  		return
  end

  local lastdate = x310825_GetMD(varMap, varPlayer, MD_JIERIQINGDIAN_DATE)
  local lasttime = x310825_GetMD(varMap, varPlayer, MD_WUYILINGJIANG_MIN)


  if lastdate == curday then
  	if lasttime + 60 > curTime then
  		Msg2Player(varMap, varPlayer, "你刚领取过活动礼包！", 8, 3)
			Msg2Player(varMap, varPlayer, "你刚领取过活动礼包！", 8, 2)
			return
		end
	end

	if IsHaveSpecificImpact(varMap, varPlayer, x310825_var_lingjiangBUFF) == 1 then
		Msg2Player(varMap, varPlayer, "你刚领取过活动礼包！", 8, 3)
		Msg2Player(varMap, varPlayer, "你刚领取过活动礼包！", 8, 2)
		return
	end

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer, "领取活动礼包需要至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "领取活动礼包需要至少1个背包空位。", 0, 3)
		return
	end



	local level = GetLevel(varMap, varPlayer)

	StartItemTask( varMap )
	ItemAppendBind( varMap, x310825_var_BonusItem.itemid, x310825_var_BonusItem.count)
	local ret = StopItemTask( varMap, varPlayer )
	if ret > 0 then

			DeliverItemListSendToPlayer(varMap,varPlayer)
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310825_var_lingjiangBUFF, 0)
			local str = format("你获得#R%d个#{_ITEM%d}#cffcf00",x310825_var_BonusItem.count,x310825_var_BonusItem.itemid)
			Msg2Player(varMap, varPlayer, str, 8, 3)
			Msg2Player(varMap, varPlayer, str, 8, 2)
			GamePlayScriptLog(varMap, varPlayer, 2551)
		  x310825_SetDayCount(varMap, varPlayer)
	else
		local str = "#Y背包空间不足，请整理背包后再试！"
		Msg2Player(varMap, varPlayer, str, 8, 3)
		Msg2Player(varMap, varPlayer, str, 8, 2)
		return
	end
end

----------------------------------------------------------------------------------------------
--放弃
----------------------------------------------------------------------------------------------
function x310825_ProcQuestAbandon( varMap, varPlayer, MissionId )

end

----------------------------------------------------------------------------------------------
--继续
----------------------------------------------------------------------------------------------
function x310825_OnContinue( varMap, varPlayer, varTalknpc )

end

----------------------------------------------------------------------------------------------
--检测是否可以捐献
----------------------------------------------------------------------------------------------
function x310825_CheckSubmit( varMap, varPlayer )

end

----------------------------------------------------------------------------------------------
--捐献
----------------------------------------------------------------------------------------------
function x310825_ProcQuestSubmit( varMap, varPlayer, varTalknpc,selectRadioId, MissionId )

end

----------------------------------------------------------------------------------------------
--杀死怪物或玩家
----------------------------------------------------------------------------------------------
function x310825_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, MissionId )
end

----------------------------------------------------------------------------------------------
--进入区域事件
----------------------------------------------------------------------------------------------
function x310825_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
end

----------------------------------------------------------------------------------------------
--道具改变
----------------------------------------------------------------------------------------------
function x310825_ProcQuestItemChanged( varMap, varPlayer, itemdataId, MissionId )
end

---------------------------------------------------------------------------------------------------
--取得此任务当天当前已完成次数
---------------------------------------------------------------------------------------------------
--function x310825_GetDayCount(varMap, varPlayer)
--	local today = GetDayOfYear()
--	local lastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
--	if lastday ~= today then
--		return 0
--	end
--
--	local daycount =  GetPlayerGameData(varMap, varPlayer, MD_WUYILINGJIANG_MIN[1], MD_WUYILINGJIANG_MIN[2], MD_WUYILINGJIANG_MIN[3])
--	return daycount
--end

---------------------------------------------------------------------------------------------------
--更新当天领奖次数
---------------------------------------------------------------------------------------------------
function x310825_SetDayCount(varMap, varPlayer)
	local today = GetDayOfYear()
	local curTime = GetMinOfDay()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_JIERIQINGDIAN_DATE[1], MD_JIERIQINGDIAN_DATE[2], MD_JIERIQINGDIAN_DATE[3])
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_JIERIQINGDIAN_DATE[1], MD_JIERIQINGDIAN_DATE[2], MD_JIERIQINGDIAN_DATE[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_WUYILINGJIANG_MIN[1], MD_WUYILINGJIANG_MIN[2], MD_WUYILINGJIANG_MIN[3], curTime)
	else
		SetPlayerGameData(varMap, varPlayer, MD_WUYILINGJIANG_MIN[1], MD_WUYILINGJIANG_MIN[2], MD_WUYILINGJIANG_MIN[3], curTime)
	end
end

function x310825_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310825_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
