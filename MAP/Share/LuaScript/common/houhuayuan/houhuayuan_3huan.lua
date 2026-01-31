--DECLARE_QUEST_INFO_START--

x300991_var_FileId = 300991  

x300991_var_QuestName = "【个人】暗渡陈仓"
x300991_var_QuestId = 9106  --看quest_list.tab里面是如何配置前置任务的!!!

x300991_var_SubmitNpc = {{44,144134},{-1,-1}, {44,144030}}

x300991_var_QuestTarget = "  将此事原委告于史官@npc_144030"
x300991_var_QuestTarget1 = "@npc_144030"

x300991_var_AcceptMessage		= "您接受了任务:%s"
x300991_var_AbandonMessage	= "您放弃了任务:%s"
x300991_var_CompleteMessage	= "您完成了任务:%s"

x300991_var_QuestMiddleCompleted = "\t众目睽睽之下竟然有此等之事。亏他纳速刺为皇族宗室之人，得五皇子信任！多谢将军告之，我即刻上报朝廷，严查内贼！"

x300991_var_QuestInfo =  "\t又要劳烦将军了，如果波斯王子真与此事有所关联，便不能让他得知此事。所以还要委屈将军变装为我的随身侍女，避开眼线，将此事原委告于元朝史官虞集。"


x300991_var_Questruse= "\t变装卸甲，毫无武装。此行小心路遇仇人趁此报复。"

x300991_var_CompleteInfo		= { day = -1, first = -1, second = -1,third = -1 }

x300991_var_TianfuItems				= {11010100,11010101,11010102}

x300991_var_BackPos = {122,177}


x300991_var_BufDataIndex_Size = 211



x300991_var_StateBuff = {{{7538,7538},{7538,7538}}, {{7538,7538},{7538,7538}}, {{7538,7538},{7538,7538}}, {{7538,7538},{7538,7538}}}
--DECLARE_QUEST_INFO_STOP--


x300991_var_RewardTable       = {
                                { minLevel = 70, maxLevel = 80,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 160,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250013, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
}


function x300991_SendStateBuff(varMap, varPlayer)
	local varCountry = GetCurCountry( varMap, varPlayer )
	local sex = GetSex( varMap, varPlayer )
	
	local buff = x300991_var_StateBuff[varCountry+1][1][sex+1]
	if IsHaveSpecificImpact( varMap, varPlayer, buff ) <= 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff, 0)
	end
	
	buff = x300991_var_StateBuff[varCountry+1][2][sex+1]
	if IsHaveSpecificImpact( varMap, varPlayer, buff ) > 0 then
		CancelSpecificImpact(varMap, varPlayer, buff)
	end
end

function x300991_CancelStateBuff(varMap, varPlayer)
	local varCountry = GetCurCountry( varMap, varPlayer )
	local sex = GetSex( varMap, varPlayer )
	
	local buff = x300991_var_StateBuff[varCountry+1][1][sex+1]
	
	if IsHaveSpecificImpact( varMap, varPlayer, buff ) > 0 then
		CancelSpecificImpact(varMap, varPlayer, buff)
	end
	
	buff = x300991_var_StateBuff[varCountry+1][2][sex+1]
	if IsHaveSpecificImpact( varMap, varPlayer, buff ) > 0 then
		CancelSpecificImpact(varMap, varPlayer, buff)
	end
end

function x300991_AddLog(varMap, varPlayer, sign, varQuest)
	 
	local gameId=0;
	if sign == 1 then
		gameId = 411
	else
		gameId = 412
	end

	GamePlayScriptLog(varMap, varPlayer, gameId)
end

function x300991_AwardTitle( varMap,varPlayer )
	


	
	local min = GetMinOfDay()
	if min < (19*60 + 30 ) or min > (23*60 + 59) then
		return
	end
	

	
	local dt = GetDayTime()
	if x300991_var_CompleteInfo.day ~= dt then
		
		x300991_var_CompleteInfo = { day = dt, first = 1, second = -1,third = -1 }
		AwardTitle(varMap,varPlayer,18)
		return
		
	else
		
		if x300991_var_CompleteInfo.first == -1 then
			
			x300991_var_CompleteInfo.first = 1
			AwardTitle(varMap,varPlayer,18)
			return
		end
		
		if x300991_var_CompleteInfo.second == -1 then
			
			x300991_var_CompleteInfo.second = 1
			AwardTitle(varMap,varPlayer,19)
			return
		end
		
		if x300991_var_CompleteInfo.third == -1 then
			
			x300991_var_CompleteInfo.third = 1
			AwardTitle(varMap,varPlayer,20)
			return
		end
		
	end
