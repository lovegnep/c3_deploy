--DECLARE_QUEST_INFO_START--

x300566_var_FileId 					= 300566                  
x300566_var_QuestId 				= 9310                    

x300566_var_QuestKind 				= 2                       
x300566_var_LevelLess					= 40                      

x300566_var_QuestName				= "【个人】生死财神"                                        
x300566_var_QuestTarget				= "  找到@npc_140006"      
x300566_var_QuestInfo				= "\t近日，帮主沈万三得了一种怪病，整日昏迷不醒。各路名医请了无数，无人能说清这究竟是何种病症。\n\t今日，代帮主@npc_140006，出重金请了神医胡青牛前往盐帮诊治，也不知现在情况如何，真是让人心急啊。"            
x300566_var_ContinueInfo				= "\t难道你也对找来这几味药引束手无策？这可如何是好。"  
x300566_var_QuestCompleted			= "\t这么快你就找齐了所有的药引？我大哥有救了！\n\t#y@myname#w，这次多亏你的相助，这是我盐帮的一点小小心意，还望不要推辞。"  
x300566_var_QuestHelp				= "#W@npc_140006就在大都东南方的盐帮总舵内。本任务所需要的物品，您可以通过#G生活技能#W制作得来，也可以向其他玩家购买。"          

x300566_var_strQuestAbandon         = "您放弃了任务：【个人】生死财神"


x300566_var_ExtTarget					= { {type=20,n=1,target=""} }



x300566_var_ExpBonus					= 0             
x300566_var_BonusItem					= {}	

x300566_var_BonusMoney1               = 0  
x300566_var_BonusMoney2               = 0  
x300566_var_BonusMoney3               = 0  
x300566_var_BonusMoney4               = 0  
x300566_var_BonusMoney5               = 0  
x300566_var_BonusMoney6               = 0  

x300566_var_BonusChoiceItem           = {}
x300566_var_GroupPoint	=	{ {type=10,varId =188,target = "木槿"},{type=10,varId =189,target = "水荷"},{type=10,varId =190,target = "白术"},{type=10,varId =191,target = "桑枝"},{type=10,varId =192,target = "玄石"}}



--DECLARE_QUEST_INFO_STOP--


x300566_MP_GETSUBMISSION            = 1 
x300566_MP_ITEM1                    = 2
x300566_MP_ITEM2                    = 3
x300566_MP_ITEM3                    = 4
x300566_MP_ITEM4                    = 5
x300566_MP_ITEMINDEX                = 6
x300566_MP_ISCOMPLETE				= 7	

x300566_var_strQuestFull            = "任务已满，任务接受失败"
x300566_var_strQuestAccept          = "您接受了任务：【个人】生死财神"
x300566_var_strQuestBook            = "\t听说那神医胡青牛给人医治，从不多话，诊断完开出一副古怪的药方，即飘然离去。\n\t更为神奇的是，只要给病人按药方配药服下，无不药到病除。"
x300566_var_strSubQuestInfo         = "\t方才那神医胡青牛已经给帮主诊断过，不过他并未说帮主得的是何种病症，只是开了张药方就离去。\n\t这药方中共有八种珍奇的物事，饶是我盐帮富甲天下，仍有四种不知能从何处得来。"
x300566_var_strQuestFinished        = "你完成了任务：【个人】生死财神"
x300566_var_strQuestRefrain         = "你今天已经做过这个任务，请明天再来吧。"
x300566_var_strQuestTarget2         = "\t收集@item_%d#W(%d/1)"

x300566_var_AcceptQuestLogID        = 941

x300566_var_FinishQuestLogID        = 942

x300566_var_TargetNPC                 = 140006

x300566_var_QuestNPC                = 139083

x300566_var_QuestReply              = "@npc_140006"

x300566_var_ItemTable                 = {
                                        { mp = x300566_MP_ITEM1, 
                                            itemlist = { 12020001,12020002,12020003,12020004,12020005,12020006 }, 
                                        },       
                                        { mp = x300566_MP_ITEM2, 
                                            itemlist = { 14030001,14030006,14030011,12052471,12052481,12052491}, 
                                        },       
                                        { mp = x300566_MP_ITEM3, 
                                            itemlist = { 12052531,11041030,11041040,11041010,11041000,11041050 }, 
                                        },       
                                        { mp = x300566_MP_ITEM4, 
                                            itemlist =  { 10260040,10250040,10230040,10200040,10280040,10290040 },  
                                        },       
}

x300566_var_UsePositionX              = 100
x300566_var_UsePositionZ              = 100

