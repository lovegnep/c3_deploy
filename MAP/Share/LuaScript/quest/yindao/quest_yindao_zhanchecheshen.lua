

--DECLARE_QUEST_INFO_START--
x203832_var_FileId = 203832
x203832_var_QuestIdPre =1650
x203832_var_QuestId = 1651
x203832_var_LevelLess	= 70
x203832_var_QuestIdNext = 1652
x203832_var_Name	={}
x203832_var_ExtTarget={{type=20,n=1,target="找到@npc_141140"}}
x203832_var_QuestName="【个人】战车车身"
x203832_var_QuestInfo="\t要想建造战车，首先，你需要一个完整的车身，正好这里有一位元战车车身制造大师，他可是个大方的人。"  
x203832_var_QuestTarget="找到@npc_141140"		
x203832_var_QuestCompleted="\t看起来你也对战车很感兴趣，那么这个普通的战车车身就送给你了。\n\t车身是战车的基础，它决定了你的战车的负重和动能，其他的任何战车部件都会消耗负重和动能，所以，一个好的车身，决定了整辆战车的能力。"					
x203832_var_ContinueInfo="\t你还没有去么？"
x203832_var_QuestHelp =	"#G按下“K”键打开技能查看介面，左键点击你刚学会的战车技能就可以坐上战车了。#W"
x203832_var_DemandItem ={}
x203832_var_ExpBonus = 382000
x203832_var_BonusMoney1 =700
x203832_var_BonusMoney2 =0
x203832_var_BonusMoney3 =0
x203832_var_BonusMoney4 =0
x203832_var_BonusMoney5 =41
x203832_var_BonusMoney6 =0
x203832_var_BonusItem	=	{{item = 12030691, n = 1}}
x203832_var_BonusChoiceItem =	{}
x203832_var_NpcGUID ={{ guid = 141140, varName = "战车车身制造大师"} }
--DECLARE_QUEST_INFO_STOP--     
x203832_var_FileIdNext =203702


x203832_var_MaxLevel      = 160

function x203832_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
  local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203832_var_LevelLess or varLevel >= x203832_var_MaxLevel then
		return
	end
	
	
	if IsQuestHaveDone(varMap, varPlayer, x203832_var_QuestId) > 0 then
		return 
	end
	
	if IsQuestHaveDone(varMap, varPlayer, x203832_var_QuestIdPre) <= 0 then
		return
	end
		
			if IsHaveQuest(varMap,varPlayer, x203832_var_QuestId) <= 0 then						
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203832_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203832_var_QuestId, varState, -1 )
				-- LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 ) 		
			end
	end
		

function x203832_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203832_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203832_var_ExpBonus )
		end
		if x203832_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203832_var_BonusMoney1 )
		end
		if x203832_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203832_var_BonusMoney2 )
		end
		if x203832_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203832_var_BonusMoney3 )
		end
		if x203832_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203832_var_BonusMoney4 )
		end
		if x203832_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203832_var_BonusMoney5 )
		end
		if x203832_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203832_var_BonusMoney6 )
		end
		for varI, item in x203832_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203832_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203832_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	
	if IsQuestHaveDone(varMap, varPlayer, x203832_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203832_var_QuestId) > 0 then
			if x203832_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203832_var_QuestName)
						TalkAppendString(varMap,x203832_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203832_var_FileId, x203832_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203832_var_QuestName)
						TalkAppendString(varMap,x203832_var_QuestCompleted)
						TalkAppendString(varMap," ")
						
						x203832_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )  
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203832_var_FileId, x203832_var_QuestId);
			end
  elseif x203832_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203832_var_QuestName)
			TalkAppendString(varMap,x203832_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 		  
			for varI, item in x203832_var_ExtTarget do  	
			TalkAppendString( varMap,item.target)		
			end 
			if x203832_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203832_var_QuestHelp )
			end
			x203832_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203832_var_FileId, x203832_var_QuestId);
		--	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
		--	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 ) 	
  end
	
end


function x203832_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203832_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203832_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203832_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203832_var_QuestId  )
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
		if x203832_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203832_var_QuestId, x203832_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then                                          
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203832_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203832_var_QuestId)       
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                 
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                 
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,1 )   
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203832_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203832_var_QuestId) <= 0 then
				return 
		end
		
		DelQuest(varMap, varPlayer, x203832_var_QuestId)
		
		Msg2Player(varMap, varPlayer, "您放弃了任务"..x203832_var_QuestName.."！", 0, 2)
	  Msg2Player(varMap, varPlayer, "您放弃了任务"..x203832_var_QuestName.."！", 0, 3)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 ) 
			
end

function x203832_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203832_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x203832_var_BonusChoiceItem do
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

function x203832_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203832_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203832_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203832_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203832_var_QuestId) > 0 then
				local num = 0
				x203832_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203832_var_QuestId)
				x203832_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203832_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
 						num = num + 1
				end
				for varI, item in x203832_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
	    			    num = num + 1
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		if num > 0 then
    			DeliverItemListSendToPlayer(varMap,varPlayer)
    		end
    		LuaCallNoclosure( 888891, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203832_var_QuestIdNext )	
   end
LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 )   
end

function x203832_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203832_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203832_var_ExpBonus);
  	end
		if x203832_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203832_var_BonusMoney1 )
	  end
		if x203832_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203832_var_BonusMoney2 )
	  end
		if x203832_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203832_var_BonusMoney3 )
		end
		if x203832_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203832_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203832_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203832_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203832_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203832_var_BonusMoney6)
		end
end

function x203832_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203832_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203832_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203832_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203832_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203832_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203832_var_QuestName.."！", 0, 3)
				if x203832_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203832_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203832_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203832_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203832_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203832_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203832_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203832_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203832_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203832_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203832_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203832_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203832_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203832_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203832_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203832_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203832_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203832_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203832_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203832_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203832_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203832_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203832_var_QuestId)        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203832_var_QuestId, varState, -1 )
		end
end

function x203832_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203832_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203832_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203832_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203832_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203832_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
