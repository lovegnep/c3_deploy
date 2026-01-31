






x562000_var_FileId 					= 562000          				
x562000_var_QuestId 				= 9502            				
x562000_var_CurScriptCountry			= 0								
x562000_var_SubmitNpcGUID				= 101650						
x562000_var_QuestItem 				= 13040040						
x562000_var_QuestItemNum 			= 60								
x562000_var_QuestItemDropRate 		= 100                            
x562000_var_QuestItemDropMaxNum 	= 1								
x562000_var_QuestRingNum 			= 10								
x562000_var_AcceptMinLevel 			= 35							
x562000_var_AcceptMaxLevel 			= 49							
x562000_var_AcceptLevelDataIdx		= 1								

x562000_var_AllBonusItemList 			= 								
{{varId = 11050001, varNum = 40, minlevel = 35, maxlevel = 39}, {varId = 11050002, varNum = 40, minlevel = 40, maxlevel = 44}, {varId = 11050002, varNum = 40, minlevel = 45, maxlevel = 49}}

x562000_var_KillMonsterList 			= 								
{{varName = "幽蛰之蜂", varMap = 90066, typeid = 6901, minlevel = 35, maxlevel = 39},
{varName = "幽纹之豹", varMap = 90067, typeid = 6902, minlevel = 40, maxlevel = 44}, 
{varName = "幽面之魈", varMap = 90068, typeid = 6903, minlevel = 45, maxlevel = 49}}

x562000_var_QuestName				= 								
"【个人】迷宫除恶"
x562000_var_AcceptDesc				= 								
"\t王国迷宫中的各种怪物横行已有多年，无数勇士试图根除他们，但最后都殒命在于此。\n\t最近一位云游的老者点播根除怪物之法，就是收集怪物的兽首骨聚而焚之，让焚骨之烟充斥迷宫，怪物闻烟既毙。\n\t你愿意完成收集兽首骨的艰巨任务吗？"		
x562000_var_CompleteDesc	 			= 								
"\t如此的年纪有这般武艺和胆识着实不易，将来封官授爵必不是难事啊!"	
x562000_var_UnCompleteDesc			= 								
"\t你还没有收集足够的兽首骨，你有什么苦难就直接告诉我，我不会为难你的。"	
x562000_var_QuestFmtName			= x562000_var_QuestName	.. 		
"(%d/%d)"
x562000_var_TargetFmtDesc	 			= 								
"消灭@npc_%d收集@item_%d#W(%d/%d)"	
x562000_var_BookDesc	 				= 								
"消灭@npc_%d收集@item_%d#W(%d/%d)"
x562000_var_TipDesc	 				= 								
"\t可以组队完成，加入队伍你也会提高完成任务的速度。"
x562000_var_LevelErrTip				= 								
"\您的级别不适合接受此任务!"	
x562000_var_TodayErrTip				= 								
"今天已经无法领取任务，请明日再来吧！"	
x562000_var_MisFullErrTip				= 								
"任务已满，任务接受失败"	
x562000_var_BagFullErrTip1			= 								
"物品栏已满，无法得到任务物品！"	
x562000_var_BagFullErrTip2			= 								
"物品栏已满，无法得到奖励物品，任务提交失败！"	
x562000_var_GiveupErrTip         		= 								
"您放弃了任务：" .. x562000_var_QuestName
x562000_var_AcceptOkTip         		= 								
"您接受了任务：" .. x562000_var_QuestName
x562000_var_FinishTip         		= 								
"您完成了任务：" .. x562000_var_QuestName
x562000_var_GetExpFmtTip         		= 								
"完成本环任务获得%d经验"





function x562000_GetAcceptLevel(varMap, varPlayer)

	acceptLevel = GetQuestParam(varMap, varPlayer, GetQuestIndexByID(varMap, varPlayer, x562000_var_QuestId), x562000_var_AcceptLevelDataIdx)
	
	
	if acceptLevel == 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x562000_var_QuestId)
		selfLevel = GetLevel(varMap, varPlayer)

		if selfLevel > x562000_var_AcceptMaxLevel then
			SetQuestByIndex(varMap, varPlayer, varQuestIdx, x562000_var_AcceptLevelDataIdx, x562000_var_AcceptMaxLevel)
			return x562000_var_AcceptMaxLevel
		else
			SetQuestByIndex(varMap, varPlayer, varQuestIdx, x562000_var_AcceptLevelDataIdx, selfLevel)
			return selfLevel			
		end
	end
	
	return acceptLevel
