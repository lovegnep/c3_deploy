
--DECLARE_QUEST_INFO_START--

x300971_var_FileId 					= 300971                  
x300971_var_QuestId 				= 7790                    

x300971_var_QuestKind 				= 1                       
x300971_var_LevelLess					= 80                      

x300971_var_QuestName				= "【国家】皇帝密令"
x300971_var_QuestTarget				= "%s  到后花园收集@npc_%d(%d/1)#r%s  到后花园收集@npc_%d(%d/1)#r%s  到后花园收集@npc_%d(%d/1)"
x300971_var_QuestInfo				= "\t各国使者现已在后花园等候，今使者们带来各国贡品，寡人有意将它们赏赐予你们。这批资源极为重要，有助于你们国力强盛，所以其他三国也对这批外藩贡品虎视眈眈，不要耽误，即刻启程拿取各国贡品！"      
x300971_var_ContinueInfo			= "\t不要耽误，即刻启程拿取各国贡品！"
x300971_var_QuestCompleted			= "你为你们国家及帮会的强盛做出了卓越贡献!"	  
x300971_var_QuestHelp				= "\t贡品在野外场景后花园内，各国力量均会抢夺该批贡品!"      
x300971_var_Questruse				= "\t每得到一批贡品都会有大量经验奖励，更有可能获得额外高经验奖励。"      


x300971_var_ExtTarget					= { {type=20,n=1,target=""} }



x300971_var_ExpBonus					= 0     
x300971_var_BonusItem					= {}	

x300971_var_BonusMoney1               = 0  
x300971_var_BonusMoney2               = 0  
x300971_var_BonusMoney3               = 0  
x300971_var_BonusMoney4               = 0  
x300971_var_BonusMoney5               = 0  
x300971_var_BonusMoney6               = 0  

x300971_var_BonusChoiceItem           = {}

--DECLARE_QUEST_INFO_STOP--

x300971_var_GrowObj = {}

-- 采集点
x300971_var_GrowpointId				= {732,733,734,735,736}
x300971_var_Growpoint				= {
									   {varID=732, varLink=14032},
									   {varID=733, varLink=14033},
									   {varID=734, varLink=14034},
									   {varID=735, varLink=14035},
									   {varID=736, varLink=14036}
									  }

x300971_var_Boss						= {type =9880,guid =-1,varX = 345, z=239, facedir =3600000, title = ""}

x300971_var_CoffExp					= {120000, 12000, 2400, 1200} 
x300971_var_InherenceExp				= 770 
x300971_var_GuildMoney				= 100000 
x300971_var_MaxCount					= 3 

x300971_var_TargetNPC                 = 139264

x300971_var_GameOpenId				= 1064

x300971_var_RewardTable       = {
                                { minLevel = 70, maxLevel = 80,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 160,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250013, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
}



function x300971_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetGameOpenById(x300971_var_GameOpenId) <= 0 then
		return
	end
	
	local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x300971_var_QuestId)
	TalkAppendButton(varMap,x300971_var_QuestId,x300971_var_QuestName,varState, 0 )
end



function x300971_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, varExtIdx)
	if IsHaveQuest( varMap, varPlayer, x300971_var_QuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300971_var_QuestId)
				if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
						x300971_DispatchContinueInfo(varMap, varPlayer, varTalknpc) 
        else
            x300971_DispatchCompletedInfo(varMap, varPlayer, varTalknpc) 
        end
    else
		x300971_DispatchQuestInfo(varMap, varPlayer, varTalknpc)	
	end
end




function x300971_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local varHaveQuest	= IsHaveQuest(varMap, varPlayer, x300971_var_QuestId)
	if( varHaveQuest > 0) then
		return 0
	else
		return 1
	end
end




