

--DECLARE_QUEST_INFO_START--
x203794_var_FileId = 203794

x203794_var_QuestId = 3694
x203794_var_LevelLess	= 45 
x203794_var_QuestIdNext = -1
x203794_var_Name	={}
x203794_var_ExtTarget={{type=20,n=1,target="阅读一次@npc_81014任务"}}
x203794_var_QuestName="【个人】大漠盗宝客"
x203794_var_QuestInfo="\t最近传闻金国在亡国之前，把搜刮来的大批宝藏埋在太行山和泰山山麓，当地盗宝客对这批财宝垂涎已久，疯狂的挖掘，企图找到金王宝藏。就算这批宝藏真的存在也理所当然应归我大元所有，所以我现在委派你前去消灭这些盗宝客！"  
x203794_var_QuestTarget=""		
x203794_var_QuestCompleted="\t这次你的任务完成的非常出色，我想官府肯定会上报朝廷好好的奖赏你的，你抓紧时间好好休息吧。\n\t记得每天都去他那里看看，一定会对你有不少帮助。"					
x203794_var_ContinueInfo="\t你回来的好快啊，找到地方了吗？"
x203794_var_QuestHelp =	""
x203794_var_DemandItem ={}
x203794_var_ExpBonus = 500000
x203794_var_BonusMoney1 =5000
x203794_var_BonusMoney2 =0
x203794_var_BonusMoney3 =0
x203794_var_BonusMoney4 =0
x203794_var_BonusMoney5 =0
x203794_var_BonusMoney6 =0
x203794_var_BonusItem	=	{}
x203794_var_BonusChoiceItem ={}
x203794_var_NpcGUID ={{ guid = 140417, varName = "包打听"} }
--DECLARE_QUEST_INFO_STOP--






x203794_var_MP_Daobaoke  = 3

x203794_var_MaxLevel      =65

function x203794_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203794_var_LevelLess or varLevel > x203794_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x203794_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x203794_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203794_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203794_var_QuestId, varState, -1 )
	end
end

function x203794_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    if x203794_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x203794_var_ExpBonus )
    end
    if x203794_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x203794_var_BonusMoney1 )
    end
    if x203794_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x203794_var_BonusMoney2 )
    end
    if x203794_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x203794_var_BonusMoney3 )
    end
    if x203794_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x203794_var_BonusMoney4 )
    end
    if x203794_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x203794_var_BonusMoney5 )
    end
    if x203794_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x203794_var_BonusMoney6 )
    end
    for varI, item in x203794_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end
    for varI, item in x203794_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end
end

function x203794_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203794_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x203794_var_QuestId) > 0 then
        if x203794_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x203794_var_QuestName)
            TalkAppendString(varMap,x203794_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203794_var_FileId, x203794_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x203794_var_QuestName)
            TalkAppendString(varMap,x203794_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x203794_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203794_var_FileId, x203794_var_QuestId);
        end
    elseif x203794_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x203794_var_QuestName)
        TalkAppendString(varMap,x203794_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标：")
        for varI, item in x203794_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        if x203794_var_QuestHelp ~= "" then
            TalkAppendString(varMap,"\n#G小提示:#W")
            TalkAppendString(varMap,x203794_var_QuestHelp )
        end
        x203794_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203794_var_FileId, x203794_var_QuestId);
    end
end

function x203794_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x203794_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203794_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end

function x203794_ProcYinDaoCompleted( varMap, varPlayer, varMode)   
	if varMode==nil then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, x203794_var_QuestId ) == 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203794_var_QuestId)  

	local n1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )	
	
	

    if varMode ==0 then 
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)

   		
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	
   	
   	
   	
   	
   	
   	
   	
   	
   	
   	
end

function x203794_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x203794_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203794_var_QuestId  )
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

    if x203794_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x203794_var_QuestId, x203794_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203794_var_QuestId)                                                  
            x203794_Msg2toplayer( varMap, varPlayer,0)
            
            
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x203794_var_MP_Daobaoke,0)
            x203794_ProcQuestLogRefresh( varMap, varPlayer, x203794_var_QuestId)
        end
    end                                                                    
end

function x203794_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x203794_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x203794_var_QuestId)
    x203794_Msg2toplayer( varMap, varPlayer, 1)
