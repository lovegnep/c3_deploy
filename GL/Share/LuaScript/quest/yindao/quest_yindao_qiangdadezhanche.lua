

--DECLARE_QUEST_INFO_START--
x203831_var_FileId = 203831
x203831_var_QuestIdPre ={3203,3229,3230,3231,3232,3233,3234,3235,3236,3237,3238,3239}
x203831_var_QuestId = 1650
x203831_var_LevelLess	= 	70
x203831_var_MaxLevel  =   160
x203831_var_QuestIdNext = 1651
x203831_var_Name	={}
x203831_var_ExtTarget={{type=20,n=1,target="找到@npc_141144"}}
x203831_var_QuestName="【个人】强大的战车！"
x203831_var_QuestInfo="\t最近大都城内有一家神秘的战车工坊开门迎客了。听说那神奇的战车来自于极西之地，一个被称为欧罗巴的地域。\n\t你可有兴趣去那神秘的战车工坊看看？"  
x203831_var_QuestTarget="找到@npc_141144"		
x203831_var_QuestCompleted="\t欢迎光临战车工坊，以后只要是和战车有关的来这里就对了！"					
x203831_var_ContinueInfo="\t去看看吧，会是什么样的工坊呢？"
x203831_var_QuestHelp =	""
x203831_var_DemandItem ={}
x203831_var_ExpBonus = 382000
x203831_var_BonusMoney1 =700
x203831_var_BonusMoney2 =0
x203831_var_BonusMoney3 =0
x203831_var_BonusMoney4 =0
x203831_var_BonusMoney5 =41
x203831_var_BonusMoney6 =0
x203831_var_BonusItem	=	{{item=13030142,n=1}}
x203831_var_BonusChoiceItem ={}
x203831_var_NpcGUID ={{ guid = 141144, varName = "战车道具商人"} }
--DECLARE_QUEST_INFO_STOP--     



function x203831_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
  local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203831_var_LevelLess or varLevel >= x203831_var_MaxLevel then
		return
	end
	----local zhiye = GetZhiye( varMap, varPlayer)+1
	if IsQuestHaveDone(varMap, varPlayer, x203831_var_QuestId) > 0 then
		return 
	end
	--local zhiye =GetZhiye( varMap, varPlayer)+1
	--if IsQuestHaveDone(varMap, varPlayer, x203831_var_QuestIdPre)> 0 then
		
			if IsHaveQuest(varMap,varPlayer, x203831_var_QuestId) <= 0 then						
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203831_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203831_var_QuestId, varState, -1 )
				 
			end
--	end
		
end

function x203831_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		--local zhiye = GetZhiye( varMap, varPlayer)+1
		if x203831_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203831_var_ExpBonus )
		end
		if x203831_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203831_var_BonusMoney1 )
		end
		if x203831_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203831_var_BonusMoney2 )
		end
		if x203831_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203831_var_BonusMoney3 )
		end
		if x203831_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203831_var_BonusMoney4 )
		end
		if x203831_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203831_var_BonusMoney5 )
		end
		if x203831_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203831_var_BonusMoney6 )
		end
		for varI, item in x203831_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203831_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203831_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	----local zhiye = GetZhiye( varMap, varPlayer)+1
	if IsQuestHaveDone(varMap, varPlayer, x203831_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203831_var_QuestId) > 0 then
			if x203831_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203831_var_QuestName)
						TalkAppendString(varMap,x203831_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203831_var_FileId, x203831_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203831_var_QuestName)
						TalkAppendString(varMap,x203831_var_QuestCompleted)
						TalkAppendString(varMap," ")
						
						x203831_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
					--	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )  
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203831_var_FileId, x203831_var_QuestId);
			end
  elseif x203831_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203831_var_QuestName)
			TalkAppendString(varMap,x203831_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 		  
			for varI, item in x203831_var_ExtTarget do  	
			TalkAppendString( varMap,item.target)		
			end 
			if x203831_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203831_var_QuestHelp )
			end
			x203831_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203831_var_FileId, x203831_var_QuestId);
			--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			
  end
	
end


