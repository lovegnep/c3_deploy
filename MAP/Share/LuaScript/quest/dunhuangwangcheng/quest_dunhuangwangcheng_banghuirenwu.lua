

--DECLARE_QUEST_INFO_START--
x256238_var_FileId = 256238

x256238_var_QuestId = 3128
x256238_var_LevelLess	= 40
x256238_var_QuestIdNext = -1
x256238_var_Name	={}
x256238_var_ExtTarget={{type=20,n=1,target="护送神兽"},{type=20,n=1,target="帮会暗战"},{type=20,n=1,target="收集黑木"},{type=20,n=1,target="粮仓除妖"},}
x256238_var_QuestName="【个人】兴帮之功"
x256238_var_QuestInfo="\t你好，我亲爱的朋友，你如愿的加入了你所向往的帮会。\n\t为了让我们的帮会一天天的强大起来，帮中兄弟要齐心完成帮中的护送神兽，帮会暗战，收集黑木，粮仓除妖任务，在完成后你会得到很丰厚的回报。"  
x256238_var_QuestTarget=""			
x256238_var_QuestCompleted="\t帮中的兄弟对你的表现十分满意，希望你以后再接再厉。"					
x256238_var_ContinueInfo="\t帮会任务，是需要和帮中兄弟合作完成的，你不要太心急。"
x256238_var_QuestHelp =	""
x256238_var_DemandItem ={}
x256238_var_BonusMoney1 =0
x256238_var_BonusMoney2 =0
x256238_var_BonusMoney3 =0
x256238_var_BonusMoney4 =0
x256238_var_BonusMoney5 =0
x256238_var_BonusMoney6 =0
x256238_var_BonusMoney8 =200
x256238_var_BonusItem	=	{}
x256238_var_BonusChoiceItem ={}
x256238_var_ExpBonus = 450000
x256238_var_NpcGUID ={{ guid = 138525, varName = "巫贤"} }
--DECLARE_QUEST_INFO_STOP--




x256238_var_MP_hss   = 1

x256238_var_MP_anzhan  = 2

x256238_var_MP_danmu  = 3

x256238_var_MP_chuyao   = 4

x256238_var_MaxLevel   = 65
function x256238_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGuildID( varMap, varPlayer ) == -1 then
		
		return
	end
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256238_var_LevelLess or varLevel >= x256238_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256238_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x256238_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256238_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256238_var_QuestId, varState, -1 )
	end
end

function x256238_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
    if x256238_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x256238_var_ExpBonus )
    end
    if x256238_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x256238_var_BonusMoney1 )
    end
    if x256238_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x256238_var_BonusMoney2 )
    end
    if x256238_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x256238_var_BonusMoney3 )
    end
    if x256238_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x256238_var_BonusMoney4 )
    end
    if x256238_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x256238_var_BonusMoney5 )
    end
    if x256238_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x256238_var_BonusMoney6 )
    end
    if x256238_var_BonusMoney8 > 0 then
		AddQuestMoneyBonus8(varMap, x256238_var_BonusMoney8 )
	end
    for varI, item in x256238_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end
    for varI, item in x256238_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end
end

function x256238_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256238_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x256238_var_QuestId) > 0 then
        if x256238_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256238_var_QuestName)
            TalkAppendString(varMap,x256238_var_ContinueInfo)
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256238_var_FileId, x256238_var_QuestId);
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x256238_var_QuestName)
            TalkAppendString(varMap,x256238_var_QuestCompleted)
            TalkAppendString(varMap," ")
            x256238_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
            StopTalkTask()
            DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256238_var_FileId, x256238_var_QuestId);
        end
    elseif x256238_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x256238_var_QuestName)
        TalkAppendString(varMap,x256238_var_QuestInfo)
        TalkAppendString( varMap,"#Y任务目标：")
        TalkAppendString( varMap,"找到@npc_82074完成:")
        for varI, item in x256238_var_ExtTarget do
            TalkAppendString( varMap,item.target)
        end 
        if x256238_var_QuestHelp ~= "" then
            TalkAppendString(varMap,"\n#G小提示:#W")
            TalkAppendString(varMap,x256238_var_QuestHelp )
        end
        x256238_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
        StopTalkTask()
        DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256238_var_FileId, x256238_var_QuestId);
    end
end

function x256238_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x256238_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256238_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end















































