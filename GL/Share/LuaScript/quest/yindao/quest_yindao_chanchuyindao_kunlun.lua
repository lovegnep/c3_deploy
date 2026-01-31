

--DECLARE_QUEST_INFO_START--
x203807_var_FileId = 203807
x203807_var_QuestIdPre = 2705
x203807_var_QuestId = 2709
x203807_var_LevelLess	= 34 
x203807_var_QuestIdNext = -1
x203807_var_Name	={}
x203807_var_ExtTarget={{type=20,n=1,target="完成一次@npc_59922"}}
x203807_var_QuestName="【个人】藏宝洞的财富（二）"
x203807_var_QuestInfo="\t事情比我们看到的还要严重，藏宝洞的深处有很多怪物活动，他们的头子也在其中。为了永远的解除这个隐患，去里面清除这些畜生吧。\n\t顺利除掉他们后，你会得到和丰厚的奖励，祝你好运年轻人。"  
x203807_var_QuestTarget=""		
x203807_var_QuestCompleted="\t看来我小看你了，你的出色表现让我折服。\n\t记得每天都来我这里看看，相信我们会互惠互利。"					
x203807_var_ContinueInfo="切勿急功近利，这是一项危险的任务，注意安全，但是奖励丰厚"
x203807_var_QuestHelp =	""
x203807_var_DemandItem ={}
x203807_var_BonusMoney1 =5000
x203807_var_BonusMoney2 =0
x203807_var_BonusMoney3 =0
x203807_var_BonusMoney4 =0
x203807_var_BonusMoney5 =0
x203807_var_BonusMoney6 =0
x203807_var_BonusItem	=	{}
x203807_var_BonusChoiceItem ={}
x203807_var_ExpBonus = 55000
x203807_var_NpcGUID ={{ guid = 129008, varName = "嘎夏布"} }
--DECLARE_QUEST_INFO_STOP--






x203807_var_MP_Chanchufuben   = 3

x203807_var_MaxLevel      = 54

function x203807_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203807_var_LevelLess or varLevel >= x203807_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x203807_var_QuestId) > 0 then
		return 
	end
  if IsQuestHaveDone(varMap, varPlayer, x203807_var_QuestIdPre)> 0 then
	   if IsHaveQuest(varMap,varPlayer, x203807_var_QuestId) <= 0 then
		  local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203807_var_QuestId)
		  TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203807_var_QuestId, varState, -1 )
	   end
 end
end

function x203807_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    if x203807_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x203807_var_ExpBonus )
    end
    if x203807_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x203807_var_BonusMoney1 )
    end
    if x203807_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x203807_var_BonusMoney2 )
    end
    if x203807_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x203807_var_BonusMoney3 )
    end
    if x203807_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x203807_var_BonusMoney4 )
    end
    if x203807_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x203807_var_BonusMoney5 )
    end
    if x203807_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x203807_var_BonusMoney6 )
    end
    for varI, item in x203807_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end
    for varI, item in x203807_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end
end

function x203807_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203807_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x203807_var_QuestId) > 0 then
        if x203807_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x203807_var_QuestName)
            TalkAppendString(varMap,x203807_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203807_var_FileId, x203807_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x203807_var_QuestName)
            TalkAppendString(varMap,x203807_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x203807_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203807_var_FileId, x203807_var_QuestId);
        end
    elseif x203807_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x203807_var_QuestName)
        TalkAppendString(varMap,x203807_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标：")
        for varI, item in x203807_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        if x203807_var_QuestHelp ~= "" then
            TalkAppendString(varMap,"\n#G小提示:#W")
            TalkAppendString(varMap,x203807_var_QuestHelp )
        end
        x203807_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203807_var_FileId, x203807_var_QuestId);
    end
end

function x203807_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
				if IsQuestHaveDone(varMap, varPlayer, x203807_var_QuestIdPre)> 0 then
					return 1
		end
		return 0
end

function x203807_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203807_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end

function x203807_ProcYinDaoCompleted( varMap, varPlayer, varMode)   
	if varMode==nil then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, x203807_var_QuestId ) == 0 then
		return
	end

	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203807_var_QuestId)  

	local n1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )	
	
	

    if varMode ==0 then 
   		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)

   		
   			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
   		end
   	
   	
   	
   	
   	
   	
   	
   	
   	
   	
   	
end