end




function x562000_GetCurRing(varMap, varPlayer)

	local curRingIdx = GetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_CURRING[1], MD_QUEST_MIGONGCHUE_CURRING[2], MD_QUEST_MIGONGCHUE_CURRING[3])
	
	
	if curRingIdx < 0 then
		WriteLog(2, format("minggongchue GGetCurRing: GetPlayerGameData curRingIdx(%d)", curRingIdx))
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_CURRING[1], MD_QUEST_MIGONGCHUE_CURRING[2], MD_QUEST_MIGONGCHUE_CURRING[3], 0)
		return 0
	end
	
	
	if curRingIdx >= x562000_var_QuestRingNum then
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_CURRING[1], MD_QUEST_MIGONGCHUE_CURRING[2], MD_QUEST_MIGONGCHUE_CURRING[3], x562000_var_QuestRingNum - 1)
		return x562000_var_QuestRingNum - 1
	end
	
	return curRingIdx
end




function x562000_GetThisTimeExp(varMap, varPlayer, selfLevel)
	return selfLevel * 220 * (x562000_GetCurRing(varMap, varPlayer) + 11) + 46200
end




function x562000_ShowNpcContext(varMap, varPlayer, varTalknpc, showMainText, isAccept)
	
	local curRingIdx = x562000_GetCurRing(varMap, varPlayer)
	
	StartTalkTask(varMap)

	
	TalkAppendString(varMap, "#Y" .. x562000_var_QuestName)
	TalkAppendString(varMap, showMainText)
	
	
	local selfLevel = 0
	if isAccept == 1 then
		selfLevel = GetLevel(varMap, varPlayer)
	else
		selfLevel = x562000_GetAcceptLevel(varMap, varPlayer)
	end
	
	
	local getExp = x562000_GetThisTimeExp(varMap, varPlayer, selfLevel, curRingIdx)
	if getExp > 0 then
		AddQuestExpBonus(varMap, getExp)
	end

	
	if curRingIdx + 1 == x562000_var_QuestRingNum then
		for varI, item in x562000_var_AllBonusItemList do
		   	if selfLevel >= item.minlevel and selfLevel <= item.maxlevel then
		   		AddQuestItemBonus(varMap, item.varId, item.varNum)
		   	end
	    end
	end

	StopTalkTask()
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x562000_var_FileId, x562000_var_QuestId)
end




function x562000_QuestLogRefresh(varMap, humanId)

    if IsHaveQuest(varMap, humanId, x562000_var_QuestId) == 0 then
        return
    end

	local curRingIdx = x562000_GetCurRing(varMap, humanId)
	
	StartTalkTask(varMap)
   
   	local rawLevel = x562000_GetAcceptLevel(varMap, humanId)
	local getExp = x562000_GetThisTimeExp(varMap, humanId, rawLevel, curRingIdx)

	
	if getExp > 0 then
		AddQuestExpBonus(varMap, getExp)
	end
	
	
	if curRingIdx + 1 == x562000_var_QuestRingNum then
		for varI, item in x562000_var_AllBonusItemList do
		   	if rawLevel >= item.minlevel and rawLevel <= item.maxlevel then
		   		AddQuestItemBonus(varMap, item.varId, item.varNum)
		   	end
	    end
	end
	
	local itemNumOnPlayer = GetItemCount(varMap, humanId, x562000_var_QuestItem)
	local chkFind = 0
	local monsterSceneId = 0
	
	
	for varI, item in x562000_var_KillMonsterList do
		if rawLevel >= item.minlevel and rawLevel <= item.maxlevel then
			monsterSceneId = item.varMap
			chkFind = 1
			break
		end
	end
	
	
	if chkFind == 0 then
		local maxLevel = 0
		for varI, item in x562000_var_KillMonsterList do
			if maxLevel < item.maxlevel then
				maxLevel = item.maxlevel
				monsterSceneId = item.varMap
			end
		end
	end
			
			
			AddQuestLogCustomText( varMap,
								   "",
								   format(x562000_var_QuestFmtName, curRingIdx + 1, x562000_var_QuestRingNum), 										
								   format(x562000_var_TargetFmtDesc, monsterSceneId, x562000_var_QuestItem, itemNumOnPlayer, x562000_var_QuestItemNum), 	
								   format("@npc_%d", x562000_var_SubmitNpcGUID),	 																		
								   format(x562000_var_BookDesc, monsterSceneId, x562000_var_QuestItem, itemNumOnPlayer, x562000_var_QuestItemNum),		
								   x562000_var_AcceptDesc, 																								
								   x562000_var_TipDesc )
	
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, humanId, x562000_var_QuestId)
end




