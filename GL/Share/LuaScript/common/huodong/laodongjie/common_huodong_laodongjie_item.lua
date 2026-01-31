--劳动节纪念币捐献

x310823_var_ScriptId 		= 310823
x310823_var_MissionKind 	= 	1                       --任务类型
x310823_var_MissionName	= "【个人】捐献劳动节纪念币"

-- 玩法开关id
x310823_var_IsEnableId    = 1089
x310823_var_LimitLevel	= 40			--最低级别

x310823_var_MaxCount		= 50

x310823_var_SubmitItem	= 11990021		--劳动节纪念币
x310823_var_GrowpointId = 145 
x310823_var_BonusItem 	= {{itemid = 12035016,rnd = 5}}
x310823_var_varMap = {
{varid = 36, varX =98, varY =180, varname = "大都南"},
{varid = 37, varX =94, varY =48, varname = "大都东"},
{varid = 38, varX =111, varY =77, varname = "大都西"},
{varid = 15, varX =168, varY =82, varname = "威海港"},
}

----------------------------------------------------------------------------------------------
--枚举
----------------------------------------------------------------------------------------------
function x310823_ProcEnumEvent( varMap, varPlayer, varTalknpc, MissionId ) 
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2011 or varday < 136 or varday > 142 then
				return
	end
	local level = GetLevel(varMap, varPlayer)
	if GetGameOpenById( x310823_var_IsEnableId) <= 0 then
        return
  end
  
  if level < x310823_var_LimitLevel then
  		return
  end
		TalkAppendButton(varMap,x310823_var_ScriptId, x310823_var_MissionName, 3, -1)
		TalkAppendButton( varMap, x310823_var_ScriptId, "节日积分商店", 10, 6)
		TalkAppendButton(varMap,x310823_var_ScriptId, "个人节日积分查询", 3, 2)
		TalkAppendButton(varMap, x310823_var_ScriptId, "全服活动积分查询", 3, 4)
		TalkAppendButton(varMap, x310823_var_ScriptId, "五一劳动节活动说明", 13, 7)
end

----------------------------------------------------------------------------------------------
--脚本默认事件
----------------------------------------------------------------------------------------------
function x310823_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	local daycount = x310823_GetDayCount(varMap, varPlayer, itemcount)
	local times = x310823_var_MaxCount - daycount
	local str = format("\n#G小提示：你今天还可以捐献#R%d#G个劳动节纪念币。",times)
	if GetGameOpenById( x310823_var_IsEnableId) <= 0 then
     return
  end
    
    if idExt < 0 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x310823_var_MissionName)
    	TalkAppendString(varMap,"\t喜兽年年来,祝福天天伴.在这劳动节的欢乐日子里,#B@myname#W你的全服活动愿望是什么呢?")
    	TalkAppendString(varMap,str)
    	TalkAppendButton(varMap, x310823_var_ScriptId, "捐献1个劳动节纪念币", 3, 1)
    	TalkAppendButton(varMap, x310823_var_ScriptId, "捐献5个劳动节纪念币", 3, 5)
    	TalkAppendButton(varMap, x310823_var_ScriptId, "捐献10个劳动节纪念币", 3, 10)
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    elseif 	idExt == 2 then 
    	StartTalkTask( varMap)
           TalkAppendString( varMap, "#Y【个人】节日积分查询" )
           TalkAppendString( varMap, format( "\n\t您目前的节日积分为#G%d#W。", GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) ) )
      StopTalkTask()
      DeliverTalkMenu( varMap, varPlayer, varTalknpc)	
     elseif idExt == 4 then
    	local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)        
    	if score < 0 then
    		score = 0
    		SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, score)
    	end
    	
    	StartTalkTask(varMap)
    	TalkAppendString(varMap, "#Y".."全服活动积分查询".."#W")
			TalkAppendString(varMap, "\t当前活动积分是:#G"..score.."\n \n\t#W当积分到达500及500的整数倍时，大都会刷出大量宝箱。\n\t当积分到达10000及10000的整数倍时，将在大都附近刷出掉落极品坐骑的九旄战神。\n \n#G注：每次只会触发一个事件。") 
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    elseif 	idExt == 6 then 
    	DispatchShopItem( varMap, varPlayer, varTalknpc, 1104)
    elseif 	idExt == 7 then 
    	StartTalkTask(varMap)
    	TalkAppendString(varMap, "#Y".."五一劳动节活动说明".."#W\n")
			TalkAppendString(varMap, "1、活动开放时间：\n\t4月26日-5月10号期间，全天任意时间均可以参与劳动节活动。\n\t#G5月17日-5月23日#W期间，全天任意时间仍可以参加此活动。\n2、活动开放等级：\n\t所有不低于40级的玩家均可以参与此活动。\n3、活动内容：\n\t活动开放时间，玩家每天可以提交50次劳动节纪念币，每次提交都有几率获得极稀有道具#G黄金藏宝图#W，并增加个人积分和全服积分。\n\t当你使用不绑定的藏宝图且有#G江湖请柬#W状态时，能够获得不绑定的奖励道具，否则为绑定。\n\t当全服积分达到500及500的整数倍时，在大都场景内刷出大量宝箱，玩家采集将有几率获得天赋、荣誉、帮贡、经验或银卡的奖励。\n\t当全服积分到达10000及10000的整数倍时，将随机在大都东、大都南、大都西和威海港中一个场景刷出一只掉落极品坐骑的九旄战神。") 
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    else
    	SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
    	
		StartTalkTask(varMap)          
		TalkAppendString(varMap, "#Y"..x310823_var_MissionName.."#W")
		local str =format("\t每捐献1个劳动节纪念币都可以获得大笔的经验和个人节日积分，并且有几率获得#G黄金藏宝图#W.\n\t你确定要捐献%d个劳动节纪念币?",idExt)
		TalkAppendString(varMap, str)
		StopTalkTask()
		DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x310823_var_ScriptId, -1)
    end