function x256238_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
    if IsQuestHaveDone(varMap, varPlayer, x256238_var_QuestId) > 0 then
        return 
    end
    if IsQuestFullNM(varMap,varPlayer)==1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"可接任务数量已满")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 
    end

    
	  local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256238_var_QuestId  )
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

    if x256238_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
        local retmiss = AddQuest( varMap, varPlayer, x256238_var_QuestId, x256238_var_FileId, 0, 0, 0, 1)
        if retmiss ==0 then
            Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
            return 0
        else
            local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256238_var_QuestId)                                                  
            x256238_Msg2toplayer( varMap, varPlayer,0)
           
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256238_var_MP_hss,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256238_var_MP_anzhan,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256238_var_MP_danmu,0)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,x256238_var_MP_chuyao,0)
            x256238_ProcQuestLogRefresh( varMap, varPlayer, x256238_var_QuestId)
        end
    end                                                                    
end

function x256238_ProcQuestAbandon(varMap, varPlayer, varQuest)
    if IsHaveQuest(varMap,varPlayer, x256238_var_QuestId) <= 0 then
        return 
    end
    DelQuest( varMap, varPlayer, x256238_var_QuestId)
    x256238_Msg2toplayer( varMap, varPlayer, 1)
end

function x256238_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256238_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end
    for j, item in x256238_var_BonusChoiceItem do
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

function x256238_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256238_var_QuestId) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有这个任务！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256238_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"您没有达到完成条件！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif x256238_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"背包空间不足，请清理后再来！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
	elseif DelQuest(varMap, varPlayer, x256238_var_QuestId) > 0 then
        x256238_Msg2toplayer( varMap, varPlayer,2)
        QuestCom(varMap, varPlayer, x256238_var_QuestId)
        x256238_GetBonus( varMap, varPlayer,varTalknpc)
        StartItemTask(varMap)
        for varI, item in x256238_var_BonusItem do
            ItemAppendBind( varMap, item.item, item.n )
        end
        for varI, item in x256238_var_BonusChoiceItem do
            if item.item == varRadioSelected then
                ItemAppend( varMap, item.item, item.n )
            end
        end
        StopItemTask(varMap,varPlayer)
       	
   end
   
end

function x256238_GetBonus( varMap, varPlayer,varTalknpc)
	if x256238_var_ExpBonus > 0 then
		AddExp(varMap, varPlayer, x256238_var_ExpBonus);
  	end
	if x256238_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256238_var_BonusMoney1)
	end
    if x256238_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256238_var_BonusMoney2)
    end
    if x256238_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x256238_var_BonusMoney3)
    end
    if x256238_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x256238_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
    end
    if x256238_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer)
        varShengWang = varShengWang + x256238_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
    end
    if x256238_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x256238_var_BonusMoney6)
    end
    if x256238_var_BonusMoney8 > 0 then
		AddGuildUserPoint(varMap,varPlayer,x256238_var_BonusMoney8)	
		local BonusMoney8 = x256238_var_BonusMoney8
		local pointText = "#Y获得#R帮贡"..BonusMoney8.."点#Y的奖励"
		StartTalkTask(varMap)
		TalkAppendString(varMap, pointText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)			
  		Msg2Player(varMap,varPlayer,pointText,8,2)
	end
end

function x256238_Msg2toplayer( varMap, varPlayer,type)
    if type == 0 then
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256238_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您接受了任务："..x256238_var_QuestName.."！", 0, 3)
    elseif type == 1 then
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256238_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您放弃了任务："..x256238_var_QuestName.."！", 0, 3)
    elseif type == 2 then
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256238_var_QuestName.."！", 0, 2)
        Msg2Player(varMap, varPlayer, "您完成了任务"..x256238_var_QuestName.."！", 0, 3)      
        if x256238_var_ExpBonus > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256238_var_ExpBonus.."#Y的奖励", 0, 2)
        end
        if x256238_var_BonusMoney1 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256238_var_BonusMoney1.."文#Y的奖励", 0, 2)
        end
        if x256238_var_BonusMoney2 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256238_var_BonusMoney2.."文#Y的奖励", 0, 2)
        end
        if x256238_var_BonusMoney3 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256238_var_BonusMoney3.."文#Y的奖励", 0, 2)
        end
        if x256238_var_BonusMoney4 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256238_var_BonusMoney4.."#Y的奖励", 0, 2)
        end
        if x256238_var_BonusMoney5 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256238_var_BonusMoney5.."#Y的奖励", 0, 2)
        end
        if x256238_var_BonusMoney6 > 0 then
            Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256238_var_BonusMoney6.."#Y的奖励", 0, 2)
        end
    end
end

function x256238_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x256238_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256238_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end

function x256238_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256238_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end












