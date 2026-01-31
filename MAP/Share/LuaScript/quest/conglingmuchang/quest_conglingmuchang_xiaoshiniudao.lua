

--DECLARE_QUEST_INFO_START--
x203542_var_FileId = 203542
x203542_var_QuestIdPre =3242
x203542_var_QuestId = 3204
x203542_var_LevelLess	= 	1 
x203542_var_QuestIdNext = 3210
x203542_var_DemandKill ={{varId=11971,varNum=4}}

x203542_var_ExtTarget={{type=20,n=4,target="消灭4只@npc_125021"}}
x203542_var_QuestName="【新手】小试牛刀"

x203542_var_QuestInfo="\t我确实遇到了一些麻烦。\n\t你看见这周围的狼群了吗？如果放任下去，必然会成为猎场的一大危害，你可以帮我将它们除掉一些吗？"  
x203542_var_QuestTarget="消灭4只@npc_125021"		
x203542_var_QuestCompleted="\t感谢你除掉了这些草原狼，在我来这里之前，我看见王国派出了征兵官正在南方招收勇士，加入王国军队。\n\t以你的身手，应征入伍应该不是问题。"
x203542_var_ContinueInfo="\t几只草原狼应该不会难住你！"
x203542_var_QuestHelp =	"#G\t你可以点击任务寻路中的蓝色字找到怪物，再用滑鼠左键点击怪物，就可以攻击并消灭它们。"
x203542_var_DemandItem ={}
x203542_var_ExpBonus = 139
x203542_var_BonusMoney1 =5
x203542_var_BonusMoney2 =0
x203542_var_BonusMoney3 =0
x203542_var_BonusMoney4 =0
x203542_var_BonusMoney5 =12
x203542_var_BonusMoney6 =0
x203542_var_BonusItem	=	{}
x203542_var_BonusChoiceItem ={}
x203542_var_NpcGUID = {{ guid = 125015, varName = "木图"} }
--DECLARE_QUEST_INFO_STOP--



function x203542_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203542_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203542_var_QuestIdPre) > 0 then
				if IsHaveQuest(varMap,varPlayer, x203542_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203542_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203542_var_QuestId, varState, -1 )
					 
				end
	end
end

function x203542_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203542_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203542_var_ExpBonus )
		end
		if x203542_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203542_var_BonusMoney1 )
		end
		if x203542_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203542_var_BonusMoney2 )
		end
		if x203542_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203542_var_BonusMoney3 )
		end
		if x203542_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203542_var_BonusMoney4 )
		end
		if x203542_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203542_var_BonusMoney5 )
		end
		if x203542_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203542_var_BonusMoney6 )
		end
		for varI, item in x203542_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203542_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203542_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203542_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203542_var_QuestId) > 0 then
			if x203542_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203542_var_QuestName)
						TalkAppendString(varMap,x203542_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203542_var_FileId, x203542_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203542_var_QuestName)
						TalkAppendString(varMap,x203542_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203542_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203542_var_FileId, x203542_var_QuestId);
			end
  elseif x203542_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203542_var_QuestName)
			TalkAppendString(varMap,x203542_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			
			for varI, item in x203542_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203542_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203542_var_QuestHelp )
			end
			x203542_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203542_var_FileId, x203542_var_QuestId);
  end
end



function x203542_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203542_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203542_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203542_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203542_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203542_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,0 )
	        return 1
	end
	return 0
end

function x203542_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203542_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203542_var_QuestId  )
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
		if x203542_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203542_var_QuestId, x203542_var_FileId, 1, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203542_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203542_var_QuestId)       
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,1 )
                                           
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203542_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203542_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203542_var_QuestId)
	  x203542_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	  
end

function x203542_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203542_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203542_var_BonusChoiceItem do
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

function x203542_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203542_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203542_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203542_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203542_var_QuestId) > 0 then
				x203542_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203542_var_QuestId)
				
				x203542_GetBonus( varMap, varPlayer,varTalknpc)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203542_var_QuestIdNext )	
				
   end
end

function x203542_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203542_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203542_var_ExpBonus);
  	end
		if x203542_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203542_var_BonusMoney1 )
	  end
		if x203542_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203542_var_BonusMoney2 )
	  end
		if x203542_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203542_var_BonusMoney3 )
		end
		if x203542_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203542_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203542_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203542_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203542_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203542_var_BonusMoney6)
		end
end

function x203542_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203542_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203542_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203542_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203542_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203542_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203542_var_QuestName.."！", 0, 3)
				if x203542_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203542_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203542_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203542_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203542_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203542_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203542_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203542_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203542_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203542_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203542_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203542_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203542_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203542_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203542_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203542_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203542_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203542_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203542_var_QuestId, varState, -1 )
		end
end



function x203542_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==x203542_var_DemandKill[1].varId then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x203542_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203542_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 4 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
												Msg2Player(varMap, humanObjId, format("你击毙了草原狼 %d/4", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x203542_CheckSubmit( varMap, humanObjId)
												if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203542_var_DemandKill[1].varNum then	
														LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
												end
										end
                end
            end
		end
	end
end


function x203542_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203542_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203542_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203542_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203542_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203542_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203542_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203542_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203542_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203542_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
