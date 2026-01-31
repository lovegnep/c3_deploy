
x310007_var_FileId = 310007

x310007_var_QuestList = { 8028,8029,8030,8031,8032,8033 }
x310007_var_QuestItem = { {quest=8028,item1=12030051, item2=12030052},
						  {quest=8029,item1=12030051, item2=12030053},
						  {quest=8030,item1=12030052, item2=12030053},
						  {quest=8031,item1=12030051, item2=12030052},
						  {quest=8032,item1=12030051, item2=12030053},
						  {quest=8033,item1=12030052, item2=12030053}
						}

x310007_var_AcceptMessage		= "您接受了任务：%s"
x310007_var_AbandonMessage	= "您放弃了任务：%s"
x310007_var_CompleteMessage	= "您完成了任务：%s"

x310007_var_QuestCommentMessage	=	"不在接任务时间，请关注活动公告"
x310007_var_QuestAcceptFailedMessage_Accepted	=	"你在本日已经做过本任务了，请明日再来"
x310007_var_QuestSubmitFailedMessage_OverTime	=	"你已经错过了交任务的时间，请放弃任务"
x310007_var_QuestAcceptTime1 = { 450, 480 }	
x310007_var_QuestAcceptTime2 = { 750, 780 }	
x310007_var_QuestAcceptTime3 = { 1170, 1200 }	
x310007_var_AwardItem = 12030028
x310007_var_VirtualQuestId = 1366

x310007_var_RandItem = {11010100, 11010101, 11010102}

function x310007_GetQuest()
	local varIndex = random(1, 6);
	return x310007_var_QuestList[varIndex]
end

function x310007_GetMDAccepted(varMap, varPlayer, varIndex)
	if varIndex == 1 then
		local value = GetPlayerGameData(varMap, varPlayer, MD_TIANJIANG_BAOXIANG_ACCEPTED1[1], MD_TIANJIANG_BAOXIANG_ACCEPTED1[2], MD_TIANJIANG_BAOXIANG_ACCEPTED1[3])
		return value
	elseif varIndex == 2 then
		local value = GetPlayerGameData(varMap, varPlayer, MD_TIANJIANG_BAOXIANG_ACCEPTED2[1], MD_TIANJIANG_BAOXIANG_ACCEPTED2[2], MD_TIANJIANG_BAOXIANG_ACCEPTED2[3])
		return value
	elseif varIndex == 3 then
		local value = GetPlayerGameData(varMap, varPlayer, MD_TIANJIANG_BAOXIANG_ACCEPTED3[1], MD_TIANJIANG_BAOXIANG_ACCEPTED3[2], MD_TIANJIANG_BAOXIANG_ACCEPTED3[3])
		return value
	end
	
end

function x310007_SetMDAccepted(varMap, varPlayer, varIndex, value)
	if varIndex == 1 then
		SetPlayerGameData(varMap, varPlayer, MD_TIANJIANG_BAOXIANG_ACCEPTED1[1], MD_TIANJIANG_BAOXIANG_ACCEPTED1[2], MD_TIANJIANG_BAOXIANG_ACCEPTED1[3], value)
	elseif varIndex == 2 then
		SetPlayerGameData(varMap, varPlayer, MD_TIANJIANG_BAOXIANG_ACCEPTED2[1], MD_TIANJIANG_BAOXIANG_ACCEPTED2[2], MD_TIANJIANG_BAOXIANG_ACCEPTED2[3], value)
	elseif varIndex == 3 then
		SetPlayerGameData(varMap, varPlayer, MD_TIANJIANG_BAOXIANG_ACCEPTED3[1], MD_TIANJIANG_BAOXIANG_ACCEPTED3[2], MD_TIANJIANG_BAOXIANG_ACCEPTED3[3], value)
	end
end

function x310007_GetMDDate(varMap, varPlayer)
	local day = GetPlayerGameData(varMap, varPlayer, MD_TIANJIANG_BAOXIANG_DATE[1], MD_TIANJIANG_BAOXIANG_DATE[2], MD_TIANJIANG_BAOXIANG_DATE[3])
	return day
end

function x310007_SetMDDate(varMap, varPlayer, day)
	SetPlayerGameData(varMap, varPlayer, MD_TIANJIANG_BAOXIANG_DATE[1], MD_TIANJIANG_BAOXIANG_DATE[2], MD_TIANJIANG_BAOXIANG_DATE[3], day)
end


