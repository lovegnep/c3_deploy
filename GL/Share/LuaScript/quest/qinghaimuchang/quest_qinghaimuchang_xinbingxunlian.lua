

--DECLARE_QUEST_INFO_START--
x203435_var_FileId = 203435
x203435_var_QuestIdPre =3413
x203435_var_QuestId = 3414
x203435_var_LevelLess	= 	1 
x203435_var_QuestIdNext = 3498
x203435_var_DemandKill ={{varId=11970,varNum=5}}

x203435_var_ExtTarget={{type=20,n=5,target="消灭5只@npc_131023"}}
x203435_var_QuestName="【新手】新兵训练！"

x203435_var_QuestInfo="\t现在，我们要开始一项针对新兵的训练！\n\t东南边有很多草原熊在游荡，你的任务，就是去干掉那些草原熊！\n\t在这之后，记得去王城右都尉金虎大人那里报到。他带领着王国的军队，就在王城的东门外。"  
x203435_var_QuestTarget="消灭5只@npc_131023"		
x203435_var_QuestCompleted="\t新人？很好！铁家这几个小子，看人的眼光还不错。"
x203435_var_ContinueInfo="\t不要怯懦，这几只熊是难不倒你的。"
x203435_var_QuestHelp =	""
x203435_var_DemandItem ={}
x203435_var_ExpBonus = 2200
x203435_var_BonusMoney1 =5
x203435_var_BonusMoney2 =0
x203435_var_BonusMoney3 =0
x203435_var_BonusMoney4 =0
x203435_var_BonusMoney5 =12
x203435_var_BonusMoney6 =0
x203435_var_BonusItem	=	{}
x203435_var_BonusChoiceItem ={}
x203435_var_NpcGUID = {{ guid = 131037, varName = "金虎"} }
--DECLARE_QUEST_INFO_STOP--



function x203435_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203435_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203435_var_QuestIdPre) > 0 then
				if IsHaveQuest(varMap,varPlayer, x203435_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203435_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203435_var_QuestId, varState, -1 )
					 
				end
	end
end

function x203435_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203435_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203435_var_ExpBonus )
		end
		if x203435_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203435_var_BonusMoney1 )
		end
		if x203435_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203435_var_BonusMoney2 )
		end
		if x203435_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203435_var_BonusMoney3 )
		end
		if x203435_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203435_var_BonusMoney4 )
		end
		if x203435_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203435_var_BonusMoney5 )
		end
		if x203435_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203435_var_BonusMoney6 )
		end
		for varI, item in x203435_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203435_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203435_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203435_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203435_var_QuestId) > 0 then
			if x203435_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203435_var_QuestName)
						TalkAppendString(varMap,x203435_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203435_var_FileId, x203435_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203435_var_QuestName)
						TalkAppendString(varMap,x203435_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203435_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203435_var_FileId, x203435_var_QuestId);
			end
  elseif x203435_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203435_var_QuestName)
			TalkAppendString(varMap,x203435_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			
			for varI, item in x203435_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203435_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203435_var_QuestHelp )
			end
			x203435_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203435_var_FileId, x203435_var_QuestId);
  end
end



function x203435_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203435_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203435_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203435_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203435_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203435_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,0 )
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 )
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )
	        return 1
	end
	return 0
end

function x203435_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203435_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203435_var_QuestId  )
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
		if x203435_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203435_var_QuestId, x203435_var_FileId, 1, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203435_Msg2toplayer( varMap, varPlayer,0)
		  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,1 )
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203435_var_QuestId)       
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,1 )
                                           
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203435_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203435_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203435_var_QuestId)
	  x203435_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 )
end

function x203435_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203435_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203435_var_BonusChoiceItem do
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

function x203435_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203435_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203435_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203435_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203435_var_QuestId) > 0 then
				x203435_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203435_var_QuestId)
				
				x203435_GetBonus( varMap, varPlayer,varTalknpc)
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203435_var_QuestIdNext )	
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
				
   end
end

function x203435_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203435_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203435_var_ExpBonus);
  	end
		if x203435_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203435_var_BonusMoney1 )
	  end
		if x203435_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203435_var_BonusMoney2 )
	  end
		if x203435_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203435_var_BonusMoney3 )
		end
		if x203435_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203435_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203435_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203435_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203435_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203435_var_BonusMoney6)
		end
end

function x203435_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203435_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203435_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203435_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203435_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203435_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203435_var_QuestName.."！", 0, 3)
				if x203435_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203435_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203435_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203435_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203435_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203435_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203435_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203435_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203435_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203435_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203435_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203435_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203435_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203435_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203435_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203435_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203435_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203435_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203435_var_QuestId, varState, -1 )
		end
end



function x203435_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==x203435_var_DemandKill[1].varId then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x203435_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203435_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 5 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
												Msg2Player(varMap, humanObjId, format("你击毙了草原棕熊 %d/5", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x203435_CheckSubmit( varMap, humanObjId)
										end
                end
            end
		end
	end
end


function x203435_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203435_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203435_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203435_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203435_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203435_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203435_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203435_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203435_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203435_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
