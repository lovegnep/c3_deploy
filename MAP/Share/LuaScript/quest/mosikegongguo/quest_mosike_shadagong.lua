

--DECLARE_QUEST_INFO_START--
x203330_var_FileId = 203330
x203330_var_QuestIdPre = {825,826}
x203330_var_QuestId = 827
x203330_var_LevelLess	= 	88 
x203330_var_QuestIdNext = 828
x203330_var_Name	={}
x203330_var_ExtTarget={{type=20,n=1,target="击败@npc_117006"}}
x203330_var_QuestName="【剧场】罪魁祸首的覆灭"
x203330_var_QuestInfo="\t我们现在已经尽数消灭了莫斯科大公的党羽和部队，现在正是我们动手收拾这个阴谋家的时候了。"  
x203330_var_QuestTarget=""		
x203330_var_QuestCompleted="\t哈哈哈，我们的西征之路的第一步竟然能够兵不血刃，真是没有想到。"					
x203330_var_ContinueInfo="\t别让那个阴险的家伙逃走。"
x203330_var_QuestHelp =	""
x203330_var_DemandItem ={}
x203330_var_ExpBonus = 684000
x203330_var_BonusMoney1 =880
x203330_var_BonusMoney2 =0
x203330_var_BonusMoney3 =0
x203330_var_BonusMoney4 =0
x203330_var_BonusMoney5 =106
x203330_var_BonusMoney6 =0
x203330_var_BonusItem	=	{}
x203330_var_BonusChoiceItem ={}
x203330_var_NpcGUID ={{guid=117006,varName ="莫斯科大公"}}
--DECLARE_QUEST_INFO_STOP--


function x203330_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x203330_var_QuestId) > 0 then
		return 
	else
	if IsQuestHaveDone(varMap, varPlayer, x203330_var_QuestIdPre[1])> 0 then
	  if IsQuestHaveDone(varMap, varPlayer, x203330_var_QuestIdPre[2])> 0 then
	   local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203330_var_QuestId)
	   TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203330_var_QuestId, varState, -1 )
	  end
	end
 end
end

function x203330_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203330_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203330_var_ExpBonus )
		end
		if x203330_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203330_var_BonusMoney1 )
		end
		if x203330_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203330_var_BonusMoney2 )
		end
		if x203330_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203330_var_BonusMoney3 )
		end
		if x203330_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203330_var_BonusMoney4 )
		end
		if x203330_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203330_var_BonusMoney5 )
		end
		if x203330_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203330_var_BonusMoney6 )
		end
		for varI, item in x203330_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203330_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203330_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

	if IsQuestHaveDone(varMap, varPlayer, x203330_var_QuestId) > 0 then
		return 
	end
	if which == -1 then
		if IsHaveQuest(varMap,varPlayer, x203330_var_QuestId) > 0 then
			if x203330_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203330_var_QuestName)
						TalkAppendString(varMap,x203330_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203330_var_FileId, x203330_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203330_var_QuestName)
						TalkAppendString(varMap,x203330_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203330_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203330_var_FileId, x203330_var_QuestId);
			end
		elseif x203330_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203330_var_QuestName)
			TalkAppendString(varMap,x203330_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203330_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203330_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203330_var_QuestHelp )
			end
			x203330_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203330_var_FileId, x203330_var_QuestId);
  	end
	elseif which == 1 then
			SetMonsterCamp(varMap,varTalknpc,21)
			NpcTalk(varMap, varTalknpc, "既然事已败漏，只好和你拼个鱼死网破！", -1)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t莫斯科大公突然露出一副凶恶的嘴脸，向你冲来！")
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203330_var_FileId, x203330_var_QuestId);
	
	
	
	
	
	end
  
end


function x203330_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
					return 1
		
		

end

function x203330_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203330_var_QuestId)
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) >= 1 then
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	    end
	 		return 0
end

function x203330_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203330_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203330_var_QuestId  )
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
		if x203330_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203330_var_QuestId, x203330_var_FileId, 1, 0, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203330_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x203330_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203330_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203330_var_QuestId)
	  x203330_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x203330_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
end

function x203330_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203330_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203330_var_BonusChoiceItem do
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

function x203330_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203330_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203330_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203330_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203330_var_QuestId) > 0 then
				x203330_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203330_var_QuestId)		
				x203330_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203330_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203330_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		for varI, item in x203330_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203330_var_QuestIdNext )	
end

function x203330_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203330_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203330_var_ExpBonus);
  	end
		if x203330_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203330_var_BonusMoney1 )
	  end
		if x203330_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203330_var_BonusMoney2 )
	  end
		if x203330_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203330_var_BonusMoney3 )
		end
		if x203330_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203330_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203330_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203330_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203330_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203330_var_BonusMoney6)
		end
end

function x203330_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203330_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203330_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203330_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203330_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203330_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203330_var_QuestName.."！", 0, 3)
				if x203330_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203330_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203330_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203330_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203330_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203330_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203330_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203330_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203330_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203330_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203330_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203330_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203330_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203330_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203330_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==2107 then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x203330_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203330_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 1 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
												Msg2Player(varMap, humanObjId, format("击败莫斯科大公   %d/1", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x203330_CheckSubmit( varMap, humanObjId)
				 		end
			    end
				end
			end
	end 
end


function x203330_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203330_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203330_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203330_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203330_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
		
		
		
		
					
				
					
			
			
			
	
	
   local bFind  = 0
  for varI ,item in x203330_var_NpcGUID do
     if item.guid == varTalkNpcGUID then
    		if IsHaveQuest(varMap,varPlayer, x203330_var_QuestId) > 0 then 
    		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200502_var_QuestId, varState, -1 )
  				
  			 end
         bFind = 1
         break
     end
  end
    if bFind == 0 then   
     return
    end
		
		
end

function x203330_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203330_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203330_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203330_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203330_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203330_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
