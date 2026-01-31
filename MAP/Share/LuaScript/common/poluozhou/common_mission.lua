--DECLARE_QUEST_INFO_START--


x305015_var_FileId = 305015

x305015_var_LevelLess = 70

x305015_var_QuestName           = "【个人】四国争霸"

x305015_var_AwardItemId = 13011012 

x305015_var_ExpBonus					= 	0   
x305015_var_BonusItem					=	{}	

x305015_var_BonusMoney1               = 	0  
x305015_var_BonusMoney2               =   0  
x305015_var_BonusMoney3               =   0  
x305015_var_BonusMoney4               =   0  
x305015_var_BonusMoney5               =   0  
x305015_var_BonusMoney6               = 450  

x305015_var_BonusChoiceItem           =   {}

--DECLARE_QUEST_INFO_STOP--


x305015_var_QuestDescription    = "\t这段时间以来，我们和其他三国之间的战争愈加激烈，虽然我国将士人人奋勇杀敌，可是在资源补给方面，我们并没有占据优势。\n\t近日探马来报，在后花园的其他国家驻地，堆积了大量军用物资，如果我们能将其夺走，不仅能打击别国的士气，对我国军队的补给也有着莫大的好处。"

x305015_var_QuestFlow           = "\t秘密潜入到别国远征军驻地，获得我军急需的物资，解燃眉之急。切记，遇到后一定要除掉他们，以免泄露此次行动，引来其他三国的报复。"

x305015_var_QuestHelp           = "\t你需要杀死别国探马，才可以顺利获得本国军队所急需的物资。"

x305015_var_strQuestTarget      = "杀死@npc_%d并采集他附近的@item_%d#W(%d/3)。"

x305015_var_strQuestAbandon     = "你放弃了任务：【个人】四国争霸"

x305015_var_strQuestComplete    = "你完成了任务：【个人】四国争霸"

x305015_var_strQuestAccept      = "你接受了任务：【个人】四国争霸"

x305015_var_QuestContinue       = "\t请你前往#g%s#w，到其中击败草原%s，收集100个#g%s#w后交给我。"

x305015_var_NPC                   = "@npc_%d"

x305015_var_TotalCount            = 3

x305015_var_MP_TargetCountryId    = 1

x305015_var_MP_TargetItemId       = 2

x305015_var_MP_ItemCount          = 3

x305015_var_MP_DoubleDay          = 4

x305015_var_MoneyCoefficient      = 0

x305015_var_ExperienceCoefficient = 15000

x305015_var_AcceptQuestID         = 1281

x305015_var_FinishQuestID         = 1282

x305015_var_Loulan_NPC_Guid       = 142600

x305015_var_Kunlun_NPC_Guid       = 142601

x305015_var_Laiyin_NPC_Guid       = 142602

x305015_var_Dunhuang_NPC_Guid     = 142603

x305015_var_QuestNPC_Table      = {
                                    { typeId = 9720, posX = 50, posZ = 50, ai = 2, aiscript = 0, objGuid = 142600, campId = 16, liveTime = -1, varName = "楼兰探马", timerId = 93 }, 
                                    { typeId = 9720, posX = 206, posZ = 50, ai = 2, aiscript = 0, objGuid = 142602, campId = 17, liveTime = -1, varName = "天山探马", timerId = 94 }, 
                                    { typeId = 9720, posX = 50, posZ = 206, ai = 2, aiscript = 0, objGuid = 142601, campId = 18, liveTime = -1, varName = "昆仑探马", timerId = 95 }, 
                                    { typeId = 9720, posX = 206, posZ = 206, ai = 2, aiscript = 0, objGuid = 142603, campId = 19, liveTime = -1, varName = "敦煌探马", timerId = 96 }, 
}

x305015_var_QuestUpdateDate     = -1

x305015_var_MatchCountry          = { -1, -1, -1, -1 }
x305015_var_LastLeagueCount       = -1