function x300971_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

    if IsHaveQuest(varMap, varPlayer, x300971_var_QuestId) > 0 then
			local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300971_var_QuestId)
			local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
    	    if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) ~= 1 then
						Msg2Player(varMap, varPlayer, "任务为未完成状态。", 8, 2)
						Msg2Player(varMap, varPlayer, "任务为未完成状态", 8, 3)
						return
					end 
		
    else
    	if GetGameOpenById(x300971_var_GameOpenId) <= 0 then
			return
		end
	
		if GetLevel( varMap, varPlayer) < x300971_var_LevelLess then
			Msg2Player( varMap, varPlayer, format("很抱歉，您的等级不足%d级，无法接受【国家】皇帝密令。", x300971_var_LevelLess), 8, 3)
			return
		end
		
		if GetGuildID( varMap, varPlayer ) == -1 then
	 		
			Msg2Player(varMap, varPlayer, "很抱歉，没有帮会无法接受任务！", 8, 2)
			Msg2Player(varMap, varPlayer, "很抱歉，没有帮会无法接受任务！", 8, 3)
			return
		end 

		if x300971_GetDayCount(varMap, varPlayer) == 0 then
			Msg2Player( varMap, varPlayer, "你今天领取过该任务，请明天再来吧！", 8, 3)
			return
		end
		
		local varRet = AddQuest( varMap, varPlayer, x300971_var_QuestId, x300971_var_FileId, 0, 0, 0, 0) 
		if varRet == 0 then
			Msg2Player(varMap,varPlayer, "任务已满，任务接受失败！",8,3)
			return
		end
		
		
		Msg2Player( varMap, varPlayer, "您获得了任务："..x300971_var_QuestName, 8, 3)
		Msg2Player( varMap, varPlayer, "您获得了任务："..x300971_var_QuestName, 8, 2)
		
	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300971_var_QuestId)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
		for i=1, 5 do
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, i, 0)
		end
		
		-- 随机选择采集点
		local rgp = {1,2,3,4,5};
		local rm = 5
		for i=1, 3 do
			local rnd = random(1, rm)
			if rnd<1 then rnd = 1 end
			if rnd>rm then rnd = rm end
			if (rnd ~= rm) then
				local tmp = rgp[rnd];
				rgp[rnd] = rgp[rm];
				rgp[rm] = tmp;
			end
			rm = rm - 1
		end
		-- 记录选中的采集类型索引
		for i=1, 3 do
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, rgp[6-i], 1 )
		end
		
		x300971_ProcQuestLogRefresh( varMap, varPlayer, x300971_var_QuestId)
		return 1
    end
end




function x300971_ProcQuestAbandon( varMap, varPlayer, varQuest)
	if IsHaveQuest( varMap, varPlayer, x300971_var_QuestId) > 0 then
		DelQuest( varMap, varPlayer, x300971_var_QuestId)
        x300971_SetDayCount(varMap, varPlayer)
		Msg2Player( varMap, varPlayer, "您放弃了任务："..x300971_var_QuestName, 8, 3)
		Msg2Player( varMap, varPlayer, "您放弃了任务："..x300971_var_QuestName, 8, 2)
	end
end




function x300971_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest)
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	x300971_SetDayCount(varMap, varPlayer)
	
	if (x300971_GiveReward(varMap,varPlayer,varButtonClick) == 1) then
		DelQuest(varMap, varPlayer, x300971_var_QuestId)
		Msg2Player(varMap, varPlayer, "您完成了任务:"..x300971_var_QuestName, 8, 3)
		Msg2Player(varMap, varPlayer, "您完成了任务:"..x300971_var_QuestName, 8, 2)
		
		AddGuildMoney(varMap, varPlayer, x300971_var_GuildMoney)
    Msg2Player(varMap, varPlayer, "获得#R帮会金钱100两#cffcf00的奖励", 8, 2)
		Msg2Player(varMap, varPlayer, "获得#R帮会金钱100两#cffcf00的奖励", 8, 3)
		
		local varLevel = GetLevel(varMap, varPlayer)
		if varLevel >= 80 then
			local refixInh = AddInherenceExp(varMap, varPlayer, x300971_var_InherenceExp)
			local varMsg = format("获得#R天赋值%d点#cffcf00的奖励。",refixInh)
			Msg2Player(varMap, varPlayer, varMsg, 8, 2)
			Msg2Player(varMap, varPlayer, varMsg, 8, 3)
		end
	end

end

-- ------------------------------------------------------------------------------------------------
-- 奖励道具。
-- 返回值：0 表示失败，1 表示成功。
-- ------------------------------------------------------------------------------------------------
function x300971_GiveReward(varMap, varPlayer, varRadioSelected)
	local varLevel = GetLevel( varMap, varPlayer)
    local varCanBind = 0
    local varCount = 0
    local varId = 0
    for varI, item in x300971_var_RewardTable do
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
        for varI, item in x300971_var_RewardTable do
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

function x300971_BonusInfo(varMap, varPlayer)

	local varLevel = GetLevel(varMap, varPlayer)

    
  AddQuestGuildMoneyBonus(varMap, x300971_var_GuildMoney)
    
	if varLevel >= 80 then
		local refixInhExp = RefixInherenceExp(varMap, varPlayer, x300971_var_InherenceExp)
		AddQuestInherenceExpBonus(varMap,refixInhExp)
	end
