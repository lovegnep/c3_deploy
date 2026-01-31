

--DECLARE_QUEST_INFO_START--
x256224_var_FileId = 256224

x256224_var_QuestId = 3111
x256224_var_LevelLess	= 40
x256224_var_QuestIdNext = -1
x256224_var_Name	={}
x256224_var_ExtTarget={{type=20,n=1,target="完成@npc_28828"},{type=20,n=1,target="答对@npc_28829"},{type=20,n=1,target="完成@npc_28830"},{type=20,n=1,target="进入@npc_28831"},}
x256224_var_QuestName="【个人】大都嘉年华"
x256224_var_QuestInfo="\t京城的繁华岂是王城可比，机会随处都在。你可以去@npc_139129，@npc_139133，@npc_139100，@npc_139104他们那里看看，大都嘉年华一系列有趣的任务都在等待着你。"  
x256224_var_QuestTarget=""		
x256224_var_QuestCompleted="\t从你兴高采烈的样子上看大嘉年华任务让你过的很愉快。\n\t记得每天都去他们那里看看，在乐趣之余你会有很大的收获。"					
x256224_var_ContinueInfo="\t怎么愁眉苦脸的，大都的嘉年华不好玩吗？"
x256224_var_QuestHelp =	""
x256224_var_DemandItem ={}
x256224_var_ExpBonus = 80000
x256224_var_BonusMoney1 =15000
x256224_var_BonusMoney2 =0
x256224_var_BonusMoney3 =0
x256224_var_BonusMoney4 =0
x256224_var_BonusMoney5 =200
x256224_var_BonusMoney6 =0
x256224_var_BonusItem	=	{{item=12030107,n=1},{item=12030011,n=20}}
x256224_var_BonusChoiceItem ={}
x256224_var_NpcGUID ={{ guid = 140417, varName = "包打听"} }
--DECLARE_QUEST_INFO_STOP--


x256224_var_MP_yizhe   = 1

x256224_var_MP_dengmi   = 2

x256224_var_MP_tiesan  = 3

x256224_var_MP_wuting  = 4

x256224_var_MaxLevel   = 55

function x256224_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256224_var_LevelLess or varLevel >= x256224_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256224_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x256224_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256224_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256224_var_QuestId, varState, -1 )
	end
end

function x256224_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    if x256224_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x256224_var_ExpBonus )
    end
    if x256224_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x256224_var_BonusMoney1 )
    end
    if x256224_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x256224_var_BonusMoney2 )
    end
    if x256224_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x256224_var_BonusMoney3 )
    end
    if x256224_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x256224_var_BonusMoney4 )
    end
    if x256224_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x256224_var_BonusMoney5 )
    end
    if x256224_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x256224_var_BonusMoney6 )
    end
    for varI, item in x256224_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end
    for varI, item in x256224_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end
end

function x256224_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256224_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x256224_var_QuestId) > 0 then
        if x256224_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256224_var_QuestName)
            TalkAppendString(varMap,x256224_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256224_var_FileId, x256224_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256224_var_QuestName)
            TalkAppendString(varMap,x256224_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x256224_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256224_var_FileId, x256224_var_QuestId);
        end
    elseif x256224_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x256224_var_QuestName)
        TalkAppendString(varMap,x256224_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标：")
        for varI, item in x256224_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        if x256224_var_QuestHelp ~= "" then
            TalkAppendString(varMap,"\n#G小提示:#W")
            TalkAppendString(varMap,x256224_var_QuestHelp )
        end
        x256224_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256224_var_FileId, x256224_var_QuestId);
    end
end

function x256224_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x256224_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256224_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end

function x256224_ProcYinDaoCompleted( varMap, varPlayer, varMode)   
	if varMode==nil then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, x256224_var_QuestId ) == 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256224_var_QuestId)  

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

function x256224_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x256224_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256224_var_QuestId  )
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

    if x256224_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x256224_var_QuestId, x256224_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256224_var_QuestId)                                                  
            x256224_Msg2toplayer( varMap, varPlayer,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256224_var_MP_yizhe,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256224_var_MP_dengmi,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256224_var_MP_tiesan,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256224_var_MP_wuting,0)
            x256224_ProcQuestLogRefresh( varMap, varPlayer, x256224_var_QuestId)
        end
    end                                                                    
end

function x256224_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x256224_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x256224_var_QuestId)
    x256224_Msg2toplayer( varMap, varPlayer, 1)
end

function x256224_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256224_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
    end
    for j, item in x256224_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppendBind( varMap, item.item, item.n )
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

function x256224_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256224_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256224_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256224_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x256224_var_QuestId) > 0 then
        x256224_Msg2toplayer( varMap, varPlayer,2)
        QuestCom(varMap, varPlayer, x256224_var_QuestId)
        x256224_GetBonus( varMap, varPlayer,varTalknpc)
        StartItemTask(varMap)
        for varI, item in x256224_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        for varI, item in x256224_var_BonusChoiceItem do
            if item.item == varRadioSelected then
                ItemAppend( varMap, item.item, item.n )
            end
        end
        StopItemTask(varMap,varPlayer)
       	DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   