x305015_var_CountryTable          = {
                                    { varId = 0, varName = "楼兰", varTalknpc = 142600 }, 
                                    { varId = 1, varName = "天山", varTalknpc = 142602 }, 
                                    { varId = 2, varName = "昆仑", varTalknpc = 142601 }, 
                                    { varId = 3, varName = "敦煌", varTalknpc = 142603 }, 
}

x305015_var_TargetNPC_ReliveTime  = 180000

x305015_var_MaxCount              = 3

x305015_var_ItemTable             = { 13070010, 13070011, 13070012 }

x305015_var_RongYu                = 450

x305015_var_QuestTable          = {
                                    7100,  
                                    7101,  
                                    7102,  
                                    7103,  
}
x305015_var_RewardTable       = {
                                { minLevel = 70, maxLevel = 80,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 160,  items = { { varId = 12250010, cnt = 1 }, { varId = 12250011, cnt = 1 }, { varId = 12250012, cnt = 1 }, { varId = 12250013, cnt = 1 }, { varId = 12250014, cnt = 1 } } }, 
}
function x305015_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetLevel( varMap, varPlayer) >= x305015_var_LevelLess then
        local varQuest = 0
        for varI, item in x305015_var_QuestTable do
            if IsHaveQuestNM( varMap, varPlayer, item) ~= 0 then
                varQuest = item
                break
            end
        end
        if varQuest ~= 0 then
            local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x305015_GetQuestId( varMap, varPlayer, varQuest) )
            TalkAppendButton( varMap, x305015_GetQuestId( varMap, varPlayer, varQuest), x305015_var_QuestName, varState)
        else
            local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x305015_var_QuestTable[ GetCurCountry( varMap, varPlayer) + 1] )
            TalkAppendButton( varMap, x305015_var_QuestTable[ GetCurCountry( varMap, varPlayer) + 1], x305015_var_QuestName, varState)
        end
    end
end

function x305015_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest)
    if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
        
        x305015_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
    else
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
		if isFinish > 0 then 
			x305015_QuestComplateInfo( varMap, varPlayer, varTalknpc, varQuest) 
		else
			x305015_QuestContinue( varMap, varPlayer, varTalknpc, varQuest) 
		end
    end
end


function x305015_QuestContinue( varMap, varPlayer, varTalknpc, varQuest)
	StartTalkTask( varMap)
		TalkAppendString( varMap, "#Y"..x305015_var_QuestName)
        TalkAppendString( varMap, "\t怎么，你没有找到我们所需的物资？" )
 	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x305015_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end	  
	StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end


function x305015_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	local varLevel = GetLevel( varMap, varPlayer)

	StartTalkTask( varMap)

		
		TalkAppendString( varMap, "#Y"..x305015_var_QuestName)
		TalkAppendString( varMap, x305015_var_QuestDescription)

		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x305015_var_QuestFlow )
		TalkAppendString( varMap, " ")
		TalkAppendString( varMap, " ")

		
        TalkAppendString( varMap, "#Y小提示：")
        TalkAppendString( varMap, x305015_var_QuestHelp)
        
		local varLevel = GetLevel(varMap, varPlayer)
	    for varI, item in x305015_var_RewardTable do
	        if varLevel >= item.minLevel and varLevel < item.maxLevel then
	            for j, iter in item.items do
	                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
	            end
	            break
	        end
	    end	
		

		
		local varExp = GetLevel( varMap, varPlayer) * x305015_var_ExperienceCoefficient
		if varExp > 0 then
			AddQuestExpBonus( varMap, varExp)
		end

		
        local money = varLevel * x305015_var_MoneyCoefficient
		if money > 0 then
			AddQuestMoneyBonus1( varMap, money)
		end

		
		if x305015_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x305015_var_BonusMoney2 )
		end

		
		if x305015_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x305015_var_BonusMoney3 )
		end

		
		if x305015_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x305015_var_BonusMoney4 )
		end

		
		if x305015_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x305015_var_BonusMoney5 )
		end

		
		for varI, item in x305015_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x305015_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end

	StopTalkTask()

	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x305015_var_FileId, x305015_var_QuestTable[ GetCurCountry( varMap, varPlayer) + 1]);
