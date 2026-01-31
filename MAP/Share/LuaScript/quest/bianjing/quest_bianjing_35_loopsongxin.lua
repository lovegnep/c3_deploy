

--DECLARE_QUEST_INFO_START--
x260000_var_FileId = 260000
x260000_var_QuestIdPre =-1
x260000_var_QuestId = 2116
x260000_var_LevelLess	= 	15 
x260000_var_QuestIdNext = 2117
x260000_var_Name	={}
x260000_var_ExtTarget={{type=20,n=1,target="找到@npc_129228"}}
x260000_var_QuestName="【循环】风紧"
x260000_var_QuestInfo="\t加思加这几天好像手头很紧，想干一票大的。不过最近怪事很多，你帮我通知他一下，不要轻举妄动，免得把自己栽进去。"  
x260000_var_QuestTarget=""		
x260000_var_QuestCompleted="\t唉，既然是这样，那还是再忍几天，等风声过了再找“肥羊”吧。 "					
x260000_var_ContinueInfo=""
x260000_var_QuestHelp =	""
x260000_var_DemandItem ={}
x260000_var_BonusMoney1 =0
x260000_var_BonusMoney2 =0
x260000_var_BonusMoney3 =0
x260000_var_BonusMoney4 =0
x260000_var_BonusMoney5 =0
x260000_var_BonusMoney6 =0
x260000_var_BonusItem	=	{}
x260000_var_BonusChoiceItem ={}
x260000_var_ExpBonus = 20
x260000_var_NpcGUID ={{ guid = 129228, varName = "加思加"} }


function x260000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x260000_var_QuestId) > 0 then
		return 
	end
	if GetLevel(varMap, varPlayer)> 34 then
		if GetLevel(varMap, varPlayer)< 46 then
			if IsHaveQuest(varMap,varPlayer, x260000_var_QuestId) <= 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x260000_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x260000_var_QuestId, varState, -1 )
			end
		end
	end
end

function x260000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x260000_var_ExpBonus> 0 then
		local addexpture = x260000_var_ExpBonus*GetLevel(varMap, varPlayer)
			AddQuestExpBonus(varMap, addexpture )
		end
		if x260000_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x260000_var_BonusMoney1 )
		end
		if x260000_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x260000_var_BonusMoney2 )
		end
		if x260000_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x260000_var_BonusMoney3 )
		end
		if x260000_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x260000_var_BonusMoney4 )
		end
		if x260000_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x260000_var_BonusMoney5 )
		end
		if x260000_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x260000_var_BonusMoney6 )
		end
		for varI, item in x260000_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x260000_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x260000_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x260000_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x260000_var_QuestId) > 0 then
			if x260000_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x260000_var_QuestName)
						TalkAppendString(varMap,x260000_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x260000_var_FileId, x260000_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x260000_var_QuestName)
						TalkAppendString(varMap,x260000_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x260000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x260000_var_FileId, x260000_var_QuestId);
			end
  elseif x260000_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x260000_var_QuestName)
			TalkAppendString(varMap,x260000_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x260000_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x260000_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x260000_var_QuestHelp )
			end
			x260000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x260000_var_FileId, x260000_var_QuestId);
  end
	
end


function x260000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
					return 1
		
		

end

function x260000_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x260000_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x260000_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x260000_var_QuestId  )
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
		
		if x260000_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x260000_var_QuestId, x260000_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x260000_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x260000_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x260000_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x260000_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x260000_var_QuestId)
	  x260000_Msg2toplayer( varMap, varPlayer,1)
			
end

function x260000_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x260000_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x260000_var_BonusChoiceItem do
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

function x260000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x260000_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x260000_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x260000_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x260000_var_QuestId) > 0 then
				x260000_Msg2toplayer( varMap, varPlayer,2)
				
				x260000_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x260000_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x260000_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x260000_GetBonus( varMap, varPlayer,varTalknpc)
	  if x260000_var_ExpBonus > 0 then
	  local addexpture = x260000_var_ExpBonus*GetLevel(varMap, varPlayer)
			AddExp(varMap, varPlayer, addexpture);
  	end
		if x260000_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x260000_var_BonusMoney1 )
	  end
		if x260000_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x260000_var_BonusMoney2 )
	  end
		if x260000_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x260000_var_BonusMoney3 )
		end
		if x260000_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x260000_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x260000_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x260000_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x260000_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x260000_var_BonusMoney6)
		end
end

function x260000_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x260000_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x260000_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x260000_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x260000_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x260000_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x260000_var_QuestName.."！", 0, 3)
				local expAward =x260000_var_ExpBonus*GetLevel(varMap, varPlayer)
				Msg2Player(varMap, varPlayer, "#Y获得#R经验"..expAward.."#Y的奖励", 0, 2)
		end
end

function x260000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x260000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x260000_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x260000_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x260000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x260000_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x260000_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x260000_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x260000_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x260000_var_QuestId, varState, -1 )
		end
end

function x260000_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x260000_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x260000_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x260000_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x260000_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x260000_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x260000_ProcQuestLogRefresh( varMap,varPlayer,varQuest)

    StartTalkTask(varMap)
    AddQuestExpBonus(varMap, x260000_var_ExpBonus*GetLevel(varMap, varPlayer) )
		StopTalkTask()
		DeliverTalkRefreshQuest(varMap, varPlayer, x260000_var_QuestId);

end
