

--DECLARE_QUEST_INFO_START--
x256240_var_FileId = 256240
x256240_var_QuestIdPre = 3046
x256240_var_QuestId = 3005
x256240_var_LevelLess	= 	1 
x256240_var_QuestIdNext = 3006
x256240_var_Name	={}
x256240_var_ExtTarget={{type=20,n=5,target="消灭5只@npc_80000"}}
x256240_var_QuestName="【新手】小试身手"
x256240_var_QuestInfo="\t村口最近不知为什么多了很多可恶的狐狸，虽然它们并不会拿羊儿们当作食物，可是它们身上的骚味却令那些可怜的羔羊寝食难安。\n\t想办法赶走它们，如果它们能够懂得什么叫做“杀一儆百”这个道理，事情就会好办得多。"  
x256240_var_QuestTarget=""		
x256240_var_QuestCompleted="\t真没想到你这么快就回来了！怎么？你没有顺手带点狐皮回来么？那真可惜了，它们的皮可是上等的御寒材料。\n\t不过，我们的那些羊群今晚上看来能睡个好觉了，哈哈哈。"					
x256240_var_ContinueInfo="\t赶走那些狐狸了吗？"
x256240_var_QuestHelp =	""
x256240_var_DemandItem ={}
x256240_var_BonusMoney1 =55
x256240_var_BonusMoney2 =0
x256240_var_BonusMoney3 =0
x256240_var_BonusMoney4 =0
x256240_var_BonusMoney5 =12
x256240_var_BonusMoney6 =0
x256240_var_BonusItem	=	{{item=10261001,n=1}}
x256240_var_BonusChoiceItem ={}
x256240_var_ExpBonus = 163





x256240_var_NpcGUID ={{ guid = 138004, varName = "苍狼长老"}}

--DECLARE_QUEST_INFO_STOP--


function x256240_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 11,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x256240_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x256240_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x256240_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256240_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256240_var_QuestId, varState, -1 )
		end
	end
end

function x256240_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256240_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256240_var_ExpBonus )
		end
		if x256240_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256240_var_BonusMoney1 )
		end
		if x256240_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256240_var_BonusMoney2 )
		end
		if x256240_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256240_var_BonusMoney3 )
		end
		if x256240_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256240_var_BonusMoney4 )
		end
		if x256240_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256240_var_BonusMoney5 )
		end
		if x256240_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256240_var_BonusMoney6 )
		end
		for varI, item in x256240_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256240_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256240_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256240_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256240_var_QuestId) > 0 then
			if x256240_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256240_var_QuestName)
						TalkAppendString(varMap,x256240_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256240_var_FileId, x256240_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256240_var_QuestName)
						TalkAppendString(varMap,x256240_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256240_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256240_var_FileId, x256240_var_QuestId);
			end
  elseif x256240_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256240_var_QuestName)
			TalkAppendString(varMap,x256240_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")  
			for varI, item in x256240_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256240_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256240_var_QuestHelp )
			end
			x256240_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 	
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,1 ) 
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256240_var_FileId, x256240_var_QuestId);
  end
	
end


function x256240_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x256240_var_QuestIdPre)> 0 then
			return 1
	end
		return 0

end

function x256240_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x256240_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==5 then 
				
	        return 1
	  end
	  return 0
	
end

function x256240_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256240_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256240_var_QuestId  )
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
   	if x256240_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
   				local retmiss = AddQuest( varMap, varPlayer, x256240_var_QuestId, x256240_var_FileId, 1, 0, 0,1)
   				if retmiss ==0 then
   					Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
   					return 0
   				else
   	  			x256240_Msg2toplayer( varMap, varPlayer,0)
   	  		end
    	end                                                                    
	     
end


function x256240_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256240_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256240_var_QuestId)
	  x256240_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256240_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256240_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256240_var_BonusChoiceItem do
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

function x256240_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256240_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256240_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256240_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256240_var_QuestId) > 0 then
				x256240_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256240_var_QuestId)
				x256240_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256240_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256240_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end  
    		 DeliverItemListSendToPlayer(varMap,varPlayer)
    		StopItemTask(varMap,varPlayer)
    		
   end 
  
   LuaCallNoclosure( 203434, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256240_var_QuestIdNext )	
end

function x256240_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256240_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256240_var_ExpBonus);
  	end
		if x256240_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256240_var_BonusMoney1 )
	  end
		if x256240_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256240_var_BonusMoney2 )
	  end
		if x256240_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256240_var_BonusMoney3 )
		end
		if x256240_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256240_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256240_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256240_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256240_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256240_var_BonusMoney6)
		end
end

function x256240_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256240_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256240_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256240_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256240_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256240_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256240_var_QuestName.."！", 0, 3)
				if x256240_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256240_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256240_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256240_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256240_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256240_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256240_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256240_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256240_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256240_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256240_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256240_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256240_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256240_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256240_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==1830 then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x256240_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x256240_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 5 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)	
												LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, humanObjId, 21,0 ) 
												LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, humanObjId, 17,1 ) 
												Msg2Player(varMap, humanObjId, format("消灭狐狸   %d/5", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x256240_CheckSubmit( varMap, humanObjId)
										end
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) == 5 then
															SetQuestByIndex(varMap,humanObjId,varQuestIdx,7,1)
															SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,5)	
										LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, humanObjId, 17,0 ) 												
										LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, humanObjId, 1,1 ) 						
										end
                end
            end
		end
	end
end


function x256240_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

end

function x256240_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)

end

function x256240_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)

end

function x256240_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256240_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256240_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256240_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256240_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256240_var_QuestId, varState, -1 )
		end
end

function x256240_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256240_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256240_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256240_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256240_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256240_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x256240_ProcScneneTimer(varMap)









































































































































end





function x256240_CloseTimer( varMap, TimerIndex )







end