end


function x305015_CheckDayTimes( varMap, varPlayer)
    local varToday = GetDayOfYear()

    if x305015_GetAcceptDate( varMap, varPlayer) ~= varToday then
        return 0
    else
        return 1
    end
end

function x305015_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
    if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then   
        
        local varToday = GetDayOfYear()
        if x305015_GetAcceptDate( varMap, varPlayer) == varToday then 
            Msg2Player( varMap, varPlayer, "你今天已经完成过这个任务，请明天再来", 8, 3)
            return
        end
    	local result = AddQuest( varMap, varPlayer, x305015_var_QuestTable[ GetCurCountry( varMap, varPlayer) + 1], x305015_var_FileId, 1, 0, 1, 0)
    	if( result == 0) then
    		local varStr = "任务已满，任务接受失败！"
    		StartTalkTask( varMap)
    		TalkAppendString( varMap, varStr)
    		StopTalkTask( varMap)
    		DeliverTalkTips( varMap, varPlayer)
          	Msg2Player(varMap, varPlayer, varStr, 8, 2)
    		return 0
        else
            
            x305015_SetAcceptDate( varMap, varPlayer, varToday)

            
            local oppoId = x305015_GetMatchCountry( varMap, varPlayer )
                    

            local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x305015_var_QuestTable[ GetCurCountry( varMap, varPlayer) + 1] )
			local targetItem = x305015_var_ItemTable[ random( 1, 3) ]
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetCountryId, oppoId)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetItemId, targetItem)
            local minute = GetMinOfDay()
            if GetWeek() == 3 and minute >= 1200 and minute <= 1230 then
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x305015_var_MP_DoubleDay, 2)
            end
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x305015_var_MP_ItemCount, 0)

            
            x305015_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

    		Msg2Player( varMap, varPlayer, x305015_var_strQuestAccept, 8, 2)
    		Msg2Player( varMap, varPlayer, x305015_var_strQuestAccept, 8, 3)

            
			local varName = ""
			for varI, item in x305015_var_CountryTable do
				if oppoId == item.varId then
					varName = item.varName
				end
			end
    		StartTalkTask( varMap)
			TalkAppendString( varMap, "#Y"..x305015_var_QuestName)
    		TalkAppendString( varMap, format( "\t寻找并消灭#g%s探马#w，以免走漏消息。然后在%s远征军驻地周围获取@item_%d#w。", varName, varName, targetItem) )
		-- local varLevel = GetLevel(varMap, varPlayer)
			-- for varI, item in x305015_var_RewardTable do
				-- if varLevel >= item.minLevel and varLevel < item.maxLevel then
	            -- for j, iter in item.items do
	                -- AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
	            -- end
				-- break
			-- end
    end  
    		StopTalkTask( varMap)
            --DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x305015_var_FileId , varQuest)

            
            GamePlayScriptLog( varMap, varPlayer, x305015_var_AcceptQuestID)

    else
        
        x305015_QuestComplate( varMap, varPlayer, varTalknpc, varQuest)
    end

end

function x305015_GetRandomDay( varMap, varPlayer, QuestData, varQuest)
    if IsHaveQuestNM( varMap, varPlayer, x305015_var_QuestTable[ GetCurCountry( varMap, varPlayer) + 1] ) == 0 then
        return
    else
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x305015_var_QuestTable[ GetCurCountry( varMap, varPlayer) + 1] )
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x305015_var_MP_DoubleDay, QuestData)
    end
end

function x305015_QuestLogRefresh( varMap, varPlayer, varQuest)
    x305015_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
end

function x305015_GetQuestId( varMap, varPlayer, varQuest)
    local varQuest = x305015_var_QuestTable[ GetCurCountry( varMap, varPlayer) + 1]
    if GetCurCountry( varMap, varPlayer) ~= 0 then
        if varQuest == x305015_var_QuestTable[ 1] then
            varQuest = varQuest
        end
    end

    return varQuest
