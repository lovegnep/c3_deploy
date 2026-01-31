--DECLARE_QUEST_INFO_START--

x300565_var_FileId 					= 300565                  
x300565_var_QuestId 				= 9302                    

x300565_var_QuestKind 				= 2                       
x300565_var_LevelLess				= 40                      

x300565_var_QuestName				= "【个人】相国寺比武"                                        
x300565_var_QuestTarget				= "  找到@npc_%d"      
x300565_var_QuestInfo				= "\t我们大相国寺正在召集天下武林人士，召开武林大会，推选新一届的武林盟主。\n\t这位施主看来武功不凡，若你也想参加这武林大会，可以去找我寺主持@npc_%d。"            
x300565_var_QuestInfo1	            = "\t阿弥陀佛。\n\t施主也是来参加这武林大会的？我观施主目有精光，显然是内功深湛之人，你可先去和@npc_%d切磋一番。"
x300565_var_ContinueInfo			= "\t施主为何还在此徘徊，莫非心生胆怯？"  
x300565_var_QuestCompleted			= "\t如今这武林中果然是英才辈出啊，想不到这么快施主就得胜归来，恭喜施主了。\n\t武林大会举办之日，还请施主定要光临本寺。"  
x300565_var_QuestHelp				= ""          

x300565_var_strQuestAbandon         = "您放弃了任务：【个人】相国寺比武"


x300565_var_ExtTarget				= { {type=20,n=1,target=""} }



x300565_var_ExpBonus				= 0             
x300565_var_BonusItem				= {}	

x300565_var_BonusMoney1             = 0  
x300565_var_BonusMoney2             = 0  
x300565_var_BonusMoney3             = 0  
x300565_var_BonusMoney4             = 0  
x300565_var_BonusMoney5             = 0  
x300565_var_BonusMoney6             = 0  

x300565_var_BonusChoiceItem         = {}


--DECLARE_QUEST_INFO_STOP--




x300565_MP_FINDMASTER               = 1 
x300565_MP_TARGETINDEX              = 2 
x300565_MP_ISCOMPLETE				= 7	

x300565_var_strQuestFull            = "任务已满，任务接受失败"
x300565_var_strQuestAccept          = "您接受了任务：【个人】相国寺比武"
x300565_var_strQuestBook            = "\t@npc_139300就在大相国寺内等待各路武林英豪，少侠还是快快前往吧。"
x300565_var_strMonsterHasCreated    = "\t方才那位少侠已经在挑战，#g你可以与他一起和我切磋#w，放心，我并不担心你们倚多为胜。"
x300565_var_strMonsterCreated       = "\t智障大师让你来的？\n\t好的，我就和你切磋一番，不必担心，我只会使出二成内力。"
x300565_var_strQuestFinished        = "你完成了任务：【个人】相国寺比武"
x300565_var_strQuestRefrain         = "很抱歉，你今天已经做过此任务，不能再次领取。"
x300565_var_strQuestTarget2         = "\t战胜#G%s#W(%d/1)"
x300565_var_strQuestInfo2           = "\t和@npc_%d切磋武艺"
x300565_var_strQuestInfo3           = "\t战胜#S%s"
x300565_var_strQuestBook1           = "\t回复@npc_139300"

x300565_var_AcceptQuestLogID        = 931

x300565_var_FinishQuestLogID        = 932

x300565_var_TargetNPC               = 139300

x300565_var_QuestNPC                = 139116

x300565_var_QuestReply              = "@npc_139300"

x300565_var_Range                   = 20

x300565_var_CoffCredit              = 0

