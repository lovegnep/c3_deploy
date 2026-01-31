

--DECLARE_QUEST_INFO_START--
x203821_var_FileId = 203821
x203821_var_QuestIdPre =2711
x203821_var_QuestId = 4046
x203821_var_LevelLess	= 35 
x203821_var_QuestIdNext = -1
x203821_var_Name	={}
x203821_var_ExtTarget={{type=20,n=1,target="添加一个好友，将好友度提升到10"}}
x203821_var_QuestName="【个人】君子之交"
x203821_var_QuestInfo="\t去寻找和你志趣相投，又能肝胆相照的一位好友吧。\n\t在组队完成任务过程中你可以邀请那些你喜欢的人为好友。在王国中可以成为好友的人数不胜数，一起组队完成#G“好友任务或打怪”#W将好友度提升得10。"	
x203821_var_QuestTarget=""		
x203821_var_QuestCompleted="\t恭喜你交到密友，看到你们在完成任务时的默契配合我很欣慰。"					
x203821_var_ContinueInfo="\t邀请那些你喜欢的人为好友，一起组队完成#G“好友任务或打怪”#W将好友度提升得10。"	
x203821_var_QuestHelp ="一起组队完成#G“好友任务或打怪”#W可以将好友度提升得10。"
x203821_var_DemandItem ={}
x203821_var_ExpBonus = 1000000
x203821_var_BonusMoney1 =295
x203821_var_BonusMoney2 =0
x203821_var_BonusMoney3 =0
x203821_var_BonusMoney4 =0
x203821_var_BonusMoney5 =56
x203821_var_BonusMoney6 =0
x203821_var_BonusItem	={}
x203821_var_BonusChoiceItem ={}
x203821_var_NpcGUID ={{ guid = 123759, varName = "朋尔多"} }
--DECLARE_QUEST_INFO_STOP--


x203821_var_MaxLevel      = 160

function x203821_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		local varLevel = GetLevel(varMap, varPlayer)
	  if varLevel < x203821_var_LevelLess or varLevel >= x203821_var_MaxLevel then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x203821_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x203821_var_QuestId) <= 0 then
		if IsQuestHaveDone(varMap, varPlayer, x203821_var_QuestIdPre) > 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203821_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203821_var_QuestId, varState, -1 )
		end
	end

end

function x203821_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203821_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203821_var_ExpBonus )
		end
		if x203821_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203821_var_BonusMoney1 )
		end
		if x203821_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203821_var_BonusMoney2 )
		end
		if x203821_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203821_var_BonusMoney3 )
		end
		if x203821_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203821_var_BonusMoney4 )
		end
		if x203821_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203821_var_BonusMoney5 )
		end
		if x203821_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203821_var_BonusMoney6 )
		end
		for varI, item in x203821_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x203821_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x203821_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203821_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203821_var_QuestId) > 0 then
			if x203821_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203821_var_QuestName)
				TalkAppendString(varMap,x203821_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203821_var_FileId, x203821_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203821_var_QuestName)
				TalkAppendString(varMap,x203821_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x203821_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203821_var_FileId, x203821_var_QuestId);
			end
  elseif x203821_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203821_var_QuestName)
			TalkAppendString(varMap,x203821_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203821_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203821_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203821_var_QuestHelp )
			end
			x203821_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203821_var_FileId, x203821_var_QuestId);
  end
	
end


function x203821_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x203821_CheckSubmit( varMap, varPlayer, varTalknpc)                                                 
	if IsHaveFriend_FriendPointMoreThenPara(varMap, varPlayer, 10) > 0 then
	   return 1
	end
	 
	return 0
	
end


function x203821_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203821_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203821_var_QuestId  )
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
		
		if x203821_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203821_var_QuestId, x203821_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203821_Msg2toplayer( varMap, varPlayer,0)
		  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 104,1 )
					local friend = IsHaveFriend_FriendPointMoreThenPara(varMap, varPlayer, 10)
					if  friend >= 1 then
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203821_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x203821_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203821_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203821_var_QuestId)
	  x203821_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203821_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203821_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x203821_var_BonusChoiceItem do
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

function x203821_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203821_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203821_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203821_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203821_var_QuestId) > 0 then
				x203821_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203821_var_QuestId)
				x203821_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203821_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x203821_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x203821_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203821_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203821_var_ExpBonus);
  	end
		if x203821_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203821_var_BonusMoney1 )
	  end
		if x203821_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203821_var_BonusMoney2 )
	  end
		if x203821_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203821_var_BonusMoney3 )
		end
		if x203821_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203821_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203821_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203821_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203821_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203821_var_BonusMoney6)
		end
end

function x203821_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203821_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203821_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203821_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203821_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203821_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203821_var_QuestName.."！", 0, 3)
				if x203821_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203821_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203821_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203821_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203821_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203821_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203821_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203821_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203821_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203821_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203821_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203821_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203821_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203821_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203821_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203821_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203821_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203821_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203821_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203821_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203821_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203821_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203821_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203821_var_QuestId, varState, -1 )
		end
end

function x203821_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203821_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203821_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203821_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203821_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203821_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