end

function x305015_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x305015_GetQuestId( varMap, varPlayer, varQuest) )
    local oppoId = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetCountryId)
    local targetNPC = 0
    local varItem = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetItemId)
    
    local varItemCount = GetItemCountInBag( varMap, varPlayer, varItem)
	local varTalknpc = 0
	local myCountry = GetCurCountry( varMap, varPlayer)

    
    for varI, item in x305015_var_CountryTable do
        if oppoId == item.varId then
            targetNPC = item.varTalknpc
        end
    end
	
    for varI, item in x305015_var_CountryTable do
        if myCountry == item.varId then
			varTalknpc = item.varTalknpc
        end
    end

    StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "t",                            
                                x305015_var_QuestName,          
                                format( x305015_var_strQuestTarget, targetNPC, varItem, varItemCount),     
                                format( x305015_var_NPC, varTalknpc),  
                                x305015_var_QuestFlow,          
                                x305015_var_QuestDescription,   
                                x305015_var_QuestHelp)          
    local varExp = GetLevel( varMap, varPlayer) * x305015_var_ExperienceCoefficient
    AddQuestExpBonus( varMap, varExp)
 	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x305015_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end     
    local playerLevel = GetLevel( varMap, varPlayer)
    if playerLevel > 80 then
        playerLevel = 80
    end
    
    -- AddQuestMoneyBonus6(varMap, x305015_var_BonusMoney6 )

    StopTalkTask()
    DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end

function x305015_Accept( varMap, varPlayer, varQuest )
	return -1
end

function x305015_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, growpointId, itemIndex)
    
    local varQuest = 0
    for varI, item in x305015_var_QuestTable do
        if IsHaveQuestNM( varMap, varPlayer, item) ~= 0 then
            varQuest = item
            break
        end
    end

    if varQuest == 0 then
        return 1
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x305015_GetQuestId( varMap, varPlayer, varQuest) )
    local oppoId = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetCountryId)
    local varItem = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetItemId)
    if varItem ~= itemIndex then
        Msg2Player( varMap, varPlayer, "请依照任务提示，抢夺相应的资源。", 8, 3)
        return 1
    end
    local varX, z = GetWorldPos( varMap, varPlayer)
    
    if oppoId == 0 then    
        if FindMonsterByGUID( varMap, x305015_var_Loulan_NPC_Guid) ~= 4294967295 then
            Msg2Player( varMap, varPlayer, "请先去杀死#g楼兰探马#cffcf00再来采集！", 8, 3)
            return 1
        else
            if varX > 143 and varX < 297 and z > 296 and z < 460 then
                return 0
            else
                Msg2Player( varMap, varPlayer, "必须在#g楼兰探马#cffcf00附近采集", 8, 3)
                return 1
            end
        end
    elseif oppoId == 1 then    
        if FindMonsterByGUID( varMap, x305015_var_Laiyin_NPC_Guid) ~= 4294967295 then
            Msg2Player( varMap, varPlayer, "请先去杀死#G天山探马#cffcf00再来采集！", 8, 3)
            return 1
        else
            if varX > 1 and varX < 243 and z > 1 and z < 153 then
                return 0
            else
                Msg2Player( varMap, varPlayer, "必须在#G天山探马#cffcf00附近采集", 8, 3)
                return 1
            end
        end
    elseif oppoId == 2 then    
        if FindMonsterByGUID( varMap, x305015_var_Kunlun_NPC_Guid) ~= 4294967295 then
            Msg2Player( varMap, varPlayer, "请先去杀死#g昆仑探马#cffcf00再来采集！", 8, 3)
            return 1
        else
            if varX > 1 and varX < 117 and z > 157 and z < 307 then
                return 0
            else
                Msg2Player( varMap, varPlayer, "必须在#g昆仑探马#cffcf00附近采集", 8, 3)
                return 1
            end
        end
    elseif oppoId == 3 then    
        if FindMonsterByGUID( varMap, x305015_var_Dunhuang_NPC_Guid) ~= 4294967295 then
            Msg2Player( varMap, varPlayer, "请先去杀死#g敦煌探马#cffcf00再来采集！", 8, 3)
            return 1
        else
            if varX > 293 and varX < 453 and z > 1 and z < 120 then
                return 0
            else
                Msg2Player( varMap, varPlayer, "必须在#g敦煌探马#cffcf00附近采集", 8, 3)
                return 1
            end
        end
    end
