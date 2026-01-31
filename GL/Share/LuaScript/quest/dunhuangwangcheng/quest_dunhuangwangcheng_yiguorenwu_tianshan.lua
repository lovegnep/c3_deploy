

--DECLARE_QUEST_INFO_START--
x256269_var_FileId = 256269
x256269_var_QuestIdPre = 2625
x256269_var_QuestId = 2609
x256269_var_LevelLess	= 40
x256269_var_QuestIdNext = -1
x256269_var_Name	={}
x256269_var_ExtTarget={{type=20,n=1,target="@npc_28816"},{type=20,n=1,target="@npc_28817"},{type=20,n=1,target="@npc_28818"},{type=20,n=1,target="@npc_28819"},}
x256269_var_QuestName="【个人】国家使命"
x256269_var_QuestInfo="\t我等你很久了，到了你这样的修为的人，应该开始为国家尽一份力了。\n\t找到@npc_128502，@npc_128503，@npc_128504，@npc_128505完成他们所交代的任务，你会获得丰厚的奖励。"  
x256269_var_QuestTarget=""		
x256269_var_QuestCompleted="\t这等为国效力的事，乃是我等臣民应尽之责。\n\t记得每天都去他们那里完成任务，臣民百姓会记得你，你的奖励也不会少。"					
x256269_var_ContinueInfo="\t失败不可怕，可怕的是你自此丧失斗志。"
x256269_var_QuestHelp =	""
x256269_var_DemandItem ={}
x256269_var_ExpBonus = 55000
x256269_var_BonusMoney1 =5000
x256269_var_BonusMoney2 =0
x256269_var_BonusMoney3 =0
x256269_var_BonusMoney4 =0
x256269_var_BonusMoney5 =200
x256269_var_BonusMoney6 =0
x256269_var_BonusItem	=	{}
x256269_var_BonusChoiceItem ={}
x256269_var_NpcGUID ={{ guid = 128552, varName = "古力佩罗"} }
--DECLARE_QUEST_INFO_STOP--


x256269_var_MP_cisha  = 1

x256269_var_MP_duoqi   = 2

x256269_var_MP_chujian  = 3

x256269_var_MP_qingbao  = 4

x256269_var_MaxLevel   = 55

function x256269_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256269_var_LevelLess or varLevel >= x256269_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256269_var_QuestId) > 0 then
		return 
	end
	
  if IsQuestHaveDone(varMap, varPlayer, x256269_var_QuestIdPre)> 0 then 
	if IsHaveQuest(varMap,varPlayer, x256269_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256269_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256269_var_QuestId, varState, -1 )
	end
	end
end

function x256269_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    if x256269_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x256269_var_ExpBonus )
    end
    if x256269_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x256269_var_BonusMoney1 )
    end
    if x256269_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x256269_var_BonusMoney2 )
    end
    if x256269_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x256269_var_BonusMoney3 )
    end
    if x256269_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x256269_var_BonusMoney4 )
    end
    if x256269_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x256269_var_BonusMoney5 )
    end
    if x256269_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x256269_var_BonusMoney6 )
    end
    for varI, item in x256269_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end
    for varI, item in x256269_var_BonusChoiceItem do
       AddQuestRadioItemBonus(varMap, item.item, item.n)
    end
end

function x256269_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256269_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x256269_var_QuestId) > 0 then
        if x256269_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256269_var_QuestName)
            TalkAppendString(varMap,x256269_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256269_var_FileId, x256269_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256269_var_QuestName)
            TalkAppendString(varMap,x256269_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x256269_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256269_var_FileId, x256269_var_QuestId);
        end
    elseif x256269_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x256269_var_QuestName)
        TalkAppendString(varMap,x256269_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标：")
        TalkAppendString( varMap,"完成以下任务：")
        for varI, item in x256269_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        if x256269_var_QuestHelp ~= "" then
            TalkAppendString(varMap,"\n#G小提示:#W")
            TalkAppendString(varMap,x256269_var_QuestHelp )
        end
        x256269_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256269_var_FileId, x256269_var_QuestId);
    end
end

function x256269_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x256269_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256269_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end

function x256269_ProcYinDaoCompleted( varMap, varPlayer, varMode)   
	if varMode==nil then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, x256269_var_QuestId ) == 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256269_var_QuestId)  

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

function x256269_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x256269_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256269_var_QuestId  )
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


    if x256269_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x256269_var_QuestId, x256269_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256269_var_QuestId)                                                  
            x256269_Msg2toplayer( varMap, varPlayer,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256269_var_MP_cisha,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256269_var_MP_duoqi,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256269_var_MP_chujian,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256269_var_MP_qingbao,0)
            x256269_ProcQuestLogRefresh( varMap, varPlayer, x256269_var_QuestId)
        end
    end                                                                    
end

function x256269_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x256269_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x256269_var_QuestId)
    x256269_Msg2toplayer( varMap, varPlayer, 1)
end

function x256269_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256269_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end
    for j, item in x256269_var_BonusChoiceItem do
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

