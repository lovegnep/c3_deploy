

--DECLARE_QUEST_INFO_START--
x200000_var_FileId = 200000
x200000_var_QuestIdPre =13
x200000_var_QuestId = 15
x200000_var_LevelLess	= 	10 
x200000_var_QuestIdNext = -1
x200000_var_Name	={}
x200000_var_ExtTarget={{type=20,n=1,target="找到@npc_101003"}}
x200000_var_QuestName="【剧场】孛儿贴的歉意<二>"
x200000_var_QuestInfo="\t请你告诉札木合，在孛儿贴的心中，他一直如兄长一般，希望以后他能继续做孛儿贴的大哥。"  
x200000_var_QuestTarget="将孛儿贴的话带给@npc_101003"		
x200000_var_QuestCompleted="\t孛儿贴选择了铁木真？一直是把我当兄长看待？我不相信！我平时对孛儿贴那么好，她居然仅仅把我当个哥哥！难道她真的不明白我的心意么……\n\t我最心爱的孛儿贴……难道真的和传言说得一样，铁木真是天狼星转世，是这片草原的主人么？"					
x200000_var_ContinueInfo=""
x200000_var_QuestHelp =	""
x200000_var_DemandItem ={}
x200000_var_ExpBonus = 3432
x200000_var_BonusMoney1 =220
x200000_var_BonusMoney2 =0
x200000_var_BonusMoney3 =0
x200000_var_BonusMoney4 =0
x200000_var_BonusMoney5 =25
x200000_var_BonusMoney6 =0
x200000_var_BonusItem	=	{}
x200000_var_BonusChoiceItem ={}
x200000_var_NpcGUID ={{ guid = 101003, varName = "札木合"} }
--DECLARE_QUEST_INFO_STOP--


function x200000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x200000_var_QuestId) > 0 then
		return 
	end
	
				if IsQuestHaveDone(varMap, varPlayer, x200000_var_QuestIdPre)> 0 then
						if IsHaveQuest(varMap,varPlayer, x200000_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200000_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200000_var_QuestId, varState, -1 )
						end
				end
end

function x200000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x200000_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x200000_var_ExpBonus )
		end
		if x200000_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x200000_var_BonusMoney1 )
		end
		if x200000_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x200000_var_BonusMoney2 )
		end
		if x200000_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x200000_var_BonusMoney3 )
		end
		if x200000_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x200000_var_BonusMoney4 )
		end
		if x200000_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x200000_var_BonusMoney5 )
		end
		if x200000_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x200000_var_BonusMoney6 )
		end
		for varI, item in x200000_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x200000_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x200000_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x200000_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x200000_var_QuestId) > 0 then
			if x200000_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200000_var_QuestName)
						TalkAppendString(varMap,x200000_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x200000_var_FileId, x200000_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200000_var_QuestName)
						TalkAppendString(varMap,x200000_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x200000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x200000_var_FileId, x200000_var_QuestId);
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   end
  elseif x200000_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x200000_var_QuestName)
			TalkAppendString(varMap,x200000_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x200000_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x200000_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x200000_var_QuestHelp )
			end
			x200000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x200000_var_FileId, x200000_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
  end
	
end


function x200000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x200000_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x200000_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x200000_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x200000_var_QuestId  )
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
		
		if x200000_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x200000_var_QuestId, x200000_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x200000_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200000_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x200000_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x200000_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x200000_var_QuestId)
	  x200000_Msg2toplayer( varMap, varPlayer,1)
			
end

function x200000_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x200000_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x200000_var_BonusChoiceItem do
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

function x200000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x200000_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200000_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200000_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x200000_var_QuestId) > 0 then
				x200000_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x200000_var_QuestId)
				
				x200000_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x200000_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x200000_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x200000_GetBonus( varMap, varPlayer,varTalknpc)
	  if x200000_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x200000_var_ExpBonus);
  	end
		if x200000_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x200000_var_BonusMoney1 )
	  end
		if x200000_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x200000_var_BonusMoney2 )
	  end
		if x200000_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x200000_var_BonusMoney3 )
		end
		if x200000_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x200000_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x200000_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x200000_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x200000_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x200000_var_BonusMoney6)
		end
end

function x200000_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x200000_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x200000_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200000_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200000_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200000_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200000_var_QuestName.."！", 0, 3)
				if x200000_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x200000_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x200000_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x200000_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x200000_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x200000_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x200000_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x200000_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x200000_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x200000_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x200000_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x200000_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x200000_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x200000_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x200000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x200000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x200000_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x200000_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x200000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x200000_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x200000_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x200000_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200000_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200000_var_QuestId, varState, -1 )
		end
end

function x200000_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x200000_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x200000_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200000_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200000_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x200000_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
