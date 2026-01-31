

--DECLARE_QUEST_INFO_START--
x203431_var_FileId = 203431
x203431_var_QuestIdPre =3409
x203431_var_QuestId = 3442
x203431_var_LevelLess	= 	1
x203431_var_QuestIdNext = 3404
x203431_var_Name	={}
x203431_var_ExtTarget={{type=20,n=1,target="找到@npc_131015"}}
x203431_var_QuestName="【新手】迟归的随从"
x203431_var_QuestInfo="\t我的随从木图，去了西北方收集马儿最爱吃的草料，到现在没有归来，莫非是他遇到了什么难事？\n\t你去西北方看看吧。"  
x203431_var_QuestTarget="找到@npc_131015"		
x203431_var_QuestCompleted="\t你好，朋友。\n\t我的导师白鹿长老让你来的？"					
x203431_var_ContinueInfo=""
x203431_var_QuestHelp =	""
x203431_var_DemandItem ={}
x203431_var_ExpBonus = 190
x203431_var_BonusMoney1 =5
x203431_var_BonusMoney2 =0
x203431_var_BonusMoney3 =0
x203431_var_BonusMoney4 =0
x203431_var_BonusMoney5 =12
x203431_var_BonusMoney6 =0
x203431_var_BonusChoiceItem ={}
x203431_var_BonusItem	=	{}
x203431_var_NpcGUID ={{ guid = 131015, varName = "苍狼长老随从"} }
--DECLARE_QUEST_INFO_STOP--


function x203431_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203431_var_QuestId) > 0 then
		return 
	end

				if IsQuestHaveDone(varMap, varPlayer, x203431_var_QuestIdPre)> 0 then
						if IsHaveQuest(varMap,varPlayer, x203431_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203431_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203431_var_QuestId, varState, -1 )
						end
			end
	
end

function x203431_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203431_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203431_var_ExpBonus )
		end
		if x203431_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203431_var_BonusMoney1 )
		end
		if x203431_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203431_var_BonusMoney2 )
		end
		if x203431_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203431_var_BonusMoney3 )
		end
		if x203431_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203431_var_BonusMoney4 )
		end
		if x203431_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203431_var_BonusMoney5 )
		end
		if x203431_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203431_var_BonusMoney6 )
		end
		for varI, item in x203431_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203431_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203431_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203431_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203431_var_QuestId) > 0 then
			if x203431_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203431_var_QuestName)
						TalkAppendString(varMap,x203431_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203431_var_FileId, x203431_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203431_var_QuestName)
						TalkAppendString(varMap,x203431_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203431_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203431_var_FileId, x203431_var_QuestId);
			end
  elseif x203431_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203431_var_QuestName)
			TalkAppendString(varMap,x203431_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203431_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203431_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203431_var_QuestHelp )
			end
			x203431_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203431_var_FileId, x203431_var_QuestId);
  end
	
end


function x203431_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203431_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203431_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203431_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203431_var_QuestId  )
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
		
		if x203431_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203431_var_QuestId, x203431_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203431_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203431_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,1,1 )
	    			
		  		end
	 	end                                                                    
	     
end


function x203431_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203431_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203431_var_QuestId)
	  x203431_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203431_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203431_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x203431_var_BonusChoiceItem do
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

function x203431_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203431_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203431_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203431_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203431_var_QuestId) > 0 then
				x203431_Msg2toplayer( varMap, varPlayer,2)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,6,0)
				QuestCom(varMap, varPlayer, x203431_var_QuestId)
				x203431_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203431_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x203431_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppendBind( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203431_var_QuestIdNext )	
end

function x203431_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203431_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203431_var_ExpBonus);
  	end
		if x203431_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203431_var_BonusMoney1 )
	  end
		if x203431_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203431_var_BonusMoney2 )
	  end
		if x203431_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203431_var_BonusMoney3 )
		end
		if x203431_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203431_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203431_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203431_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203431_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203431_var_BonusMoney6)
		end
end

function x203431_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203431_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203431_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203431_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203431_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203431_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203431_var_QuestName.."！", 0, 3)
				if x203431_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203431_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203431_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203431_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203431_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203431_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203431_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203431_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203431_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203431_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203431_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203431_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203431_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203431_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203431_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203431_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203431_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203431_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203431_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203431_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203431_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203431_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203431_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203431_var_QuestId, varState, -1 )
		end
end

function x203431_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203431_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203431_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203431_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203431_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203431_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