x300565_var_TargetNPCList           = {
                                        { varId = 139323, monsterId = 0, constId = 1056, bornTime = -1, varName = "何足道" }, 
                                        { varId = 139326, monsterId = 0, constId = 1052, bornTime = -1, varName = "风陵师太"}, 
                                        { varId = 139320, monsterId = 0, constId = 1050, bornTime = -1, varName = "张三丰" }, 
                                        { varId = 139331, monsterId = 0, constId = 1051, bornTime = -1, varName = "郭破虏" }, 
                                        { varId = 139338, monsterId = 0, constId = 1054, bornTime = -1, varName = "铁中堂" }, 
                                        { varId = 139341, monsterId = 0, constId = 1053, bornTime = -1, varName = "西门君临" }, 
                                        { varId = 139346, monsterId = 0, constId = 1055, bornTime = -1, varName = "陈铁志" }, 
}

x300565_var_IsEnableId              = 1004

x300565_var_RewardTable             = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}



function x300565_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetLevel( varMap, varPlayer) < x300565_var_LevelLess then
        return 0
    end

    local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
    if varTalkNpcGUID == x300565_var_TargetNPC then
        return 0
    end
    if IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) > 0 then
        return 0
    end
    TalkAppendButton( varMap, x300565_var_QuestId, x300565_var_QuestName, GetQuestStateNM( varMap, varPlayer, varTalknpc, x300565_var_QuestId), 1)
end




function x300565_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExtIdx)
    if GetGameOpenById( x300565_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) == 0 then
        x300565_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
        return
    end
    
	if IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) > 0 then  
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300565_var_QuestId)
        local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
        local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300565_MP_TARGETINDEX)
        if varTalkNpcGUID == x300565_var_QuestNPC then
            local varDone = x300565_CheckSubmit( varMap, varPlayer, varTalknpc)
            if varDone > 0 then
                x300565_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
            else
                x300565_DispatchContinueInfo( varMap, varPlayer, varTalknpc) 
            end
        elseif varTalkNpcGUID == x300565_var_TargetNPC then
            local varDone = x300565_CheckSubmit( varMap, varPlayer, varTalknpc)
            if varDone > 0 then
                x300565_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
            else
                if GetQuestParam( varMap, varPlayer, varQuestIdx, x300565_MP_FINDMASTER) == 0 then
	                
	                local index1 = random( 1, getn( x300565_var_TargetNPCList) )
	                local varTalkNpcGUID = x300565_var_TargetNPCList[ index1].varId
	                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300565_MP_TARGETINDEX, index1)
	                StartTalkTask( varMap)
	                    TalkAppendString( varMap, "#Y"..x300565_var_QuestName)
	                    TalkAppendString( varMap, format( x300565_var_QuestInfo1, varTalkNpcGUID) )
	                    TalkAppendString( varMap, " ")
	                    TalkAppendString( varMap, "#Y任务目标：")
	                    TalkAppendString( varMap, format( x300565_var_QuestTarget, varTalkNpcGUID) )
	                    TalkAppendString( varMap, " ")
	                StopTalkTask( varMap)
	                DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300565_MP_FINDMASTER, 1)
	                x300565_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
                else
                	x300565_DispatchContinueInfo( varMap, varPlayer, varTalknpc) 
                end
            end
        elseif varIndex ~= 0 then
            if varTalkNpcGUID ~= x300565_var_TargetNPCList[ varIndex].varId then
                return
            end
            if x300565_var_TargetNPCList[ varIndex].monsterId == 0 then
                StartTalkTask( varMap)
                    TalkAppendString( varMap, x300565_var_strMonsterCreated)
                StopTalkTask( varMap)
                DeliverTalkMenu( varMap, varPlayer, varTalknpc)

                local varX, z = GetWorldPos( varMap, varTalknpc)
                
                x300565_var_TargetNPCList[ varIndex].monsterId = CreateMonster( varMap, x300565_var_TargetNPCList[ varIndex].constId, varX + random( -2, 2), z + random( -2, 2), 1, 0, x300565_var_FileId, -1, 21, 1200000)
                if x300565_var_TargetNPCList[ varIndex].monsterId >= 0 then
                    x300565_var_TargetNPCList[ varIndex].bornTime = GetMinOfDay()
                end
            else
                
                local liveTime = 0
                if GetMinOfDay() < x300565_var_TargetNPCList[ varIndex].bornTime then
                    liveTime = GetMinOfDay() + 1440 - x300565_var_TargetNPCList[ varIndex].bornTime
                else
                    liveTime = GetMinOfDay() - x300565_var_TargetNPCList[ varIndex].bornTime
                end
                if liveTime >= 20 then
                    
                    StartTalkTask( varMap)
                        TalkAppendString( varMap, x300565_var_strMonsterCreated)
                    StopTalkTask( varMap)
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)

                    local varX, z = GetWorldPos( varMap, varTalknpc)
                    
                    x300565_var_TargetNPCList[ varIndex].monsterId = CreateMonster( varMap, x300565_var_TargetNPCList[ varIndex].constId, varX + random( -2, 2), z + random( -2, 2), 1, 0, x300565_var_FileId, -1, 21, 1200000)
                    if x300565_var_TargetNPCList[ varIndex].monsterId >= 0 then
                        x300565_var_TargetNPCList[ varIndex].bornTime = GetMinOfDay()
                    end
                else
                    StartTalkTask( varMap)
                        TalkAppendString( varMap, x300565_var_strMonsterHasCreated)
                    StopTalkTask( varMap)
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                end
            end
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300565_MP_FINDMASTER, 2)
            x300565_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
        end
	else
		x300565_DispatchQuestInfo( varMap, varPlayer, varTalknpc)	
	end