end

function x310823_ProcAcceptCheck( varMap, varPlayer, NPCId )
    return 1
end

----------------------------------------------------------------------------------------------
--接受
----------------------------------------------------------------------------------------------
function x310823_ProcAccept( varMap, varPlayer )
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2011 or varday < 136 or varday > 142 then
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 3)
		Msg2Player(varMap, varPlayer, "不在活动时间内！", 8, 2)
		return
	end
	local level = GetLevel(varMap, varPlayer)
	if level < x310823_var_LimitLevel then
  		return
  end

	local itemcount = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local daycount = x310823_GetDayCount(varMap, varPlayer, itemcount)
	local score = 0
	
	if daycount >= x310823_var_MaxCount then
		Msg2Player(varMap, varPlayer, "你今天已经捐献50个劳动节纪念币，请明天再来", 8, 3)
		Msg2Player(varMap, varPlayer, "你今天已经捐献50个劳动节纪念币，请明天再来。", 8, 2)
		return
	end
	
	if itemcount > x310823_var_MaxCount-daycount then
		Msg2Player(varMap, varPlayer, "你今天剩余可捐献次数不足，捐献失败", 8, 3)
		Msg2Player(varMap, varPlayer, "你今天剩余可捐献次数不足，捐献失败", 8, 2)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 1 then
		Msg2Player(varMap, varPlayer, "很抱歉，捐献劳动节纪念币需要至少2个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，捐献劳动节纪念币需要至少2个背包空位", 0, 3)
		return
	end
	
	if GetItemCountInBag(varMap, varPlayer, x310823_var_SubmitItem) < itemcount then
		 Msg2Player( varMap, varPlayer, "您没有足够的劳动节纪念币,捐献失败", 8, 3)
	    Msg2Player( varMap, varPlayer, "您没有足够的劳动节纪念币,捐献失败。", 8, 2)
	    return
	end
	
	local level = GetLevel(varMap, varPlayer)
	
	StartItemTask( varMap )
	local c = 0
	for i = 1, itemcount do
	
		local rnd = random(1, 100)
		
		for j, item in x310823_var_BonusItem do
			if rnd <= item.rnd then
					local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x310823_var_SubmitItem)
					if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then
						ItemAppendBind( varMap, item.itemid, 1)
					else
						ItemAppend( varMap, item.itemid, 1)
					end
				c = c + 1
				break
			end
		end
		GamePlayScriptLog(varMap, varPlayer, 2530) 
	end
	
	local ret = StopItemTask( varMap, varPlayer )
	
	if ret > 0 then
	
		if DelItem( varMap, varPlayer, x310823_var_SubmitItem, itemcount) ~= 1 then 
			return 0
  	end
		
		if c >0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		end
		x310823_SetDayCount(varMap, varPlayer, itemcount)
		
		
		
	else
		local str = "#Y背包空间不足，请整理背包后再试！"
		Msg2Player(varMap, varPlayer, str, 8, 3)
		Msg2Player(varMap, varPlayer, str, 8, 2)
		return
	end
	
	local allexp = 0
	for i = 1, itemcount do
			local exp = random(7, 11)
			if level <=70 then
				exp = exp*360*level
			elseif level <=80 then
				exp = exp*648*level
			elseif level <=90 then
				exp = exp*1296*level
			else
				exp = exp*1680*level
			end
			allexp = allexp+exp
			score = score + 2
			
			if GetCountryParam(varMap, 3, CD_HUODONG_XINNIAN) ~= -310823 then     --3号国家变量为标志位
				SetCountryParam(varMap, 3, CD_HUODONG_XINNIAN,-310823)
				SetCountryParam(varMap, 0, CD_HUODONG_XINNIAN,0)                   --清理0号国家变量（存全服积分使用）
				SetCountryParam(varMap, 1, CD_HUODONG_XINNIAN,500) 							--清理1号国家变量，1号变量作为活动触发时间的比对变量使用，所以设为500
				SetCountryParam(varMap, 2, CD_HUODONG_XINNIAN,0) 								--清理2号国家变量（未使用）
			end                                    
			
			SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, 1, 2)
			local index = random (1,4)
			SetCountryParam(varMap, 0, CD_INDEX_LAODONGJIE_JIFEN,index)
			local myGuid = GetPlayerGUID( varMap,varPlayer )