end

function x203794_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203794_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end
    for j, item in x203794_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppend( varMap, item.item, item.n )
            break
        end
    end
    local varRet = StopItemTask(varMap,varPlayer)
    if varRet <= 0 then
        if result == 1 then
            result = 0
        end
    end
	return result
end

function x203794_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203794_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x203794_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x203794_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x203794_var_QuestId) > 0 then
        x203794_Msg2toplayer( varMap, varPlayer,2)
        QuestCom(varMap, varPlayer, x203794_var_QuestId)
        x203794_GetBonus( varMap, varPlayer,varTalknpc)
        StartItemTask(varMap)
        for varI, item in x203794_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        for varI, item in x203794_var_BonusChoiceItem do
            if item.item == varRadioSelected then
                ItemAppend( varMap, item.item, item.n )
            end
        end
        StopItemTask(varMap,varPlayer)
       
   end
   
end

function x203794_GetBonus( varMap, varPlayer,varTalknpc)
	if x203794_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x203794_var_ExpBonus);
  	end
	if x203794_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203794_var_BonusMoney1)
	end
    if x203794_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203794_var_BonusMoney2)
    end
    if x203794_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x203794_var_BonusMoney3)
    end
    if x203794_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x203794_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
    end
    if x203794_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer)
        varShengWang = varShengWang + x203794_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
    end
    if x203794_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x203794_var_BonusMoney6)
    end
end

function x203794_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务"..x203794_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务"..x203794_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务"..x203794_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务"..x203794_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x203794_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x203794_var_QuestName.."！", 0, 3)
        if x203794_var_ExpBonus > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203794_var_ExpBonus.."#Y的奖励", 0, 2)
        end
        if x203794_var_BonusMoney1 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203794_var_BonusMoney1.."文#Y的奖励", 0, 2)
        end
        if x203794_var_BonusMoney2 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203794_var_BonusMoney2.."文#Y的奖励", 0, 2)
        end
        if x203794_var_BonusMoney3 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203794_var_BonusMoney3.."文#Y的奖励", 0, 2)
        end
        if x203794_var_BonusMoney4 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203794_var_BonusMoney4.."#Y的奖励", 0, 2)
        end
        if x203794_var_BonusMoney5 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203794_var_BonusMoney5.."#Y的奖励", 0, 2)
        end
        if x203794_var_BonusMoney6 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203794_var_BonusMoney6.."#Y的奖励", 0, 2)
        end
    end
end

function x203794_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203794_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203794_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x203794_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203794_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x203794_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x203794_var_QuestId) < 1 then
        return
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203794_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x203794_var_MP_Hunt, 1)
    x203794_ProcQuestLogRefresh( varMap, varPlayer, x203794_var_QuestId)
end

function x203794_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203794_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x203794_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203794_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203794_var_QuestId, varState, -1 )
    end
end

function x203794_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203794_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203794_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203794_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203794_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203794_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203794_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    
   
    local Daobaoke= GetQuestParam( varMap, varPlayer, varQuestIdx, x203794_var_MP_Daobaoke)
    local strTarget = format( "任务已经完成，请回报@npc_%d", x203794_var_NpcGUID[1].guid)

    if Daobaoke== 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        
        
        
        
        
        
        
        
        
        
        if Daobaoke== 0 then
            strTarget = "  #W阅读一次@npc_81014任务(0/1)"
        else
            strTarget = strTarget.."  #G阅读一次@npc_81014任务(1/1)"
        end
    end

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x203794_var_QuestName,          
                                strTarget,
                                "",                             
                                "去找@npc_124057，阅读一次任务。",
                                "\t最近传闻金国在亡国之前，把搜刮来大批宝藏埋在太行山和泰山山麓，当地盗宝客对这批财宝垂涎已久，疯狂的挖掘，企图找到金王宝藏。就算这批宝藏真的存在也理所当然应归我大元所有，所以我现在委派你前去消灭这些盗宝客！",
                                "@npc_124057的任务是非常简单，回报高额的。"
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


























function x203794_FinishDaobaoke( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x203794_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203794_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x203794_var_MP_Daobaoke, 1)

    x203794_ProcQuestLogRefresh( varMap, varPlayer, x203794_var_QuestId)
end