end




function x300565_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId)
	if( varHaveQuest > 0) then
		return 0;
	else
		return 1;
	end
end




function x300565_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)

    local varName = GetName( varMap, varPlayer)
    if IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) > 0 then
    else
        local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
        if varTalkNpcGUID ~= x300565_var_QuestNPC then
            return 0
        end
        local varToday = GetDayOfYear()
        if x300565_GetQuestDate( varMap, varPlayer) == varToday then
            Msg2Player( varMap, varPlayer, x300565_var_strQuestRefrain, 8, 3)
            return 0
        end
        
        
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x300565_var_QuestId  )
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
        
        if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[ 1], MD_RICHANG_DAY[ 2], MD_RICHANG_DAY[ 3] ) == GetDayOfYear() then
            if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[ 1], MD_RICHANG_COUNT[ 2], MD_RICHANG_COUNT[ 3] ) >= 3 then
                Msg2Player( varMap, varPlayer, "你不能再领取今天的日常任务了", 8, 3)
                return 0
            end
        else
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 0)
        end

        local varRet = AddQuest( varMap, varPlayer, x300565_var_QuestId, x300565_var_FileId, 0, 0, 0, 1)
        if varRet == 0 then
            LuaScenceM2Player( varMap, varPlayer, x300565_var_strQuestFull, varName, 3, 1)
            return 0
        else
            
            LuaScenceM2Player( varMap, varPlayer, x300565_var_strQuestAccept, varName, 3, 1)
            LuaScenceM2Player( varMap, varPlayer, x300565_var_strQuestAccept, varName, 2, 1)
        end

        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300565_var_QuestName)
            TalkAppendString( varMap, x300565_var_strQuestBook)
        StopTalkTask( varMap)
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)

        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300565_var_QuestId)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)

        
        GamePlayScriptLog( varMap, varPlayer, x300565_var_AcceptQuestLogID)
    end
end


function x300565_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end


function x300565_ProcQuestAbandon( varMap, varPlayer, varQuest)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x300565_var_QuestId)
	if varHaveQuest > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300565_var_QuestId)
		DelQuest( varMap, varPlayer, x300565_var_QuestId)
		
        
        local varToday = GetDayOfYear()
        SetPlayerGameData( varMap, varPlayer, MD_WULINDAHUI_DATE[ 1], MD_WULINDAHUI_DATE[ 2], MD_WULINDAHUI_DATE[ 3], varToday)
		if varToday == GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3] ) then
            local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
            if varCount < 3 then
                SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1 + varCount)
            end
        else
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3], varToday)
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1)
        end

		Msg2Player( varMap, varPlayer, x300565_var_strQuestAbandon, 8, 3)
		Msg2Player( varMap, varPlayer, x300565_var_strQuestAbandon, 8, 2)
	end