--			local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)
--			LuaCallNoclosure( x310823_var_ScriptId, "OnScoreChanged", varMap, varPlayer ,score)
			GetCountryQuestDataNM(varMap, myGuid, 0, CD_HUODONG_XINNIAN, x310823_var_ScriptId, -1, "OnScoreChanged", 3)
			GamePlayScriptLog( varMap, varPlayer, 2509)
	end
			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + score)
			SetFeastScore( varMap, varPlayer, allscore + score)
      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", score, score + allscore ), 8, 3)
			AddExp( varMap, varPlayer, allexp)
			Msg2Player( varMap, varPlayer, format( "全服活动积分增加%d点#cffcf00", itemcount).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "全服活动积分增加%d点#cffcf00", itemcount), 8, 3)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp), 8, 3)
end

----------------------------------------------------------------------------------------------
--放弃
----------------------------------------------------------------------------------------------
function x310823_ProcQuestAbandon( varMap, varPlayer, MissionId )

end

----------------------------------------------------------------------------------------------
--继续
----------------------------------------------------------------------------------------------
function x310823_OnContinue( varMap, varPlayer, varTalknpc )

end

----------------------------------------------------------------------------------------------
--检测是否可以捐献
----------------------------------------------------------------------------------------------
function x310823_CheckSubmit( varMap, varPlayer )

end

----------------------------------------------------------------------------------------------
--捐献
----------------------------------------------------------------------------------------------
function x310823_ProcQuestSubmit( varMap, varPlayer, varTalknpc,selectRadioId, MissionId )

end

----------------------------------------------------------------------------------------------
--杀死怪物或玩家
----------------------------------------------------------------------------------------------
function x310823_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, MissionId )
end

----------------------------------------------------------------------------------------------
--进入区域事件
----------------------------------------------------------------------------------------------
function x310823_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
end

----------------------------------------------------------------------------------------------
--道具改变
----------------------------------------------------------------------------------------------
function x310823_ProcQuestItemChanged( varMap, varPlayer, itemdataId, MissionId )
end

---------------------------------------------------------------------------------------------------
--取得此任务当天当前已完成次数
---------------------------------------------------------------------------------------------------
function x310823_GetDayCount(varMap, varPlayer)
	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if lastday ~= today then
		return 0
	end

	local daycount =  GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
	return daycount
end

---------------------------------------------------------------------------------------------------
--更新当天接任务次数
---------------------------------------------------------------------------------------------------
function x310823_SetDayCount(varMap, varPlayer, itemcount)
	local today = GetDayOfYear()
	local lastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], itemcount)
	else
		local daycount = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], daycount+itemcount)
	end
end
----------------------------------------------------------------------------------------------
function x310823_OnScoreChanged(varMap, guid, missionData)
local mapindex = GetCountryParam(varMap, 0, CD_INDEX_LAODONGJIE_JIFEN)
if mod(missionData, 10000) == 0 then
		if varMap == x310823_var_varMap[mapindex].varid then
			local msg1 = format("全服活动活动积分到%d分，九旄战神出现在%s！",missionData,x310823_var_varMap[mapindex].varname)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_MAIN_RIGHTDOWN, 1)
  		SetSystemTimerTick( varMap, 310823, "ProcTimerDoingStart", 22, 5*1000 )
  	end
  	
		
	elseif mod(missionData, 500) == 0 then
		if varMap ==0 then
			SetGrowPointIntervalContainer( varMap, x310823_var_GrowpointId, 1000)
			local msg1 = format("全服活动活动积分到%d分，大量宝箱出现在大都！",missionData)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, msg1, CHAT_MAIN_RIGHTDOWN, 1)
		end
	end
end
function x310823_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
			
			local index = x310823_GetMapIndex(varMap)
			local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)
			if index >= 1 and index <= 4 then
				CreateMonster( varMap, 27300, x310823_var_varMap[index].varX, x310823_var_varMap[index].varY, 1, 952, -1, -1, 21, 60*60*1000, 0, "")
				WriteLog(1,format("x310823_ProcTimerDoingStart,score--%d,varMap---%d",score,varMap)) 
			end
end

function x310823_GetMapIndex(varMap)
		for i, item in x310823_var_varMap do 
			if item.varid == varMap then
				return i
			end
		end
	return -1
end
