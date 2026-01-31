

--DECLARE_QUEST_INFO_START--
x203694_var_FileId = 203694
x203694_var_QuestIdPre ={3703,3729,3730,3731,3732,3733,3734,3735,3736,3737,3738,3739}
x203694_var_QuestId = {3705,3753,3754,3755,3756,3757,3758,3759,3760,3761,3762,3763}
x203694_var_LevelLess	= 	1
x203694_var_QuestIdNext = 3708
x203694_var_Name	={}
x203694_var_ExtTarget={{type=20,n=1,target="找到@npc_134016"}}
x203694_var_QuestName="【新手】白鹿长老"
x203694_var_QuestInfo="\t获得新兵器之后，记得按下“B”键打开背包，右键点击你刚刚获得的武器，就可以装备上新武器了。\n\t白鹿长老正在西北方等待着你的到来。"  
x203694_var_QuestTarget="找到@npc_134016"		
x203694_var_QuestCompleted="\t真没想到你这么快就来了！\n\t看来你在前面两位长老那里得到了不少收获啊。"					
x203694_var_ContinueInfo=""
x203694_var_QuestHelp =	"#G按下“B”键打开背包，右键点击就可以装备你刚刚获得的武器。#W"
x203694_var_DemandItem ={}
x203694_var_ExpBonus = 163
x203694_var_BonusMoney1 =5
x203694_var_BonusMoney2 =0
x203694_var_BonusMoney3 =0
x203694_var_BonusMoney4 =0
x203694_var_BonusMoney5 =12
x203694_var_BonusMoney6 =0
x203694_var_BonusItem	=	{}
x203694_var_BonusChoiceItem ={}
x203694_var_NpcGUID ={{ guid = 134016, varName = "白鹿长老"} }
--DECLARE_QUEST_INFO_STOP--     



function x203694_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local zhiye = GetZhiye( varMap, varPlayer)+1
	if IsQuestHaveDone(varMap, varPlayer, x203694_var_QuestId[zhiye]) > 0 then
		return 
	end
	local zhiye =GetZhiye( varMap, varPlayer)+1
	if IsQuestHaveDone(varMap, varPlayer, x203694_var_QuestIdPre[zhiye])> 0 then
		
			if IsHaveQuest(varMap,varPlayer, x203694_var_QuestId[zhiye]) <= 0 then						
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203694_var_QuestId[zhiye])
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203694_var_QuestId[zhiye], varState, -1 )
				 
			end
	end
		
end

function x203694_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		local zhiye = GetZhiye( varMap, varPlayer)+1
		if x203694_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203694_var_ExpBonus )
		end
		if x203694_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203694_var_BonusMoney1 )
		end
		if x203694_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203694_var_BonusMoney2 )
		end
		if x203694_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203694_var_BonusMoney3 )
		end
		if x203694_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203694_var_BonusMoney4 )
		end
		if x203694_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203694_var_BonusMoney5 )
		end
		if x203694_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203694_var_BonusMoney6 )
		end
		for varI, item in x203694_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203694_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203694_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	local zhiye = GetZhiye( varMap, varPlayer)+1
	if IsQuestHaveDone(varMap, varPlayer, x203694_var_QuestId[zhiye]) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203694_var_QuestId[zhiye]) > 0 then
			if x203694_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203694_var_QuestName)
						TalkAppendString(varMap,x203694_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203694_var_FileId, x203694_var_QuestId[zhiye]);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203694_var_QuestName)
						TalkAppendString(varMap,x203694_var_QuestCompleted)
						TalkAppendString(varMap," ")
						
						x203694_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )  
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203694_var_FileId, x203694_var_QuestId[zhiye]);
			end
  elseif x203694_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203694_var_QuestName)
			TalkAppendString(varMap,x203694_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 		  
			for varI, item in x203694_var_ExtTarget do  	
			TalkAppendString( varMap,item.target)		
			end 
			if x203694_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203694_var_QuestHelp )
			end
			x203694_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203694_var_FileId, x203694_var_QuestId[zhiye]);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			
  end
	
end


function x203694_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203694_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203694_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		local zhiye = GetZhiye( varMap, varPlayer)+1
		if IsQuestHaveDone(varMap, varPlayer, x203694_var_QuestId[zhiye]) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		if x203694_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203694_var_QuestId[zhiye], x203694_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then                                          
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203694_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203694_var_QuestId[zhiye])       
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                 
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                 
	    					
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203694_ProcQuestAbandon(varMap, varPlayer, varQuest)
		local zhiye = GetZhiye( varMap, varPlayer)+1
		if IsHaveQuest(varMap,varPlayer, x203694_var_QuestId[zhiye]) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203694_var_QuestId[zhiye])
	  x203694_Msg2toplayer( varMap, varPlayer,1) 
			
end

function x203694_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local zhiye = GetZhiye( varMap, varPlayer)+1
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203694_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203694_var_BonusChoiceItem do
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

function x203694_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	local zhiye = GetZhiye( varMap, varPlayer)+1
	if IsHaveQuest(varMap,varPlayer, x203694_var_QuestId[zhiye]) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203694_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203694_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203694_var_QuestId[zhiye]) > 0 then
				x203694_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203694_var_QuestId[zhiye])
				QuestCom(varMap, varPlayer, 3707)
				x203694_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203694_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203694_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   local zhiye =GetZhiye( varMap, varPlayer)+1
   LuaCallNoclosure( 203689, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203694_var_QuestIdNext )	
end

function x203694_GetBonus( varMap, varPlayer,varTalknpc)
		local zhiye = GetZhiye( varMap, varPlayer)+1
	  if x203694_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203694_var_ExpBonus);
  	end
		if x203694_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203694_var_BonusMoney1 )
	  end
		if x203694_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203694_var_BonusMoney2 )
	  end
		if x203694_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203694_var_BonusMoney3 )
		end
		if x203694_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203694_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203694_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203694_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203694_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203694_var_BonusMoney6)
		end
end

function x203694_Msg2toplayer( varMap, varPlayer,type)
		local zhiye = GetZhiye( varMap, varPlayer)+1
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203694_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203694_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203694_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203694_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203694_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203694_var_QuestName.."！", 0, 3)
				if x203694_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203694_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203694_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203694_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203694_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203694_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203694_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203694_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203694_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203694_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203694_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203694_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203694_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203694_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203694_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203694_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203694_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203694_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203694_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203694_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
		local zhiye = GetZhiye( varMap, varPlayer)+1
	  local bFind  = 0
    for varI ,item in x203694_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203694_var_QuestId[zhiye]) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203694_var_QuestId[zhiye])        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203694_var_QuestId[zhiye], varState, -1 )
		end
end

function x203694_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203694_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203694_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203694_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203694_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203694_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
