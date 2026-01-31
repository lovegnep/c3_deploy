

--DECLARE_QUEST_INFO_START--
x256202_var_FileId = 256202
x256202_var_QuestId = 1442
x256202_var_LevelLess	= 	30

x256202_var_Name	={}
x256202_var_ExtTarget={{type=20,n=1,target="找到@npc_138565学习并使用4级#r七星剑阵#w"}}
x256202_var_QuestName="【个人】新的技能" 
x256202_var_QuestInfo="\t你已经出人头地，但还需要继续修炼，找到@npc_138565，学习并使用4级#r七星剑阵#w。"  
x256202_var_QuestTarget=""		
x256202_var_QuestCompleted="\t很好，希望你继续保持修炼！"					
x256202_var_ContinueInfo="\t我对没有能力的人不感兴趣！"
x256202_var_QuestHelp =	""
x256202_var_DemandItem ={}
x256202_var_BonusMoney1 =600
x256202_var_BonusMoney2 =0
x256202_var_BonusMoney3 =0
x256202_var_BonusMoney4 =0
x256202_var_BonusMoney5 =0
x256202_var_BonusMoney6 =0
x256202_var_BonusItem	=	{}
x256202_var_BonusChoiceItem ={}
x256202_var_ExpBonus = 25000
x256202_var_NpcGUID ={}
--DECLARE_QUEST_INFO_STOP--


function x256202_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetLevel(varMap, varPlayer) < 30 then
		return
	end
	if IsQuestHaveDone(varMap, varPlayer, x256202_var_QuestId) > 0 then
		return 
	end
		if GetZhiye( varMap, varPlayer)==1 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256202_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256202_var_QuestId, varState, -1 )
		end
end

function x256202_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256202_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256202_var_ExpBonus )
		end
		if x256202_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256202_var_BonusMoney1 )
		end
		if x256202_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256202_var_BonusMoney2 )
		end
		if x256202_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256202_var_BonusMoney3 )
		end
		if x256202_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256202_var_BonusMoney4 )
		end
		if x256202_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256202_var_BonusMoney5 )
		end
		if x256202_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256202_var_BonusMoney6 )
		end
		for varI, item in x256202_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256202_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256202_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256202_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256202_var_QuestId) > 0 then
			if x256202_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256202_var_QuestName)
						TalkAppendString(varMap,x256202_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256202_var_FileId, x256202_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256202_var_QuestName)
						TalkAppendString(varMap,x256202_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256202_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256202_var_FileId, x256202_var_QuestId);
			end
  elseif x256202_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256202_var_QuestName)
			TalkAppendString(varMap,x256202_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256202_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256202_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256202_var_QuestHelp )
			end
			x256202_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256202_var_FileId, x256202_var_QuestId);
  end
	
end


function x256202_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
					return 1

end

function x256202_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x256202_var_QuestId )
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	end
	return 0
	
end

function x256202_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256202_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256202_var_QuestId  )
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
		
		
		if x256202_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256202_var_QuestId, x256202_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256202_Msg2toplayer( varMap, varPlayer,0)
		  			if x256202_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256202_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x256202_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256202_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256202_var_QuestId)
	  x256202_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256202_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256202_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256202_var_BonusChoiceItem do
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

function x256202_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256202_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256202_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256202_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256202_var_QuestId) > 0 then
				x256202_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256202_var_QuestId)
				x256202_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256202_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256202_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x256202_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256202_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256202_var_ExpBonus);
  	end
		if x256202_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256202_var_BonusMoney1 )
	  end
		if x256202_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256202_var_BonusMoney2 )
	  end
		if x256202_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256202_var_BonusMoney3 )
		end
		if x256202_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256202_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256202_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256202_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256202_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256202_var_BonusMoney6)
		end
end

function x256202_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256202_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256202_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256202_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256202_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256202_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256202_var_QuestName.."！", 0, 3)
				if x256202_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256202_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256202_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256202_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256202_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256202_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256202_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256202_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256202_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256202_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256202_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256202_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256202_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256202_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256202_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256202_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256202_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256202_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256202_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256202_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x256202_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256202_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256202_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256202_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256202_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256202_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
