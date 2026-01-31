

--DECLARE_QUEST_INFO_START--
x203377_var_FileId = 203377
x203377_var_QuestIdPre =3210
x203377_var_QuestId = 3212
x203377_var_LevelLess	= 	1
x203377_var_QuestIdNext = 3213

x203377_var_ExtTarget={{type=20,n=1,target="找到@npc_138009去报信"}}
x203377_var_QuestName="【新手】王国援兵"
x203377_var_QuestTalk={"武士的现状","武士的特点","如何能成为宗师"}
x203377_var_QuestInfo="\t咱们现在的力量还不足以抵抗他们疯狂的进攻。\n\t现今之际，唯有去王城求援才能解燃眉之急！你现在快马加鞭，去王城附近报信。我会安排一个人在王城附近接应你。希望我们这次的安排能够得到长生天的庇佑！"  
x203377_var_QuestTarget={"  前往@npc_80005,使用背包中（B）的@item_13810501","  向@npc_138009说明情况"}	
x203377_var_QuestCompleted="\t你来的真是时候，海都要有大动作了，他们已经率领大部队要突袭村子了！你赶紧将这个消息告诉村子里的人！"
x203377_var_ContinueInfo="\t你是他们派来的救兵么？"
x203377_var_QuestHelp =	""
x203377_var_DemandItem ={}
x203377_var_ExpBonus = 2200
x203377_var_BonusMoney1 =11
x203377_var_BonusMoney2 =0
x203377_var_BonusMoney3 =0
x203377_var_BonusMoney4 =0
x203377_var_BonusMoney5 =12
x203377_var_BonusMoney6 =0
x203377_var_BonusItem	=	{}
x203377_var_BonusChoiceItem ={}
x203377_var_NpcGUID = {{ guid = 138009, varName = "间谍"} }

--DECLARE_QUEST_INFO_STOP--
x203377_var_item = 13810501
x203377_var_NPCTalk ={
"现今之际，唯有去王城求援才能解燃眉之急！",
}

function x203377_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203377_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203377_var_QuestIdPre) > 0 then
				if IsHaveQuest(varMap,varPlayer, x203377_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203377_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203377_var_QuestId, varState, -1 )
					  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 )					 
				end
	end
end

function x203377_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203377_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203377_var_ExpBonus )
		end
		if x203377_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203377_var_BonusMoney1 )
		end
		if x203377_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203377_var_BonusMoney2 )
		end
		if x203377_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203377_var_BonusMoney3 )
		end
		if x203377_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203377_var_BonusMoney4 )
		end
		if x203377_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203377_var_BonusMoney5 )
		end
		if x203377_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203377_var_BonusMoney6 )
		end
		for varI, item in x203377_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203377_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203377_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
    local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203377_var_QuestId)
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203377_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203377_var_QuestId) > 0 then
		if x203377_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x203377_var_QuestName)
			TalkAppendString(varMap,x203377_var_QuestCompleted)
			TalkAppendString(varMap," ")
			x203377_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203377_var_FileId, x203377_var_QuestId);
		end
  elseif x203377_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
  		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
		StartTalkTask(varMap)
  		TalkAppendString(varMap,"#Y"..x203377_var_QuestName)
		TalkAppendString(varMap,x203377_var_QuestInfo)
		TalkAppendString( varMap,"#Y任务目标：") 
		--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
		for varI, item in x203377_var_ExtTarget do
				TalkAppendString( varMap,item.target)
		end 
		if x203377_var_QuestHelp ~= "" then
			TalkAppendString(varMap,"\n#G小提示:#W")
			TalkAppendString(varMap,x203377_var_QuestHelp )
		end
		x203377_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		StopTalkTask()
		DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203377_var_FileId, x203377_var_QuestId);
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
end

function x203377_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203377_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203377_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203377_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203377_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,7) >0 then
	        return 1
	end
	return 0
end

