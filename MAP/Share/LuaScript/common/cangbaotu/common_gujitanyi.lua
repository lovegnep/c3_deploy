--DECLARE_QUEST_INFO_START--


x300340_var_ScritpId = 300340

x300340_var_QuestId = 8051

x300340_var_LevelLess = 20

x300340_var_QuestName           = "【个人】草原三宝"

x300340_var_NeedGold = 10000
x300340_var_KillQuestId =  7012
x300340_var_Material_Thread = 13011010


x300340_var_QuestPropertyId =  12030021

x300340_var_AwardItemId = 13011012 

x300340_var_ExpBonus					= 	0                    	
x300340_var_BonusItem					=	{}	

x300340_var_BonusMoney1               = 	0  
x300340_var_BonusMoney2               =   0  
x300340_var_BonusMoney3               =   0  
x300340_var_BonusMoney4               =   0  
x300340_var_BonusMoney5               =   0  
x300340_var_BonusMoney6               =   0  

x300340_var_BonusChoiceItem           =   {}

--DECLARE_QUEST_INFO_STOP--

x300340_var_QuestTable              = {
                                        { minLevel = 20, maxLevel = 40, placeId = 36, placeName = "@npcsp_温泉谷_82004",  varItem = 13013100, itemName = "珍宝皮毛",	monsterName="生物" }, 
                                        { minLevel = 40, maxLevel = 60, placeId = 37, placeName = "@npcsp_风陵山_82005",  varItem = 13013101, itemName = "明目胆汁",	monsterName="生物" }, 
                                        { minLevel = 60, maxLevel = 9999, placeId = 39, placeName = "@npcsp_黄叶林_82006",  varItem = 13013102, itemName = "血玉骨",	monsterName="生物" }
}



x300340_var_QuestDescription    = "\t辽阔草原中，生物所带来的不仅是肥美的鲜肉，有些入药至宝都是不可多得的珍品，不知道你可否知道#g草原三宝#w一说，我就在收集它们。\n\t前往#g%s#w，到其中击败%s，收集100个@item_%d#w后交给我。\n\t这里有一个@item_12030021#w，现在送给你，请在草原生物密集的#g%s#w中使用吧！如果觉得好用的话可以去@npc_138502那里购买。"

x300340_var_QuestHelp           = "\t#g诱兽炉香可以让迷宫中的生物必定掉落任务所需的物品，如果你需要更多的话，请去@npc_138502那里买吧。"

x300340_var_strQuestTarget      = "  到%s收集@item_%d#W(%d/100)"

x300340_var_strQuestAbandon     = "你放弃了任务：【个人】草原三宝"

x300340_var_strQuestComplete    = "你完成了任务：【个人】草原三宝"

x300340_var_strQuestAccept      = "你接受了任务：【个人】草原三宝"

x300340_var_QuestContinue       = "\t请你前往#g%s#w，到其中击败草原%s，收集100个#g%s#w后交给我。"

x300340_var_QuestProcess				=	"\t请你前往#G%s#W，到其中击败草原生物，收集100个@item_%d#W。"

x300340_var_FanqiTime             = 180

x300340_var_Range                 = 4

x300340_var_NPC                   = "@npc_138558"

x300340_var_FinishCount           = 100

x300340_var_MP_TargetItemId       = 1

x300340_var_MP_PosX               = 2

x300340_var_MP_PosZ               = 3

x300340_var_MP_UseTime            = 4

x300340_var_MP_TargetScene        = 5

x300340_var_MoneyCoefficient      = 300

x300340_var_ExperienceCoefficient = 3000

function x300340_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    if GetLevel( varMap, varPlayer) >= x300340_var_LevelLess then
        local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, varQuest)
        
        TalkAppendButton( varMap, x300340_var_QuestId, x300340_var_QuestName, varState)
    end
end

function x300340_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
    if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
        
        x300340_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
    else
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
        local varItem = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetItemId)
		if isFinish > 0 and GetItemCountInBag( varMap, varPlayer, varItem) >= 100 then 
			x300340_QuestComplateInfo( varMap, varPlayer, varTalknpc, varQuest) 
		else
            
			x300340_QuestContinue( varMap, varPlayer, varTalknpc, varQuest) 
		end
    end