function x203831_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203831_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203831_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203831_var_LevelLess or varLevel >= x203831_var_MaxLevel then
		return
	end
		--local zhiye = GetZhiye( varMap, varPlayer)+1
		if IsQuestHaveDone(varMap, varPlayer, x203831_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		if x203831_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203831_var_QuestId, x203831_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then                                          
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203831_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203831_var_QuestId)       
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                 
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                 
	    					
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203831_ProcQuestAbandon(varMap, varPlayer, varQuest)
		--local zhiye = GetZhiye( varMap, varPlayer)+1
		if IsHaveQuest(varMap,varPlayer, x203831_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203831_var_QuestId)
	  x203831_Msg2toplayer( varMap, varPlayer,1) 
			
end

function x203831_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	--local zhiye = GetZhiye( varMap, varPlayer)+1
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
--	for j, item in x203831_var_BonusItem do
--		ItemAppend( varMap, item.item, item.n )
--  end
  for j, item in x203831_var_BonusChoiceItem do
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

function x203831_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	--local zhiye = GetZhiye( varMap, varPlayer)+1
	if IsHaveQuest(varMap,varPlayer, x203831_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203831_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203831_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203831_var_QuestId) > 0 then
				x203831_Msg2toplayer( varMap, varPlayer,2)
				Msg2Player(varMap, varPlayer,"#G恭喜你学会了#R驾驭战车#G技能！", 0, 2)
				Msg2Player(varMap, varPlayer,"#G恭喜你学会了#R驾驭战车#G技能！", 0, 3)
				Msg2Player(varMap, varPlayer,"#G现在可以点击技能栏中的#R驾驭战车#G技能驾驶战车了！", 0, 2)
				Msg2Player(varMap, varPlayer,"#G现在可以点击技能栏中的#R驾驭战车#G技能驾驶战车了！", 0, 3)
				QuestCom(varMap, varPlayer, x203831_var_QuestId)
				x203831_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
--				for varI, item in x203831_var_BonusItem do
-- 						ItemAppend( varMap, item.item, item.n )
--				end
				for varI, item in x203831_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		local chariotID = 1
    		local varBagIdx = -1 
    		if (1 == AddChariotToPlayer( varMap, varPlayer, chariotID, varBagIdx)) then
    			if -1 == HaveSkill(varMap, varPlayer,92) then
    				AddSkillToPlayer(varMap, varPlayer, 92, 1, 3)
    			end
    		end
    		
    		if IsHaveChariot(varMap, varPlayer) == 1 and IsHaveChariotSkill(varMap, varPlayer, 101) == 0 then
					AddSkillToChariot(varMap, varPlayer, 101, -1)
   		  end
    		
   end
   local zhiye =GetZhiye( varMap, varPlayer)+1
   LuaCallNoclosure( 203832, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203831_var_QuestIdNext )	
end

function x203831_GetBonus( varMap, varPlayer,varTalknpc)
		--local zhiye = GetZhiye( varMap, varPlayer)+1
	  if x203831_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203831_var_ExpBonus);
  	end
		if x203831_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203831_var_BonusMoney1 )
	  end
		if x203831_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203831_var_BonusMoney2 )
	  end
		if x203831_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203831_var_BonusMoney3 )
		end
		if x203831_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203831_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203831_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203831_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203831_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203831_var_BonusMoney6)
		end
end

function x203831_Msg2toplayer( varMap, varPlayer,type)
		--local zhiye = GetZhiye( varMap, varPlayer)+1
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203831_var_QuestName, 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203831_var_QuestName, 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203831_var_QuestName, 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203831_var_QuestName, 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203831_var_QuestName, 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203831_var_QuestName, 0, 3)
				if x203831_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203831_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203831_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203831_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203831_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203831_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203831_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203831_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203831_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203831_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203831_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203831_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203831_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203831_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203831_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203831_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203831_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203831_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203831_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203831_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
		--local zhiye = GetZhiye( varMap, varPlayer)+1
	  local bFind  = 0
    for varI ,item in x203831_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203831_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203831_var_QuestId)        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203831_var_QuestId, varState, -1 )
		end
end

function x203831_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203831_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203831_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203831_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203831_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203831_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
