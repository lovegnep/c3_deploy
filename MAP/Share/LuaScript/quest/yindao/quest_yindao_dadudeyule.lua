

--DECLARE_QUEST_INFO_START--
x203800_var_FileId = 203800
x203800_var_QuestIdPre =-1
x203800_var_QuestId = 1469
x203800_var_LevelLess	= 	40
x203800_var_QuestIdNext = 1470
x203800_var_Name	={}
x203800_var_ExtTarget={{type=20,n=1,target="找到@npc_139104"}}
x203800_var_QuestName="【个人】大都的娱乐<一>"
x203800_var_QuestInfo="\t我听说在大都有个地方可以跳舞，里面的妞儿们都个比个美艳，不知道你去过没？如果想要去舞厅的话，就找@npc_139104吧。"  
x203800_var_QuestTarget=""		
x203800_var_QuestCompleted="\t帅哥美女们注意了，这里就是全大都最有名的舞厅，希望休闲一下的就来找我吧！"					
x203800_var_ContinueInfo=""
x203800_var_QuestHelp =	""
x203800_var_DemandItem ={}
x203800_var_ExpBonus = 30000
x203800_var_BonusMoney1 =0
x203800_var_BonusMoney2 =0
x203800_var_BonusMoney3 =0
x203800_var_BonusMoney4 =0
x203800_var_BonusMoney5 =0
x203800_var_BonusMoney6 =0
x203800_var_BonusItem	=	{{item=12030011,n=20}}
x203800_var_BonusChoiceItem ={}
x203800_var_NpcGUID ={{ guid = 139104, varName = "杜十娘"} }
--DECLARE_QUEST_INFO_STOP--

x203800_var_MaxLevel   = 160

function x203800_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203800_var_LevelLess or varLevel >= x203800_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x203800_var_QuestId) > 0 then
		return 
	end
	
						if IsHaveQuest(varMap,varPlayer, x203800_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203800_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203800_var_QuestId, varState, -1 )
						end
	
end

function x203800_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203800_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203800_var_ExpBonus )
		end
		if x203800_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203800_var_BonusMoney1 )
		end
		if x203800_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203800_var_BonusMoney2 )
		end
		if x203800_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203800_var_BonusMoney3 )
		end
		if x203800_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203800_var_BonusMoney4 )
		end
		if x203800_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203800_var_BonusMoney5 )
		end
		if x203800_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203800_var_BonusMoney6 )
		end
		for varI, item in x203800_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203800_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203800_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203800_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203800_var_QuestId) > 0 then
			if x203800_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203800_var_QuestName)
						TalkAppendString(varMap,x203800_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203800_var_FileId, x203800_var_QuestId);
			else
						
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203800_var_QuestName)
						TalkAppendString(varMap,x203800_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203800_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203800_var_FileId, x203800_var_QuestId);
			end
  elseif x203800_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203800_var_QuestName)
			TalkAppendString(varMap,x203800_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203800_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203800_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203800_var_QuestHelp )
			end
			x203800_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203800_var_FileId, x203800_var_QuestId);
  end
	
end


function x203800_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203800_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203800_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203800_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203800_var_QuestId  )
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
		
		if x203800_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203800_var_QuestId, x203800_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203800_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203800_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
	    			
		  		end
	 	end                                                                    
	     
end


function x203800_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203800_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203800_var_QuestId)
	  x203800_Msg2toplayer( varMap, varPlayer,1)
	  
			
end

function x203800_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203800_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x203800_var_BonusChoiceItem do
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

function x203800_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203800_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203800_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203800_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203800_var_QuestId) > 0 then
				x203800_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203800_var_QuestId)
				x203800_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203800_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x203800_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
  		LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203800_var_QuestIdNext )	
end

function x203800_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203800_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203800_var_ExpBonus);
  	end
		if x203800_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203800_var_BonusMoney1 )
	  end
		if x203800_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203800_var_BonusMoney2 )
	  end
		if x203800_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203800_var_BonusMoney3 )
		end
		if x203800_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203800_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203800_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203800_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203800_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203800_var_BonusMoney6)
		end
end

function x203800_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203800_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203800_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203800_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203800_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203800_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203800_var_QuestName.."！", 0, 3)
				if x203800_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203800_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203800_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203800_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203800_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203800_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203800_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203800_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203800_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203800_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203800_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203800_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203800_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203800_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203800_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203800_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203800_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203800_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203800_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203800_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203800_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203800_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203800_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203800_var_QuestId, varState, -1 )
				
		end
end

function x203800_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203800_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203800_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203800_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203800_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203800_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