x300566_var_CoffExp                   = 0

x300566_var_CoffMoney                 = 500

x300566_var_strQuestItem1Target     = "  收集@item_%d#W(%d/1)\n"

x300566_var_strQuestItem2Target     = "  收集@item_%d#W(%d/1)\n"

x300566_var_strQuestItem3Target     = "  收集@item_%d#W(%d/1)\n"

x300566_var_strQuestItem4Target     = "  收集@item_%d#W(%d/1)"

x300566_var_strGetItem                = "你获得了@item_%d#cffcf00"

x300566_var_strGongLue2               = "找到四种药引"

x300566_var_strQuestDescription2    = "救人如救火，看来你要赶紧去帮@npc_140006找到这四种罕见的药引了。"

x300566_var_strGongLue3               = "将药交给@npc_140006。"

x300566_var_strQuestDescription3    = "终于配齐了药引，还是快去交给@npc_140006吧。"

x300566_var_IsEnableId                = 1005

x300566_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
                                
}




function x300566_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)

    if GetLevel( varMap, varPlayer) < x300566_var_LevelLess then
        return 0
    end
    if IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) > 0 then
        return 0
    end

    TalkAppendButton( varMap, x300566_var_QuestId, x300566_var_QuestName, GetQuestStateNM( varMap, varPlayer, varTalknpc, x300566_var_QuestId), 1)
end




function x300566_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExtIdx)

    if GetGameOpenById( x300566_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) == 0 then
        x300566_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
        return
    end

	if IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) > 0 then  
        local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
        if varTalkNpcGUID == x300566_var_QuestNPC then
            local varDone = x300566_CheckSubmit( varMap, varPlayer, varTalknpc)
            if varDone > 0 then
                x300566_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
            else
                x300566_DispatchContinueInfo( varMap, varPlayer, varTalknpc) 
            end
        elseif varTalkNpcGUID == x300566_var_TargetNPC then
            local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300566_var_QuestId)
            if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 0 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 then
                if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_GETSUBMISSION) == 1 then
                    x300566_DispatchContinueInfo( varMap, varPlayer, varTalknpc) 
                else
                    StartTalkTask( varMap)
                        TalkAppendString( varMap, "#Y"..x300566_var_QuestName)
                        TalkAppendString( varMap, x300566_var_strSubQuestInfo)
                    StopTalkTask( varMap)
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)

                    
                    local varIndex = random( 1, getn( x300566_var_ItemTable[ 1].itemlist) )
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEMINDEX, varIndex)
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_GETSUBMISSION, 1)
                    
                    for varI, item in x300566_var_ItemTable do
                        if HaveItemInBag( varMap, varPlayer, item.itemlist[ varIndex] ) > 0 then
                            SetQuestByIndex( varMap, varPlayer, varQuestIdx, item.mp, 1)
                        end
                    end
                    x300566_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
                end
            else
                x300566_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
            end
        end
	else
		x300566_DeliverTalkInfo( varMap, varPlayer, varTalknpc)	
	end
	 
end




function x300566_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
	local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId)
	if( varHaveQuest > 0) then
		return 0;
	else
		return 1;
	end
end




function x300566_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    if GetGameOpenById( x300566_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) == 0 then
        return 0
    end

    local varName = GetName( varMap, varPlayer)
    if IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) > 0 then
    else
        local varToday = GetDayOfYear()
        if x300566_GetQuestDate( varMap, varPlayer) == varToday then
            Msg2Player( varMap, varPlayer, x300566_var_strQuestRefrain, 8, 3)
            return 0
        end
        if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[ 1], MD_RICHANG_DAY[ 2], MD_RICHANG_DAY[ 3] ) == varToday then
            if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[ 1], MD_RICHANG_COUNT[ 2], MD_RICHANG_COUNT[ 3] ) >= 3 then
                Msg2Player( varMap, varPlayer, "你不能再领取今天的日常任务了", 8, 3)
                return 0
            end
        else
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 0)
        end
        
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x300566_var_QuestId  )
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
		
        local varRet = AddQuest( varMap, varPlayer, x300566_var_QuestId, x300566_var_FileId, 0, 0, 1, 1)
        if varRet == 0 then
            LuaScenceM2Player( varMap, varPlayer, x300566_var_strQuestFull, varName, 3, 1)
            return 0
        else
            
            LuaScenceM2Player( varMap, varPlayer, x300566_var_strQuestAccept, varName, 3, 1)
            LuaScenceM2Player( varMap, varPlayer, x300566_var_strQuestAccept, varName, 2, 1)
        end

        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300566_var_QuestName)
            TalkAppendString( varMap, x300566_var_strQuestBook)
        StopTalkTask( varMap)
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)

        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300566_var_QuestId)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)

        
        GamePlayScriptLog( varMap, varPlayer, x300566_var_AcceptQuestLogID)
    end
