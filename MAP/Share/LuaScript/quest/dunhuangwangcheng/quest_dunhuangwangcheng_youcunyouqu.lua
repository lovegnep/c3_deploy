

--DECLARE_QUEST_INFO_START--
x256249_var_FileId = 256249
x256249_var_QuestIdPre =3095
x256249_var_QuestId = 3053
x256249_var_LevelLess	= 	25 
x256249_var_QuestIdNext = 3054
x256249_var_Name	={}
x256249_var_ExtTarget={{type=20,n=1,target="找到@npc_138584"}}
x256249_var_QuestName="【个人】有存有取"
x256249_var_QuestInfo="\t看你的行囊已经被撑得变了形，把东西全带在身上，是不是很不方便？去找@npc_138584吧，他能够帮你解决这一系列的问题！"  
x256249_var_QuestTarget=""		
x256249_var_QuestCompleted="\t我这里提供寄存服务，你可以储存一些不必时刻随身携带的东西，比如宝石或者平常不用的装备和材料等。当然，如果你想拥有足够大的空间的话，我还可以为你开启更大的仓库，不过这要你有足够的现金才行。"					
x256249_var_ContinueInfo=""
x256249_var_QuestHelp =	""
x256249_var_DemandItem ={}
x256249_var_BonusMoney1 =500
x256249_var_BonusMoney2 =0
x256249_var_BonusMoney3 =0
x256249_var_BonusMoney4 =0
x256249_var_BonusMoney5 =0
x256249_var_BonusMoney6 =0
x256249_var_BonusItem	=	{}
x256249_var_BonusChoiceItem ={}
x256249_var_ExpBonus = 11000
x256249_var_NpcGUID ={{ guid = 138584, varName = "巴图存"} }
--DECLARE_QUEST_INFO_STOP--

x256249_var_MaxLevel   = 40

function x256249_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256249_var_LevelLess or varLevel >= x256249_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256249_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x256249_var_QuestIdPre)> 0 then
						if IsHaveQuest(varMap,varPlayer, x256249_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256249_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256249_var_QuestId, varState, -1 )
						end
	end
end

function x256249_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256249_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256249_var_ExpBonus )
		end
		if x256249_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256249_var_BonusMoney1 )
		end
		if x256249_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256249_var_BonusMoney2 )
		end
		if x256249_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256249_var_BonusMoney3 )
		end
		if x256249_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256249_var_BonusMoney4 )
		end
		if x256249_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256249_var_BonusMoney5 )
		end
		if x256249_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256249_var_BonusMoney6 )
		end
		for varI, item in x256249_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256249_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256249_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256249_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256249_var_QuestId) > 0 then
			if x256249_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256249_var_QuestName)
						TalkAppendString(varMap,x256249_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256249_var_FileId, x256249_var_QuestId);
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 39,0 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256249_var_QuestName)
						TalkAppendString(varMap,x256249_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256249_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256249_var_FileId, x256249_var_QuestId);
			end
  elseif x256249_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256249_var_QuestName)
			TalkAppendString(varMap,x256249_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256249_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256249_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256249_var_QuestHelp )
			end
			x256249_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256249_var_FileId, x256249_var_QuestId);
  end
	
end


function x256249_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x256249_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x256249_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256249_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256249_var_QuestId  )
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
		
		if x256249_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256249_var_QuestId, x256249_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256249_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256249_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
	    			
		  		end
	 	end                                                                    
	     
end


function x256249_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256249_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256249_var_QuestId)
	  x256249_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 39,0 )
			
end

function x256249_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256249_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256249_var_BonusChoiceItem do
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

function x256249_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256249_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256249_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256249_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256249_var_QuestId) > 0 then
				x256249_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256249_var_QuestId)
				x256249_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256249_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256249_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
  		LuaCallNoclosure( 256250, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256249_var_QuestIdNext )	
end

function x256249_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256249_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256249_var_ExpBonus);
  	end
		if x256249_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256249_var_BonusMoney1 )
	  end
		if x256249_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256249_var_BonusMoney2 )
	  end
		if x256249_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256249_var_BonusMoney3 )
		end
		if x256249_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256249_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256249_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256249_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256249_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256249_var_BonusMoney6)
		end
end

function x256249_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256249_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256249_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256249_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256249_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256249_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256249_var_QuestName.."！", 0, 3)
				if x256249_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256249_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256249_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256249_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256249_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256249_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256249_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256249_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256249_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256249_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256249_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256249_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256249_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256249_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256249_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256249_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256249_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256249_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256249_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256249_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256249_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256249_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256249_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256249_var_QuestId, varState, -1 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 39,1 )
		end
end

function x256249_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256249_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256249_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256249_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256249_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256249_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