end


function x300340_QuestContinue( varMap, varPlayer, varTalknpc, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestId)
    local taritem = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetItemId)
    local strItem = ""
    local strPalace = ""
    local strMonster = ""
    for varI, item in x300340_var_QuestTable do
        if item.varItem == taritem then
            strItem = item.itemName
            strPalace = item.placeName
            strMonster = item.monsterName
            break
        end
    end
	StartTalkTask( varMap)
		TalkAppendString( varMap, "#Y"..x300340_var_QuestName)
        TalkAppendString( varMap, format( x300340_var_QuestContinue, strPalace, strMonster, strItem) )

	StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end


function x300340_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	local varLevel = GetLevel( varMap, varPlayer)
    local bFind = 0
    local strDescription = ""
    local varItem = 0
    local baseScene = ( GetCurCountry( varMap, varPlayer) ) * 100 + 50

    
    for varI, item in x300340_var_QuestTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            SetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID, baseScene + item.placeId)
            SetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_ITEMID, item.varItem)
            varItem = item.varItem
            strDescription = format( x300340_var_QuestDescription, item.placeName, item.monsterName, item.varItem, item.placeName)
            bFind = 1
            break
        end
    end

    if bFind == 0 then
        return
    end

	StartTalkTask( varMap)

		
		TalkAppendString( varMap, "#Y"..x300340_var_QuestName)
		TalkAppendString( varMap, strDescription)

		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, format( "收集@item_%d#W。", varItem ) )
		TalkAppendString( varMap, " ")
		TalkAppendString( varMap, " ")

		
        TalkAppendString( varMap, "#Y小提示：")
        TalkAppendString( varMap, x300340_var_QuestHelp)
        

		

		
		local varExp = GetLevel( varMap, varPlayer) * x300340_var_ExperienceCoefficient
		if varExp > 0 then
			AddQuestExpBonus( varMap, varExp)
		end

		
        local money = varLevel * x300340_var_MoneyCoefficient
		if money > 0 then
			AddQuestMoneyBonus1( varMap, money)
		end

		
		if x300340_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x300340_var_BonusMoney2 )
		end

		
		if x300340_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x300340_var_BonusMoney3 )
		end

		
		if x300340_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x300340_var_BonusMoney4 )
		end

		
		if x300340_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x300340_var_BonusMoney5 )
		end

		
		if x300340_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x300340_var_BonusMoney6 )
		end

		
		for varI, item in x300340_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	    end

		
		for varI, item in x300340_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	    end

	StopTalkTask()

	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300340_var_ScritpId, x300340_var_QuestId);
end


function x300340_CheckDayTimes( varMap, varPlayer)
    local varToday = GetDayOfYear()

    if x300340_GetAcceptTime( varMap, varPlayer) ~= varToday then
        return 0
    else
        return 1
    end
end