end




function x300971_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)

    
    TalkAppendString( varMap, "#Y"..x300971_var_QuestName)
    TalkAppendString( varMap, x300971_var_QuestInfo)
    TalkAppendString( varMap, " ")

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300971_var_QuestId)
	local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
	
	-- TalkAppendString( varMap,"#Y任务目标：")
	-- TalkAppendString( varMap, format(x300971_var_QuestTarget,
									-- x300971_var_Growpoint[varQuest[1].QuestIndex].varLink, varQuest[1].Count,
									-- x300971_var_Growpoint[varQuest[2].QuestIndex].varLink, varQuest[2].Count,
									-- x300971_var_Growpoint[varQuest[3].QuestIndex].varLink, varQuest[3].Count) )
	TalkAppendString( varMap, " ")
	TalkAppendString( varMap,"#Y任务提示：")
    TalkAppendString( varMap, format(x300971_var_QuestHelp))
    TalkAppendString( varMap, " ")
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300971_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end							
    x300971_BonusInfo(varMap, varPlayer)
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300971_var_FileId, x300971_var_QuestId)
end




function x300971_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300971_var_QuestId)
	local rnd = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
		
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300971_var_QuestName)
    TalkAppendString( varMap, format(x300971_var_ContinueInfo, x300971_var_TargetNPC))
	TalkAppendString( varMap, " ")
	
	TalkAppendString( varMap,"#Y完成情况：")
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300971_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
		TalkAppendString(varMap, "未完成")
	else
		TalkAppendString(varMap, "已完成")
	end
	
	x300971_BonusInfo(varMap, varPlayer)
 	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300971_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end	   
	StopTalkTask()
    DeliverTalkRequire( varMap, varPlayer, varTalknpc, x300971_var_FileId, x300971_var_QuestId,0)
end




function x300971_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300971_var_QuestName)
    TalkAppendString( varMap, x300971_var_QuestCompleted)
    TalkAppendString( varMap, " ")
		local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300971_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end    
    x300971_BonusInfo(varMap, varPlayer)
    
	StopTalkTask()
	DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x300971_var_FileId, x300971_var_QuestId)
end




function x300971_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end




function x300971_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
end




function x300971_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end




function x300971_GetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HUANGDIMILING_DATE[1], MD_HUANGDIMILING_DATE[2],MD_HUANGDIMILING_DATE[3])
	
	if varToday ~= varLastday then
		return 1
	end
		
	return 0
end




function x300971_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	SetPlayerGameData(varMap, varPlayer, MD_HUANGDIMILING_DATE[1], MD_HUANGDIMILING_DATE[2], MD_HUANGDIMILING_DATE[3], varToday)
end




function x300971_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300971_var_QuestId)
    local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
	
	local varQuest1 = {
						{done="#W",QuestIndex=1, Count=0},
						{done="#W",QuestIndex=1, Count=0},
						{done="#W",QuestIndex=5, Count=0}
					  }
	local varIdx = 1
	for idx=1, 5 do
		local cnt = GetQuestParam( varMap, varPlayer, varQuestIdx, idx)
		if (cnt > 0) then
			varQuest1[varIdx].QuestIndex = idx
			varQuest1[varIdx].Count = cnt-1
				if cnt == 2 then
					varQuest1[varIdx].done = "#G"
				else
					varQuest1[varIdx].done = "#W"
				end
			varIdx = varIdx + 1
		end
	end
	
	StartTalkTask( varMap)
    AddQuestLogCustomText( varMap,
							"",									
                            x300971_var_QuestName,     
							format(x300971_var_QuestTarget,
									varQuest1[1].done,x300971_var_Growpoint[varQuest1[1].QuestIndex].varLink, varQuest1[1].Count,
									varQuest1[2].done,x300971_var_Growpoint[varQuest1[2].QuestIndex].varLink, varQuest1[2].Count,
									varQuest1[3].done,x300971_var_Growpoint[varQuest1[3].QuestIndex].varLink, varQuest1[3].Count),						
                            --format(x300971_var_QuestTarget, varCount, x300971_var_MaxCount),            
                            "@npc_"..x300971_var_TargetNPC,       
                            format(x300971_var_Questruse,x300971_var_TargetNPC), 				
                            x300971_var_QuestInfo,              
                            x300971_var_QuestHelp			
                            )
		local varLevel = GetLevel(varMap, varPlayer)
		for varI, item in x300971_var_RewardTable do
	        if varLevel >= item.minLevel and varLevel < item.maxLevel then
	            for j, iter in item.items do
	                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
	            end
	            break
	        end
	    end
                            
    x300971_BonusInfo(varMap, varPlayer)
    
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
end


