

--DECLARE_QUEST_INFO_START--
x256225_var_FileId = 256225

x256225_var_QuestId = 3112
x256225_var_LevelLess	= 40 
x256225_var_QuestIdNext = -1
x256225_var_Name	={}
x256225_var_ExtTarget={{type=20,n=1,target="完成一次@npc_28832"},{type=20,n=1,target="完成一次@npc_28833"},{type=20,n=1,target="完成一次@npc_28834"},{type=20,n=1,target="完成一次@npc_28835"},}
x256225_var_QuestName="【个人】大都的收获"
x256225_var_QuestInfo="\t大都是四方宾客汇聚之地，每天都有很多事发生。你可以去@npc_139084，@npc_139115，@npc_139083和@npc_139116他们那里看看，这些都是阔绰之人，帮他们做事收获必然丰厚。"  
x256225_var_QuestTarget=""		
x256225_var_QuestCompleted="\t不错，不错，结识了这些能人义士将来必对你有所帮助。\n\t我没有骗你吧，他们的奖励我想你应该很满意，每天常去他们那里走走都会有收获的。"					
x256225_var_ContinueInfo="\t别太心急，做事就要每一步迈的坚实，遇到挫折不要紧，努一把力就会完成的。"
x256225_var_QuestHelp =	""
x256225_var_DemandItem ={}
x256225_var_BonusMoney1 =8000
x256225_var_BonusMoney2 =0
x256225_var_BonusMoney3 =0
x256225_var_BonusMoney4 =0
x256225_var_BonusMoney5 =500
x256225_var_BonusMoney6 =0
x256225_var_BonusItem	=	{{item=11050002,n=3},{item=11000201,n=3},}
x256225_var_BonusChoiceItem ={}
x256225_var_ExpBonus = 30000
x256225_var_NpcGUID ={{ guid = 140417, varName = "包打听"} }
--DECLARE_QUEST_INFO_STOP--


x256225_var_MP_douxi   = 1

x256225_var_MP_fawang  = 2

x256225_var_MP_caishen  = 3

x256225_var_MP_biwu   = 4

x256225_var_MaxLevel   = 160

function x256225_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256225_var_LevelLess or varLevel >= x256225_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256225_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x256225_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256225_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256225_var_QuestId, varState, -1 )
	end
end

function x256225_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    if x256225_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x256225_var_ExpBonus )
    end
    if x256225_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x256225_var_BonusMoney1 )
    end
    if x256225_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x256225_var_BonusMoney2 )
    end
    if x256225_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x256225_var_BonusMoney3 )
    end
    if x256225_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x256225_var_BonusMoney4 )
    end
    if x256225_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x256225_var_BonusMoney5 )
    end
    if x256225_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x256225_var_BonusMoney6 )
    end
    for varI, item in x256225_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end
    for varI, item in x256225_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end
end

function x256225_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256225_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x256225_var_QuestId) > 0 then
        if x256225_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256225_var_QuestName)
            TalkAppendString(varMap,x256225_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256225_var_FileId, x256225_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256225_var_QuestName)
            TalkAppendString(varMap,x256225_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x256225_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256225_var_FileId, x256225_var_QuestId);
        end
    elseif x256225_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x256225_var_QuestName)
        TalkAppendString(varMap,x256225_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标：")
        for varI, item in x256225_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        if x256225_var_QuestHelp ~= "" then
            TalkAppendString(varMap,"\n#G小提示:#W")
            TalkAppendString(varMap,x256225_var_QuestHelp )
        end
        x256225_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256225_var_FileId, x256225_var_QuestId);
    end
end

function x256225_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x256225_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256225_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end

function x256225_ProcYinDaoCompleted( varMap, varPlayer, varMode)   
	if varMode==nil then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, x256225_var_QuestId ) == 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256225_var_QuestId)  

	local n1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )	
	local n2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local n3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )
	local n4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )                                                

    if varMode ==0 then 
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)

   		if n2==1 and n3==1 and n4==1 then
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	elseif varMode==1 then 
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
   		if n1==1 and n3==1 and n4==1 then
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	elseif varMode==2 then	
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,2,1)
   		if n1==1 and n2==1 and n4==1 then
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	elseif varMode==3 then 
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,3,1)
   		if n1==1 and n2==1 and n3==1 then
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	end
end

function x256225_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x256225_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local varFrontQuest1, varFrontQuest2, varFrontQuest3	= GetFrontQuestIdNM( varMap, varPlayer,x256225_var_QuestId  )
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


    if x256225_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x256225_var_QuestId, x256225_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256225_var_QuestId)                                                  
            x256225_Msg2toplayer( varMap, varPlayer,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256225_var_MP_douxi,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256225_var_MP_fawang,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256225_var_MP_caishen,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256225_var_MP_biwu,0)
            x256225_ProcQuestLogRefresh( varMap, varPlayer, x256225_var_QuestId)
        end
    end                                                                    
end

function x256225_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x256225_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x256225_var_QuestId)
    x256225_Msg2toplayer( varMap, varPlayer, 1)
end

function x256225_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256225_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end
    for j, item in x256225_var_BonusChoiceItem do
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

