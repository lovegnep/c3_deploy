

--DECLARE_QUEST_INFO_START--
x256221_var_FileId = 256221
x256221_var_QuestIdPre = 3079
x256221_var_QuestId = 3109
x256221_var_LevelLess	= 35
x256221_var_QuestIdNext = -1
x256221_var_Name	={}
x256221_var_ExtTarget={{type=20,n=1,target="完成一整轮@npc_82059"},}
x256221_var_QuestName="【个人】第一次材料收集"
x256221_var_QuestInfo="\t你好，亲爱的朋友，王国中有不少官员正在寻求人手帮忙，你可以去@npc_138559，那里看看，当你将他们三人的一整轮任务都完成后，我会好好的奖励你。"  
x256221_var_QuestTarget=""		
x256221_var_QuestCompleted="\t看来你已经对王国内务了如指掌了。\n\t记得每天都去他们那里看看，一定会对你有不少帮助。"					
x256221_var_ContinueInfo="别太心急，我为你准备了不少礼物，但是......你应该先完成那几个任务。"
x256221_var_QuestHelp =	""
x256221_var_DemandItem ={}
x256221_var_BonusMoney1 =176
x256221_var_BonusMoney2 =0
x256221_var_BonusMoney3 =0
x256221_var_BonusMoney4 =0
x256221_var_BonusMoney5 =21
x256221_var_BonusMoney6 =0
x256221_var_BonusItem	=	{}
x256221_var_BonusChoiceItem ={}
x256221_var_ExpBonus = 21000
x256221_var_NpcGUID ={{ guid = 138559, varName = "库库斯"} }
--DECLARE_QUEST_INFO_STOP--


x256221_var_MP_Tax        = 1





x256221_var_MaxLevel      = 160

function x256221_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256221_var_LevelLess or varLevel >= x256221_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256221_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x256221_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256221_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256221_var_QuestId, varState, -1 )
	end
end

function x256221_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    if x256221_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x256221_var_ExpBonus )
    end
    if x256221_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x256221_var_BonusMoney1 )
    end
    if x256221_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x256221_var_BonusMoney2 )
    end
    if x256221_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x256221_var_BonusMoney3 )
    end
    if x256221_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x256221_var_BonusMoney4 )
    end
    if x256221_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x256221_var_BonusMoney5 )
    end
    if x256221_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x256221_var_BonusMoney6 )
    end
    for varI, item in x256221_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end
    for varI, item in x256221_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end
end

function x256221_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256221_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x256221_var_QuestId) > 0 then
        if x256221_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256221_var_QuestName)
            TalkAppendString(varMap,x256221_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256221_var_FileId, x256221_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256221_var_QuestName)
            TalkAppendString(varMap,x256221_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x256221_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256221_var_FileId, x256221_var_QuestId);
        end
    elseif x256221_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x256221_var_QuestName)
        TalkAppendString(varMap,x256221_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标：")
        for varI, item in x256221_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        if x256221_var_QuestHelp ~= "" then
            TalkAppendString(varMap,"\n#G小提示:#W")
            TalkAppendString(varMap,x256221_var_QuestHelp )
        end
        x256221_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256221_var_FileId, x256221_var_QuestId);
    end
end

function x256221_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x256221_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256221_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end

function x256221_ProcYinDaoCompleted( varMap, varPlayer, varMode)   
	if varMode==nil then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, x256221_var_QuestId ) == 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256221_var_QuestId)  

	local n1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )	
	local n2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local n3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )                                                

    if varMode ==0 then 
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)

   		if n2==1 and n3==1 then
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   
   	
   	
   	
   	
   
   	
   		
   		
   		
   	end
end

function x256221_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x256221_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256221_var_QuestId  )
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

    if x256221_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x256221_var_QuestId, x256221_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256221_var_QuestId)                                                  
            x256221_Msg2toplayer( varMap, varPlayer,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256221_var_MP_Tax,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256221_var_MP_Hunt,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256221_var_MP_Neizheng,0)
            x256221_ProcQuestLogRefresh( varMap, varPlayer, x256221_var_QuestId)
        end
    end                                                                    