end




function x300565_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300565_var_QuestId)

    if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
        return 1
    else
        return 0
    end
end




function x300565_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick)
	
	if x300565_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x300565_var_BonusMoney1 )
	    Msg2Player(varMap,varPlayer,format("获得银卡#{_MONEY%d}的奖励。", x300565_var_BonusMoney1),4,2)
	end

	
	if x300565_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x300565_var_BonusMoney2 )
	    Msg2Player(varMap,varPlayer,format("获得银币#{_MONEY%d}的奖励。", x300565_var_BonusMoney2),4,2)
	end

	
	if x300565_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x300565_var_BonusMoney3 )
	    Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x300565_var_BonusMoney3),4,2)
	end

	
	if x300565_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x300565_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
		Msg2Player(varMap,varPlayer,format("获得江湖声望%d的奖励。", x300565_var_BonusMoney4),4,2)
	end

	
	if x300565_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x300565_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,format("获得朝廷声望%d的奖励。", x300565_var_BonusMoney5),4,2)
	end

	
	if x300565_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x300565_var_BonusMoney6)
		Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x300565_var_BonusMoney6),4,2)
	end

 	
	for varI, item in x300565_var_BonusItem do
 		StartItemTask(varMap)
		ItemAppend( varMap, item.item, item.n )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
    end

	
	for varI, item in x300565_var_BonusChoiceItem do
	    if item.item == varButtonClick then
	        StartItemTask(varMap)
			ItemAppend( varMap, item.item, item.n )
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

			
			return
		end
    end
end




function x300565_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
    if GetGameOpenById( x300565_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) == 0 then
        return
    end

	if IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) <= 0 then
        return 0
    end
    
    local varToday = GetDayOfYear()
    local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
    if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
        Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
        return 0
    end

    -- find item index
    local index = 0
    for i, item in x300565_var_RewardTable do
        for j, iter in item.items do
            if varRadioSelected == iter.varId then
                index = j
                break
            end
        end
        if index ~= 0 then
            break
        end
    end
    
	local varLevel = GetLevel( varMap, varPlayer)
    local varCanBind = 0
    local varCount = 0
    local varId = 0
    if index <= 2 or index  ==5 then
        varCanBind = 1
    end
    for varI, item in x300565_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        DelQuest( varMap, varPlayer, x300565_var_QuestId)
        local strLog = format( "DayCommon: Error in 300565! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
        WriteLog( 1, strLog)
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

        Msg2Player( varMap, varPlayer, format( "您获得了物品：@itemid_%d",varId), 8, 3)
	else
        Msg2Player( varMap, varPlayer, "背包空间不足，无法获得任务奖励物品，交任务失败", 8, 3)
        return 0
	end
    LuaCallNoclosure( 256225, "Finishbiwu", varMap, varPlayer)
    LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300565_var_QuestId)
    DelQuest( varMap, varPlayer, x300565_var_QuestId)
    local varName = GetName( varMap, varPlayer)
    LuaScenceM2Player( varMap, varPlayer, x300565_var_strQuestFinished, varName, 3, 1)
    LuaScenceM2Player( varMap, varPlayer, x300565_var_strQuestFinished.."。", varName, 2, 1)
    x300565_SetQuestDate( varMap, varPlayer, GetDayOfYear() )
    GamePlayScriptLog( varMap, varPlayer, x300565_var_FinishQuestLogID)
		if varLevel >=60 then 
		  if random( 1, 100) <= 20 then
				local bai = 12030143
				local bai80 = 12030144
				StartItemTask( varMap)
				if varLevel >=80 then
					bai = bai80
				end	
				ItemAppendBind( varMap, bai, 1)	
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
				else
					Msg2Player( varMap, varPlayer, "无法获得额外奖励物品，请整理背包", 8, 3)
				end    
		 	end	        
		end
		--送精致的水晶
		if varLevel >= 40 and varLevel < 60 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000206, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的国传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end 
		elseif varLevel > 59 and varLevel <80 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000207, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的神传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end
		elseif varLevel > 79 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000208, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的天传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end
		end
	    