end

function x305015_ProcGpRecycle( varMap, varPlayer, varTalknpc, growpointId, itemIndex)
    
    local varQuest = 0
    for varI, item in x305015_var_QuestTable do
        if IsHaveQuestNM( varMap, varPlayer, item) ~= 0 then
            varQuest = item
            break
        end
    end

    if varQuest == 0 then
        return 0
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x305015_GetQuestId( varMap, varPlayer, varQuest) )
    local varItemCount = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_ItemCount)
    local maxCount = x305015_var_MaxCount
    if varItemCount > x305015_var_TotalCount - x305015_var_MaxCount then
        maxCount = x305015_var_TotalCount - varItemCount
    end
    if maxCount == 0 then
        Msg2Player( varMap, varPlayer, "任务已经完成，不能继续采集", 8, 3)
        return 0
    end
    local varItemCount = random( 1, maxCount)
    StartItemTask( varMap)
    ItemAppend( varMap, itemIndex, varItemCount)
    if StopItemTask( varMap, varPlayer) > 0 then
        DeliverItemListSendToPlayer( varMap, varPlayer)

        
        x305015_ProcQuestLogRefresh( varMap, varPlayer, x305015_GetQuestId( varMap, varPlayer, varQuest) )

        return 1
    else
        Msg2Player( varMap, varPlayer, "无法得到采集物品，请整理道具栏", 8, 3)
        return 0
    end
end



function x305015_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end


function x305015_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
    
    local varQuest = 0
    for varI, item in x305015_var_QuestTable do
        if IsHaveQuestNM( varMap, varPlayer, item) ~= 0 then
            varQuest = item
            break
        end
    end

    if varQuest == 0 then
        return 1
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x305015_GetQuestId( varMap, varPlayer, varQuest) )
    local varItem = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetItemId)
    if varItem ~= varItemData then
        return 0
    end

    
    local varItemCount = GetItemCountInBag( varMap, varPlayer, varItem)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x305015_var_MP_ItemCount, varItemCount)
    if varItemCount >= x305015_var_TotalCount then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        Msg2Player( varMap, varPlayer, "任务已完成，快去交任务吧", 8, 3)
    else
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
    end

	return 0
end

function x305015_QuestComplateInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
	TalkAppendString( varMap, "#Y"..x305015_var_QuestName.."#W\n\t王国的英雄，你是远征军的骄傲！这些物资不知可以挽救多少我们受伤的兄弟！" )
    local varExp = GetLevel( varMap, varPlayer) * x305015_var_ExperienceCoefficient
    if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end
    
    local playerLevel = GetLevel( varMap, varPlayer)
    if playerLevel > 80 then
        playerLevel = 80
    end
    
    -- AddQuestMoneyBonus6( varMap, x305015_var_BonusMoney6)
		local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x305015_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end  
	StopTalkTask( varMap)
    local varQuest = 0
    for varI, item in x305015_var_QuestTable do
        if IsHaveQuestNM( varMap, varPlayer, item) ~= 0 then
            varQuest = item
            break
        end
    end
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x305015_var_FileId, x305015_GetQuestId( varMap, varPlayer, varQuest) )
end

function x305015_QuestComplate( varMap, varPlayer, varTalknpc, varQuest)
   
end

function x305015_GetAcceptDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_POLO_DATE[ 1], MD_POLO_DATE[ 2], MD_POLO_DATE[ 3] )
end