function x562000_ProcEnumEvent(varMap, varPlayer, varTalknpc, misId)

	
	if x562000_var_CurScriptCountry ~= GetCurCountry(varMap, varPlayer) then
		return
	end

	local curRingIdx = x562000_GetCurRing(varMap, varPlayer)

	
	local selfLevel = GetLevel(varMap, varPlayer)
	if selfLevel < x562000_var_AcceptMinLevel or selfLevel > x562000_var_AcceptMaxLevel then
		 return
	end

    if IsHaveQuestNM(varMap, varPlayer, x562000_var_QuestId) == 0 then
        local curState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x562000_var_QuestId)
        TalkAppendButton(varMap, x562000_var_QuestId, x562000_var_QuestName, curState, 0);
    end
end




function x562000_ProcEventEntry(varMap, varPlayer, varTalknpc, misId, selIndex)
	
	
	if x562000_var_CurScriptCountry ~= GetCurCountry(varMap, varPlayer) then
		return
	end
	
	
	if IsHaveQuestNM(varMap, varPlayer, x562000_var_QuestId) == 1 then 
		local isFinish = GetQuestParam(varMap, varPlayer, GetQuestIndexByID(varMap, varPlayer, x562000_var_QuestId), 0)

		
		if isFinish == 1 then        
	        x562000_ShowNpcContext(varMap, varPlayer, varTalknpc, x562000_var_CompleteDesc, 0)
		elseif isFinish == 0 then
			StartTalkTask(varMap)                                                                
			TalkAppendString(varMap, x562000_var_UnCompleteDesc)                  
			StopTalkTask()                                                                         
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x562000_var_FileId, x562000_var_QuestId)
		end
	else
		
		local selfLevel = GetLevel(varMap, varPlayer)
		if selfLevel < x562000_var_AcceptMinLevel or selfLevel > x562000_var_AcceptMaxLevel then
	        Msg2Player(varMap, varPlayer, selfLevel, x562000_var_LevelErrTip, 8, 3)		
			return
		end

		x562000_ShowNpcContext(varMap, varPlayer, varTalknpc, x562000_var_AcceptDesc, 1)
	end
end




function x562000_ProcQuestLogRefresh(varMap, varPlayer, misId)
    x562000_QuestLogRefresh(varMap, varPlayer, x562000_var_QuestId)
end




