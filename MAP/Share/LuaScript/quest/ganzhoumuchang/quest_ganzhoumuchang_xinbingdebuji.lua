
--DECLARE_QUEST_INFO_START--
x203444_var_FileId = 203444
x203444_var_QuestIdPre =3712
x203444_var_QuestId = 3713
x203444_var_LevelLess	= 	1 
x203444_var_QuestIdNext = 3714
x203444_var_Name	={}
x203444_var_ExtTarget={{type=20,n=1,target="按下#GCTRL+1#W，做出马奶"}}
x203444_var_QuestName="【新手】新兵的补给"
x203444_var_QuestInfo="\t你的坐骑有个很不错的技能：马奶。\n\t对于我们这些常年在马背上生存的军人来说，马奶的作用无可替代，现在，试着做出一个马奶吧。"  
x203444_var_QuestTarget="按下#GCTRL+1#W，做出马奶"		
x203444_var_QuestCompleted="\t清香的马奶，是补充体力的上品。你可以平时多做一些马奶以备不时之需。"					
x203444_var_ContinueInfo="\t清香的马奶，可是补充体力的上品。\n\t（按下#GCTRL+1#W，就能做出马奶。）"
x203444_var_QuestHelp =	""
x203444_var_DemandItem = 12010100
x203444_var_ExpBonus = 2200
x203444_var_BonusMoney1 =5
x203444_var_BonusMoney2 =0
x203444_var_BonusMoney3 =0
x203444_var_BonusMoney4 =0
x203444_var_BonusMoney5 =12
x203444_var_BonusMoney6 =0
x203444_var_BonusItem	=	{}
x203444_var_BonusChoiceItem ={}
x203444_var_NpcGUID ={}
--DECLARE_QUEST_INFO_STOP--


function x203444_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203444_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203444_var_QuestIdPre)> 0 then
			x203444_CheckSubmit(varMap, varPlayer, varTalknpc)
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203444_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203444_var_QuestId, varState, -1 )
	end
end

function x203444_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203444_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203444_var_ExpBonus )
		end
		if x203444_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203444_var_BonusMoney1 )
		end
		if x203444_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203444_var_BonusMoney2 )
		end
		if x203444_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203444_var_BonusMoney3 )
		end
		if x203444_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203444_var_BonusMoney4 )
		end
		if x203444_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203444_var_BonusMoney5 )
		end
		if x203444_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203444_var_BonusMoney6 )
		end
		for varI, item in x203444_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203444_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203444_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203444_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203444_var_QuestId) > 0 then
			if x203444_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203444_var_QuestName)
						TalkAppendString(varMap,x203444_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203444_var_FileId, x203444_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203444_var_QuestName)
						TalkAppendString(varMap,x203444_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203444_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203444_var_FileId, x203444_var_QuestId);
			end
  elseif x203444_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203444_var_QuestName)
			TalkAppendString(varMap,x203444_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203444_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203444_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203444_var_QuestHelp )
			end
			x203444_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203444_var_FileId, x203444_var_QuestId);
  end
	
end


function x203444_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203444_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203444_CheckSubmit( varMap, varPlayer, varTalknpc)
		if GetItemCount(varMap,varPlayer,x203444_var_DemandItem) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203444_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 24,0 )
	    		return 1
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203444_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
	  return 0
	
end

function x203444_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203444_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203444_var_QuestId  )
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
		if x203444_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203444_var_QuestId, x203444_var_FileId, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203444_Msg2toplayer( varMap, varPlayer,0)
		  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 24,1 )
		 				x203444_ProcQuestItemChanged(varMap, varPlayer, -1, varQuest)
						if x203444_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203444_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x203444_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203444_var_QuestId) <= 0 then
				return 
		end                                            

		DelQuest(varMap, varPlayer, x203444_var_QuestId)
	  x203444_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 24,0 )
end

function x203444_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203444_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203444_var_BonusChoiceItem do
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

function x203444_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203444_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203444_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203444_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203444_var_QuestId) > 0 then
				x203444_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203444_var_QuestId)
				x203444_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203444_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203444_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203444_var_QuestIdNext )	
end

function x203444_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203444_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203444_var_ExpBonus);
  	end
		if x203444_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203444_var_BonusMoney1 )
	  end
		if x203444_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203444_var_BonusMoney2 )
	  end
		if x203444_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203444_var_BonusMoney3 )
		end
		if x203444_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203444_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203444_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203444_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203444_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203444_var_BonusMoney6)
		end
end

function x203444_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203444_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203444_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203444_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203444_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203444_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203444_var_QuestName.."！", 0, 3)
				if x203444_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203444_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203444_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203444_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203444_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203444_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203444_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203444_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203444_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203444_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203444_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203444_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203444_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203444_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203444_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203444_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203444_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203444_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203444_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
		if GetItemCount(varMap,varPlayer,x203444_var_DemandItem) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203444_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 24,0 )
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203444_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
end


function x203444_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x203444_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203444_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203444_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203444_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203444_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203444_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
