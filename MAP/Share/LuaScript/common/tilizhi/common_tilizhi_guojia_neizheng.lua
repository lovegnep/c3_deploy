--DECLARE_QUEST_INFO_START--
x330000_var_FileId          			= 330000
x330000_var_QuestName       			= "【体力】完成国家内政"
x330000_var_QuestInfo					= "\n\t如果你觉得繁忙的#R内政任务#W已经让你无暇顾及的话，可以用消耗体力值来直接完成。你只需要一次性收集到我要的东西，就可以完成今天的内政任务了。"
x330000_var_QuestSuggest				= "\t当你今天已经领取了国家内政任务，就不可以用体力值兑换完成了。当然，如果你今天使用了体力值兑换完成国家内政任务，也不可以再领取内政任务了。"
x330000_var_QuestCommentCountOver  		= "你今天不能再领取国家内政了，明天再来吧。"
x330000_var_QuestId						= {10300,10301, 10302, 10303}
x330000_var_NeedMaterialLevel1			= {{name= "红花", itemid = 11020002}, {name= "甘草", itemid = 11020001}, {name= "初级矿石", itemid = 11030001}, {name= "马蜂", itemid = 11030401}}
x330000_var_NeedMaterialLevel3			= {{name= "三级装饰部件", itemid = 11041002}, {name= "三级藤甲部件", itemid = 11041012}, {name= "三级皮革部件", itemid = 11041022}, {name= "三级锻金部件", itemid = 11041032}, {name= "三级铁甲部件", itemid = 11041042}, {name= "三级工艺部件", itemid = 11041052}}
x330000_var_SavePlayerMaterial1			= {}
x330000_var_SavePlayerMaterial2			= {}
x330000_var_ExpParam					= 73000
x330000_var_Prestige					= 250
x330000_var_MoneyParam					= 500 
x330000_var_Level								= 25
x330000_var_LevelLess 					= 65
x330000_var_PlayerPhyForce				= 150
x330000_var_QuestName1          = "#cb4b4b4【体力】完成国家内政"
--DECLARE_QUEST_INFO_STOP--


function x330000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330000_var_Level then
		return
	end
	local varquest = x330000_GetQuestID(varMap,varPlayer)
		if (x330000_GetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY) ~= GetDayOfYear() or x330000_GetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH) == 0) and (IsHaveQuest( varMap, varPlayer, varquest) <= 0) then
	 			TalkAppendButton(varMap, x330000_var_FileId, x330000_var_QuestName, 3, 1)
	 	else
	 	  	TalkAppendButton(varMap, x330000_var_FileId, x330000_var_QuestName1, 3, 1)
	 	end	

end


function x330000_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	local num1, num2 = x330000_GetNeedMaterial(varMap, varPlayer)
	local varExp = GetLevel(varMap, varPlayer) * x330000_var_ExpParam
	local varMoney = GetLevel(varMap, varPlayer) * x330000_var_MoneyParam	
	local varname1 = x330000_var_NeedMaterialLevel1[num1].name
	local varname2 = x330000_var_NeedMaterialLevel3[num2].name
	local varQuestInfo = ""
	local tf = RefixInherenceExp( varMap, varPlayer,1375)	
	if 	GetLevel(varMap, varPlayer) >=80 then
			
			 varQuestInfo = format("你将获得#R经验值#W#G%s点#W、#R银卡#W#G#{_MONEY%d}#W、#R声望#W#G%s点#W、#R天赋#W#G%s点#W奖励。", varExp, varMoney, x330000_var_Prestige,tf)
	else
			 varQuestInfo = format("你将获得#R经验值#W#G%s点#W、#R银卡#W#G#{_MONEY%d}#W、#R声望#W#G%s点#W奖励。", varExp, varMoney, x330000_var_Prestige)
	
	end	
	
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330000_var_QuestName)
		TalkAppendString(varMap,format("%s\n \n\t今天你需要向我提交#R50#W个#G%s#W和#R5#W个#G%s#W，以及#R150#W点体力值，就可直接完成任务。\n\t%s ", x330000_var_QuestInfo, varname1, varname2, varQuestInfo))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#Y小提示：")
		TalkAppendString( varMap,format("%s", x330000_var_QuestSuggest))
		TalkAppendString( varMap," ")

		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		if GetLevel(varMap, varPlayer) >=80 then
		TalkAppendString( varMap,format("经验值：%s点\n银卡：#{_MONEY%d}\n声望：%s点\n天赋：%s点", varExp, varMoney, x330000_var_Prestige, tf))		
		else
		TalkAppendString( varMap,format("经验值：%s点\n银卡：#{_MONEY%d}\n声望：%s点", varExp, varMoney, x330000_var_Prestige))	
		end
		TalkAppendString( varMap," ")		
		
		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330000_var_FileId, -1)
