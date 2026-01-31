

--DECLARE_QUEST_INFO_START--
x256222_var_FileId = 256222

x256222_var_QuestId = 3113
x256222_var_LevelLess	= 32
x256222_var_QuestIdNext = -1
x256222_var_Name	={}
x256222_var_ExtTarget={{type=20,n=1,target="完成一次@npc_82060"},{type=20,n=1,target="乘坐一次@npc_82061"},{type=20,n=1,target="完成一次@npc_82062"},}
x256222_var_QuestName="【个人】三十级后的精彩"
x256222_var_QuestInfo="\t谢谢你的问候，我这些时日一切安好。对了，在@npc_138580，@npc_138572和@npc_138509那里有些小任务需要完成，你也好趁此机会历练一下自己，不必担心任务都很简单。"  
x256222_var_QuestTarget=""		
x256222_var_QuestCompleted="\t看你满面红光，一定是大有收获。\n\t记得每天都去他们那里看看，收获定然是不会少的。"					
x256222_var_ContinueInfo="\t做事就要做到底，不可半途而废。"
x256222_var_QuestHelp =	""
x256222_var_DemandItem ={}
x256222_var_BonusMoney1 =10000
x256222_var_BonusMoney2 =0
x256222_var_BonusMoney3 =0
x256222_var_BonusMoney4 =0
x256222_var_BonusMoney5 =21
x256222_var_BonusMoney6 =0
x256222_var_BonusItem	=	{}
x256222_var_BonusChoiceItem ={}
x256222_var_ExpBonus = 85000
x256222_var_NpcGUID ={{ guid = 138575, varName = "万事通"} }
--DECLARE_QUEST_INFO_STOP--


x256222_var_MP_baoxiang       = 1

x256222_var_MP_Gongche       = 2

x256222_var_MP_Lunhuitai   = 3

x256222_var_MaxLevel      = 160

function x256222_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256222_var_LevelLess or varLevel >= x256222_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256222_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x256222_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256222_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256222_var_QuestId, varState, -1 )
	end
end

function x256222_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    if x256222_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x256222_var_ExpBonus )
    end
    if x256222_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x256222_var_BonusMoney1 )
    end
    if x256222_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x256222_var_BonusMoney2 )
    end
    if x256222_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x256222_var_BonusMoney3 )
    end
    if x256222_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x256222_var_BonusMoney4 )
    end
    if x256222_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x256222_var_BonusMoney5 )
    end
    if x256222_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x256222_var_BonusMoney6 )
    end
    for varI, item in x256222_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end
    for varI, item in x256222_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end
end

function x256222_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256222_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x256222_var_QuestId) > 0 then
        if x256222_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256222_var_QuestName)
            TalkAppendString(varMap,x256222_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256222_var_FileId, x256222_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256222_var_QuestName)
            TalkAppendString(varMap,x256222_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x256222_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256222_var_FileId, x256222_var_QuestId);
        end
    elseif x256222_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x256222_var_QuestName)
        TalkAppendString(varMap,x256222_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标：")
        for varI, item in x256222_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        if x256222_var_QuestHelp ~= "" then
            TalkAppendString(varMap,"\n#G小提示:#W")
            TalkAppendString(varMap,x256222_var_QuestHelp )
        end
        x256222_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256222_var_FileId, x256222_var_QuestId);
    end
end

function x256222_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x256222_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256222_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end

function x256222_ProcYinDaoCompleted( varMap, varPlayer, varMode)   
	if varMode==nil then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, x256222_var_QuestId ) == 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256222_var_QuestId)  

	local n1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )	
	local n2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local n3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )                                                

    if varMode ==0 then 
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)

   		if n2==1 and n3==1 then
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	elseif varMode==1 then 
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
   		if n1==1 and n3==1 then
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	elseif varMode==2 then	
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,2,1)
   		if n1==1 and n2==1 then
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	end
end

function x256222_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x256222_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256222_var_QuestId  )
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

    if x256222_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x256222_var_QuestId, x256222_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256222_var_QuestId)                                                  
            x256222_Msg2toplayer( varMap, varPlayer,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256222_var_MP_baoxiang,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256222_var_MP_Gongche,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256222_var_MP_Lunhuitai,0)
            x256222_ProcQuestLogRefresh( varMap, varPlayer, x256222_var_QuestId)
        end
    end                                                                    
end

function x256222_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x256222_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x256222_var_QuestId)
    x256222_Msg2toplayer( varMap, varPlayer, 1)
end

function x256222_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256222_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end
    for j, item in x256222_var_BonusChoiceItem do
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

function x256222_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256222_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256222_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256222_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x256222_var_QuestId) > 0 then
        x256222_Msg2toplayer( varMap, varPlayer,2)
        QuestCom(varMap, varPlayer, x256222_var_QuestId)
        x256222_GetBonus( varMap, varPlayer,varTalknpc)
        StartItemTask(varMap)
        for varI, item in x256222_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        for varI, item in x256222_var_BonusChoiceItem do
            if item.item == varRadioSelected then
                ItemAppend( varMap, item.item, item.n )
            end
        end
        StopItemTask(varMap,varPlayer)
       
   end
   