end

function x300991_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )


	
	--如果已经完成任务，则不予显示
	--if x300991_GetDayCount(varMap, varPlayer) >= 1 then
	--	return 0
	--end
	

	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varMap == x300991_var_SubmitNpc[1][1] and varTalkNpcGUID == x300991_var_SubmitNpc[1][2] then
		
		if IsHaveQuestNM( varMap, varPlayer, x300991_var_QuestId ) <= 0 and QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, x300991_var_QuestId ) > 0 then
			local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300991_var_QuestId)
			TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x300991_var_QuestId, questState)
		end
	elseif varMap == x300991_var_SubmitNpc[3][1] and varTalkNpcGUID == x300991_var_SubmitNpc[3][2] then
		
		if IsHaveQuestNM( varMap, varPlayer, x300991_var_QuestId ) > 0 and IsQuestHaveDoneNM( varMap, varPlayer, x300991_var_QuestId ) <= 0 then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300991_var_QuestId )
			
			--if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) ~= 1 then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			--end
			 
			local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300991_var_QuestId)
			TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x300991_var_QuestId, questState)
		end
	end
    
	return 0
end


function x300991_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varMap ==44 and varTalkNpcGUID == 144134 then
			if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
					local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
					if varRet > 0 then	
						x300991_DispatchQuestInfo(varMap, varPlayer, varTalknpc, varQuest)
					end
			end
	 elseif varMap ==44 and varTalkNpcGUID == 144030 then
			if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
				x300991_DispatchQuestCompleted( varMap, varPlayer, varTalknpc) 	
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"你没有此任务！")
				StopTalkTask()
				DeliverTalkMenu(varMap,varPlayer,varTalknpc);
			end
	 end
end

function x300991_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local submitGuid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	if varTalkNpcGUID == submitGuid then	
		TalkAppendButtonNM( varMap, varPlayer, -1, varQuest, 7, x300991_var_FileId ) 
	end
	
end


function x300991_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


function x300991_DispatchQuestMiddleCompleted(varMap, varPlayer,varTalknpc, varQuest)
	
end


function x300991_DispatchQuestCompleted(varMap, varPlayer,varTalknpc, varQuest)
	if IsHaveSpecificImpact( varMap, varPlayer, 7538 ) <= 0 then
		Msg2Player(varMap,varPlayer,"您伪装失败，请放弃任务后，重新接取",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"您伪装失败，请放弃任务后，重新接取",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		return 
	end
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300991_var_QuestName);
		TalkAppendString(varMap, x300991_var_QuestMiddleCompleted)
		
		local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300991_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end


	StopTalkTask(varMap);
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300991_var_FileId, x300991_var_QuestId)
	
	
	
	
	
	
	
end

function x300991_DispatchQuestInfo(varMap, varPlayer,varTalknpc, varQuest)
	
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300991_var_QuestName);
		TalkAppendString(varMap, x300991_var_QuestInfo)
		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300991_var_QuestTarget)
		TalkAppendString( varMap, " ")
		
		
			local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300991_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end



	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300991_var_FileId, x300991_var_QuestId)
end


function x300991_DispatchQuestContinueInfo(varMap, varPlayer, varTalknpc, varQuest)

	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x300991_var_QuestName)
		TalkAppendString(varMap, x300991_var_ContinueQuestInfo)
		
		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x300991_var_QuestTarget)
		TalkAppendString( varMap, " ")
	StopTalkTask(varMap);

	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300991_var_FileId, varQuest);
end


function x300991_CheckFront(varMap, varPlayer, varTalknpc)
	if x300991_GetDayCount_1HUAN(varMap, varPlayer) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"必须首先完成【个人】契丹赋税")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	
	if x300991_GetDayCount_2HUAN(varMap, varPlayer) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"必须首先完成【个人】中饱私囊")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	
	local haveImpact = IsHaveSpecificImpact(varMap, varPlayer, 7629)
		if(haveImpact > 0) then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "请取消战车加护状态后，再领取此任务")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			
			return 0
		end			

	
	
	return 1

end