function x203377_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203377_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203377_var_QuestId  )
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
		if x203377_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
				
				local space =GetBagSpace(varMap, varPlayer)
				if space == 0 then 
					Msg2Player(varMap, varPlayer, "背包已满无法领取任务", 0, 3) 
					return 
				end
				
				local retmiss = AddQuest( varMap, varPlayer, x203377_var_QuestId, x203377_var_FileId, 0, 1, 0,1)
				if retmiss ==0 then
					Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
					return 0
				else
	  			x203377_Msg2toplayer( varMap, varPlayer,0)
    			StartItemTask(varMap)
				ItemAppend( varMap, x203377_var_item,1 )
  				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					Msg2Player(varMap, varPlayer, "获得信号弹", 0, 2)
					DeliverItemListSendToPlayer(varMap,varPlayer)
				end
		  		end
	    		NpcTalk(varMap,varTalknpc,x203377_var_NPCTalk[1],varPlayer)
	    		--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 ) 
	  			if IsHaveSpecificImpact( varMap, varPlayer, 32578) ~= 1 then
		 	 		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 32578, 0)
		 		end
	 	end                                                                    
	     
end


function x203377_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203377_var_QuestId) <= 0 then
				return 
		end
		local a = DelQuest(varMap, varPlayer, x203377_var_QuestId)
		if a >0 then
	    x203377_Msg2toplayer( varMap, varPlayer,1)
	    DelItemByIDInBag(varMap, varPlayer,x203377_var_item,1)
		end
	
end

function x203377_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203377_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203377_var_BonusChoiceItem do
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

function x203377_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203377_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203377_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203377_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203377_var_QuestId) > 0 then
				x203377_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203377_var_QuestId)
				x203377_GetBonus( varMap, varPlayer,varTalknpc)			  
			  	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,0)
				LuaCallNoclosure( 203379, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203377_var_QuestIdNext )	
   end
end

function x203377_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203377_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203377_var_ExpBonus);
  	end
		if x203377_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203377_var_BonusMoney1 )
	  end
		if x203377_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203377_var_BonusMoney2 )
	  end
		if x203377_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203377_var_BonusMoney3 )
		end
		if x203377_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203377_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203377_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203377_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203377_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203377_var_BonusMoney6)
		end
end

function x203377_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203377_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203377_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203377_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203377_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203377_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203377_var_QuestName.."！", 0, 3)
				if x203377_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203377_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203377_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203377_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203377_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203377_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203377_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203377_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203377_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203377_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203377_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203377_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203377_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203377_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203377_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203377_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203377_var_QuestId) > 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203377_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203377_var_QuestId, 7, -1 )
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 )
		end
end

function x203377_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
	if IsHaveQuest(varMap,varPlayer, x203377_var_QuestId) <= 0 then return end

	StartTalkTask( varMap)
	 if  x203377_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
    AddQuestLogCustomText( varMap,
							"",									
                            x203377_var_QuestName,
                           	x203377_var_QuestTarget[1],
                            "",       
                            x203377_var_QuestInfo,
                            x203377_var_QuestTarget[1],
                            x203377_var_QuestHelp			
                            )
    else
        AddQuestLogCustomText( varMap,
							"",									
                            x203377_var_QuestName,              
                           	x203377_var_QuestTarget[2],            
                            "",       
                            x203377_var_QuestInfo, 				
                            x203377_var_QuestTarget[2],    
                            x203377_var_QuestHelp			
                            )
    end
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest)
	
	
end

function x203377_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203377_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203377_var_QuestId)
	if IsHaveQuest(varMap,varPlayer, x203377_var_QuestId) <= 0 or GetQuestParam(varMap,varPlayer,varQuestIdx,7) >0 then return end
	if varArea ~= 3 or GetQuestParam(varMap,varPlayer,varQuestIdx,1)==1  then return end
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203377_var_QuestId)
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
	Msg2Player(varMap, varPlayer, "请在此使用信号弹", 0, 3)
	--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,11,1 )
end

function x203377_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203377_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	
	--LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203377_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203377_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203377_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203377_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203377_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203377_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203377_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
