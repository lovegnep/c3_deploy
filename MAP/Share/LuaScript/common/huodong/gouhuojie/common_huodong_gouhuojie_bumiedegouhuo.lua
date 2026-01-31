

x310851_var_FileId 		= 310851
x310851_var_QuestKind 	= 	1                       
x310851_var_QuestName	= "【活动】不灭的篝火"


x310851_var_IsEnableId    = 1071
x310851_var_LimitLevel	= 10			

x310851_var_MaxCount		= 50

x310851_var_FireBuff    = 7551
x310851_var_HuoduiGUID  ={400750, 400754, 400757, 400760}

x310851_var_MopBuff 		= 32613
x310851_var_MopNpcTable ={400754,400755,400756,400757,400758,400759,400760,400761,400762}
x310851_var_BroadCastEffectTime        = {}

x310851_var_SubmitItem	= 13810521 --大捆木柴		
x310851_var_BonusItem 	= 13810522 --火焰印记

x310851_var_BuffTable ={8319,8320,8321}
x310851_var_MopTable ={
												"今年的篝火节真热闹啊！",
												"再添些木柴进去！",
												"篝火烧的这么旺，今年我们一定能有个好收成！",
												}


function x310851_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
  local perYear, perMonth, perDay = GetYearMonthDay();
  if ( perYear == 2012 and perMonth == 4 and perDay >= 17 and perDay <= 30  ) then
		local CurTime =GetCurrentTime()
		if (x310851_var_BroadCastEffectTime[varMap] == nil) or (CurTime - x310851_var_BroadCastEffectTime[varMap]) > 3 then
			x310851_var_BroadCastEffectTime[varMap] = CurTime
				for i, item in x310851_var_MopNpcTable do
					local MopObj = FindMonsterByGUID(varMap, item)
					x310851_BroadcastEffect(varMap, MopObj)
				end
		end
		if GetGameOpenById( x310851_var_IsEnableId) <= 0 then
	        return
	    end
	    
		TalkAppendButton(varMap,x310851_var_FileId, x310851_var_QuestName, 8, -1)
		TalkAppendButton( varMap, x310851_var_FileId, "节日积分商店", 10, 6)
		TalkAppendButton( varMap, x310851_var_FileId, "篝火节木柴商店", 10, 7)
		TalkAppendButton( varMap, x310851_var_FileId, "篝火节活动说明", 1, 999)
	end
end




function x310851_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	local varDaycount = x310851_GetDayCount(varMap, varPlayer, varItemCount)
	local times = x310851_var_MaxCount - varDaycount
	local varStr = format("\n#G小提示：你今天还可以上交#R%d#G个大捆木柴。",times)
	if GetGameOpenById( x310851_var_IsEnableId) <= 0 then
        return
    end
    
    if idExt < 0 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x310851_var_QuestName)
    	TalkAppendString(varMap,"\t王城中的人们都沉浸在篝火节的欢乐之中，而我们所剩的木柴已经不多了，我们需要更多的人手去收集木柴。#B@myname#W你如果愿意帮忙收集一些木柴，我会给你一些丰厚奖励？")
    	TalkAppendString(varMap,varStr)
    	TalkAppendButton(varMap, x310851_var_FileId, "上交1个大捆木柴", 3, 1)
    	TalkAppendButton(varMap, x310851_var_FileId, "上交5个大捆木柴", 3, 5)
    	TalkAppendButton(varMap, x310851_var_FileId, "上交10个大捆木柴", 3, 10)
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    elseif 	idExt == 6 then 
   	 DispatchShopItem( varMap, varPlayer, varTalknpc, 1104)
    elseif 	idExt == 7 then 
   	 DispatchShopItem( varMap, varPlayer, varTalknpc, 341)   
   	elseif  idExt == 999 then 
   		StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x310851_var_QuestName)
    	TalkAppendString(varMap,"\t春回大地，万物复苏。成吉思汗的世界中人们纷纷点燃篝火，用圣洁的火焰来驱赶寒冬的积郁，用热情的火焰来迎接夏日的到来。\n#B活动日期：#W4月17日到4月30日期间。\n#B开放等级：#W所有10级以上玩家就可以参与。\n#B活动内容：#W\n1、篝火节的仪式：\n\t玩家每天可以接取一次的日常任务，完成后可以获得丰厚的经验和道具奖励。\n2、篝火节的斗志：\n\t所有等级不低于40级的玩家每天都可以在#S篝火节祀官(222，190)#W处接取任务，按照任务要求到敌对国家尝试破坏敌国火堆后将能获得丰厚的奖励。\n3、不灭的篝火：\n\t为了篝火节能够正常进行，篝火节祀官需要大量的木柴，每个玩家每天有提交50捆木柴的机会，每提交一次木柴将能获得大量的奖励。\n\t活动期间每日的13：00~13：30和19：00~19：30将在王城、边塞和中兴府地区将限量刷出大量的木柴，先到先得。\n\t拥有木柴的玩家还请谨慎行事，被击杀后身上所携带的木柴将有几率掉落。\n4、篝火节的礼物：\n\t所有参加篝火节活动并做成贡献的玩家都能获得#G火焰印记#W，使用印记能够在祀官处兑换绝版烈焱战骑、烈焱时装及拥有强大能力的烈焱手镯碎片。")
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
    else
    	SetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER, idExt)
    	
		StartTalkTask(varMap)          
		TalkAppendString(varMap, "#Y"..x310851_var_QuestName.."#W")
		local varStr =format("\t每上交1个大捆木柴都可以获得大笔的经验和一个火焰印记。\n\t你确定要上交%d个大捆木柴？",idExt)
		TalkAppendString(varMap, varStr)
		AddQuestItemBonus(varMap, x310851_var_BonusItem, idExt)
		TalkAppendString(varMap, "#r #r#Y经验奖励：\n\t#W海量经验")
		StopTalkTask()
		DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x310851_var_FileId, -1)
    end