function x300340_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
    if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then   
        
        if x300340_CheckDayTimes( varMap, varPlayer) ~= 0 then
        	local varStr = "你今天已经完成过这个任务，请明天再来"
            StartTalkTask( varMap)
            TalkAppendString( varMap, varStr )
            StopTalkTask()
            DeliverTalkTips( varMap, varPlayer)
            Msg2Player(varMap, varPlayer, varStr, 8, 2)
            return
        end
        
        StartItemTask( varMap)
            ItemAppend( varMap, x300340_var_QuestPropertyId, 1)
        local result = StopItemTask( varMap, varPlayer)
        if result == 0 then
        	local varStr = "背包已满，无法存放任务道具，任务接受失败！";
    		StartTalkTask( varMap)
    		TalkAppendString( varMap, varStr )
    		StopTalkTask( varMap)
    		DeliverTalkTips( varMap, varPlayer)
          	Msg2Player(varMap, varPlayer, varStr, 8, 2)
    		
            return 0
        end
    	local varRet	= AddQuest( varMap, varPlayer, x300340_var_QuestId, x300340_var_ScritpId, 1, 0, 0, 1);
    	if( varRet == 0) then
    		local varStr = "任务已满，任务接受失败！"
    		StartTalkTask( varMap)
    		TalkAppendString( varMap, varStr )
    		StopTalkTask( varMap)
    		DeliverTalkTips( varMap, varPlayer)
          	Msg2Player(varMap, varPlayer, varStr, 8, 2)
    		return 0
        else
            
            local varToday = GetDayOfYear()
            x300340_SetAcceptTime( varMap, varPlayer, varToday)
            
            local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestId)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetItemId, GetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_ITEMID) )
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetScene, GetPlayerRuntimeData( varMap, varPlayer, RD_GUJI_SCENEID) )
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300340_var_MP_PosX, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300340_var_MP_PosZ, 0)
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300340_var_MP_UseTime, 0)

            x300340_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

    		StartTalkTask( varMap)
    		TalkAppendString( varMap, x300340_var_strQuestAccept);
    		StopTalkTask( varMap);
    		DeliverTalkTips( varMap, varPlayer);
    		Msg2Player( varMap, varPlayer, x300340_var_strQuestAccept, 8, 2)
    		Msg2Player( varMap, varPlayer, x300340_var_strQuestAccept, 8, 3)

            
            DeliverItemListSendToPlayer( varMap, varPlayer)
            local varStr = "你获得了物品：@item_"..x300340_var_QuestPropertyId;
    		StartTalkTask( varMap)
    		TalkAppendString( varMap, varStr);
    		StopTalkTask( varMap);
    		DeliverTalkTips( varMap, varPlayer);
            

            
            GamePlayScriptLog( varMap, varPlayer, 441)
        end
    else
        
        x300340_QuestComplate( varMap, varPlayer, varTalknpc, varQuest)
    end
end

function x300340_QuestLogRefresh( varMap, varPlayer, varQuest)
    x300340_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300340_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestId)
    local taritem = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetItemId)
    local strItem = ""
    local strPalace = ""
    local strMonster = ""
    for varI, item in x300340_var_QuestTable do
        if item.varItem == taritem then
            strItem = item.itemName
            strPalace = item.placeName
            strMonster = item.monsterName
            break
        end
    end

    
    local itemSize = GetItemCount( varMap, varPlayer, taritem)
    if itemSize >= x300340_var_FinishCount then
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestId)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
    end

    StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x300340_var_QuestName,          
                                format( x300340_var_strQuestTarget, strPalace, taritem, itemSize),     
                                x300340_var_NPC,                  
                                format(x300340_var_QuestProcess, strPalace, taritem),          
                                format( x300340_var_QuestDescription, strPalace, strMonster, taritem, strPalace),   
                                x300340_var_QuestHelp )          
    local varExp = GetLevel( varMap, varPlayer) * x300340_var_ExperienceCoefficient
    AddQuestExpBonus( varMap, varExp)
    
    local playerLevel = GetLevel( varMap, varPlayer)
    if playerLevel > 80 then
        playerLevel = 80
    end
    local money = playerLevel * x300340_var_MoneyCoefficient
    AddQuestMoneyBonus1( varMap, money)

    StopTalkTask()
    DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end

function x300340_Accept( varMap, varPlayer, varQuest )
	return -1
end



