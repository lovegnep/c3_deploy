

--DECLARE_QUEST_INFO_START--
x200502_var_FileId = 200502
x200502_var_QuestIdPre ={67,70,71}
x200502_var_QuestId = 68
x200502_var_LevelLess	= 	15 
x200502_var_QuestIdNext = 65
x200502_var_Name	={}
x200502_var_ExtTarget={{type=20,n=1,target="询问@npc_102010"}}
x200502_var_QuestName="【剧场】询问状况"
x200502_var_QuestInfo="\t我刚刚召回了孛儿贴的灵魂，她现在应该苏醒了。你去月伦夫人那里问问吧。"  
x200502_var_QuestTarget=""		
x200502_var_QuestCompleted="\t谢天谢地，孛儿贴刚刚突然自己醒了过来，我终于可以放心了。 "					
x200502_var_ContinueInfo=""
x200502_var_QuestHelp =	""
x200502_var_DemandItem ={}
x200502_var_BonusMoney1 =253
x200502_var_BonusMoney2 =0
x200502_var_BonusMoney3 =0
x200502_var_BonusMoney4 =0
x200502_var_BonusMoney5 =31
x200502_var_BonusMoney6 =0
x200502_var_BonusItem	=	{}
x200502_var_BonusChoiceItem ={}
x200502_var_ExpBonus = 4398
x200502_var_NpcGUID ={{ guid = 102010, varName = "月伦夫人"} }
--DECLARE_QUEST_INFO_STOP--


function x200502_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x200502_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x200502_var_QuestIdPre[1])> 0 then
		if IsQuestHaveDone(varMap, varPlayer, x200502_var_QuestIdPre[2])> 0 then
			if IsQuestHaveDone(varMap, varPlayer, x200502_var_QuestIdPre[3])> 0 then
				
						if IsHaveQuest(varMap,varPlayer, x200502_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200502_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200502_var_QuestId, varState, -1 )
						end
				
			end
		end
	end
end

function x200502_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x200502_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x200502_var_ExpBonus )
		end
		if x200502_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x200502_var_BonusMoney1 )
		end
		if x200502_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x200502_var_BonusMoney2 )
		end
		if x200502_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x200502_var_BonusMoney3 )
		end
		if x200502_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x200502_var_BonusMoney4 )
		end
		if x200502_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x200502_var_BonusMoney5 )
		end
		if x200502_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x200502_var_BonusMoney6 )
		end
		for varI, item in x200502_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x200502_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x200502_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x200502_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x200502_var_QuestId) > 0 then
			if x200502_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200502_var_QuestName)
						TalkAppendString(varMap,x200502_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x200502_var_FileId, x200502_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200502_var_QuestName)
						TalkAppendString(varMap,x200502_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x200502_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x200502_var_FileId, x200502_var_QuestId);
			end
  elseif x200502_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x200502_var_QuestName)
			TalkAppendString(varMap,x200502_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x200502_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x200502_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x200502_var_QuestHelp )
			end
			x200502_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x200502_var_FileId, x200502_var_QuestId);
  end
	
end


function x200502_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x200502_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x200502_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x200502_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x200502_var_QuestId  )
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
		
		if x200502_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x200502_var_QuestId, x200502_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x200502_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200502_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x200502_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x200502_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x200502_var_QuestId)
	  x200502_Msg2toplayer( varMap, varPlayer,1)
			
end

function x200502_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x200502_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x200502_var_BonusChoiceItem do
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

function x200502_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x200502_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200502_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200502_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x200502_var_QuestId) > 0 then
				x200502_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x200502_var_QuestId)
				x200502_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x200502_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x200502_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x200502_var_QuestIdNext )	
end

function x200502_GetBonus( varMap, varPlayer,varTalknpc)
	  if x200502_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x200502_var_ExpBonus);
  	end
		if x200502_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x200502_var_BonusMoney1 )
	  end
		if x200502_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x200502_var_BonusMoney2 )
	  end
		if x200502_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x200502_var_BonusMoney3 )
		end
		if x200502_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x200502_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x200502_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x200502_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x200502_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x200502_var_BonusMoney6)
		end
end

function x200502_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x200502_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x200502_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200502_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200502_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200502_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200502_var_QuestName.."！", 0, 3)
				if x200502_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x200502_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x200502_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x200502_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x200502_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x200502_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x200502_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x200502_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x200502_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x200502_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x200502_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x200502_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x200502_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x200502_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x200502_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x200502_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x200502_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x200502_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x200502_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x200502_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x200502_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x200502_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200502_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200502_var_QuestId, varState, -1 )
		end
end

function x200502_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x200502_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x200502_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200502_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200502_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x200502_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
