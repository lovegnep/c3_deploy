--五一节日馈赠

x205006_var_ScriptId 		= 205006
x205006_var_MissionKind 	= 	1                       --任务类型
x205006_var_MissionName	= "【个人】Shopping礼金100两"

-- 玩法开关id
x205006_var_IsEnableId    = 1091
x205006_var_LimitLevel	= 75		--最低级别

x205006_var_MaxCount		= 50

x205006_var_lingjiangBUFF = 9300
x205006_var_BonusItem 	= {itemid = 12500303 , count = 1}


----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x205006_ProcEnumEvent( varMap, varPlayer, varTalknpc, MissionId )
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	local curTime = GetMinOfDay()
	if year ~= 2012 or varday < 181 or varday > 182 then
				return
	end
	if  curTime < 1140 or curTime > 1380 then
		return
	end

	local level = GetLevel(varMap, varPlayer)
	if GetGameOpenById( x205006_var_IsEnableId) <= 0 then
        return
  end

  if level < x205006_var_LimitLevel then
  		return
  end
		TalkAppendButton(varMap,x205006_var_ScriptId, x205006_var_MissionName, 3, -1)
		TalkAppendButton(varMap, x205006_var_ScriptId, "Shopping活动说明", 13, 7)
end

----------------------------------------------------------------------------------------------
--脚本默认事件
----------------------------------------------------------------------------------------------
function x205006_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	if GetGameOpenById( x205006_var_IsEnableId) <= 0 then
     return
  end

    if idExt < 0 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x205006_var_MissionName)
    	TalkAppendString(varMap,"\t为了答谢所有支持成吉思汗的玩家,6月30日和7月1日两天所有等级不低于75级玩家在活动期间都可以领取一个《Shopping》礼金包,打开节日礼包可以获得100两金卡奖励。")
    	TalkAppendButton(varMap, x205006_var_ScriptId, "领取Shopping礼包", 3, 1)
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    elseif  idExt == 1 then
    	StartTalkTask(varMap)
			TalkAppendString(varMap, "每天只能领取一次礼包，#B@myname#W你现在就要领取么?")
    	StopTalkTask()
    	DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x205006_var_ScriptId, -1)
    elseif 	idExt == 7 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap, "#Y".."活动说明".."#W\n")
			TalkAppendString(varMap, "1、活动时间：\n\t2012年6月30日（六）~2012年7月1日（日）每晚19：00至23：00每晚活动时段内，每人仅能领奖1次。\n2、活动内容：\n\t于活动期间，每人都可以找【领奖大使】NPC对话，获得一组《我要Shopping》Buff计时器及《Shopping礼金包》，只要角色线上满60分钟Buff消失后，即可打开礼包领取100两购物金，马上去商城逛街去！~\n3、备注：\n\tBuff下线不计时，死亡不消失。")
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    end
end

function x205006_ProcAcceptCheck( varMap, varPlayer, NPCId )
    return 1
end

----------------------------------------------------------------------------------------------
--接受
----------------------------------------------------------------------------------------------
function x205006_ProcAccept( varMap, varPlayer )
	local year, month, day = GetYearMonthDay();
	local curday = GetDayOfYear()
	local curTime = GetMinOfDay()

	if year ~= 2012 or curday < 181 or curday > 182 then
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 3)
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 2)
		return
	end

	if  curTime < 1140 or curTime > 1380 then
		return
	end

	local level = GetLevel(varMap, varPlayer)
	if level < x205006_var_LimitLevel then
  		return
  end

  local lastdate = x205006_GetMD(varMap, varPlayer, MD_SHOPPING_DATE)
  local lasttime = x205006_GetMD(varMap, varPlayer, MD_WUYILINGJIANG_MIN)


  if lastdate == curday then
  	--if lasttime + 60 > curTime then
  		Msg2Player(varMap, varPlayer, "你已经领取过活动礼包！", 8, 3)
			Msg2Player(varMap, varPlayer, "你已经领取过活动礼包！", 8, 2)
			return
		--end
	end

	if IsHaveSpecificImpact(varMap, varPlayer, x205006_var_lingjiangBUFF) == 1 then
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
	ItemAppendBind( varMap, x205006_var_BonusItem.itemid, x205006_var_BonusItem.count)
	local ret = StopItemTask( varMap, varPlayer )
	if ret > 0 then

			DeliverItemListSendToPlayer(varMap,varPlayer)
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x205006_var_lingjiangBUFF, 0)
			local str = format("你获得#R%d个#{_ITEM%d}#cffcf00",x205006_var_BonusItem.count,x205006_var_BonusItem.itemid)
			Msg2Player(varMap, varPlayer, str, 8, 3)
			Msg2Player(varMap, varPlayer, str, 8, 2)
			GamePlayScriptLog(varMap, varPlayer, 2551)
		  x205006_SetDayCount(varMap, varPlayer)
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
function x205006_ProcQuestAbandon( varMap, varPlayer, MissionId )

end

----------------------------------------------------------------------------------------------
--继续
----------------------------------------------------------------------------------------------
function x205006_OnContinue( varMap, varPlayer, varTalknpc )

end

----------------------------------------------------------------------------------------------
--检测是否可以捐献
----------------------------------------------------------------------------------------------
function x205006_CheckSubmit( varMap, varPlayer )

end

----------------------------------------------------------------------------------------------
--捐献
----------------------------------------------------------------------------------------------
function x205006_ProcQuestSubmit( varMap, varPlayer, varTalknpc,selectRadioId, MissionId )

end

----------------------------------------------------------------------------------------------
--杀死怪物或玩家
----------------------------------------------------------------------------------------------
function x205006_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, MissionId )
end

----------------------------------------------------------------------------------------------
--进入区域事件
----------------------------------------------------------------------------------------------
function x205006_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
end

----------------------------------------------------------------------------------------------
--道具改变
----------------------------------------------------------------------------------------------
function x205006_ProcQuestItemChanged( varMap, varPlayer, itemdataId, MissionId )
end

---------------------------------------------------------------------------------------------------
--取得此任务当天当前已完成次数
---------------------------------------------------------------------------------------------------
--function x205006_GetDayCount(varMap, varPlayer)
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
function x205006_SetDayCount(varMap, varPlayer)
	local today = GetDayOfYear()
	local curTime = GetMinOfDay()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_SHOPPING_DATE[1], MD_SHOPPING_DATE[2], MD_SHOPPING_DATE[3])
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_SHOPPING_DATE[1], MD_SHOPPING_DATE[2], MD_SHOPPING_DATE[3], today)
		--SetPlayerGameData(varMap, varPlayer, MD_WUYILINGJIANG_MIN[1], MD_WUYILINGJIANG_MIN[2], MD_WUYILINGJIANG_MIN[3], curTime)
	--else
		--SetPlayerGameData(varMap, varPlayer, MD_WUYILINGJIANG_MIN[1], MD_WUYILINGJIANG_MIN[2], MD_WUYILINGJIANG_MIN[3], curTime)
	end
end

function x205006_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x205006_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