function x305015_SetAcceptDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_POLO_DATE[ 1], MD_POLO_DATE[ 2], MD_POLO_DATE[ 3], value)
end

function x305015_ProcQuestAbandon( varMap, varPlayer, varQuest)
    local varQuest = 0
    for varI, item in x305015_var_QuestTable do
        if IsHaveQuestNM( varMap, varPlayer, item) ~= 0 then
            varQuest = item
            break
        end
    end
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x305015_GetQuestId( varMap, varPlayer, varQuest) )
    local varItem = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetItemId)
	if DelQuestNM( varMap, varPlayer, x305015_GetQuestId( varMap, varPlayer, varQuest) ) == 1 then
		Msg2Player( varMap, varPlayer, x305015_var_strQuestAbandon, 8, 3)
		Msg2Player( varMap, varPlayer, x305015_var_strQuestAbandon.."。", 8, 2)
        x305015_SetAcceptDate( varMap, varPlayer, GetDayOfYear() )
        
        local varItemCount = GetItemCountInBag( varMap, varPlayer, varItem)
        if varItemCount > 0 then
            
            if DelItem( varMap, varPlayer, varItem, varItemCount) ~= 1 then return 0 end
        end
	end
end

function x305015_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
		local varRet = QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) 
		if varRet > 0 then 
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x305015_GetQuestId( varMap, varPlayer, varQuest) )
		    local varItem = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_TargetItemId)
		    local doubleDay = GetQuestParam( varMap, varPlayer, varQuestIdx, x305015_var_MP_DoubleDay)
		    local varItemCount = GetItemCountInBag( varMap, varPlayer, varItem)
		    local playerLevel = GetLevel( varMap, varPlayer)
			if DelItem( varMap, varPlayer, varItem, varItemCount) ~= 1 then return 0 end
		    DelQuest( varMap, varPlayer, varQuest)
		    local xp = x305015_var_ExperienceCoefficient * playerLevel
			x305015_GiveReward(varMap,varPlayer,varButtonClick)
		    AddExp( varMap, varPlayer, xp)
		    StartTalkTask( varMap)
		    TalkAppendString( varMap, x305015_var_strQuestComplete)
		    StopTalkTask( varMap)
		    DeliverTalkTips( varMap, varPlayer)
		    Msg2Player( varMap, varPlayer, x305015_var_strQuestComplete, 8, 2)
		    Msg2Player( varMap, varPlayer, format( "你获得#R经验%d点#cffcf00的奖励", xp), 8, 2)
		    StartTalkTask( varMap)
		    TalkAppendString( varMap, format( "你获得#R经验%d点#cffcf00的奖励", xp) )
		    StopTalkTask( varMap)
		    DeliverTalkTips( varMap, varPlayer)
		    -- AddHonor(varMap, varPlayer, x305015_var_RongYu)
		    -- Msg2Player( varMap, varPlayer, format( "你获得#R%d点荣誉#cffcf00的奖励", x305015_var_RongYu), 8, 3)
		    -- Msg2Player( varMap, varPlayer, format( "你获得#R%d点荣誉#cffcf00的奖励。", x305015_var_RongYu), 8, 2)
		    local minute = GetMinOfDay()
		    if doubleDay == 2 and GetWeek() == 3 and minute >= 1200 and minute <= 1230 then
		    end
		    local varToday = GetDayOfYear()
		    x305015_SetAcceptDate( varMap, varPlayer, varToday)
		    GamePlayScriptLog( varMap, varPlayer, x305015_var_FinishQuestID)
		end
end

function x305015_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end



function x305015_GiveReward(varMap,varPlayer,varRadioSelected)
	local varLevel = GetLevel( varMap, varPlayer)
    local varCanBind = 0
    local varCount = 0
    local varId = 0
    for varI, item in x305015_var_RewardTable do
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
        for varI, item in x305015_var_RewardTable do
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