end


function x330000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if GetLevel(varMap, varPlayer) < x330000_var_LevelLess then
		local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330000_var_LevelLess)
		Msg2Player( varMap, varPlayer, str, 8, 3)
		return
	end
	
	local num1, num2 = x330000_GetNeedMaterial(varMap, varPlayer)
	local varitemid1 = x330000_var_NeedMaterialLevel1[num1].itemid
	local varitemid2 = x330000_var_NeedMaterialLevel3[num2].itemid	
	local varcount1 = GetItemCount(varMap, varPlayer, varitemid1)
	local varcount2 = GetItemCount(varMap, varPlayer, varitemid2)
	local varname1 = x330000_var_NeedMaterialLevel1[num1].name
	local varname2 = x330000_var_NeedMaterialLevel3[num2].name	

--	if IsQuestHaveDone(varMap, varPlayer, 1400) <= 0 then
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】国家内政的职责", 8, 2)
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】国家内政的职责", 8, 3)		
--		return 
--	end
		
	for num = 1, 4 do
		if IsHaveQuest( varMap, varPlayer, x330000_var_QuestId[num]) > 0 then
			Msg2Player( varMap, varPlayer, x330000_var_QuestCommentCountOver, 8, 2)
			Msg2Player( varMap, varPlayer, x330000_var_QuestCommentCountOver, 8, 3)
			return
		end
	end
			

	if (x330000_GetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY) == GetDayOfYear()) and (x330000_GetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH) ~= 0) then
		Msg2Player( varMap, varPlayer, x330000_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330000_var_QuestCommentCountOver, 8, 3)
		return
	end	
	
	if varcount1 < 50 then


		Msg2Player( varMap, varPlayer, format("一级材料#G%s#cffcf00数量不够", varname1), 8, 2)
		Msg2Player( varMap, varPlayer, format("一级材料#G%s#cffcf00数量不够", varname1), 8, 3)
		return	
	end

	if varcount2 < 5 then
		Msg2Player( varMap, varPlayer, format("三级材料#G%s#cffcf00数量不够", varname2), 8, 2)
		Msg2Player( varMap, varPlayer, format("三级材料#G%s#cffcf00数量不够", varname2), 8, 3)
		return	
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330000_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	DelItem(varMap, varPlayer, varitemid1, 50)
	DelItem(varMap, varPlayer, varitemid2, 5)	
	x330000_GetPlayerAward(varMap, varPlayer)	
	x330000_SetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY, GetDayOfYear())
	x330000_SetMD( varMap, varPlayer, MD_GUOJIARENWU_HIGH, 10)
	x330000_var_SavePlayerMaterial1[GetGUID(varMap, varPlayer)] = nil
	x330000_var_SavePlayerMaterial2[GetGUID(varMap, varPlayer)] = nil
end


function x330000_GetPlayerAward(varMap, varPlayer)
	local varExp = GetLevel(varMap, varPlayer) * x330000_var_ExpParam
	local varMoney = GetLevel(varMap, varPlayer) * x330000_var_MoneyParam	
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330000_var_PlayerPhyForce)

    --活跃度
    for i=1,10,1 do
    GamePlayScriptLog( varMap, varPlayer, 11280)
	LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,1)
	end
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,1)
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,13)
------记录一周完成的内政任务次数，用于国民津贴的计算-------------------------------------------------------------------	
	local week = x330000_GetCurrentWeek()
  if x330000_GetMD( varMap, varPlayer, MD_NEIZHENG_WEEK) ~= week then
      x330000_SetMD( varMap, varPlayer, MD_NEIZHENG_WEEK, week)
      x330000_SetMD( varMap, varPlayer, MD_NEIZHENG_WEEKCOUNT, 1)
  else
      x330000_SetMD( varMap, varPlayer, MD_NEIZHENG_WEEKCOUNT, x330000_GetMD( varMap, varPlayer, MD_NEIZHENG_WEEKCOUNT) + 1)
  end
------------------------------------------------------------------------------------------------------------------------
	--成3上线兑换绝版骑乘活动