end




function x300565_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)

    
    TalkAppendString( varMap, "#Y"..x300565_var_QuestName)
    TalkAppendString( varMap, format( x300565_var_QuestInfo, x300565_var_TargetNPC) )
    TalkAppendString( varMap, " ")

    
    TalkAppendString( varMap, "#Y任务目标：")
    TalkAppendString( varMap, format( x300565_var_QuestTarget, x300565_var_TargetNPC) )
    TalkAppendString( varMap, " ")

    
    if x300565_var_QuestHelp ~= "" then
        TalkAppendString( varMap, "#Y任务提示：")
        TalkAppendString( varMap, x300565_var_QuestHelp)
        TalkAppendString( varMap, " ")
    end                 

    
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300565_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end

	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300565_var_FileId, x300565_var_QuestId)
end




function x300565_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300565_var_QuestName)
    TalkAppendString( varMap, x300565_var_ContinueInfo)
    TalkAppendString( varMap, " ")
    local playerLevel = GetLevel( varMap, varPlayer)
    
        
    
    
        
    
    
    
    
    
    
	StopTalkTask( varMap)
	DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	
end




function x300565_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
    if IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) > 0 then
        StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x300565_var_QuestName)
        TalkAppendString( varMap, x300565_var_QuestCompleted)
        TalkAppendString( varMap, " ")
        local varLevel = GetLevel(varMap, varPlayer)
        for varI, item in x300565_var_RewardTable do
            if varLevel >= item.minLevel and varLevel < item.maxLevel then
                for j, iter in item.items do
                    AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
                end
                break
            end
        end
        StopTalkTask()
        DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300565_var_FileId, x300565_var_QuestId)
    else
        StartTalkTask( varMap)
            TalkAppendString( "你身上无此任务！" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    end
end




function x300565_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end

function x300565_ProcDie( varMap, varPlayer, varKiller)
    
    local varIndex = 0
    for varI, item in x300565_var_TargetNPCList do
        if varPlayer == item.monsterId then
            varIndex = varI
        end
    end
    if varIndex == 0 then
        return
    else
        x300565_var_TargetNPCList[ varIndex].monsterId = 0
    end

    if GetGameOpenById( x300565_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) == 0 then
        return
    end

    
    local varX, z = GetWorldPos( varMap, varPlayer)
    
    local humanCount = GetScenePlayerCount( varMap)
    for varI = 0, humanCount - 1 do
        local humanId = GetScenePlayerObjId( varMap, varI)
        if humanId >= 0 and IsPlayerStateNormal( varMap, humanId) == 1 and IsHaveQuestNM( varMap, humanId, x300565_var_QuestId) > 0 then
            
            local playerx, playerz = GetWorldPos( varMap, humanId)
            if abs( varX - playerx) <= x300565_var_Range and abs( z - playerz) <= x300565_var_Range and GetHp( varMap, humanId) > 0 then
                local varQuestIdx = GetQuestIndexByID( varMap, humanId, x300565_var_QuestId)
                if GetQuestParam( varMap, humanId, varQuestIdx, x300565_MP_TARGETINDEX) == varIndex and GetQuestParam( varMap, humanId, varQuestIdx, 0) == 0 then
                    SetQuestByIndex( varMap, humanId, varQuestIdx, 7, 1)
                    SetQuestByIndex( varMap, humanId, varQuestIdx, 0, 1)
                    Msg2Player( varMap, humanId, "任务已完成，快去找智障禅师交任务吧", 8, 3)
                    x300565_ProcQuestLogRefresh( varMap, humanId, x300565_var_QuestId)
                end
            end
        end
    end
end




function x300565_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
end




function x300565_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
    if GetGameOpenById( x300565_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) == 0 then
        return
    end

    if IsHaveQuestNM( varMap, varPlayer, x300565_var_QuestId) > 0 then
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300565_var_QuestId)
        local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300565_MP_TARGETINDEX)
        if varIndex ~= 0 and varTalkNpcGUID == x300565_var_TargetNPCList[ varIndex].varId and GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 0 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
            TalkAppendButton( varMap, x300565_var_QuestId, "我要挑战", 13, 3)
        elseif varTalkNpcGUID == x300565_var_TargetNPC and GetQuestParam( varMap, varPlayer, varQuestIdx, x300565_MP_FINDMASTER) == 0 then
            TalkAppendButton( varMap, x300565_var_QuestId, "相国寺比武", 13, 2)
        elseif varTalkNpcGUID == x300565_var_TargetNPC then
            TalkAppendButton( varMap, x300565_var_QuestId, x300565_var_QuestName, GetQuestStateNM( varMap, varPlayer, varTalknpc, x300565_var_QuestId), 4)
        end
    end