function x300991_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
		Msg2Player(varMap,varPlayer,"很抱歉，您扛着旗子不能来参与活动",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"很抱歉，您扛着旗子不能来参与活动",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		return 
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7062 ) > 0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7063 ) >0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7064 ) >0
		or IsHaveSpecificImpact( varMap, varPlayer, 7065 ) >0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "携带龙魂状态不能来参与活动");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"携带龙魂状态不能来参与活动",8,2)
		return 0
	end
	
	
	if IsHaveQuestNM( varMap, varPlayer, 8066 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8074 ) > 0 or 
		IsHaveQuestNM( varMap, varPlayer, 8067 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8068 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8069 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8070 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8071 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8072 ) > 0 or
		IsHaveQuestNM( varMap, varPlayer, 8073 ) > 0 then

		Msg2Player(varMap,varPlayer,"很抱歉，您有童趣任务不能来参与活动",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"很抱歉，您有童趣任务不能来参与活动",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		return
	end

	if IsBusMember(varMap, varPlayer) > 0 then
		Msg2Player(varMap,varPlayer,"很抱歉，护送不能来参与活动",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"很抱歉，护送不能来参与活动",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		return 
	end
	
	if IsInChariot(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，乘坐战车状态不能领取任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end			
	
	if IsPlayerStateNormal(varMap,varPlayer) == 1 then
		if GetChangeSceneState(varMap, varPlayer)==2 then
			return
		end
	else
		return
	end
	
	
	--检查前置任务是否完成
	if x300991_CheckFront(varMap, varPlayer, varTalknpc) <= 0 then
		return
	end
	
	
	--检查当天是否已经完成一次
	if x300991_GetDayCount(varMap, varPlayer) >= 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，您今天任务次数已满，请明天再来做吧！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)		
		return
	end
	
			
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	

		
	--这里可以获取当前任务的前置任务


	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, x300991_var_QuestId ) 
	if varRet > 0 then 
		varRet = AddQuestNM( varMap, varPlayer,x300991_var_QuestId)
		if varRet > 0 then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300991_var_QuestId )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			
			x300991_SetAcceptTime(varMap, varPlayer)
			
			
			 x300991_BianShen( varMap, varPlayer, varTalknpc, varQuest )
			return 1
		elseif varRet == 0 then
			local varText = "任务获取失败，添加失败"
			Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		elseif varRet == -1 then
			local varText = "背包已满,请整理后再来接任务"
			Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		elseif varRet == -2 then
			local varText = "任务已满，添加任务失败"
			Msg2Player(varMap,varPlayer, varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		end
	end
		
		

	return 0
end



--把原来的npc2的处理移下来
function x300991_BianShen( varMap, varPlayer, varTalknpc, varQuest )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300991_var_QuestId )
		
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) ~= 1 then 
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, 1 )
		
			x300991_AddLog(varMap, varPlayer, 1, varQuest)

			ReCallHorse( varMap, varPlayer )
			

			x300991_SendStateBuff(varMap, varPlayer)
			
			
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7538, 0)
				
			local message = format(x300991_var_AcceptMessage, x300991_var_QuestName)
			Msg2Player(varMap,varPlayer, message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
			Msg2Player(varMap,varPlayer, message,CHAT_TYPE_SELF,CHAT_RIGHTDOWN)

			x300991_ProcQuestLogRefresh( varMap,varPlayer,x300991_var_QuestId)

			MarkMutexState(varMap, varPlayer, 23)
			return 1
		end
end




function x300991_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, x300991_var_QuestId )
	if varRet == 1 then
		
		x300991_CancelStateBuff(varMap, varPlayer)

		x300991_NextDayReset(varMap, varPlayer)
		--local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		local day = GetDayOfYear()
		--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)

		ClearMutexState(varMap, varPlayer, 23)

		local message = format(x300991_var_AbandonMessage, x300991_var_QuestName)
		Msg2Player(varMap,varPlayer, message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer, message,CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
	end
end



function x300991_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varMap == x300991_var_SubmitNpc[3][1] and varTalkNpcGUID == x300991_var_SubmitNpc[3][2] then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
		local varRet = QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) 
		if varRet > 0 then 
	
			if x300991_GiveReward(varMap,varPlayer,varButtonClick) <= 0 then
				return 0
			end
			
			x300991_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, x300991_var_QuestId )
			x300991_SetDayCount(varMap, varPlayer)
			SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 3101, 0)

			return 1
		end
	end
	return 0
end

function x300991_AddTianfuItem( varMap, varPlayer)
	local varLevel = GetLevel( varMap, varPlayer)
	if varLevel >= 80 then
		if random( 1, 100) <= 22 then
			local varIndex = random(1,3)
			StartItemTask( varMap)
	        ItemAppend( varMap, x300991_var_TianfuItems[varIndex], 1)
	        if StopItemTask( varMap, varPlayer) <= 0 then
	            Msg2Player( varMap, varPlayer, "由于你的背包已满，无法获得天赋道具奖励。", 8, 2)
	        else
	            DeliverItemListSendToPlayer( varMap, varPlayer)
	        end
		end
	end