function x300340_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
    
    if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return
    end
    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestId)
    
    local misScene = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetScene)
    
    
    
    if misScene == varMap then
        
        local bUseFanqi = 0
        
        local curTime = GetCurrentTime()

        
        local useItemArray = {}
        
        local nearteamnum = GetNearTeamCount( varMap, varPlayer)
        local useTime = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_var_MP_UseTime)
        if nearteamnum <= 1 and curTime - useTime < x300340_var_FanqiTime then
            useItemArray[ 1] = varPlayer
        else
            for varI = 0, nearteamnum - 1 do
                
                local memberId = GetNearTeamMember( varMap, varPlayer, varI)

                if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                    
                    local mIndex = GetQuestIndexByID( varMap, memberId, x300340_var_QuestId)
                    if mIndex >= 0 then
                        local useitem = GetQuestParam( varMap, memberId, mIndex, x300340_var_MP_UseTime)
                        if curTime - useitem < x300340_var_FanqiTime then
                            useItemArray[ varI + 1] = memberId
                        end
                    end
                end
            end
        end

        
        for varI, varId in useItemArray do
            
            local varX, z = GetWorldPos( varMap, varObj)
            local mIndex = GetQuestIndexByID( varMap, varId, x300340_var_QuestId)
            
            local ux = GetQuestParam( varMap, varId, mIndex, x300340_var_MP_PosX)
            local uz = GetQuestParam( varMap, varId, mIndex, x300340_var_MP_PosZ)
            
            
            if ux ~= 0 and uz ~= 0 then
                
                
                if abs( varX - ux) < x300340_var_Range and abs( z - uz) < x300340_var_Range then
                    
                    bUseFanqi = 1
                    break
                end
            end
        end

        
        local DropItem = 0
        if bUseFanqi == 1 then
            
            DropItem = 1
        else
            
            local temp = random( 1, 100)
            
            if temp > 45 and temp <= 55 then
                DropItem = 1
            end
        end

        
        local toGiveItem = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetItemId)

        
        if DropItem == 1 then
            if nearteamnum <= 1 then   
                local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestId)
                if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
                    StartItemTask( varMap)
                    ItemAppend( varMap, toGiveItem, 1)
                    local result = StopItemTask( varMap, varPlayer)
                    if result == 0 then
                		StartTalkTask( varMap)
                		TalkAppendString( varMap, "背包已满，无法得到任务物品" )
                		StopTalkTask( varMap)
                		DeliverTalkTips( varMap, varPlayer)
                        return
                    end
                    DeliverItemListSendToPlayer( varMap, varPlayer)
                    local varStr = "#Y你获得了物品：#G#{_ITEM"..toGiveItem.."}";
                    StartTalkTask( varMap)
                    TalkAppendString( varMap, varStr.."#Y ("..GetItemCount(varMap, varPlayer, toGiveItem).."/"..x300340_var_FinishCount..")" )
                    StopTalkTask( varMap)
                    DeliverTalkTips( varMap, varPlayer )
                    
                    x300340_ProcQuestLogRefresh( varMap, varPlayer, x300340_var_QuestId)
                end
            else  
                local varCount = 1
                local arrMember = {}
                
                for varI = 0, nearteamnum - 1 do
                    
                    local memberId = GetNearTeamMember( varMap, varPlayer, varI)
                    if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
                        local varQuestIdx = GetQuestIndexByID( varMap, memberId, x300340_var_QuestId)
                        if IsHaveQuestNM( varMap, memberId, x300340_var_QuestId) ~= 0 and GetQuestParam( varMap, memberId, varQuestIdx, 7) == 0 then 
                            arrMember[ varCount] = memberId
                            varCount = varCount + 1
                        end
                    end
                end
                if varCount == 1 then
                    
                    return
                end
                
                local varI = random( 1, getn( arrMember) )
                local varQuestIdx = GetQuestIndexByID( varMap, arrMember[ varI], x300340_var_QuestId)
                toGiveItem = GetQuestParam( varMap, arrMember[ varI], varQuestIdx, x300340_var_MP_TargetItemId)
                StartItemTask( varMap)
                ItemAppend( varMap, toGiveItem, 1)
                local result = StopItemTask( varMap, arrMember[ varI] )
                if result == 0 then
                    StartTalkTask( varMap)
                    TalkAppendString( varMap, "背包已满，无法得到任务物品" )
                    StopTalkTask( varMap)
                    DeliverTalkTips( varMap, arrMember[ varI] )
                    return
                end
                DeliverItemListSendToPlayer( varMap, arrMember[ varI] )
                local varStr = "#Y你获得了物品：#G#{_ITEM"..toGiveItem.."}";
                StartTalkTask( varMap)
                TalkAppendString( varMap,  varStr.."#Y ("..GetItemCount(varMap, arrMember[ varI], toGiveItem).."/"..x300340_var_FinishCount..")" )
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, arrMember[ varI] )
                
                x300340_ProcQuestLogRefresh( varMap, arrMember[ varI], x300340_var_QuestId)
            end
            
            
            
        end
    end