function x256238_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x256238_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
    if IsHaveQuest(varMap,varPlayer, x256238_var_QuestId) > 0 then
        local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256238_var_QuestId)
        TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256238_var_QuestId, varState, -1 )
    end
end

function x256238_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256238_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256238_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256238_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256238_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256238_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x256238_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    
    local hss = GetQuestParam( varMap, varPlayer, varQuestIdx, x256238_var_MP_hss)
    local anzhan = GetQuestParam( varMap, varPlayer, varQuestIdx, x256238_var_MP_anzhan)
    local danmu= GetQuestParam( varMap, varPlayer, varQuestIdx, x256238_var_MP_danmu)
    local chuyao= GetQuestParam( varMap, varPlayer, varQuestIdx, x256238_var_MP_chuyao)
    local strTarget = format( "任务已经完成，请回报@npc_%d", x256238_var_NpcGUID[1].guid)

    if hss == 1 and anzhan == 1 and danmu== 1 and chuyao== 1 then
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    else
        if hss== 0 or anzhan  == 0 or danmu == 0 or chuyao == 0 then      
           strTarget = "  #W找到@npc_82074完成:\n"
        end
        if hss == 0 then
       
            strTarget =strTarget.."  #W护送神兽(0/1)\n"
        else
            strTarget =strTarget.."  #G护送神兽(1/1)\n"
        end
        if anzhan == 0 then
            strTarget = strTarget.."  #W帮会暗战(0/1)\n"
        else
            strTarget = strTarget.."  #G帮会暗战(1/1)\n"
        end
        if danmu== 0 then
            strTarget = strTarget.."  #W收集黑木(0/1)\n"
        else
            strTarget = strTarget.."  #G收集黑木(1/1)\n"
        end
         if chuyao== 0 then
            strTarget = strTarget.."  #W粮仓除妖(0/1)\n"
        else
            strTarget = strTarget.."  #G粮仓除妖(1/1)\n"
        end
    end

	StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                                "",                             
                                x256238_var_QuestName,          
                                strTarget,
                                "",                             
                                "找到@npc_138533完成护送神兽，帮会暗战，收集黑木，粮仓除妖",
                                "\t你好，我亲爱的朋友，你如愿的加入了你所向往的帮会。\n\t为了让我们的帮会一天天的强大起来，帮中兄弟要齐心完成帮中的护送神兽，帮会暗战，收集黑木，粮仓除妖任务，在完成后你会得到很丰厚的回报。",
                                "@npc_138533的任务都是回报高额的任务，但是要注意安全。"
                                )
       	if x256238_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256238_var_ExpBonus )
		end
		if x256238_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256238_var_BonusMoney1 )
		end
		if x256238_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256238_var_BonusMoney2 )
		end
		if x256238_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256238_var_BonusMoney3 )
		end
		if x256238_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256238_var_BonusMoney4 )
		end
		if x256238_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256238_var_BonusMoney5 )
		end
		if x256238_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256238_var_BonusMoney6 )
		end
		if x256238_var_BonusMoney8 > 0 then
			AddQuestMoneyBonus8(varMap, x256238_var_BonusMoney8 )
		end
		
		
		
		for varI, item in x256238_var_BonusItem do
	   		AddQuestItemBonus(varMap, item.item, item.n)
 		end
		for varI, item in x256238_var_BonusChoiceItem do
    		AddQuestRadioItemBonus(varMap, item.item, item.n)
  		end

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end














function x256238_Finishhss( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256238_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256238_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256238_var_MP_hss, 1)

    x256238_ProcQuestLogRefresh( varMap, varPlayer, x256238_var_QuestId)
end


function x256238_Finishanzhan( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256238_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256238_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256238_var_MP_anzhan, 1)

    x256238_ProcQuestLogRefresh( varMap, varPlayer, x256238_var_QuestId)
end

function x256238_Finishdanmu( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256238_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256238_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256238_var_MP_danmu, 1)

    x256238_ProcQuestLogRefresh( varMap, varPlayer, x256238_var_QuestId)
end

function x256238_Finishchuyao( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256238_var_QuestId) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256238_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x256238_var_MP_chuyao, 1)

    x256238_ProcQuestLogRefresh( varMap, varPlayer, x256238_var_QuestId)
end

function x256238_LevelUp( varMap, varPlayer)
    if IsHaveQuest( varMap, varPlayer, x256238_var_QuestId) < 1 then
        return
    end

    
    if   GetLevel(varMap, varPlayer) >= 65 then
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256238_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
    end
end 
