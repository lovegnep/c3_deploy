

--DECLARE_QUEST_INFO_START--
x203837_var_FileId = 203837
x203837_var_QuestIdPre = 1681
x203837_var_QuestId = 1682
x203837_var_LevelLess	= 	45
x203837_var_QuestIdNext = -1
x203837_var_Name	={}
x203837_var_ExtTarget={{type=20,n=1,target="在@npc_141134处给将星卡升级"}}
x203837_var_QuestName="【个人】将星卡升级"
x203837_var_QuestInfo="\t将星组合多如牛毛，找到适合自己的组合后，就要收集此组合包含的将星卡，并给它升级到相应的级别。\n\t升级将星卡需要一张主卡作为升级对象，和四张副卡作为升级材料，副卡的等级决定主卡升级达成的几率，现在请尝试为一张将星卡升级。"
x203837_var_QuestTarget=""		
x203837_var_QuestCompleted="\t升级将星卡就是这么简单，还需要更多的将星卡？浮屠塔可是个好地方，千万不能错过。"					
x203837_var_ContinueInfo="\t你不愿意使你的卡牌更强大吗？"
x203837_var_QuestHelp =	""
x203837_var_DemandItem ={45012887,45012182,45013682,45013687,45013692,45013697,45013702,45013707,45011002,45011007,45011012,45011017,45011022,45011027,45011232,45011237,45011242,45011247,45011252,45011257,45011467,45011472,45011477,45011482,45011487,45011492,45011717,45011722,45011727,45011732,45011737,45011742,45011942,45011947,45011952,45011957,45011962,45011967,45012187,45012192,45012197,45012202,45012207,45012412,45012417,45012422,45012427,45012432,45012437,45012672,45012677,45012682,45012687,45012692,45012697,45012892,45012897,45012902,45012907,45012912,45013122,45013127,45013132,45013137,45013142,45013147}
x203837_var_BonusMoney1 =376
x203837_var_BonusMoney2 =0
x203837_var_BonusMoney3 =0
x203837_var_BonusMoney4 =0
x203837_var_BonusMoney5 =71
x203837_var_BonusMoney6 =0
x203837_var_BonusItem	=	{}
x203837_var_BonusChoiceItem ={}
x203837_var_ExpBonus = 54000
x203837_var_NpcGUID ={{ guid = 141134, varName = "将星大师"} }
--DECLARE_QUEST_INFO_STOP--

x203837_var_MaxLevel   = 50

function x203837_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203837_var_LevelLess  then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x203837_var_QuestId) > 0 then
		return 
	end
	
	if IsQuestHaveDone(varMap, varPlayer, x203837_var_QuestIdPre)> 0 then 
	if IsHaveQuest(varMap,varPlayer, x203837_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203837_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203837_var_QuestId, varState, -1 )
	end
	end

end

function x203837_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203837_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203837_var_ExpBonus )
		end
		if x203837_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203837_var_BonusMoney1 )
		end
		if x203837_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203837_var_BonusMoney2 )
		end
		if x203837_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203837_var_BonusMoney3 )
		end
		if x203837_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203837_var_BonusMoney4 )
		end
		if x203837_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203837_var_BonusMoney5 )
		end
		if x203837_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203837_var_BonusMoney6 )
		end
		for varI, item in x203837_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x203837_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x203837_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203837_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203837_var_QuestId) > 0 then
			if x203837_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203837_var_QuestName)
				TalkAppendString(varMap,x203837_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203837_var_FileId, x203837_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203837_var_QuestName)
				TalkAppendString(varMap,x203837_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x203837_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203837_var_FileId, x203837_var_QuestId);
			end
  elseif x203837_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203837_var_QuestName)
			TalkAppendString(varMap,x203837_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203837_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203837_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203837_var_QuestHelp )
			end
			x203837_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203837_var_FileId, x203837_var_QuestId);
  end
	
end


function x203837_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x203837_CheckSubmit( varMap, varPlayer, varTalknpc)  
                                                  
		if  IsHaveQuest(varMap, varPlayer,x203837_var_QuestId) ~=1 then
			return 0
		end
		
	   	local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x203837_var_QuestId)                                                  
	   	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	   	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 102,0 )
	   		return 1
	   		
	   	else 
	   		return 0
	   	end
	   	
	
end


function x203837_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203837_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203837_var_QuestId  )
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
		
		if x203837_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203837_var_QuestId, x203837_var_FileId, 0, 0, 1,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203837_Msg2toplayer( varMap, varPlayer,0)
						for varI ,item in x203837_var_DemandItem do
							if GetItemCount( varMap, varPlayer, item ) >= 1 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203837_var_QuestId) 
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
			    		break
							end
						end
					end
	 	end                                                                    
	     
end

function x203837_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203837_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203837_var_QuestId)
	  x203837_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 102,0 )
end

function x203837_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203837_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203837_var_BonusChoiceItem do
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

function x203837_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203837_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203837_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203837_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203837_var_QuestId) > 0 then
				x203837_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203837_var_QuestId)
				x203837_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203837_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x203837_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		 
    		
   end
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 91,1 ) 
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 101,1 ) 
  --LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203837_var_QuestIdNext )	
end

function x203837_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203837_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203837_var_ExpBonus);
  	end
		if x203837_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203837_var_BonusMoney1 )
	  end
		if x203837_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203837_var_BonusMoney2 )
	  end
		if x203837_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203837_var_BonusMoney3 )
		end
		if x203837_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203837_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203837_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203837_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203837_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203837_var_BonusMoney6)
		end
end

function x203837_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x203837_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x203837_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x203837_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x203837_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203837_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203837_var_QuestName.."！", 0, 3)
				if x203837_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203837_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203837_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203837_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203837_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203837_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203837_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203837_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203837_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203837_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203837_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203837_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203837_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203837_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203837_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203837_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203837_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203837_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203837_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	local temp = 0
	for varI ,item in x203837_var_DemandItem do
		if	item == varItemData then
			temp = 1
			break
		end
	end
	if temp == 0 then
		return
	end
		
	
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203837_var_QuestId) 
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)

end


function x203837_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203837_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
					 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 102,0 ) 
					 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 92,0 )     
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203837_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203837_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203837_var_QuestId, varState, -1 )
				if x203837_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 102,1 ) 
					 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 92,1 ) 
				end
		end
end

function x203837_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203837_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203837_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203837_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203837_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203837_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