--		local year, month, day = GetYearMonthDay()
--		local lastDay = GetDayOfYear()
--		local FeastId1 = GetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] )
--	    local varTimes = GetPlayerGameData( varMap, varPlayer, MD_LESSHORSE_COUNT[ 1], MD_LESSHORSE_COUNT[ 2], MD_LESSHORSE_COUNT[ 3] )
--		if FeastId1 ~= 12 then
--			LuaCallNoclosure(888894,"Feast_SetCurrentId",varMap,varPlayer,12)
--			SetPlayerGameData( varMap, varPlayer, MD_FEAST_INDEX[ 1], MD_FEAST_INDEX[ 2], MD_FEAST_INDEX[ 3] ,12)	
--		end
--		if 	year == 2012 and lastDay < 90 then
--			if varTimes < 7 then
--				GamePlayScriptLog(varMap, varPlayer, 5004)
--				SetPlayerGameData( varMap, varPlayer, MD_LESSHORSE_COUNT[ 1], MD_LESSHORSE_COUNT[ 2], MD_LESSHORSE_COUNT[ 3], varTimes+1 )
--			end
--		end
------------------------------------------------------------------------------------------------  
 	AddExp(varMap, varPlayer, varExp)
 	AddMoney( varMap, varPlayer, 1, varMoney)
 	SetShengWang(varMap, varPlayer, GetShengWang( varMap, varPlayer) + x330000_var_Prestige)
 	GamePlayScriptLog( varMap, varPlayer, 3091)
 	local varMessage = format("获得经验：#R%s#cffcf00点\n获得银卡：#R#{_MONEY%d}#cffcf00\n获得声望：#R%s#cffcf00点", varExp, varMoney, x330000_var_Prestige)

 	
	Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330000_var_QuestName), 8, 2) 
	Msg2Player( varMap, varPlayer, varMessage, 8, 2)
 	if GetLevel(varMap, varPlayer) >=80 then
 	 local tf = 1375
   local refixtf = RefixInherenceExp( varMap, varPlayer,1375)	
   Msg2Player( varMap, varPlayer, format( "获得#R%s#cffcc00点天赋奖励。", refixtf), 8, 2)
 		
 	end	
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330000_var_QuestName));
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..varExp.."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    local varMoney1 =format("#{_MONEY%d}",varMoney)
    TalkAppendString(varMap,"获得#R银卡"..varMoney1.."#cffcf00的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer) 
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R声望"..x330000_var_Prestige.."点#cffcf00的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer) 
 	if GetLevel(varMap, varPlayer) >=80 then
 	 local tf = 1375
   local refixtf = AddInherenceExp( varMap, varPlayer, tf)
     StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R天赋"..refixtf.."点#cffcf00的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)   
  end         	
  	local multi = x330000_IsMulti( varMap, varPlayer)
	if multi > 0 then
		AddExp( varMap, varPlayer, floor(varExp*multi))
		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(varExp*multi)), 8, 2)
		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(varExp*multi)), 8, 3)
	end  
  
  	local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
		if maxlevel >= 70 then
			local nCountryIdx = GetCurCountry(varMap, varPlayer);
			
			local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			
			local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
			local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
			local ruoguoopen = IsOpenWeakCountryCheck()
			if selfscore <= allscore * 0.15 and selfscore > 0 and allscore > 0 and ruoguoopen == 1 then
				        
				        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 4000)
				        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
					    Msg2Player( varMap, varPlayer, "弱国额外增加#R2#cffcc00两国家金钱。", 8, 2)			
				        StartItemTask( varMap)
				        ItemAppendBind( varMap, 11990050, 5)
				        if StopItemTask( varMap, varPlayer) > 0 then
				            DeliverItemListSendToPlayer( varMap, varPlayer)
				            Msg2Player( varMap, varPlayer, "弱国额外获得#R4#cffcc00个还魂丹", 8, 3)
				        else
				            Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
				        end
				        GamePlayScriptLog( varMap, varPlayer, 462)
			elseif selfscore <= allscore * 0.18 and selfscore > 0 and allscore > 0 and ruoguoopen == 1 then
				        
				        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 4000)
				        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
					    Msg2Player( varMap, varPlayer, "弱国额外增加#R2#cffcc00两国家金钱。", 8, 2)			
				        StartItemTask( varMap)
				        ItemAppendBind( varMap, 11990050, 3)
				        if StopItemTask( varMap, varPlayer) > 0 then
				            DeliverItemListSendToPlayer( varMap, varPlayer)
				            Msg2Player( varMap, varPlayer, "弱国额外获得#R2#cffcc00个还魂丹", 8, 3)
				        else
				            Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
				        end
				        GamePlayScriptLog( varMap, varPlayer, 462)
			elseif selfscore <= allscore * 0.2 and selfscore > 0 and allscore > 0 and ruoguoopen == 1 then
		        
		        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 4000)
		        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
		        Msg2Player( varMap, varPlayer, "弱国额外增加#R2#cffcc00两国家金钱。", 8, 2)
		        StartItemTask( varMap)
		        ItemAppendBind( varMap, 11990050, 2)
		        if StopItemTask( varMap, varPlayer) > 0 then
		            DeliverItemListSendToPlayer( varMap, varPlayer)
		            Msg2Player( varMap, varPlayer, "弱国额外获得#R1#cffcc00个还魂丹", 8, 3)
		        else
		            Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
		        end
		        GamePlayScriptLog( varMap, varPlayer, 462)
			else
		        
		        AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 2000)
		        Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2)
				StartItemTask( varMap)
		        ItemAppendBind( varMap, 11990050, 1)
		        if StopItemTask( varMap, varPlayer) > 0 then
		            DeliverItemListSendToPlayer( varMap, varPlayer)
		        else
		            Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
		        end
		        GamePlayScriptLog( varMap, varPlayer, 462)
						LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,13)

			end
		else
			
			AddCountryResourceEx( varMap, GetCurCountry( varMap, varPlayer), 2, 2000)
			Msg2Player( varMap, varPlayer, "完成今天全部内政任务，增加#R2#cffcc00两国家金钱。", 8, 2) 
			StartItemTask( varMap)
			ItemAppendBind( varMap, 11990050, 1)
			if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
			else
				Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
			end
  
  	end
  
  
  
  
  
  
  
  
  
  
  
