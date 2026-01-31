

--DECLARE_QUEST_INFO_START--
x203812_var_FileId = 203812
x203812_var_QuestIdPre =4227
x203812_var_QuestId = 4251
x203812_var_LevelLess	= 30
x203812_var_QuestIdNext = {4348,4349,4350,4351,4352,4353,4354,4355,4356,4357,4358,4359}
x203812_var_Name	={}
x203812_var_ExtTarget={{type=20,n=1,target="找到@npc_132038"}}
x203812_var_QuestName="【个人】骑乘技能"
x203812_var_QuestInfo="\t看你的样子似乎还不知道啊，你的骑乘也是可以学习技能的，一匹拥有绝佳技能的骑乘，可以让你如虎添翼。王城的@npc_132038可以让你的骑乘学会新的技能，价格也不贵，你可以去他那里看看。"  
x203812_var_QuestTarget=""		
x203812_var_QuestCompleted="\t骑乘的技能也有高低之分，要学习更高级的技能，需要有低级技能作为基础。"					
x203812_var_ContinueInfo=""
x203812_var_QuestHelp =	""
x203812_var_DemandItem ={}
x203812_var_ExpBonus = 142000
x203812_var_BonusMoney1 =200
x203812_var_BonusMoney2 =0
x203812_var_BonusMoney3 =0
x203812_var_BonusMoney4 =0
x203812_var_BonusMoney5 =0
x203812_var_BonusMoney6 =0
x203812_var_BonusItem	=	{}
x203812_var_BonusChoiceItem ={}
x203812_var_NpcGUID ={{ guid = 132038, varName = "骑乘技能"} }
--DECLARE_QUEST_INFO_STOP--     
x203812_var_FileIdNext =203738


x203812_var_MaxLevel      = 49

function x203812_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203812_var_LevelLess or varLevel >= x203812_var_MaxLevel then
		return
	end
	
	if IsQuestHaveDone(varMap, varPlayer, x203812_var_QuestId) > 0 then
		return 
	end
	
		if IsQuestHaveDone(varMap, varPlayer, x203812_var_QuestIdPre) > 0 then
			if IsHaveQuest(varMap,varPlayer, x203812_var_QuestId) <= 0 then						
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203812_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203812_var_QuestId, varState, -1 )
				 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 ) 		
			end
		end
		
end

function x203812_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203812_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203812_var_ExpBonus )
		end
		if x203812_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203812_var_BonusMoney1 )
		end
		if x203812_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203812_var_BonusMoney2 )
		end
		if x203812_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203812_var_BonusMoney3 )
		end
		if x203812_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203812_var_BonusMoney4 )
		end
		if x203812_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203812_var_BonusMoney5 )
		end
		if x203812_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203812_var_BonusMoney6 )
		end
		for varI, item in x203812_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203812_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203812_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203812_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203812_var_QuestId) > 0 then
			if x203812_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203812_var_QuestName)
						TalkAppendString(varMap,x203812_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203812_var_FileId, x203812_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203812_var_QuestName)
						TalkAppendString(varMap,x203812_var_QuestCompleted)
						TalkAppendString(varMap," ")
						
						x203812_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )  
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203812_var_FileId, x203812_var_QuestId);
			end
  elseif x203812_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203812_var_QuestName)
			TalkAppendString(varMap,x203812_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 		  
			for varI, item in x203812_var_ExtTarget do  	
			TalkAppendString( varMap,item.target)		
			end 
			if x203812_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203812_var_QuestHelp )
			end
			x203812_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203812_var_FileId, x203812_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 ) 	
  end
	
end


function x203812_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203812_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203812_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203812_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203812_var_QuestId  )
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
		if x203812_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203812_var_QuestId, x203812_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then                                          
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203812_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203812_var_QuestId)       
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                 
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                 
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )   
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203812_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203812_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203812_var_QuestId)
	  x203812_Msg2toplayer( varMap, varPlayer,1) 
			
end

function x203812_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203812_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203812_var_BonusChoiceItem do
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

function x203812_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203812_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203812_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203812_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203812_var_QuestId) > 0 then
				x203812_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203812_var_QuestId)
				x203812_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203812_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203812_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   local zhiye =GetZhiye( varMap, varPlayer)+1
   LuaCallNoclosure( x203812_var_FileIdNext, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203812_var_QuestIdNext[zhiye] )	
end

function x203812_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203812_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203812_var_ExpBonus);
  	end
		if x203812_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203812_var_BonusMoney1 )
	  end
		if x203812_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203812_var_BonusMoney2 )
	  end
		if x203812_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203812_var_BonusMoney3 )
		end
		if x203812_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203812_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203812_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203812_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203812_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203812_var_BonusMoney6)
		end
end

function x203812_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203812_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203812_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203812_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203812_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203812_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203812_var_QuestName.."！", 0, 3)
				if x203812_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203812_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203812_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203812_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203812_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203812_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203812_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203812_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203812_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203812_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203812_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203812_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203812_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203812_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203812_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203812_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203812_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203812_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203812_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203812_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203812_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203812_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203812_var_QuestId)        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203812_var_QuestId, varState, -1 )
		end
end

function x203812_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203812_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203812_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203812_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203812_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203812_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