end

function x256221_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x256221_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x256221_var_QuestId)
    x256221_Msg2toplayer( varMap, varPlayer, 1)
end

function x256221_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256221_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end
    for j, item in x256221_var_BonusChoiceItem do
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

function x256221_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256221_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256221_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256221_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x256221_var_QuestId) > 0 then
        x256221_Msg2toplayer( varMap, varPlayer,2)
        QuestCom(varMap, varPlayer, x256221_var_QuestId)
        x256221_GetBonus( varMap, varPlayer,varTalknpc)
        StartItemTask(varMap)
        for varI, item in x256221_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        for varI, item in x256221_var_BonusChoiceItem do
            if item.item == varRadioSelected then
                ItemAppend( varMap, item.item, item.n )
            end
        end
        StopItemTask(varMap,varPlayer)
       
   end
   
end

function x256221_GetBonus( varMap, varPlayer,varTalknpc)
	if x256221_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x256221_var_ExpBonus);
  	end
	if x256221_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256221_var_BonusMoney1)
	end
    if x256221_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256221_var_BonusMoney2)
    end
    if x256221_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x256221_var_BonusMoney3)
    end
    if x256221_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x256221_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
    end
    if x256221_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer)
        varShengWang = varShengWang + x256221_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
    end
    if x256221_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x256221_var_BonusMoney6)
    end
end

function x256221_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256221_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256221_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256221_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256221_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256221_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256221_var_QuestName.."！", 0, 3)
        if x256221_var_ExpBonus > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256221_var_ExpBonus.."#Y的奖励", 0, 2)
        end
        if x256221_var_BonusMoney1 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256221_var_BonusMoney1.."文#Y的奖励", 0, 2)
        end
        if x256221_var_BonusMoney2 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256221_var_BonusMoney2.."文#Y的奖励", 0, 2)
        end
        if x256221_var_BonusMoney3 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256221_var_BonusMoney3.."文#Y的奖励", 0, 2)
        end
        if x256221_var_BonusMoney4 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256221_var_BonusMoney4.."#Y的奖励", 0, 2)
        end
        if x256221_var_BonusMoney5 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256221_var_BonusMoney5.."#Y的奖励", 0, 2)
        end
        if x256221_var_BonusMoney6 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256221_var_BonusMoney6.."#Y的奖励", 0, 2)
        end
    end
end

function x256221_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x256221_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256221_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x256221_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256221_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x256221_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256221_var_QuestId) < 1 then
        return
    end

    
     
     
     
end

function x256221_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x256221_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x256221_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256221_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256221_var_QuestId, varState, -1 )
    end
end

function x256221_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256221_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256221_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256221_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256221_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256221_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x256221_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    local tax = GetQuestParam( varMap, varPlayer, varQuestIdx, x256221_var_MP_Tax)
    local hunt = GetQuestParam( varMap, varPlayer, varQuestIdx, x256221_var_MP_Hunt)
    local neizheng = GetQuestParam( varMap, varPlayer, varQuestIdx, x256221_var_MP_Neizheng)
    local strTarget = format( "任务已经完成，请回报@npc_%d", x256221_var_NpcGUID[1].guid)

    if tax == 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        if tax == 0 then
            strTarget = "  #W完成一整轮@npc_82059(0/1)\n"
        else
            strTarget = "  #G完成一整轮@npc_82059(1/1)\n"
        end
        
          
        
          
       
        
           
        
           
       
    end

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x256221_var_QuestName,          
                                strTarget,
                                "",                             
                                "去@npc_138559处，分别完成他们每人发布的一整轮任务。",
                                "\t你好，亲爱的朋友，王国中有不少官员正在寻求人手帮忙，你可以去@npc_138559他们那里看看，当你将他们三人的一整轮任务都完成后，我会好好的奖励你。",
                                "@npc_138559的任务都是非常简单，回报高额的任务。"
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


function x256221_FinishShouji( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256221_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256221_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256221_var_MP_Tax, 1)

    x256221_ProcQuestLogRefresh( varMap, varPlayer, x256221_var_QuestId)
end
