--得到联盟国数目， 0 ， 2， or 3
function x305015_GetLeagueCount()
    
  local maxCount = 0  
  for i = 0, 3 do
        local iCount = 0
        for j = 0, 3 do
            if i ~= j and IsLeague( i, j ) == 1 then
                iCount = iCount + 1
            end
        end
        
        if iCount > 0 then
            iCount = iCount + 1
            if maxCount < iCount then
                maxCount = iCount
            end
        end
  end

  return maxCount
  
end


--得到配对国家
function x305015_GetMatchCountry( varMap, varPlayer )

    local bNeedUpdateMatchCountry = 0
    
    if x305015_var_MatchCountry[1] == -1 or
       x305015_var_MatchCountry[2] == -1 or
       x305015_var_MatchCountry[3] == -1 or
       x305015_var_MatchCountry[4] == -1 then
       
       bNeedUpdateMatchCountry = 1
       
    end
    
    --日期改变，重新配对
    if bNeedUpdateMatchCountry == 0 then
        local varToday = GetDayOfYear()
        if varToday ~= x305015_var_QuestUpdateDate then
             x305015_var_QuestUpdateDate = varToday
             bNeedUpdateMatchCountry = 1
        end
    end
    
    --联盟情况改变，重新配对
    if bNeedUpdateMatchCountry == 0 then
        
        if x305015_var_LastLeagueCount ~= 3 then
            if IsLeague( x305015_var_MatchCountry[1],x305015_var_MatchCountry[2] ) == 1 or
               IsLeague( x305015_var_MatchCountry[3],x305015_var_MatchCountry[4] ) == 1 then
                    bNeedUpdateMatchCountry = 1
            end     
        else 
            if IsLeague( x305015_var_MatchCountry[1],x305015_var_MatchCountry[2] ) == 1 or
               IsLeague( x305015_var_MatchCountry[1],x305015_var_MatchCountry[3] ) == 1 or
               IsLeague( x305015_var_MatchCountry[1],x305015_var_MatchCountry[4] ) == 1 then
               
               bNeedUpdateMatchCountry = 1
               
            end
        end
   
    end
    
    
    if bNeedUpdateMatchCountry == 1 then
        x305015_UpdateMatchCountry( varMap, varPlayer )
    end
    
    local playerCountry = GetCurCountry( varMap, varPlayer )
    local matchCountry = -1
    if x305015_var_LastLeagueCount ~= 3  then
        
          if playerCountry == x305015_var_MatchCountry[1] then
          
                matchCountry = x305015_var_MatchCountry[2]
                
          elseif playerCountry == x305015_var_MatchCountry[2] then
          
                matchCountry = x305015_var_MatchCountry[1]
          
          elseif playerCountry == x305015_var_MatchCountry[3] then
          
                matchCountry = x305015_var_MatchCountry[4]
                
          elseif playerCountry == x305015_var_MatchCountry[4] then
          
                matchCountry = x305015_var_MatchCountry[3]
                
          end
        
        
    else
          if playerCountry == x305015_var_MatchCountry[1] then
          
              matchCountry = x305015_var_MatchCountry[2]
          
          elseif playerCountry == x305015_var_MatchCountry[2] or
                 playerCountry == x305015_var_MatchCountry[3] or
                 playerCountry == x305015_var_MatchCountry[4] then
                 
              matchCountry = x305015_var_MatchCountry[1]
              
          end
    
    end
    
    
    return matchCountry



end