end


function x300566_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end


function x300566_ProcQuestAbandon( varMap, varPlayer, varQuest)
	local varHaveQuest	= IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId)
	if varHaveQuest > 0 then
        
        
        
            
            
            
            
        
		DelQuest( varMap, varPlayer, x300566_var_QuestId)
        
        local varToday = GetDayOfYear()
        SetPlayerGameData( varMap, varPlayer, MD_SHENGSICAISHEN_DATE[ 1], MD_SHENGSICAISHEN_DATE[ 2], MD_SHENGSICAISHEN_DATE[ 3], varToday)
		if varToday == GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3] ) then
            local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
            if varCount < 3 then
                SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1 + varCount)
            end
        else
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3], varToday)
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1)
        end

		Msg2Player( varMap, varPlayer, x300566_var_strQuestAbandon, 8, 3)
		Msg2Player( varMap, varPlayer, x300566_var_strQuestAbandon, 8, 2)
	end
end




function x300566_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300566_var_QuestId)

    if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
        return 1
    else
        return 0
    end
end




function x300566_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick)
	
	if x300566_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x300566_var_BonusMoney1 )
	    Msg2Player(varMap,varPlayer,format("获得银卡#{_MONEY%d}的奖励。", x300566_var_BonusMoney1),4,2)
	end

	
	if x300566_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x300566_var_BonusMoney2 )
	    Msg2Player(varMap,varPlayer,format("获得银币#{_MONEY%d}的奖励。", x300566_var_BonusMoney2),4,2)
	end

	
	if x300566_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x300566_var_BonusMoney3 )
	    Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x300566_var_BonusMoney3),4,2)
	end

	
	if x300566_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
		varRongYu = varRongYu + x300566_var_BonusMoney4
		SetRongYu( varMap, varPlayer, varRongYu )
		Msg2Player(varMap,varPlayer,format("获得江湖声望%d的奖励。", x300566_var_BonusMoney4),4,2)
	end

	
	if x300566_var_BonusMoney5 > 0 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + x300566_var_BonusMoney5
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,format("获得朝廷声望%d的奖励。", x300566_var_BonusMoney5),4,2)
	end

	
	if x300566_var_BonusMoney6 > 0 then
		AddHonor(varMap,varPlayer,x300566_var_BonusMoney6)
		Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x300566_var_BonusMoney6),4,2)
	end

 	
	for varI, item in x300566_var_BonusItem do
 		StartItemTask(varMap)
		ItemAppend( varMap, item.item, item.n )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，请整理背包后再来")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
    end

	
	for varI, item in x300566_var_BonusChoiceItem do
	    if item.item == varButtonClick then
	        StartItemTask(varMap)
			ItemAppend( varMap, item.item, item.n )
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包已满，请整理背包后再来")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

			
			return
		end
    end
end




function x300566_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
   if GetGameOpenById( x300566_var_IsEnableId) <= 0 then
      return
   end
   
    if IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) < 0 then
    	return
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300566_var_QuestId)
    local varName = GetName( varMap, varPlayer)
    local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEMINDEX)
    for varI, item in x300566_var_ItemTable do
        if GetItemCountInBag( varMap, varPlayer, item.itemlist[ varIndex] ) < 1 then
            LuaScenceM2Player( varMap, varPlayer, format( "没有@item_%d#cffcf00不能交任务", item.itemlist[ varIndex] ), varName, 3, 1)
            return
        end
    end

    if LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300566_var_QuestId) == 0 then
        Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
        return 0
    end

    
    for varI, item in x300566_var_ItemTable do
        if DelItem( varMap, varPlayer, item.itemlist[ varIndex], 1) ~= 1 then return 0 end
    end
    DelQuest( varMap, varPlayer, x300566_var_QuestId)
    LuaCallNoclosure( 256225, "Finishcaishen", varMap, varPlayer)	
    LuaScenceM2Player( varMap, varPlayer, x300566_var_strQuestFinished, varName, 3, 1)
    LuaScenceM2Player( varMap, varPlayer, x300566_var_strQuestFinished.."。", varName, 2, 1)
    x300566_SetQuestDate( varMap, varPlayer, GetDayOfYear() )

    -- find item index
    local index = 0
    for i, item in x300566_var_RewardTable do
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
    for varI, item in x300566_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        DelQuest( varMap, varPlayer, x300566_var_QuestId)
        local strLog = format( "DayCommon: Error in 300566! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
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
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("您获得了物品：@itemid_%d",varId))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足，无法获得任务奖励物品，交任务失败")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
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
	    GamePlayScriptLog( varMap, varPlayer, x300566_var_FinishQuestLogID)
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