function x300971_ProcGpCreate(varMap, growPointType, varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1)
	
	if (x300971_var_GrowObj[varMap] == nil) then
		x300971_var_GrowObj[varMap] = {}
	end
	x300971_var_GrowObj[varMap][varBoxId] = growPointType
end


function x300971_ProcGpOpen( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    if IsHaveQuestNM( varMap, varPlayer, x300971_var_QuestId) > 0 then
		if (x300971_var_GrowObj[varMap] == nil) then
			return 1;
		end
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300971_var_QuestId)
		local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
		if varCount == x300971_var_MaxCount then
			Msg2Player( varMap, varPlayer, "每个人每天只允许收集3份贡品,明天再来吧", 8, 3)
			return 1
		end

		-- 检验是否需要的贡品类型
		local gp = x300971_var_GrowObj[varMap][varTalknpc]
		local idx = x300971_Gp2Index(gp)
		if (idx == 0) then
			return 1
		end
		local gFlag = GetQuestParam( varMap, varPlayer, varQuestIdx, idx)
		if (gFlag == 0) then
			Msg2Player( varMap, varPlayer, "您的任务没有要求收集该类型贡品", 8, 3)
			return 1
		end
		if (gFlag == 2) then
			Msg2Player( varMap, varPlayer, "您已经收集过该类型贡品", 8, 3)
			return 1
		end
				
		return 0
    end
        Msg2Player( varMap, varPlayer, "很抱歉，你没有【国家】皇帝密令任务，无法采集", 8, 3)
    return 1
end


function x300971_ProcGpProcOver( varMap, varPlayer, varTalknpc )
end


function x300971_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)

    if IsHaveQuestNM( varMap, varPlayer, x300971_var_QuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300971_var_QuestId)
		local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
		
		-- 设置不同类型贡品标志
		local gp = x300971_var_GrowObj[varMap][varTalknpc]
		local idx = x300971_Gp2Index(gp)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, idx, 2)

		-- 记录数量
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, varCount+1)
		if varCount+1 == x300971_var_MaxCount then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
		end
		
		local varLevel = GetLevel(varMap, varPlayer)
		local rnd = random(1, 1000)
        local xp = 0
        if rnd == 1 then
			xp = varLevel * x300971_var_CoffExp[1]
			if x300971_var_Boss.title~= "" then
				CreateMonster(varMap, x300971_var_Boss.type, x300971_var_Boss.varX, x300971_var_Boss.z, 1, 977, -1, x300971_var_Boss.guid, 21,-1,x300971_var_Boss.facedir, "", x300971_var_Boss.title)
			else
				CreateMonster(varMap, x300971_var_Boss.type, x300971_var_Boss.varX, x300971_var_Boss.z, 1, 977, -1, x300971_var_Boss.guid, 21,-1,x300971_var_Boss.facedir)
			end
			local killerName = GetName(varMap,varPlayer)
			local varMsg1 = format("%s收集到稀有的外藩贡品，武仙突袭后花园抢夺贡品资源！",killerName)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
		elseif rnd <= 101 then
			xp = varLevel * x300971_var_CoffExp[2]
		elseif rnd <= 501 then
			xp = varLevel * x300971_var_CoffExp[3]
		else
			xp = varLevel * x300971_var_CoffExp[4]
		end
		AddExp(varMap, varPlayer, xp);
		Msg2Player(varMap, varPlayer, format( "收集外藩贡品获得#R经验%d点#cffcf00的奖励", xp), 8, 2)
		Msg2Player(varMap, varPlayer, format( "收集外藩贡品获得#R经验%d点#cffcf00的奖励", xp), 8, 3)
	
		x300971_ProcQuestLogRefresh( varMap, varPlayer, x300971_var_QuestId)
		return 1
    end

    return 0
end

function x300971_ProcDie(varMap, varPlayer, varKiller)

end
	
function x300971_Gp2Index(ngp)
	for i=1, 5 do
		if (x300971_var_GrowpointId[i] == ngp) then
			return i
		end
	end
	
	return 0
end