end

function x330000_GetQuestID(varMap,varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
		if varCountry == 0 then
			return x330000_var_QuestId[1]
		elseif varCountry == 1 then                                                  
			return x330000_var_QuestId[2]
		elseif varCountry == 2 then	                                                
			return x330000_var_QuestId[3]
		elseif varCountry == 3 then                                                  
			return x330000_var_QuestId[4]
		end	

end

function x330000_GetNeedMaterial(varMap, varPlayer)
	if x330000_GetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY) ~= GetDayOfYear() then	
		if x330000_var_SavePlayerMaterial1[GetGUID(varMap, varPlayer)] == nil or x330000_var_SavePlayerMaterial2[GetGUID(varMap, varPlayer)] == nil then
			x330000_var_SavePlayerMaterial1[GetGUID(varMap, varPlayer)] = random(1, 4)
			x330000_var_SavePlayerMaterial2[GetGUID(varMap, varPlayer)] = random(1, 6)
		end
	else	
		if x330000_var_SavePlayerMaterial1[GetGUID(varMap, varPlayer)] == nil or x330000_var_SavePlayerMaterial2[GetGUID(varMap, varPlayer)] == nil then
			x330000_var_SavePlayerMaterial1[GetGUID(varMap, varPlayer)] = random(1, 4)
			x330000_var_SavePlayerMaterial2[GetGUID(varMap, varPlayer)] = random(1, 6)

		end
	end
	return x330000_var_SavePlayerMaterial1[GetGUID(varMap, varPlayer)], x330000_var_SavePlayerMaterial2[GetGUID(varMap, varPlayer)]
end


function x330000_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330000_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330000_GetCurrentWeek()
	
	local nCurrentTime = ( GetCurrentTime() + 8 * 3600) / 86400 - 4  
	local nWeek = floor( nCurrentTime / 7)		 

	return nWeek
end

function x330000_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330000_var_Level then
		return	0
	end
	local varquest = x330000_GetQuestID(varMap,varPlayer)
		
		if (x330000_GetMD( varMap, varPlayer, MD_GUOJIARENWU_LASTDAY) ~= GetDayOfYear()) and (IsHaveQuest( varMap, varPlayer, varquest) <= 0) then
	 			TalkAppendButton(varMap, x330000_var_FileId, x330000_var_QuestName, 3, 1)
	 	else
	 	  	TalkAppendButton(varMap, x330000_var_FileId, x330000_var_QuestName1, 3, 1)
	 	end	
	 	return 1

end

function x330000_IsMulti( varMap, varPlayer)
local MaxLevel = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
local MinLevel = GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
local Level = GetLevel( varMap, varPlayer)
local Dislevel = MinLevel - Level - 10
	if MaxLevel >= 75 then
		if Dislevel > 0 then
			if Level < 50 then
				local multi50 = Dislevel/10
				return multi50
			elseif Level >= 50 and Level < 60 then
				local multi60 = Dislevel*2/10
				return multi60
			elseif Level >= 60 and Level < 75 then
				local multi70 = Dislevel*4/10
				return multi70
			elseif Level >= 75 and Level < 90 then
				local multi80 = Dislevel*8/10
				return multi80
			else 
				return 0
			end
		end
		return 0
	end
	return 0
end