function x310007_NextDayReset(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = x310007_GetMDDate(varMap, varPlayer)

	if varToday ~= varLastday then
		x310007_SetMDDate(varMap, varPlayer, 0)
		
		
		
	end
end

function x310007_IsNextDay(varMap, varPlayer)
	
	local varToday = GetDayOfYear()
	local varLastday = x310007_GetMDDate(varMap, varPlayer)

	if varToday ~= varLastday then
		return 1
	end 
		
	return -1
end


function x310007_HaveAccepted( varMap, varPlayer )
	

	
		
			
		
	
		
			
		
	
		
			
		
	

	if x310007_GetMDDate(varMap, varPlayer) > 0 then
		return 1
	end

	return -1
end

function x310007_ProcAcceptCheckTime(  )

	local minspan = GetMinOfDay()
	
	
		
	if  minspan >= x310007_var_QuestAcceptTime2[1] and minspan <= x310007_var_QuestAcceptTime2[2] then
		return 2
	elseif  minspan >= x310007_var_QuestAcceptTime3[1] and minspan <= x310007_var_QuestAcceptTime3[2] then
		return 3
	end
	
	return -1
end

function x310007_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	varQuest = x310007_GetQuest();

	for varI, item in x310007_var_QuestList do
		if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
			return 0
		end
	end

	if QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) > 0 then
		local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuest, questState);
		return 1
	end
    
	return 0
end


function x310007_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		if x310007_IsNextDay(varMap, varPlayer) > 0 then
			x310007_NextDayReset(varMap, varPlayer) 
		end
		
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
		
		
			if varRet > 0 then	
				
				StartTalkTask( varMap);
				TalkAppendString(varMap, "#Y【个人】天降宝箱#W\n\t我们虔诚的祈祷，终于能得到长生天的感应，每天当所有的萨满信徒向着长生天祈福的时候，长生天就会降下赐福宝箱。\n\t我们现在需要你帮助，去寻找沉睡在宝箱内的圣物，如果你愿意帮我的话，请你在每天我们祈祷的时间来找我吧！\n#R\n【活动时间】#G\n 12：30~13：00\n 19：30~20：00#W\n\t注意：每天只可以接受一次本任务。");
				AddQuestMoneyBonus5(varMap, 100 )
				AddQuestExpBonus(varMap, GetLevel(varMap, varPlayer)*4500)
				AddQuestItemBonus(varMap, x310007_var_AwardItem, 1)
				
				StopTalkTask(varMap);
				DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310007_var_FileId, varQuest);
			else
				local varText = "未知错误，无法接新的任务"
				if varRet == -1 then
					varText = "等级不足，无法接新的任务"
				elseif varRet == -2 then
					varText = "等级过高，无法接新的任务"
				elseif varRet == -3 then
					varText = "金钱不足，无法接新的任务"
				elseif varRet == -4 then
					varText = "您不是本国玩家，无法接新的任务"
				elseif varRet == -5 then
					varText = "职业类型不符，无法接新的任务"
				elseif varRet == -6 then
					varText = "阵营不符，无法接新的任务"
				elseif varRet == -7 then
					varText = "此人无此任务"
				end
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 
			QuestComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		else
			QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		end
	end
end

function x310007_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if x310007_ProcAcceptCheckTime() < 0 then
		local varQuestName = GetQuestNameNM(varMap, varPlayer, varQuest);
			StartTalkTask(varMap);
			TalkAppendString(varMap, x310007_var_QuestCommentMessage);
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,x310007_var_QuestCommentMessage,8,2)
		return 
	end

	if x310007_HaveAccepted( varMap, varPlayer ) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, x310007_var_QuestAcceptFailedMessage_Accepted);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,x310007_var_QuestAcceptFailedMessage_Accepted,8,2)
		return
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0
		end
	end

	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) 
	if varRet > 0 then 
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
		if varRet > 0 then
			QuestCom( varMap, varPlayer, x310007_var_VirtualQuestId)
			DeliverTalkAddQuestInfoNM( varMap, varPlayer, varTalknpc, varQuest, 1)

			GamePlayScriptLog(varMap, varPlayer, 511)

			local day = GetDayOfYear()

			x310007_SetMDDate(varMap, varPlayer, day)
			
			
				
				
			
				
				
			
				
				
			
				
				
				
				
				
				
			

			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			
			local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
			local message = format(x310007_var_AcceptMessage, varQuestName);
			StartTalkTask(varMap)
			TalkAppendString(varMap, message);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer, message, 4, 2)
			
			for varI, item in x310007_var_QuestItem do
				if item.quest == varQuest then
					local Num = GetItemCount( varMap, varPlayer, item.item1 )
					if Num > 0 then
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
					end

					local Num2 = GetItemCount( varMap, varPlayer, item.item2 )
					if Num2 > 0 then
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 1 )
					end

					if Num > 0 and Num2 > 0 then
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
					end
				end
			end
			
		elseif varRet == 0 then
			local varText = "任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -1 then
			local varText = "背包已满,请整理后再来接任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	
	end
end



function x310007_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		local day = GetDayOfYear()
		x310007_SetMDDate(varMap, varPlayer, day)

		local item1=12030051;
		local item2=12030052;
		local item3=12030053;

		local ItemCnt = GetItemCount( varMap, varPlayer, item1 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,item1,ItemCnt) ~= 1 then return 0 end
		end

		ItemCnt = GetItemCount( varMap, varPlayer, item2 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,item2,ItemCnt) ~= 1 then return 0 end
		end

		ItemCnt = GetItemCount( varMap, varPlayer, item3 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,item3,ItemCnt) ~= 1 then return 0 end
		end

		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x310007_var_AbandonMessage, varQuestName);
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message, 4, 2)

		QuestUnCom( varMap, varPlayer, x310007_var_VirtualQuestId)

	end