--刷新国家配对
function x305015_UpdateMatchCountry( varMap, varPlayer )

     x305015_var_LastLeagueCount = x305015_GetLeagueCount()
     
     if x305015_var_LastLeagueCount == 0 then
         
            local cou1 = random(0,3)
            local cou2 = random(0,3)
            while cou1 == cou2 do
                 cou2 = random(0,3)
            end        
            
            local cou3 = -1;
            local cou4 = -1;
            for i = 0, 3 do
                if i ~= cou1 and i ~= cou2 then
                    if cou3 == -1 then
                        cou3 = i
                    elseif cou4 == -1 then
                        cou4 = i
                    end
                end
            end
            
            x305015_var_MatchCountry[1] = cou1
            x305015_var_MatchCountry[2] = cou2
            x305015_var_MatchCountry[3] = cou3
            x305015_var_MatchCountry[4] = cou4
            
     elseif x305015_var_LastLeagueCount == 2 then
            
            local league2 = { -1, -1 }
            for i = 0, 3 do
                for j = 0, 3 do
                    if i ~= j then
                        if IsLeague( i, j ) == 1 then
                            league2[1] = i
                            league2[2] = j
                            break
                        end
                    end
                end
            end
            
            local other2 = { -1, -1 }
            for i = 0, 3 do
                if i ~= league2[1] and i ~= league2[2] then
                    if other2[1] < 0 then
                        other2[1] = i
                    elseif other2[2] < 0 then
                        other2[2] = i
                    end
                end
            end
            
            x305015_var_MatchCountry[1] = league2[1]
            x305015_var_MatchCountry[3] = league2[2]
            
            local r1 = random(1,2)
            x305015_var_MatchCountry[2] = other2[r1]
            if r1 == 1 then
                r1 = 2 
            elseif r1 == 2 then
                r1 = 1
            end
            x305015_var_MatchCountry[4] = other2[r1]
            
     
     elseif x305015_var_LastLeagueCount == 3 then
     
           local thelonelyCountry = -1
            for i = 0, 3 do
                for j = 0, 3 do
                    if i ~= j then
                        if IsLeague( i, j ) == 0 then
                            thelonelyCountry = i
                            break
                        end
                    end
                end
            end
     
            x305015_var_MatchCountry[1] = thelonelyCountry
            x305015_var_MatchCountry[2] = -1
            x305015_var_MatchCountry[3] = -1
            x305015_var_MatchCountry[4] = -1
            
            for i = 0, 3 do
                
                if i ~= thelonelyCountry then
                
                    if x305015_var_MatchCountry[2] < 0 then
                    
                        x305015_var_MatchCountry[2] = i
                        
                    elseif x305015_var_MatchCountry[3] < 0 then
                        
                        x305015_var_MatchCountry[3] = i
                        
                    elseif x305015_var_MatchCountry[4] < 0 then
                    
                        x305015_var_MatchCountry[4] = i
                    
                    end
                    
                end
            
            end
            
            local rand = random(2,4)
            if rand ~= 2 then
                local temp = x305015_var_MatchCountry[2]
                x305015_var_MatchCountry[2] = x305015_var_MatchCountry[rand]
                x305015_var_MatchCountry[rand] = temp                      
            end
           
     
     end

end



function x305015_CheckCountryColleague( varMap ,nCountryIDA,nCountryIDB)
	if nCountryIDA == nCountryIDB then
		return -1
	end
	
	if nCountryIDA < 0 and nCountryIDA >= 4 then
		return -1
	end
	if nCountryIDB < 0 and nCountryIDB >= 4 then
		return -1
	end
	
	if IsLeague( nCountryIDA, nCountryIDB ) == 1 then
		return 1
	end
		
	return -1
		
end



function x305015_CheckOther2IsCountryColleague( varMap ,nCountryIDA,nCountryIDB)
	if nCountryIDA == nCountryIDB then
		return -1
	end
	
	if nCountryIDA < 0 and nCountryIDA >= 4 then
		return -1
	end
	if nCountryIDB < 0 and nCountryIDB >= 4 then
		return -1
	end
	
	local aRemainCountryIDs = {}
	local nRemainsIndex = 0
	
	local varI = 0
	
	
	for varI = 0 , 3 do 
		if varI ~= nCountryIDA and varI ~= nCountryIDB then
			nRemainsIndex = nRemainsIndex +1
			aRemainCountryIDs[nRemainsIndex] = varI
		end
	end
	
	
	local varRet  = x305015_CheckCountryColleague(varMap, aRemainCountryIDs[1],aRemainCountryIDs[2])
	
	return varRet 
		
end