end

function x310851_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x310851_ProcAccept( varMap, varPlayer )

	local varItemCount = GetPlayerRuntimeData(varMap, varPlayer, RD_QUEST_WULONG_CUR_ANSWER)
	local varDaycount = x310851_GetDayCount(varMap, varPlayer, varItemCount)
	local score = 0
	
	if varDaycount >= x310851_var_MaxCount then
		Msg2Player(varMap, varPlayer, "你今天已经上交50个大捆木柴，请明天再来", 8, 3)
		Msg2Player(varMap, varPlayer, "你今天已经上交50个大捆木柴，请明天再来。", 8, 2)
		return
	end
	
	if varItemCount > x310851_var_MaxCount-varDaycount then
		Msg2Player(varMap, varPlayer, format("剩余次数不足，今天你还能上交#R%d#cffcf00个大捆木柴",x310851_var_MaxCount-varDaycount), 8, 3)
		Msg2Player(varMap, varPlayer, format("剩余次数不足，今天你还能上交#R%d#cffcf00个大捆木柴",x310851_var_MaxCount-varDaycount), 8, 2)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 1 then
		Msg2Player(varMap, varPlayer, "很抱歉，上交大捆木柴需要至少2个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，上交大捆木柴需要至少2个背包空位", 0, 3)
		return
	end
	
	if GetItemCountInBag(varMap, varPlayer, x310851_var_SubmitItem) < varItemCount then
		 Msg2Player( varMap, varPlayer, "您没有足够的大捆木柴,上交失败", 8, 3)
	   Msg2Player( varMap, varPlayer, "您没有足够的大捆木柴,上交失败。", 8, 2)
	   return
	end
	
	local varLevel = GetLevel(varMap, varPlayer)
	
	StartItemTask( varMap )
	for varI = 1, varItemCount do
	
		ItemAppendBind( varMap, x310851_var_BonusItem, 1)
	end
	
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		if DelItem( varMap, varPlayer, x310851_var_SubmitItem, varItemCount) ~= 1 then return 0 end
		DeliverItemListSendToPlayer(varMap,varPlayer)
		x310851_SetDayCount(varMap, varPlayer, varItemCount)
		
		
		
	else
		local varStr = "#Y背包空间不足，请整理背包后再试！"
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		Msg2Player(varMap, varPlayer, varStr, 8, 2)
		return
	end
	
	local FireObj = FindMonsterByGUID(varMap, x310851_var_HuoduiGUID[GetCurCountry(varMap, varPlayer) + 1])
	if IsHaveSpecificImpact(varMap, FireObj, x310851_var_FireBuff) == 0 then
		SendSpecificImpactToUnit(varMap, FireObj, FireObj, FireObj, x310851_var_FireBuff, 0)
	end
	local allexp = 0
	for varI = 1, varItemCount do
			local varExp = random(7, 11)
			if varLevel <=70 then
				varExp = varExp*360*varLevel
			elseif varLevel <=80 then
				varExp = varExp*648*varLevel
			elseif varLevel <=90 then
				varExp = varExp*1296*varLevel
			else
				varExp = varExp*1680*varLevel
			end
			allexp = allexp+varExp
			score = score + 2
			local myGuid = GetPlayerGUID( varMap,varPlayer )
			GamePlayScriptLog( varMap, varPlayer, 3141)
	end
--			local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
--			SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + score)
--			SetFeastScore( varMap, varPlayer, allscore + score)
--      Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", score, score + allscore ), 8, 3)
			AddExp( varMap, varPlayer, allexp)
			Msg2Player( varMap, varPlayer, format( "获得%d个#cffcf00@item_%d", varItemCount, x310851_var_BonusItem).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "获得%d个#cffcf00@item_%d", varItemCount, x310851_var_BonusItem), 8, 3)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp).."。", 8, 2)
			Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", allexp), 8, 3)
end




function x310851_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310851_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310851_CheckSubmit( varMap, varPlayer )

end




function x310851_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310851_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310851_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310851_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end




function x310851_GetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
	return varDaycount
end




function x310851_SetDayCount(varMap, varPlayer, varItemCount)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DATE[1], MD_HUODONG_XINNIAN_ITEM_DATE[2], MD_HUODONG_XINNIAN_ITEM_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], varItemCount)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[1], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[2], MD_HUODONG_XINNIAN_ITEM_DAYCOUNT[3], varDaycount+varItemCount)
	end
end

function x310851_BroadcastEffect(varMap, varPlayer)
	local flag1 =random(1,100)
	local flag2 =random(1,100)
	if flag1 <= 5 then
		NpcTalk(varMap, varPlayer, x310851_var_MopTable[random(getn(x310851_var_MopTable))], -1)
	end
	if flag2 <= 5 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310851_var_BuffTable[random(getn(x310851_var_BuffTable))], 0)
	end
end
