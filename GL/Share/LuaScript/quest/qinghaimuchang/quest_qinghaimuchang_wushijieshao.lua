

--DECLARE_QUEST_INFO_START--
x203565_var_FileId = 203565
x203565_var_QuestIdPre =3400
x203565_var_QuestId = 3417
x203565_var_LevelLess	= 	1 
x203565_var_QuestIdNext = 3441

x203565_var_ExtTarget={{type=20,n=3,target="向@npc_131001讨教职业发展"}}
x203565_var_QuestName="【新手】初识职业"
x203565_var_QuestTalk={"武士的现状","武士的特点","如何能成为宗师"}
x203565_var_QuestInfo="\t作为一个初入世界的新人，首先必须要对自己的职业有明确的认识。\n\t我的朋友智者哈达，年轻时游历世界，见多识广。他一定可以为你做出有关你的职业的指点。"  
x203565_var_QuestTarget="向@npc_131001讨教职业发展"		
x203565_var_QuestCompleted="\t绝世武功并非朝夕而蹴，只有持之以恒的练习，才能成为一代宗师。"
x203565_var_ContinueInfo={"\t从商周时代，中国就拥有了虎贲甲士，即武士。中国几千年的战争史上，武士一直是军队的重要组成部分。",
												"\t武士们凭藉锋利的兵刃，坚固的盔甲，健硕的体格，旺盛的斗志活跃于与敌人的正面交锋中。",
												"\t技能均为近程伤害技能，以单目标攻击技能为主，配有部分多目标技能。\n"}
x203565_var_QuestHelp =	"#G您可以用滑鼠#R左键#G点击@npc_131001，和他对话。您可以点击键盘上的#RQ#G键，打开任务列表，选中你要完成的任务，点击#R任务目标#G中的蓝色字体来进行自动寻路。"
x203565_var_DemandItem ={}
x203565_var_ExpBonus = 23
x203565_var_BonusMoney1 =11
x203565_var_BonusMoney2 =0
x203565_var_BonusMoney3 =0
x203565_var_BonusMoney4 =0
x203565_var_BonusMoney5 =12
x203565_var_BonusMoney6 =0
x203565_var_BonusItem	=	{}
x203565_var_BonusChoiceItem ={}
x203565_var_NpcGUID = {{ guid = 131001, varName = "长老"} }

--DECLARE_QUEST_INFO_STOP--



function x203565_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203565_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203565_var_QuestIdPre) > 0 then
		if GetZhiye( varMap, varPlayer)==0 then
				if IsHaveQuest(varMap,varPlayer, x203565_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203565_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203565_var_QuestId, varState, -1 )
					  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 )					 
				end
		end
	end
end

function x203565_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203565_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203565_var_ExpBonus )
		end
		if x203565_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203565_var_BonusMoney1 )
		end
		if x203565_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203565_var_BonusMoney2 )
		end
		if x203565_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203565_var_BonusMoney3 )
		end
		if x203565_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203565_var_BonusMoney4 )
		end
		if x203565_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203565_var_BonusMoney5 )
		end
		if x203565_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203565_var_BonusMoney6 )
		end
		for varI, item in x203565_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203565_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203565_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203565_var_QuestId)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203565_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203565_var_QuestId) > 0 then
			if x203565_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203565_var_QuestName) 
						TalkAppendString(varMap,x203565_var_ContinueInfo[1])
						TalkAppendButton(varMap, varQuest, x203565_var_QuestTalk[1],0,0)
						StopTalkTask()	
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,1 )		
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203565_var_FileId, x203565_var_QuestId); 
						
					elseif which ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203565_var_QuestName)
						TalkAppendString(varMap,x203565_var_ContinueInfo[2])
						TalkAppendButton(varMap, varQuest, x203565_var_QuestTalk[2],1,1)
						StopTalkTask()
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203565_var_FileId, x203565_var_QuestId);
					elseif which ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203565_var_QuestName)
						TalkAppendString(varMap,x203565_var_ContinueInfo[3])
						TalkAppendButton(varMap, varQuest, x203565_var_QuestTalk[3],0,2)
						StopTalkTask()
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,2)
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203565_var_FileId, x203565_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203565_var_QuestId)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)                                                
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1)
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203565_var_QuestName)
						TalkAppendString(varMap,x203565_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203565_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,3)
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203565_var_FileId, x203565_var_QuestId);
			end
  elseif x203565_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203565_var_QuestName)
			TalkAppendString(varMap,x203565_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
			for varI, item in x203565_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203565_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203565_var_QuestHelp )
			end
			x203565_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203565_var_FileId, x203565_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
end

function x203565_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203565_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203565_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203565_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203565_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 1 then
	        return 1
	end
	return 0
end

function x203565_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203565_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203565_var_QuestId  )
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
		if x203565_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203565_var_QuestId, x203565_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203565_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203565_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,0 )
	    			
		  		end
	 	end                                                                    
	     
end

function x203565_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203565_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203565_var_QuestId)
	  x203565_Msg2toplayer( varMap, varPlayer,1)
	  
end

function x203565_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203565_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203565_var_BonusChoiceItem do
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

function x203565_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203565_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203565_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203565_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203565_var_QuestId) > 0 then
				x203565_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203565_var_QuestId)
				QuestCom(varMap, varPlayer, 3440)
				x203565_GetBonus( varMap, varPlayer,varTalknpc)
				
					
				
				
					
				
			  
			  	 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,0)
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203565_var_QuestIdNext )	
   end
end

function x203565_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203565_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203565_var_ExpBonus);
  	end
		if x203565_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203565_var_BonusMoney1 )
	  end
		if x203565_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203565_var_BonusMoney2 )
	  end
		if x203565_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203565_var_BonusMoney3 )
		end
		if x203565_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203565_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203565_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203565_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203565_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203565_var_BonusMoney6)
		end
end

function x203565_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203565_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203565_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203565_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203565_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203565_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203565_var_QuestName.."！", 0, 3)
				if x203565_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203565_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203565_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203565_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203565_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203565_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203565_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203565_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203565_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203565_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203565_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203565_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203565_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203565_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203565_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203565_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203565_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203565_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203565_var_QuestId, 7, -1 )
		end
end



function x203565_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203565_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203565_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203565_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203565_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203565_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203565_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203565_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203565_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203565_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203565_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