function x562000_ProcQuestAccept(varMap, varPlayer, varTalknpc, misId)

	
	if x562000_var_CurScriptCountry ~= GetCurCountry(varMap, varPlayer) then
		return
	end

	local dayOfYear = GetDayOfYear()

	
	local lastDate = GetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_ACCEPTDATE[1], MD_QUEST_MIGONGCHUE_ACCEPTDATE[2], MD_QUEST_MIGONGCHUE_ACCEPTDATE[3])
	if lastDate ~= dayOfYear then
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_TODAYRING[1], MD_QUEST_MIGONGCHUE_TODAYRING[2], MD_QUEST_MIGONGCHUE_TODAYRING[3], 0)	
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_ACCEPTDATE[1], MD_QUEST_MIGONGCHUE_ACCEPTDATE[2], MD_QUEST_MIGONGCHUE_ACCEPTDATE[3], dayOfYear)
	end
	
	local curRingIdx = x562000_GetCurRing(varMap, varPlayer)
		
	local todayRingNum = GetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_TODAYRING[1], MD_QUEST_MIGONGCHUE_TODAYRING[2], MD_QUEST_MIGONGCHUE_TODAYRING[3])
	if todayRingNum < 0 then
		WriteLog(2, format("minggongchue ProcQuestAccept: GetPlayerGameData todayRingNum(%d)", todayRingNum))
		return
	end
	
	
	if todayRingNum > x562000_var_QuestRingNum then
		SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_TODAYRING[1], MD_QUEST_MIGONGCHUE_TODAYRING[2], MD_QUEST_MIGONGCHUE_TODAYRING[3], x562000_var_QuestRingNum)
		todayRingNum = x562000_var_QuestRingNum
	end

	if IsHaveQuestNM(varMap, varPlayer, x562000_var_QuestId) == 0 then
	local selfLevel = GetLevel(varMap, varPlayer)
	
		
		if selfLevel < x562000_var_AcceptMinLevel or selfLevel > x562000_var_AcceptMaxLevel then
			Msg2Player(varMap, varPlayer, x562000_var_LevelErrTip, 8, 3)
			return
		end

		
		if todayRingNum >= x562000_var_QuestRingNum then
			Msg2Player(varMap, varPlayer, x562000_var_TodayErrTip, 8, 3)
			return
		end

		local retOpt = AddQuest(varMap, varPlayer, x562000_var_QuestId, x562000_var_FileId, 1, 0, 1, 1)
    	
    	
    	if retOpt == 0 then
            Msg2Player(varMap, varPlayer, x562000_var_MisFullErrTip, 8, 3)
    		return
    	end
    	
    	
    	SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_ACCEPTDATE[1], MD_QUEST_MIGONGCHUE_ACCEPTDATE[2], MD_QUEST_MIGONGCHUE_ACCEPTDATE[3], dayOfYear)
 	
        
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x562000_var_QuestId)
        SetQuestByIndex(varMap, varPlayer, varQuestIdx, 0, 0)

        
        Msg2Player(varMap, varPlayer, x562000_var_AcceptOkTip, 8, 2)
        Msg2Player(varMap, varPlayer, x562000_var_AcceptOkTip, 8, 3)
        
        
        x562000_QuestLogRefresh(varMap, varPlayer, x562000_var_QuestId)
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, x562000_var_AcceptLevelDataIdx, selfLevel)
    else
		local isFinish = GetQuestParam(varMap, varPlayer, GetQuestIndexByID(varMap, varPlayer, x562000_var_QuestId), 0)
		local rawLevel = x562000_GetAcceptLevel(varMap, varPlayer)
		
		if isFinish == 1 then

			
			if curRingIdx + 1 == x562000_var_QuestRingNum then
				for varI, item in x562000_var_AllBonusItemList do
				   	if rawLevel >= item.minlevel and rawLevel <= item.maxlevel then
					   	StartItemTask(varMap)
		                ItemAppendBind(varMap, item.varId, item.varNum)
		                
		                if StopItemTask(varMap, varPlayer) > 0 then
		                    DeliverItemListSendToPlayer(varMap, varPlayer)
		                else
	   					 	Msg2Player(varMap, varPlayer, x562000_var_BagFullErrTip2, 8, 3)		
	   					 	return 
		                end
		            end
			    end
			end

			
			local getExp = x562000_GetThisTimeExp(varMap, varPlayer, rawLevel, curRingIdx)
			
			
			curRingIdx = curRingIdx + 1
			todayRingNum = todayRingNum + 1
			SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_CURRING[1], MD_QUEST_MIGONGCHUE_CURRING[2], MD_QUEST_MIGONGCHUE_CURRING[3], mod(curRingIdx, x562000_var_QuestRingNum))
			SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_TODAYRING[1], MD_QUEST_MIGONGCHUE_TODAYRING[2], MD_QUEST_MIGONGCHUE_TODAYRING[3], todayRingNum)			

			DelQuest(varMap, varPlayer, x562000_var_QuestId)
			
			
			local itemNumOnPlayer = GetItemCount(varMap, varPlayer, x562000_var_QuestItem)
			if itemNumOnPlayer > 0 then
				if DelItem(varMap, varPlayer, x562000_var_QuestItem, itemNumOnPlayer) ~= 1 then return 0 end
			end

	   	 	if getExp > 0 then
	   	 		AddExp(varMap, varPlayer, getExp)
	    		Msg2Player(varMap, varPlayer, format(x562000_var_GetExpFmtTip, getExp), 8 ,2)
	    	end

            Msg2Player(varMap, varPlayer, x562000_var_FinishTip, 8, 2)
            Msg2Player(varMap, varPlayer, x562000_var_FinishTip, 8, 3)
		end
	end
end