end

function x256222_GetBonus( varMap, varPlayer,varTalknpc)
	if x256222_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x256222_var_ExpBonus);
  	end
	if x256222_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256222_var_BonusMoney1)
	end
    if x256222_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256222_var_BonusMoney2)
    end
    if x256222_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x256222_var_BonusMoney3)
    end
    if x256222_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x256222_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
    end
    if x256222_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer)
        varShengWang = varShengWang + x256222_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
    end
    if x256222_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x256222_var_BonusMoney6)
    end
end

function x256222_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256222_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256222_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256222_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256222_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256222_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256222_var_QuestName.."！", 0, 3)
        if x256222_var_ExpBonus > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256222_var_ExpBonus.."#Y的奖励", 0, 2)
        end
        if x256222_var_BonusMoney1 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256222_var_BonusMoney1.."文#Y的奖励", 0, 2)
        end
        if x256222_var_BonusMoney2 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256222_var_BonusMoney2.."文#Y的奖励", 0, 2)
        end
        if x256222_var_BonusMoney3 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256222_var_BonusMoney3.."文#Y的奖励", 0, 2)
        end
        if x256222_var_BonusMoney4 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256222_var_BonusMoney4.."#Y的奖励", 0, 2)
        end
        if x256222_var_BonusMoney5 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256222_var_BonusMoney5.."#Y的奖励", 0, 2)
        end
        if x256222_var_BonusMoney6 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256222_var_BonusMoney6.."#Y的奖励", 0, 2)
        end
    end
end

function x256222_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x256222_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256222_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x256222_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256222_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x256222_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256222_var_QuestId) < 1 then
        return
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256222_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256222_var_MP_Gongche, 1)
    x256222_ProcQuestLogRefresh( varMap, varPlayer, x256222_var_QuestId)
end

function x256222_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x256222_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x256222_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256222_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256222_var_QuestId, varState, -1 )
    end
end

function x256222_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256222_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256222_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256222_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256222_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256222_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x256222_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    local baoxiang= GetQuestParam( varMap, varPlayer, varQuestIdx, x256222_var_MP_baoxiang)
    local Gongche = GetQuestParam( varMap, varPlayer, varQuestIdx, x256222_var_MP_Gongche)
    local Lunhuitai = GetQuestParam( varMap, varPlayer, varQuestIdx, x256222_var_MP_Lunhuitai)
    local strTarget = format( "任务已经完成，请回报@npc_%d", x256222_var_NpcGUID[1].guid)

    if baoxiang== 1 and Gongche == 1 and Lunhuitai == 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        if baoxiang== 0 then
            strTarget = "  #W完成一次@npc_82060(0/1)\n"
        else
            strTarget = "  #G完成一次@npc_82060(1/1)\n"
        end
        if Gongche == 0 then
            strTarget = strTarget.."  #W乘坐一次@npc_82061(0/1)\n"
        else
            strTarget = strTarget.."  #G乘坐一次@npc_82061(1/1)\n"
        end
        if Lunhuitai == 0 then
            strTarget = strTarget.."  #W完成一次@npc_82062(0/1)"
        else
            strTarget = strTarget.."  #G完成一次@npc_82062(1/1)"
        end
    end

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x256222_var_QuestName,          
                                strTarget,
                                "",                             
                                "去@npc_138580，@npc_138572，@npc_138509处，分别完成他们每人发布的任务。",
                                "\t谢谢你的问候，我这些时日一切安好。对了，在@npc_138580，@npc_138572和@npc_138509那里有些小任务需要完成，你也好趁此机会历练一下自己，不必担心任务都很简单。",
                                "@npc_138580，@npc_138572，@npc_138509的任务都是非常简单，回报高额的任务。"
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


function x256222_Finishbaoxiang( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256222_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256222_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256222_var_MP_baoxiang, 1)

    x256222_ProcQuestLogRefresh( varMap, varPlayer, x256222_var_QuestId)
end


function x256222_FinishGongche( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256222_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256222_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256222_var_MP_Gongche, 1)

    x256222_ProcQuestLogRefresh( varMap, varPlayer, x256222_var_QuestId)
end


function x256222_FinishLunhuitai( varMap)

	local humancount = GetFuben_PlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
			if IsHaveQuest( varMap, humanId, x256222_var_QuestId) == 1 then

				local varQuestIdx = GetQuestIndexByID( varMap, humanId, x256222_var_QuestId)
				SetQuestByIndex( varMap, humanId, varQuestIdx, x256222_var_MP_Lunhuitai, 1)
				x256222_ProcQuestLogRefresh( varMap, humanId, x256222_var_QuestId)
			
			end
	end

    
end