function x203807_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x203807_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
    local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203807_var_QuestId  )
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

    if x203807_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x203807_var_QuestId, x203807_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203807_var_QuestId)                                                  
            x203807_Msg2toplayer( varMap, varPlayer,0)
            
            
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x203807_var_MP_Chanchufuben,0)
            x203807_ProcQuestLogRefresh( varMap, varPlayer, x203807_var_QuestId)
        end
    end                                                                    
end

function x203807_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x203807_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x203807_var_QuestId)
    x203807_Msg2toplayer( varMap, varPlayer, 1)
end

function x203807_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203807_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end
    for j, item in x203807_var_BonusChoiceItem do
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

function x203807_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203807_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x203807_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x203807_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x203807_var_QuestId) > 0 then
        x203807_Msg2toplayer( varMap, varPlayer,2)
        QuestCom(varMap, varPlayer, x203807_var_QuestId)
        x203807_GetBonus( varMap, varPlayer,varTalknpc)
        StartItemTask(varMap)
        for varI, item in x203807_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        for varI, item in x203807_var_BonusChoiceItem do
            if item.item == varRadioSelected then
                ItemAppend( varMap, item.item, item.n )
            end
        end
        StopItemTask(varMap,varPlayer)
       
   end
   
end

function x203807_GetBonus( varMap, varPlayer,varTalknpc)
	if x203807_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x203807_var_ExpBonus);
  	end
	if x203807_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203807_var_BonusMoney1)
	end
    if x203807_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203807_var_BonusMoney2)
    end
    if x203807_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x203807_var_BonusMoney3)
    end
    if x203807_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x203807_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
    end
    if x203807_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer)
        varShengWang = varShengWang + x203807_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
    end
    if x203807_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x203807_var_BonusMoney6)
    end
end

function x203807_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务"..x203807_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务"..x203807_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务"..x203807_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务"..x203807_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x203807_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x203807_var_QuestName.."！", 0, 3)
        if x203807_var_ExpBonus > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203807_var_ExpBonus.."#Y的奖励", 0, 2)
        end
        if x203807_var_BonusMoney1 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203807_var_BonusMoney1.."文#Y的奖励", 0, 2)
        end
        if x203807_var_BonusMoney2 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203807_var_BonusMoney2.."文#Y的奖励", 0, 2)
        end
        if x203807_var_BonusMoney3 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203807_var_BonusMoney3.."文#Y的奖励", 0, 2)
        end
        if x203807_var_BonusMoney4 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203807_var_BonusMoney4.."#Y的奖励", 0, 2)
        end
        if x203807_var_BonusMoney5 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203807_var_BonusMoney5.."#Y的奖励", 0, 2)
        end
        if x203807_var_BonusMoney6 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203807_var_BonusMoney6.."#Y的奖励", 0, 2)
        end
    end
end

function x203807_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203807_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203807_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x203807_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203807_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x203807_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x203807_var_QuestId) < 1 then
        return
    end

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203807_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x203807_var_MP_Hunt, 1)
    x203807_ProcQuestLogRefresh( varMap, varPlayer, x203807_var_QuestId)
end

function x203807_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203807_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x203807_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203807_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203807_var_QuestId, varState, -1 )
    end
end

function x203807_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203807_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203807_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203807_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203807_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203807_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203807_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    
   
    local Chanchufuben = GetQuestParam( varMap, varPlayer, varQuestIdx, x203807_var_MP_Chanchufuben)
    local strTarget = format( "任务已经完成，请回报@npc_%d", x203807_var_NpcGUID[1].guid)

    if Chanchufuben == 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        
        
        
        
        
        
        
        
        
        
        if Chanchufuben == 0 then
            strTarget = "  #W完成一次@npc_59922(0/1)"
        else
            strTarget = strTarget.."  #G完成一次@npc_59922(1/1)"
        end
    end

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x203807_var_QuestName,          
                                strTarget,
                                "",                             
                                "去找@npc_129008，完成他发布的任务。",
                                "\t事情比我们看到的还要严重，藏宝洞的深处有很多怪物活动，他们的头子也在其中。为了永远的解除这个隐患，去里面清除这些畜生吧。\n\t顺利除掉他们后，你会得到和丰厚的奖励，祝你好运年轻人。" ,
                                "@npc_129008的任务非常艰巨，但回报高额。"
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


























function x203807_FinishChanchufuben( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x203807_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x203807_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x203807_var_MP_Chanchufuben, 1)

    x203807_ProcQuestLogRefresh( varMap, varPlayer, x203807_var_QuestId)
end