function x256269_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256269_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256269_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256269_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x256269_var_QuestId) > 0 then
        x256269_Msg2toplayer( varMap, varPlayer,2)
        QuestCom(varMap, varPlayer, x256269_var_QuestId)
        x256269_GetBonus( varMap, varPlayer,varTalknpc)
        StartItemTask(varMap)
        for varI, item in x256269_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        for varI, item in x256269_var_BonusChoiceItem do
            if item.item == varRadioSelected then
                ItemAppend( varMap, item.item, item.n )
            end
        end
        StopItemTask(varMap,varPlayer)
       	
   end
   
end

function x256269_GetBonus( varMap, varPlayer,varTalknpc)
	if x256269_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x256269_var_ExpBonus);
  	end
	if x256269_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256269_var_BonusMoney1)
	end
    if x256269_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256269_var_BonusMoney2)
    end
    if x256269_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x256269_var_BonusMoney3)
    end
    if x256269_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x256269_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
    end
    if x256269_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer)
        varShengWang = varShengWang + x256269_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
    end
    if x256269_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x256269_var_BonusMoney6)
    end
end

function x256269_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256269_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256269_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256269_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256269_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256269_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256269_var_QuestName.."！", 0, 3)      
        if x256269_var_ExpBonus > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256269_var_ExpBonus.."#Y的奖励", 0, 2)
        end
        if x256269_var_BonusMoney1 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256269_var_BonusMoney1.."文#Y的奖励", 0, 2)
        end
        if x256269_var_BonusMoney2 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256269_var_BonusMoney2.."文#Y的奖励", 0, 2)
        end
        if x256269_var_BonusMoney3 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256269_var_BonusMoney3.."文#Y的奖励", 0, 2)
        end
        if x256269_var_BonusMoney4 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256269_var_BonusMoney4.."#Y的奖励", 0, 2)
        end
        if x256269_var_BonusMoney5 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256269_var_BonusMoney5.."#Y的奖励", 0, 2)
        end
        if x256269_var_BonusMoney6 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256269_var_BonusMoney6.."#Y的奖励", 0, 2)
        end
    end
end

function x256269_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x256269_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256269_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x256269_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256269_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x256269_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256269_var_QuestId) < 1 then
        return
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256269_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256269_var_MP_duoqi, 1)
    x256269_ProcQuestLogRefresh( varMap, varPlayer, x256269_var_QuestId)
end

function x256269_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x256269_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x256269_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256269_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256269_var_QuestId, varState, -1 )
    end
end

function x256269_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256269_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256269_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256269_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256269_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256269_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x256269_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    local cisha= GetQuestParam( varMap, varPlayer, varQuestIdx, x256269_var_MP_cisha)
    local duoqi = GetQuestParam( varMap, varPlayer, varQuestIdx, x256269_var_MP_duoqi)
    local chujian = GetQuestParam( varMap, varPlayer, varQuestIdx, x256269_var_MP_chujian)
    local qingbao= GetQuestParam( varMap, varPlayer, varQuestIdx, x256269_var_MP_qingbao)
    local strTarget = format( "回报@npc_%d", x256269_var_NpcGUID[1].guid)

    if cisha== 1 and duoqi == 1 and chujian == 1 and qingbao== 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        if cisha== 0 or duoqi == 0 or chujian == 0 or qingbao == 0 then
          strTarget = "  #W完成任务：\n"
        end
         if cisha== 0 then
            strTarget = strTarget.."  #W完成一次@npc_28819(0/1)\n"
        else
            strTarget = strTarget.."  #G完成一次@npc_28819(1/1)\n"
        end
        if duoqi == 0 then
            strTarget = strTarget.."  #W完成一次@npc_28816(0/1)\n"
        else
            strTarget = strTarget.."  #G完成一次@npc_28816(1/1)\n"
        end
        if chujian == 0 then
            strTarget = strTarget.."  #W完成一次@npc_28817(0/1)\n"
        else
            strTarget = strTarget.."  #G完成一次@npc_28817(1/1)\n"
        end
        if qingbao== 0 then
            strTarget = strTarget.."  #W完成一次@npc_28818(0/1)"
        else
            strTarget = strTarget.."  #G完成一次@npc_28818(1/1)"
        end
    end

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x256269_var_QuestName,          
                                strTarget,
                                "",                             
                                "找到@npc_128502，@npc_128503，@npc_128504，@npc_128505完成他们所交代的任务。",
                                "\t我等你很久了，到了你这样的修为的人，应该开始为国家尽一份力了。\n\t找到@npc_128502，@npc_128503，@npc_128504，@npc_128505完成他们所交代的任务，你会获得丰厚的奖励。",
                                "异国任务都是回报高额的任务，但是要注意安全。"
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


function x256269_Finishcisha( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256269_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256269_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256269_var_MP_cisha, 1)

    x256269_ProcQuestLogRefresh( varMap, varPlayer, x256269_var_QuestId)
end


function x256269_Finishduoqi( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256269_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256269_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256269_var_MP_duoqi, 1)

    x256269_ProcQuestLogRefresh( varMap, varPlayer, x256269_var_QuestId)
end


function x256269_Finishchujian( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256269_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256269_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256269_var_MP_chujian, 1)

    x256269_ProcQuestLogRefresh( varMap, varPlayer, x256269_var_QuestId)
end

function x256269_Finishqingbao( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256269_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256269_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256269_var_MP_qingbao, 1)

    x256269_ProcQuestLogRefresh( varMap, varPlayer, x256269_var_QuestId)
end