end

function x300991_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	

	
	local varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then 
		--x300991_AddLog(varMap, varPlayer, 0, varQuest)
		
		
		local varLevel = GetLevel(varMap, varPlayer)
		local award1 = floor(100*varLevel*70)
		local award2 = floor(100*varLevel*70)
		local award = 0
		if GetLevel(varMap, varPlayer) >=40 and GetLevel(varMap, varPlayer) < 70 then
			award = award1;
		elseif GetLevel(varMap, varPlayer) >=70 then
			award = award2;
		end
		ClearMutexState(varMap, varPlayer, 23)

		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x300991_var_CompleteMessage, varQuestName)
		Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SELF,CHAT_RIGHTDOWN)

		--local varLevel = GetLevel(varMap, varPlayer)
		--if IsHaveSpecificImpact( varMap, varPlayer, 7716 ) > 0 then
		--	message1 = format("#Y您非常迅速的完成了【后花园】三环任务")
		--	Msg2Player(varMap,varPlayer,message1,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		--	Msg2Player(varMap,varPlayer,message1,CHAT_TYPE_SYSTEM,CHAT_RIGHTDOWN)
		--end
		
		--local varShengWang = GetShengWang( varMap, varPlayer )
		--varShengWang = varShengWang + 200
		--SetShengWang( varMap, varPlayer, varShengWang )
		--message = format("获得声望%d的奖励。", 200)
		--Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		--Msg2Player(varMap,varPlayer,message,CHAT_TYPE_SYSTEM,CHAT_RIGHTDOWN)
		--LuaCallNoclosure( 256224, "Finishtiesan", varMap, varPlayer)	

		x300991_CancelStateBuff(varMap, varPlayer)
		
		return 1 
		
	else 
		StartTalkTask(varMap)
		local varText = "未知错误，无法完成任务"
		if varRet == -2 then
			varText = "请选择奖励物品"
		elseif varRet == -3 then
			varText = "背包已满,请整理后再来交任务"
		elseif varRet == -4 then
			varText = "扣除任务物品失败"
		end
		Msg2Player(varMap,varPlayer,varText,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		return 0
	end
	return 0
end

function x300991_ProcAcceptCheckTime(  )

	local minute = GetMinOfDay()
	if (minute >= 19*60+30 and minute <24*60) then
		return 1
	end

	return -1
end

function x300991_SetAcceptTime(varMap, varPlayer)
	
	local day = GetDayOfYear()
	local minute = GetMinOfDay()
	
	--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
	--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3], minute)
end

function x300991_TieSanOnDie(varMap, varPlayer)
	
	--local varLastday = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3])
	--local lastMin = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3])

	-- local nowTime = GetDayOfYear()*1440 + GetMinOfDay()
	-- local lastTime = varLastday*1440 + lastMin

	-- if IsHaveQuestNM( varMap, varPlayer, x300991_var_QuestId ) > 0 then
		-- if nowTime - lastTime < 120 then
			
			
			-- local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300991_var_QuestId )
			-- if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) == 1 then 
			
				-- ReCallHorse( varMap, varPlayer )
				
	
				-- x300991_SendStateBuff(varMap, varPlayer)
	
				-- MarkMutexState(varMap, varPlayer, 23) 
			-- end
			-- return 
		-- end

		
		x300991_CancelStateBuff(varMap, varPlayer)
		
		DelQuestNM( varMap, varPlayer, x300991_var_QuestId )
		ClearMutexState(varMap, varPlayer, 23)
		Msg2Player(varMap,varPlayer,"【个人】暗渡陈仓任务已失败，请重新领取！",CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
		Msg2Player(varMap,varPlayer,"【个人】暗渡陈仓任务已失败，请重新领取！",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		-- x300991_NextDayReset(varMap, varPlayer)
		--local rounds = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3])
		--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], rounds+1)
		-- local day = GetDayOfYear()
		--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], day)
		
		-- if varMap ~= 0 then
			-- NewWorld(varMap, varPlayer, 0, x300991_var_BackPos[1], x300991_var_BackPos[2], x300991_var_FileId)
		-- else
			-- SetPos(varMap,varPlayer, x300991_var_BackPos[1], x300991_var_BackPos[2])
		-- end


end

