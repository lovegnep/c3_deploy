

--DECLARE_QUEST_INFO_START--
x203514_var_FileId = 203514
x203514_var_QuestIdPre =3200
x203514_var_QuestId = 3201
x203514_var_LevelLess	= 	1
x203514_var_QuestIdNext = {3217,3218,3219,3220,3221,3222,3223,3224,3225,3226,3227,3228}
x203514_var_Name	={}
x203514_var_ExtTarget={{type=20,n=1,target="找到@npc_125001"}}
x203514_var_QuestName="【主线】初入楼兰"
x203514_var_QuestInfo="\t我的老师哈达曾跟随先祖木华黎征战无数，现年事已高，但认人识事还相当哲学，有什么事你可以去找他。"  
x203514_var_QuestTarget=""		
x203514_var_QuestCompleted="\t年轻人，我早就注意到你了，少年英姿，文武全才。但在这乱世之中一路的成长又必定会艰辛无比。"					
x203514_var_ContinueInfo=""
x203514_var_QuestHelp =	""
x203514_var_DemandItem ={}
x203514_var_ExpBonus = 1400
x203514_var_BonusMoney1 =200
x203514_var_BonusMoney2 =0
x203514_var_BonusMoney3 =0
x203514_var_BonusMoney4 =0
x203514_var_BonusMoney5 =0
x203514_var_BonusMoney6 =0
x203514_var_BonusItem	=	{}
x203514_var_BonusChoiceItem ={}
x203514_var_NpcGUID ={{ guid = 125001, varName = "长老哈达"} }
--DECLARE_QUEST_INFO_STOP--     
x203514_var_FileIdNext ={203515,203516,203517,203518,203519,203520,203521,203522,203523,203524,203525,203526}


function x203514_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x203514_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203514_var_QuestIdPre)> 0 then
		
			if IsHaveQuest(varMap,varPlayer, x203514_var_QuestId) <= 0 then						
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203514_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203514_var_QuestId, varState, -1 )
				 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 ) 		
			end
	end
		
end

function x203514_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203514_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203514_var_ExpBonus )
		end
		if x203514_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203514_var_BonusMoney1 )
		end
		if x203514_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203514_var_BonusMoney2 )
		end
		if x203514_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203514_var_BonusMoney3 )
		end
		if x203514_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203514_var_BonusMoney4 )
		end
		if x203514_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203514_var_BonusMoney5 )
		end
		if x203514_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203514_var_BonusMoney6 )
		end
		for varI, item in x203514_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203514_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203514_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203514_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203514_var_QuestId) > 0 then
			if x203514_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203514_var_QuestName)
						TalkAppendString(varMap,x203514_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203514_var_FileId, x203514_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203514_var_QuestName)
						TalkAppendString(varMap,x203514_var_QuestCompleted)
						TalkAppendString(varMap," ")
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1 )  
						x203514_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )  
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203514_var_FileId, x203514_var_QuestId);
			end
  elseif x203514_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203514_var_QuestName)
			TalkAppendString(varMap,x203514_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 		  
			for varI, item in x203514_var_ExtTarget do  	
			TalkAppendString( varMap,item.target)		
			end 
			if x203514_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203514_var_QuestHelp )
			end
			x203514_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203514_var_FileId, x203514_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 ) 	
  end
	
end


function x203514_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203514_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203514_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203514_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203514_var_QuestId  )
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
		if x203514_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203514_var_QuestId, x203514_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then                                          
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203514_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203514_var_QuestId)       
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                 
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                 
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )   
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203514_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203514_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203514_var_QuestId)
	  x203514_Msg2toplayer( varMap, varPlayer,1) 
			
end

function x203514_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203514_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203514_var_BonusChoiceItem do
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

function x203514_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203514_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203514_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203514_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203514_var_QuestId) > 0 then
				x203514_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203514_var_QuestId)
				x203514_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203514_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203514_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   local zhiye =GetZhiye( varMap, varPlayer)+1
   LuaCallNoclosure( x203514_var_FileIdNext[zhiye], "ProcEventEntry", varMap, varPlayer, varTalknpc, x203514_var_QuestIdNext[zhiye] )	
end

function x203514_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203514_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203514_var_ExpBonus);
  	end
		if x203514_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203514_var_BonusMoney1 )
	  end
		if x203514_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203514_var_BonusMoney2 )
	  end
		if x203514_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203514_var_BonusMoney3 )
		end
		if x203514_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203514_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203514_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203514_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203514_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203514_var_BonusMoney6)
		end
end

function x203514_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203514_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203514_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203514_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203514_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203514_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203514_var_QuestName.."！", 0, 3)
				if x203514_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203514_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203514_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203514_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203514_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203514_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203514_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203514_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203514_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203514_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203514_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203514_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203514_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203514_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203514_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203514_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203514_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203514_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203514_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203514_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203514_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203514_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203514_var_QuestId)        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203514_var_QuestId, varState, -1 )
		end
end

function x203514_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203514_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203514_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203514_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203514_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203514_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