function x300566_DeliverTalkInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)

    
    TalkAppendString( varMap, "#Y"..x300566_var_QuestName)
    TalkAppendString( varMap, x300566_var_QuestInfo)
    TalkAppendString( varMap, " ")
           
    
    TalkAppendString( varMap, "#Y任务目标：")
    TalkAppendString( varMap, x300566_var_QuestTarget)
    TalkAppendString( varMap, " ")

    
    if x300566_var_QuestHelp ~= "" then
        TalkAppendString( varMap, "#Y任务提示：")
        TalkAppendString( varMap, x300566_var_QuestHelp)
        TalkAppendString( varMap, " ")
    end                 

    
    local varLevel = GetLevel( varMap, varPlayer)
    for varI, item in x300566_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end


	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300566_var_FileId, x300566_var_QuestId)
end




function x300566_DispatchContinueInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300566_var_QuestName)
    TalkAppendString( varMap, x300566_var_ContinueInfo)
    TalkAppendString( varMap, " ")
    
    
        
    
    
    
    
        
    
    
    
	StopTalkTask( varMap)
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	
end




function x300566_DispatchCompletedInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x300566_var_QuestName)
    TalkAppendString( varMap, x300566_var_QuestCompleted)
    TalkAppendString( varMap, " ")
    local varLevel = GetLevel( varMap, varPlayer)
    for varI, item in x300566_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	StopTalkTask( varMap)
    DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300566_var_FileId, x300566_var_QuestId)
end




function x300566_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end




function x300566_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
    if GetGameOpenById( x300566_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) == 0 then
        return 0
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300566_var_QuestId)
    local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEMINDEX)
    if varItemData == x300566_var_ItemTable[ 1].itemlist[ varIndex] then
    	if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM1) < 1 then
	        if HaveItemInBag( varMap, varPlayer, varItemData) > 0 then
	            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM1, 1)
	            Msg2Player( varMap, varPlayer, format( x300566_var_strGetItem, varItemData), 8, 3)
	        else
	            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM1, 0)
	        end
	        x300566_ProcQuestLogRefresh( varMap, varPlayer, x300566_var_QuestId)
       end 
    elseif varItemData == x300566_var_ItemTable[ 2].itemlist[ varIndex] then
      if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM2) < 1 then
        if HaveItemInBag( varMap, varPlayer, varItemData) > 0 then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM2, 1)
            Msg2Player( varMap, varPlayer, format( x300566_var_strGetItem, varItemData), 8, 3)
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM2, 0)
        end
        x300566_ProcQuestLogRefresh( varMap, varPlayer, x300566_var_QuestId)
      end
    elseif varItemData == x300566_var_ItemTable[ 3].itemlist[ varIndex] then
      if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM3) < 1 then
        if HaveItemInBag( varMap, varPlayer, varItemData) > 0 then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM3, 1)
            Msg2Player( varMap, varPlayer, format( x300566_var_strGetItem, varItemData), 8, 3)
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM3, 0)
        end
        x300566_ProcQuestLogRefresh( varMap, varPlayer, x300566_var_QuestId)
      end
    elseif varItemData == x300566_var_ItemTable[ 4].itemlist[ varIndex] then
    	if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM4) < 1 then
        if HaveItemInBag( varMap, varPlayer, varItemData) > 0 then
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM4, 1)
            Msg2Player( varMap, varPlayer, format( x300566_var_strGetItem, varItemData), 8, 3)
        else
            SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM4, 0)
        end
        x300566_ProcQuestLogRefresh( varMap, varPlayer, x300566_var_QuestId)
    	end
    else
        return
  	end

    if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM1) == 1 and
        GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM2) == 1 and
        GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM3) == 1 and
        GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM4) == 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
        Msg2Player( varMap, varPlayer, "药引已经配齐，快去交给沈万四吧。", 8, 3)
    else
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
    end
end




