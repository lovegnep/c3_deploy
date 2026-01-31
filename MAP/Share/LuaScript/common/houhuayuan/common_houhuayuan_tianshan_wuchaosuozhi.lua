

--DECLARE_QUEST_INFO_START--
x320051_var_FileId = 320051
x320051_var_QuestIdPre = -1
x320051_var_QuestId = 1660
x320051_var_LevelLess	= 	70
x320051_var_QuestIdNext = 1655
x320051_var_Name	={}
x320051_var_ExtTarget={{type=20,n=1,target="找到@npc_126098"}}
x320051_var_QuestName="【战车】物超所值"
x320051_var_QuestInfo="\t战车的知识非常庞大，但其实我知道你心里在想什么，你一定在想战车能给带来什么。呵呵，这个问题非常好，我保证你在和战车荣誉商人荣玉欢谈过之后，就会得到满意的答覆。"  
x320051_var_QuestTarget="找到@npc_126098"		
x320051_var_QuestCompleted="\t通过战车荣誉可是能得到很多好东西啊，只要你一拥有足够的荣誉，就快来找我吧。"					
x320051_var_ContinueInfo="\t你还没有去么？"
x320051_var_QuestHelp =	""
x320051_var_DemandItem ={}
x320051_var_ExpBonus = 320000
x320051_var_BonusMoney1 =700
x320051_var_BonusMoney2 =0
x320051_var_BonusMoney3 =0
x320051_var_BonusMoney4 =0
x320051_var_BonusMoney5 =0
x320051_var_BonusMoney6 =0
x320051_var_BonusChoiceItem ={}
x320051_var_BonusItem	=	{{item=12500085,n=1}}
x320051_var_NpcGUID ={{ guid = 126098, varName = "荣玉欢"} }
--DECLARE_QUEST_INFO_STOP--


function x320051_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
if  GetLevel(varMap, varPlayer) < 70 then
return
end
--if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
 --     	return 
  --	end


	if IsQuestHaveDone(varMap, varPlayer, x320051_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x320051_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x320051_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x320051_var_QuestId, varState, -1 )
						end
		
end

function x320051_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x320051_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x320051_var_ExpBonus )
		end
		if x320051_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x320051_var_BonusMoney1 )
		end
		if x320051_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x320051_var_BonusMoney2 )
		end
		if x320051_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x320051_var_BonusMoney3 )
		end
		if x320051_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x320051_var_BonusMoney4 )
		end
		if x320051_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x320051_var_BonusMoney5 )
		end
		if x320051_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x320051_var_BonusMoney6 )
		end
		for varI, item in x320051_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x320051_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x320051_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x320051_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x320051_var_QuestId) > 0 then
			if x320051_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x320051_var_QuestName)
						TalkAppendString(varMap,x320051_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x320051_var_FileId, x320051_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x320051_var_QuestName)
						TalkAppendString(varMap,x320051_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x320051_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x320051_var_FileId, x320051_var_QuestId);
			end
  elseif x320051_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x320051_var_QuestName)
			TalkAppendString(varMap,x320051_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x320051_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x320051_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x320051_var_QuestHelp )
			end
			x320051_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x320051_var_FileId, x320051_var_QuestId);
  end
	
end


function x320051_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x320051_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x320051_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x320051_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x320051_var_QuestId  )
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
		
		if x320051_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x320051_var_QuestId, x320051_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x320051_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x320051_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x320051_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x320051_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x320051_var_QuestId)
	  x320051_Msg2toplayer( varMap, varPlayer,1)
			
end

function x320051_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x320051_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x320051_var_BonusChoiceItem do
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

function x320051_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x320051_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x320051_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x320051_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x320051_var_QuestId) > 0 then
				x320051_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x320051_var_QuestId)
				x320051_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x320051_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x320051_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppendBind( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x320051_var_QuestIdNext )	
end

function x320051_GetBonus( varMap, varPlayer,varTalknpc)
	  if x320051_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x320051_var_ExpBonus);
  	end
		if x320051_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x320051_var_BonusMoney1 )
	  end
		if x320051_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x320051_var_BonusMoney2 )
	  end
		if x320051_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x320051_var_BonusMoney3 )
		end
		if x320051_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x320051_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x320051_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x320051_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x320051_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x320051_var_BonusMoney6)
		end
end

function x320051_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x320051_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x320051_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x320051_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x320051_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x320051_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x320051_var_QuestName.."！", 0, 3)
				if x320051_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x320051_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x320051_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x320051_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x320051_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x320051_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x320051_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x320051_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x320051_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x320051_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x320051_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x320051_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x320051_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x320051_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x320051_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x320051_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x320051_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x320051_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x320051_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x320051_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x320051_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x320051_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x320051_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x320051_var_QuestId, varState, -1 )
		end
end

function x320051_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x320051_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x320051_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x320051_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x320051_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x320051_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