end

function x300565_GetQuestDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_WULINDAHUI_DATE[ 1], MD_WULINDAHUI_DATE[ 2], MD_WULINDAHUI_DATE[ 3] )
end

function x300565_SetQuestDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_WULINDAHUI_DATE[ 1], MD_WULINDAHUI_DATE[ 2], MD_WULINDAHUI_DATE[ 3], value)
end




function x300565_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300565_var_QuestId)
    local strTarget = ""
    local strDetail = ""
    local strGonglue = x300565_var_strQuestBook
    local findNPC = GetQuestParam( varMap, varPlayer, varQuestIdx, x300565_MP_FINDMASTER)
	StartTalkTask( varMap)
    if findNPC == 2 then
        local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300565_MP_TARGETINDEX)
        if x300565_var_TargetNPCList[ varIndex].monsterId == 0 then
            if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
                strTarget = format( x300565_var_strQuestTarget2, x300565_var_TargetNPCList[ varIndex].varName, 1)
                strDetail = x300565_var_strQuestBook1
                strGonglue = x300565_var_strQuestBook1
            else
                
                strTarget = format( x300565_var_QuestTarget, x300565_var_TargetNPCList[ varIndex].varId)
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300565_MP_FINDMASTER, 1)
            end
        else
            
            strTarget = format( x300565_var_strQuestTarget2, x300565_var_TargetNPCList[ varIndex].varName, 0)
            strDetail = format( x300565_var_strQuestInfo3, x300565_var_TargetNPCList[ varIndex].varName)
            strGonglue = format( x300565_var_strQuestInfo2, x300565_var_TargetNPCList[ varIndex].varId)
        end
    elseif findNPC == 1 then
        
        local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300565_MP_TARGETINDEX)
        strTarget = format( x300565_var_QuestTarget, x300565_var_TargetNPCList[ varIndex].varId)
        strDetail = format( x300565_var_QuestInfo1, x300565_var_TargetNPCList[ varIndex].varId)
        strGonglue = format( x300565_var_strQuestInfo2, x300565_var_TargetNPCList[ varIndex].varId)
    elseif findNPC == 0 then
        
        strTarget = format( x300565_var_QuestTarget, x300565_var_TargetNPC)
        strDetail = format( x300565_var_QuestInfo, x300565_var_TargetNPC)
    end
    AddQuestLogCustomText( varMap,
                           x300565_var_QuestName,               
                           x300565_var_QuestName,               
                           strTarget,                           
                           x300565_var_QuestReply,              
                           strGonglue,            
                           strDetail,               
                           x300565_var_QuestHelp)               
    
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300565_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
end