function x256225_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256225_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256225_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256225_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x256225_var_QuestId) > 0 then
        x256225_Msg2toplayer( varMap, varPlayer,2)
        QuestCom(varMap, varPlayer, x256225_var_QuestId)
        x256225_GetBonus( varMap, varPlayer,varTalknpc)
        StartItemTask(varMap)
        for varI, item in x256225_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        for varI, item in x256225_var_BonusChoiceItem do
            if item.item == varRadioSelected then
                ItemAppend( varMap, item.item, item.n )
            end
        end
        StopItemTask(varMap,varPlayer)
        DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   
end

function x256225_GetBonus( varMap, varPlayer,varTalknpc)
	if x256225_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x256225_var_ExpBonus);
  	end
	if x256225_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256225_var_BonusMoney1)
	end
    if x256225_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256225_var_BonusMoney2)
    end
    if x256225_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x256225_var_BonusMoney3)
    end
    if x256225_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x256225_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
    end
    if x256225_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer)
        varShengWang = varShengWang + x256225_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
    end
    if x256225_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x256225_var_BonusMoney6)
    end
end

function x256225_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256225_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256225_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256225_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256225_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256225_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256225_var_QuestName.."！", 0, 3)
        if x256225_var_ExpBonus > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256225_var_ExpBonus.."#Y的奖励", 0, 2)
        end
        if x256225_var_BonusMoney1 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256225_var_BonusMoney1.."文#Y的奖励", 0, 2)
        end
        if x256225_var_BonusMoney2 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256225_var_BonusMoney2.."文#Y的奖励", 0, 2)
        end
        if x256225_var_BonusMoney3 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256225_var_BonusMoney3.."文#Y的奖励", 0, 2)
        end
        if x256225_var_BonusMoney4 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256225_var_BonusMoney4.."#Y的奖励", 0, 2)
        end
        if x256225_var_BonusMoney5 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256225_var_BonusMoney5.."#Y的奖励", 0, 2)
        end
        if x256225_var_BonusMoney6 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256225_var_BonusMoney6.."#Y的奖励", 0, 2)
        end
    end
end

function x256225_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x256225_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256225_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x256225_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256225_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x256225_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256225_var_QuestId) < 1 then
        return
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256225_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256225_var_MP_fawang, 1)
    x256225_ProcQuestLogRefresh( varMap, varPlayer, x256225_var_QuestId)
end

function x256225_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x256225_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x256225_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256225_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256225_var_QuestId, varState, -1 )
    end
end

function x256225_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
end

function x256225_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	
end

function x256225_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256225_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256225_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	
end

function x256225_OpenCheck( varMap, varPlayer, varTalknpc )
	
end

function x256225_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    if IsHaveQuest( varMap, varPlayer, x256225_var_QuestId) <= 0 then
        return
    end
    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256225_var_QuestId)
    local douxi = GetQuestParam( varMap, varPlayer, varQuestIdx, x256225_var_MP_douxi)
    local fawang= GetQuestParam( varMap, varPlayer, varQuestIdx, x256225_var_MP_fawang)
    local caishen = GetQuestParam( varMap, varPlayer, varQuestIdx, x256225_var_MP_caishen)
    local biwu= GetQuestParam( varMap, varPlayer, varQuestIdx, x256225_var_MP_biwu)
    local strTarget = format( "任务已经完成，请回报@npc_%d", x256225_var_NpcGUID[1].guid)

    if douxi == 1 and fawang== 1 and caishen == 1 and biwu== 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        if douxi == 0 then
            strTarget = "  #W完成一次@npc_28832(0/1)\n"
        else
            strTarget = "  #G完成一次@npc_28832(1/1)\n"
        end
        if fawang== 0 then
            strTarget = strTarget.."  #W完成一次@npc_28833(0/1)\n"
        else
            strTarget = strTarget.."  #G完成一次@npc_28833(1/1)\n"
        end
        if caishen == 0 then
            strTarget = strTarget.."  #W完成一次@npc_28834(0/1)\n"
        else
            strTarget = strTarget.."  #G完成一次@npc_28834(1/1)\n"
        end
        if biwu== 0 then
            strTarget = strTarget.."  #W完成一次@npc_28835(0/1)"
        else
            strTarget = strTarget.."  #G完成一次@npc_28835(1/1)"
        end
    end

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x256225_var_QuestName,          
                                strTarget,
                                "",                             
                                "去@npc_139084，@npc_139115，@npc_139083和@npc_139116处，完成的他们吩咐的事情。",
                                "\t大都是四方宾客汇聚之地，每天都有很多事发生。你可以去@npc_139084，@npc_139115，@npc_139083和@npc_139116他们那里看看，这些都是阔绰之人，帮他们做事收获必然丰厚。",
                                "@npc_139084，@npc_139115，@npc_139083和@npc_139116要你完成任务都是回报丰厚。"
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


function x256225_Finishdouxi( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256225_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256225_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256225_var_MP_douxi, 1)

    x256225_ProcQuestLogRefresh( varMap, varPlayer, x256225_var_QuestId)
end


function x256225_Finishfawang( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256225_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256225_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256225_var_MP_fawang, 1)

    x256225_ProcQuestLogRefresh( varMap, varPlayer, x256225_var_QuestId)
end


function x256225_Finishcaishen( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256225_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256225_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256225_var_MP_caishen, 1)

    x256225_ProcQuestLogRefresh( varMap, varPlayer, x256225_var_QuestId)
end

function x256225_Finishbiwu( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256225_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256225_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256225_var_MP_biwu, 1)

    x256225_ProcQuestLogRefresh( varMap, varPlayer, x256225_var_QuestId)
end