end

function x256224_GetBonus( varMap, varPlayer,varTalknpc)
	if x256224_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x256224_var_ExpBonus);
  	end
	if x256224_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256224_var_BonusMoney1)
	end
    if x256224_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256224_var_BonusMoney2)
    end
    if x256224_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x256224_var_BonusMoney3)
    end
    if x256224_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x256224_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
    end
    if x256224_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer)
        varShengWang = varShengWang + x256224_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
    end
    if x256224_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x256224_var_BonusMoney6)
    end
end

function x256224_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256224_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256224_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256224_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256224_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256224_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256224_var_QuestName.."！", 0, 3)      
        if x256224_var_ExpBonus > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256224_var_ExpBonus.."#Y的奖励", 0, 2)
        end
        if x256224_var_BonusMoney1 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256224_var_BonusMoney1.."文#Y的奖励", 0, 2)
        end
        if x256224_var_BonusMoney2 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256224_var_BonusMoney2.."文#Y的奖励", 0, 2)
        end
        if x256224_var_BonusMoney3 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256224_var_BonusMoney3.."文#Y的奖励", 0, 2)
        end
        if x256224_var_BonusMoney4 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256224_var_BonusMoney4.."#Y的奖励", 0, 2)
        end
        if x256224_var_BonusMoney5 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256224_var_BonusMoney5.."#Y的奖励", 0, 2)
        end
        if x256224_var_BonusMoney6 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256224_var_BonusMoney6.."#Y的奖励", 0, 2)
        end
    end
end

function x256224_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x256224_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256224_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x256224_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256224_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x256224_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256224_var_QuestId) < 1 then
        return
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256224_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256224_var_MP_dengmi, 1)
    x256224_ProcQuestLogRefresh( varMap, varPlayer, x256224_var_QuestId)
end

function x256224_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x256224_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x256224_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256224_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256224_var_QuestId, varState, -1 )
    end
end

function x256224_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
end

function x256224_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	
end

function x256224_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256224_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256224_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	
end

function x256224_OpenCheck( varMap, varPlayer, varTalknpc )
	
end

function x256224_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    if IsHaveQuest( varMap, varPlayer, x256224_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256224_var_QuestId)
    local yizhe = GetQuestParam( varMap, varPlayer, varQuestIdx, x256224_var_MP_yizhe)
    local dengmi = GetQuestParam( varMap, varPlayer, varQuestIdx, x256224_var_MP_dengmi)
    local tiesan = GetQuestParam( varMap, varPlayer, varQuestIdx, x256224_var_MP_tiesan)
    local wuting= GetQuestParam( varMap, varPlayer, varQuestIdx, x256224_var_MP_wuting)
    local strTarget = format( "任务已经完成，请回报@npc_%d", x256224_var_NpcGUID[1].guid)

    if yizhe == 1 and dengmi == 1 and tiesan == 1 and wuting== 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        if yizhe == 0 then
            strTarget = "  #W完成@npc_28828(0/1)\n"
        else
            strTarget = "  #G完成@npc_28828(1/1)\n"
        end
        if dengmi == 0 then
            strTarget = strTarget.."  #W答对@npc_28829(0/1)\n"
        else
            strTarget = strTarget.."  #G答对@npc_28829(1/1)\n"
        end
        if tiesan == 0 then
            strTarget = strTarget.."  #W完成@npc_28830(0/1)\n"
        else
            strTarget = strTarget.."  #G完成@npc_28830(1/1)\n"
        end
        if wuting== 0 then
            strTarget = strTarget.."  #W进入@npc_28831(0/1)"
        else
            strTarget = strTarget.."  #G进入@npc_28831(1/1)"
        end
    end

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x256224_var_QuestName,          
                                strTarget,
                                "",                             
                                "去@npc_139129，@npc_139133，@npc_139100，@npc_139104处，完成大都嘉年华的各项任务。",
                                "\t京城的繁华岂非王城可比，机会随处都在。你可以去@npc_139129，@npc_139133，@npc_139100，@npc_139104他们那里看看，大都嘉年华一系列有趣的任务都在等待着你。",
                                "@npc_139129，@npc_139133，@npc_139100，@npc_139104的大都嘉年华任务都非常有趣，完成后你会有很多收获。"
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


function x256224_Finishyizhe( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256224_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256224_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256224_var_MP_yizhe, 1)

    x256224_ProcQuestLogRefresh( varMap, varPlayer, x256224_var_QuestId)
end


function x256224_Finishdengmi( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256224_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256224_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256224_var_MP_dengmi, 1)

    x256224_ProcQuestLogRefresh( varMap, varPlayer, x256224_var_QuestId)
end


function x256224_Finishtiesan( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256224_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256224_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256224_var_MP_tiesan, 1)

    x256224_ProcQuestLogRefresh( varMap, varPlayer, x256224_var_QuestId)
end

function x256224_Finishwuting( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256224_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256224_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256224_var_MP_wuting, 1)

    x256224_ProcQuestLogRefresh( varMap, varPlayer, x256224_var_QuestId)
end