end


function x310007_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
   
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end

	local guid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	if guid ~= -1 then 
		if guid == varTalkNpcGUID then	
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
		end
	else
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
	end
end


function x310007_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) == 0 then 
		return
	end

	if GetBagSpace(varMap, varPlayer) < 1 then
		local message = "背包已满，无法完成此任务"
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return
	end

	DelQuest(varMap, varPlayer, varQuest)
	LuaCallNoclosure( 203783, "Finishbaoxiang", varMap, varPlayer)
	QuestUnCom( varMap, varPlayer, x310007_var_VirtualQuestId)
	GamePlayScriptLog(varMap, varPlayer, 512)

	local day = GetDayOfYear()
	x310007_SetMDDate(varMap, varPlayer, day)

		local item1=12030051;
		local item2=12030052;
		local item3=12030053;
		
		local ItemCnt = GetItemCount( varMap, varPlayer, item1 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,item1,ItemCnt) ~= 1 then return 0 end
		end

		ItemCnt = GetItemCount( varMap, varPlayer, item2 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,item2,ItemCnt) ~= 1 then return 0 end
		end

		ItemCnt = GetItemCount( varMap, varPlayer, item3 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,item3,ItemCnt) ~= 1 then return 0 end
		end

		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x310007_var_CompleteMessage, varQuestName);
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)

		local varLevel = GetLevel(varMap, varPlayer)
		local awardExp = varLevel * 4500
		AddExp( varMap, varPlayer, awardExp )
		message = format("#Y获得#R经验%d#Y的奖励", awardExp)
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)

		StartItemTask( varMap )
		ItemAppend( varMap, x310007_var_AwardItem, 1 )
		
		local rndItemid = -1
		if GetLevel(varMap, varPlayer) >= 80 and random(1, 100) <= 22 then
			local varIndex = random(1,3)
			if varIndex < 1 then varIndex = 1 end
			if varIndex > 3 then varIndex = 3 end
			rndItemid = x310007_var_RandItem[varIndex]
			ItemAppend( varMap, rndItemid, 1)
		end
		
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
	
			DeliverItemListSendToPlayer(varMap,varPlayer)

			message = format("#Y获得物品#R#{_ITEM%d}#Y的奖励", x310007_var_AwardItem )
			StartTalkTask(varMap);
			TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			
		else
			local varText = "背包已满,不能获得奖励物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
		AddCountryResource(varMap,varPlayer,2,2000,1)
		
	
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + 100
		SetShengWang( varMap, varPlayer, varShengWang )
		message = format("获得声望%d的奖励。", 100)
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,message,4,2)
		
		if rndItemid ~= -1 then
			local varStr = format("#Y随机获得#G1个#Y#{_ITEM%d}", rndItemid)
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			
		end
		if GetLevel(varMap, varPlayer) >= 60 then
			if random( 1, 100) <= 20 then
				
				local bai60 = 12030143
				local bai80 = 12030144
				local bai = bai60
				StartItemTask( varMap)
				if GetLevel(varMap, varPlayer) >=80 then
				bai = bai80
				end	
				ItemAppendBind( varMap, bai, 1)	
				if StopItemTask( varMap, varPlayer) > 0 then
				DeliverItemListSendToPlayer( varMap, varPlayer)
				Msg2Player( varMap, varPlayer, format( "幸运的获得1个#R#{_ITEM%d}", bai), 8, 3)
				else
				Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理背包", 8, 3)
				end            
			end
		end

	
end

function x310007_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

    
    if varQuest == nil or varQuest < 0 then
        return
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return
    end
    
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		
		if Num < NeedNum then 
			StartTalkTask(varMap)
			local varText = format("#Y获得物品#G#{_ITEM%d}#Y: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
		elseif Num == NeedNum then
			
			StartTalkTask(varMap)
			local varText = format( "#Y已完成获得物品#G#{_ITEM%d}#Y: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
			if GetQuestParam(varMap, varPlayer, varQuestIdx, 0) == NeedNum and GetQuestParam(varMap, varPlayer, varQuestIdx, 1) == NeedNum then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			end
		end
	end
end

function x310007_TianJiangBaoXiangDisconnect( varMap, varPlayer )

end

function x310007_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox", varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end

function x310007_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end

function x310007_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )	
	local varStr;
	varStr = GetQuestNameNM(varMap, varPlayer, varQuest);
    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    
                                varStr,                 
                                "",               
                                "",                         
                                "",                   
                                "",                
                                ""        
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);

end


function x310007_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end


function x310007_OpenCheck( varMap, varPlayer, varTalknpc )
end