end


function x300340_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	return 0
end

function x300340_QuestComplateInfo( varMap, varPlayer, varTalknpc)
	
	StartTalkTask( varMap)
	TalkAppendString( varMap, "#Y"..x300340_var_QuestName.."#W\n\t谢谢你，你简直是草原的制霸者，我为你而骄傲！" )
    local varExp = GetLevel( varMap, varPlayer) * x300340_var_ExperienceCoefficient
    if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end
    
    local playerLevel = GetLevel( varMap, varPlayer)
    if playerLevel > 80 then
        playerLevel = 80
    end
    local money = playerLevel * x300340_var_MoneyCoefficient
    AddQuestMoneyBonus1( varMap, money)
	StopTalkTask( varMap)
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300340_var_ScritpId, x300340_var_QuestId)
end

function x300340_QuestComplate( varMap, varPlayer, varTalknpc, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestId)
    local varItem = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetItemId)
    
    local varItemCount = GetItemCountInBag( varMap, varPlayer, varItem)
    
    local playerLevel = GetLevel( varMap, varPlayer)
    DelQuest( varMap, varPlayer, varQuest)
    
    local xp = x300340_var_ExperienceCoefficient * playerLevel
    if DelItem( varMap, varPlayer, varItem, varItemCount) ~= 1 then return 0 end
    AddExp( varMap, varPlayer, xp)
    
    if playerLevel > 80 then
        playerLevel = 80
    end
    local money = playerLevel * x300340_var_MoneyCoefficient
    AddMoney( varMap, varPlayer, 1, money)

    StartTalkTask( varMap)
    TalkAppendString( varMap, x300340_var_strQuestComplete)
    StopTalkTask( varMap)
    DeliverTalkTips( varMap, varPlayer)
    Msg2Player( varMap, varPlayer, x300340_var_strQuestComplete, 8, 2)

    Msg2Player( varMap, varPlayer, format( "获得#R经验%d点#cffcf00的奖励", xp), 8, 2)
    StartTalkTask( varMap)
    TalkAppendString( varMap, format( "获得#R经验%d点#cffcf00的奖励", xp) )
    StopTalkTask( varMap)
    DeliverTalkTips( varMap, varPlayer)

    Msg2Player( varMap, varPlayer, format( "获得#R银卡#{_MONEY%d}#cffcf00的奖励", money), 8, 3)
    Msg2Player( varMap, varPlayer, format( "获得#R银卡#{_MONEY%d}#cffcf00的奖励。", money), 8, 2)

    
    local varToday = GetDayOfYear()
    x300340_SetAcceptTime( varMap, varPlayer, varToday)

    
    GamePlayScriptLog( varMap, varPlayer, 442)
end


function x300340_GetAcceptTime( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_GUJI_ACCEPTTIME[ 1], MD_GUJI_ACCEPTTIME[ 2], MD_GUJI_ACCEPTTIME[ 3] )
end

function x300340_SetAcceptTime( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_GUJI_ACCEPTTIME[ 1], MD_GUJI_ACCEPTTIME[ 2], MD_GUJI_ACCEPTTIME[ 3], value)
end

function x300340_ProcQuestAbandon( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestId)
    local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_var_MP_TargetItemId)
    local varCount = GetItemCountInBag( varMap, varPlayer, varId)
    if varCount > 0 then
        if DelItem( varMap, varPlayer, varId, varCount) ~= 1 then return 0 end
    end

	local varRet = 0
	local varQuestName = GetQuestNameNM( varMap, varPlayer, x300340_var_QuestId)
	varRet = DelQuestNM( varMap, varPlayer, x300340_var_QuestId)
	if varRet == 1 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, x300340_var_strQuestAbandon);
		StopTalkTask( varMap);
		DeliverTalkTips( varMap, varPlayer);
		Msg2Player( varMap, varPlayer, x300340_var_strQuestAbandon, 8, 2)
	end

    local varToday = GetDayOfYear()

    x300340_SetAcceptTime( varMap, varPlayer, varToday)
end

function x300340_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end

function x300340_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end