function x562000_ProcQuestAbandon(varMap, varPlayer, misId)

	if IsHaveQuestNM(varMap, varPlayer, x562000_var_QuestId) == 1 then
		DelQuest(varMap, varPlayer, x562000_var_QuestId)
		
		
		local itemNumOnPlayer = GetItemCount(varMap, varPlayer, x562000_var_QuestItem)
		if itemNumOnPlayer > 0 then
			if DelItem(varMap, varPlayer, x562000_var_QuestItem, itemNumOnPlayer) ~= 1 then return 0 end
		end
        
        Msg2Player(varMap, varPlayer, x562000_var_GiveupErrTip, 8, 2)
        Msg2Player(varMap, varPlayer, x562000_var_GiveupErrTip, 8, 3)
        
        
        SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_TODAYRING[1], MD_QUEST_MIGONGCHUE_TODAYRING[2], MD_QUEST_MIGONGCHUE_TODAYRING[3], x562000_var_QuestRingNum)	
        SetPlayerGameData(varMap, varPlayer, MD_QUEST_MIGONGCHUE_CURRING[1], MD_QUEST_MIGONGCHUE_CURRING[2], MD_QUEST_MIGONGCHUE_CURRING[3], 0)
	end
end




function x562000_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalknpc, varQuestIdx, misId)
	
	
	if x562000_var_CurScriptCountry ~= GetCurCountry(varMap, varPlayer) then
		return
	end

	
	if varTalknpc == x562000_var_SubmitNpcGUID then
		if IsHaveQuestNM(varMap, varPlayer, x562000_var_QuestId) == 1 then
			local curState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x562000_var_QuestId)
			local curRingIdx = x562000_GetCurRing(varMap, varPlayer)
			
			TalkAppendButton(varMap, x562000_var_QuestId, x562000_var_QuestName, curState, 0);
		end
	end
end




function x562000_ProcQuestItemChanged(varMap, varPlayer, varItem, misId)

	if varItem ~= x562000_var_QuestItem then
		return
	end

    x562000_QuestLogRefresh(varMap, varPlayer, x562000_var_QuestId)

    
	local itemNumOnPlayer = GetItemCount(varMap, varPlayer, x562000_var_QuestItem)
    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x562000_var_QuestId)
    
    
	if itemNumOnPlayer >= x562000_var_QuestItemNum then
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 0, 1)
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 1)
	else
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 0, 0)
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 0)
	end
end




function x562000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, misId)
		
	
	local numKilled = GetMonsterOwnerCount(varMap, varObj)
	
	for varI = 0, numKilled - 1 do
	 	
	 	
		local humanId = GetMonsterOwnerID(varMap, varObj, varI)
		
		if IsPlayerStateNormal(varMap, humanId) == 1 then
			local rawLevel = x562000_GetAcceptLevel(varMap, humanId)
			local chkPass = 0
			
			
			for j, item in x562000_var_KillMonsterList do
		   		if varObjData == item.typeid and rawLevel >= item.minlevel and rawLevel <= item.maxlevel then
			   		chkPass = 1
			   		break
		   		end
	    	end
	    	
	        if humanId ~= -1 and chkPass == 1 then         
	        	
	        	
	            if IsHaveQuestNM(varMap, humanId, x562000_var_QuestId) == 1 then
	                
	                
	                if x562000_var_QuestItemNum <= 0 or x562000_var_QuestItemDropMaxNum <= 0 then 
	                	return
	                end
	
	                local itemNumOnPlayer = GetItemCount(varMap, humanId, x562000_var_QuestItem)
	                if itemNumOnPlayer < x562000_var_QuestItemNum then
		                
		                local dropRand = random(100)
		                if dropRand <= x562000_var_QuestItemDropRate then
		
			                
			                local dropNum = random(x562000_var_QuestItemDropMaxNum)
			                if dropNum == 0 then
			                    dropNum = 1
			                end
			                
			                
			                if dropNum > x562000_var_QuestItemNum - itemNumOnPlayer then
			                    dropNum = x562000_var_QuestItemNum - itemNumOnPlayer
			                end
			                
			                StartItemTask(varMap)
			                ItemAppendBind(varMap, x562000_var_QuestItem, dropNum)
			                
			                if StopItemTask(varMap, humanId) > 0 then
			                    DeliverItemListSendToPlayer(varMap, humanId)
			                    x562000_QuestLogRefresh(varMap, humanId, x562000_var_QuestId)
			                else
	       					 	Msg2Player(varMap, humanId, x562000_var_BagFullErrTip1, 8, 3)		   
			                end
			            end
					end
	            end
	        end
	    end
	end
end