function x300991_NextDayReset(varMap, varPlayer)
	
	--local varLastday = GetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3])

	local varToday = GetDayOfYear()
	if varToday ~= varLastday then 
		--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY[1], MD_TIEREN_ACCEPTTIME_DAY[2], MD_TIEREN_ACCEPTTIME_DAY[3], 0)
		--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_ACCEPTTIME_MINUTE[1], MD_TIEREN_ACCEPTTIME_MINUTE[2], MD_TIEREN_ACCEPTTIME_MINUTE[3], 0)
		--SetPlayerGameData(varMap, varPlayer, MD_TIEREN_COMMITTIME[1], MD_TIEREN_COMMITTIME[2], MD_TIEREN_COMMITTIME[3], 0)
	end
end

function x300991_CanDispel(dataIndex)
	for j=0, x300991_var_BufDataIndex_Size-1 do
		if dataIndex == x300991_var_UnDispelImpactDataIndex[j+1] then
			return -1
		end
	end
	return 1
end

function x300991_DispelBuff(varMap, varPlayer)
	local varCount = GetImpactListCount( varMap, varPlayer )
	for varI=0, varCount-1 do
		local dataIndex = GetImpactDataIndex( varMap, varPlayer, varI )
		if x300991_CanDispel(dataIndex) > 0 then
			DispelSpecificImpact( varMap, varPlayer, dataIndex )
		end
	end
end

function x300991_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	
	local target = x300991_var_QuestTarget
	local target1 = x300991_var_QuestTarget1
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300991_var_QuestId )
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 6 ) == 1 then
		target = "  将此事原委告于史官@npc_144030"
	end
	
    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    
                                x300991_var_QuestName,                 
                                target,               
                                target1,                         
                                x300991_var_Questruse,                   
                                "\t大元公主阔阔真委托你将此事原委告于元朝史官虞集。但碍于与波斯王子有关，只能变装而行。",                
                                ""        
                                )
                                
                                	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300991_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end


	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, x300991_var_QuestId);
end





--获取第1环任务的次数
function x300991_GetDayCount_1HUAN(varMap, varPlayer)


		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DATE[1], MD_HOUHUAYUAN_CIRCLE1_DATE[2], MD_HOUHUAYUAN_CIRCLE1_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3])
		return varDaycount


end

--获取第2环任务的次数
function x300991_GetDayCount_2HUAN(varMap, varPlayer)


		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DATE[1], MD_HOUHUAYUAN_CIRCLE2_DATE[2], MD_HOUHUAYUAN_CIRCLE2_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE2_DAYCOUNT[3])
		return varDaycount


end



--获取第3环任务的次数
function x300991_GetDayCount(varMap, varPlayer)


		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE3_DATE[1], MD_HOUHUAYUAN_CIRCLE3_DATE[2], MD_HOUHUAYUAN_CIRCLE3_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[3])
		return varDaycount


end



--设置第3环任务的次数
function x300991_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE3_DATE[1], MD_HOUHUAYUAN_CIRCLE3_DATE[2], MD_HOUHUAYUAN_CIRCLE3_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE3_DATE[1], MD_HOUHUAYUAN_CIRCLE3_DATE[2], MD_HOUHUAYUAN_CIRCLE3_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE3_DAYCOUNT[3], varDaycount+1)
	end
end



function x300991_GiveReward(varMap,varPlayer,varRadioSelected)

	local varLevel = GetLevel( varMap, varPlayer)
    local varCanBind = 0
    local varCount = 0
    local varId = 0
    for varI, item in x300991_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                if varRadioSelected == iter.varId then
                    if j <= 2 then
                        varCanBind = 1
                    end
                    varCount = iter.cnt
                    varId = iter.varId
                    break
                end
            end
            break
        end
    end

    
    if varCount == 0 then
        for varI, item in x300991_var_RewardTable do
            for j, iter in item.items do
                if varRadioSelected == iter.varId then
                    if j <= 2 then
                        varCanBind = 1
                    end
                    varCount = iter.cnt
                    varId = iter.varId
                    break
                end
            end
        end
    end

    if varId == 0 or varCount == 0 then
        return 0
    end

	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg, GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,0,varId,0,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16, varLogMsg)

	StartItemTask(varMap)
    if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
        if varCanBind == 1 then
            ItemAppend( varMap, varId, varCount)
        else
            ItemAppendBind( varMap, varId, varCount)
        end
    else
		ItemAppendBind( varMap, varId, varCount)
    end
		
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("您获得了物品：@itemid_%d",varId))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		return 1;
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足，无法获得任务奖励物品，交任务失败")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;	
	end
	
end