function x300566_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
    if GetGameOpenById( x300566_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) == 0 then
        return 0
    end

    if IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) > 0 then
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300566_var_QuestId)
        if varTalkNpcGUID == x300566_var_TargetNPC then
            if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 0 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 and GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_GETSUBMISSION) == 0 then
                TalkAppendButton( varMap, x300566_var_QuestId, "帮主的病怎么样了？", 13)
            else
            		local n =x300566_CheckSubmit( varMap, varPlayer, varTalknpc)
                TalkAppendButton( varMap, x300566_var_QuestId, x300566_var_QuestName, n+6)
            end
        end
    end
end

function x300566_GetQuestDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_SHENGSICAISHEN_DATE[ 1], MD_SHENGSICAISHEN_DATE[ 2], MD_SHENGSICAISHEN_DATE[ 3] )
end

function x300566_SetQuestDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_SHENGSICAISHEN_DATE[ 1], MD_SHENGSICAISHEN_DATE[ 2], MD_SHENGSICAISHEN_DATE[ 3], value)
end

function x300566_ProcUseItem( varMap, varPlayer)
end

function x300566_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
    if GetGameOpenById( x300566_var_IsEnableId) <= 0 and IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) == 0 then
        return 0
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300566_var_QuestId)
    if IsHaveQuestNM( varMap, varPlayer, x300566_var_QuestId) > 0 then
        if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM2) == 1 then
            Msg2Player( varMap, varPlayer, "你已经采集到药引了", 8, 3)
            return 1
        else
            return 0
        end
    else
        return 1
    end
end

function x300566_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end




function x300566_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300566_var_QuestId)
    local varIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEMINDEX)
    if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM1) == 1 and
        GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM2) == 1 and
        GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM3) == 1 and
        GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM4) == 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)
    end
	StartTalkTask( varMap)
    if GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_GETSUBMISSION) == 1 then
        local strQuestTarget = ""
        local item1 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM1)
        local item2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM2)
        local item3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM3)
        local item4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300566_MP_ITEM4)

        
        if item1 == 1 then
            strQuestTarget = "#G"..format( x300566_var_strQuestItem1Target, x300566_var_ItemTable[ 1].itemlist[ varIndex], item1)
        else
            strQuestTarget = "#W"..format( x300566_var_strQuestItem1Target, x300566_var_ItemTable[ 1].itemlist[ varIndex], item1)
        end

        
        if item2 == 1 then
            strQuestTarget = strQuestTarget.."#G"..format( x300566_var_strQuestItem2Target, x300566_var_ItemTable[ 2].itemlist[ varIndex], item2)
        else
            strQuestTarget = strQuestTarget.."#W"..format( x300566_var_strQuestItem2Target, x300566_var_ItemTable[ 2].itemlist[ varIndex], item2)
        end

        
        if item3 == 1 then
            strQuestTarget = strQuestTarget.."#G"..format( x300566_var_strQuestItem3Target, x300566_var_ItemTable[ 3].itemlist[ varIndex], item3)
        else
            strQuestTarget = strQuestTarget.."#W"..format( x300566_var_strQuestItem3Target, x300566_var_ItemTable[ 3].itemlist[ varIndex], item3)
        end

        
        if item4 == 1 then
            strQuestTarget = strQuestTarget.."#G"..format( x300566_var_strQuestItem4Target, x300566_var_ItemTable[ 4].itemlist[ varIndex], item4)
        else
            strQuestTarget = strQuestTarget.."#W"..format( x300566_var_strQuestItem4Target, x300566_var_ItemTable[ 4].itemlist[ varIndex], item4)
        end

        if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
            AddQuestLogCustomText( varMap,
                                   x300566_var_QuestName,               
                                   x300566_var_QuestName,               
                                   strQuestTarget,                    
                                   x300566_var_QuestReply,              
                                   x300566_var_strGongLue3,               
                                   x300566_var_strQuestDescription3,    
                                   x300566_var_QuestHelp)               
        else
            AddQuestLogCustomText( varMap,
                                   x300566_var_QuestName,               
                                   x300566_var_QuestName,               
                                   strQuestTarget,                    
                                   x300566_var_QuestReply,              
                                   x300566_var_strGongLue2,               
                                   x300566_var_strQuestDescription2,    
                                   x300566_var_QuestHelp)               
        end
    else
        AddQuestLogCustomText( varMap,
                               x300566_var_QuestName,               
                               x300566_var_QuestName,               
                               x300566_var_QuestTarget,             
                               x300566_var_QuestReply,              
                               x300566_var_strQuestBook,            
                               x300566_var_QuestInfo,               
                               x300566_var_QuestHelp)               
    end
    local varLevel = GetLevel( varMap, varPlayer)
    for varI, item in x300566_var_RewardTable do
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
