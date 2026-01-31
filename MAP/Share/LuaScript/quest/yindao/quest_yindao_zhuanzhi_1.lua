

--DECLARE_QUEST_INFO_START--
x203814_var_FileId = 203814
x203814_var_QuestIdPre =-1
x203814_var_QuestId = 4388
x203814_var_LevelLess	= 60
x203814_var_QuestIdNext = -1
x203814_var_Name	={}
x203814_var_ExtTarget={{type=20,n=1,target="找到@npc_126137"}}
x203814_var_QuestName="【个人】全新的职业"
x203814_var_QuestInfo="\t在成吉思汗3 恶狼传说的新世界里，有着新的六个职业。如果你对新职业有兴趣，可以去找王城内的转职管理员，他会将你转变成全新的职业！\n\t别担心费用的问题，他会送给你进行两次转职所需的道具。"  
x203814_var_QuestTarget=""		
x203814_var_QuestCompleted="\t没错，我为所有人提供转换职业和装备的服务。并且，我会给你两次转职所需的道具，如果你对新职业不满意，还有一次转换回原本职业的机会。"					
x203814_var_ContinueInfo=""
x203814_var_QuestHelp =	""
x203814_var_DemandItem ={}
x203814_var_ExpBonus = 10000
x203814_var_BonusMoney1 =200
x203814_var_BonusMoney2 =0
x203814_var_BonusMoney3 =0
x203814_var_BonusMoney4 =0
x203814_var_BonusMoney5 =0
x203814_var_BonusMoney6 =0
x203814_var_BonusItem	=	{{item=12250001,n=2},{item=11000599,n=24}}
x203814_var_BonusChoiceItem =	{}
x203814_var_NpcGUID ={{ guid = 126137, varName = "转职大师"} }
--DECLARE_QUEST_INFO_STOP--     
x203814_var_FileIdNext =203702


x203814_var_MaxLevel      = 160

function x203814_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203814_var_LevelLess or varLevel >= x203814_var_MaxLevel then
		return
	end
	

	if IsQuestHaveDone(varMap, varPlayer, x203814_var_QuestId) > 0 then
		return 
	end
	
		
			if IsHaveQuest(varMap,varPlayer, x203814_var_QuestId) <= 0 then						
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203814_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203814_var_QuestId, varState, -1 )
				 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 ) 		
			end
	end
		

function x203814_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203814_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203814_var_ExpBonus )
		end
		if x203814_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203814_var_BonusMoney1 )
		end
		if x203814_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203814_var_BonusMoney2 )
		end
		if x203814_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203814_var_BonusMoney3 )
		end
		if x203814_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203814_var_BonusMoney4 )
		end
		if x203814_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203814_var_BonusMoney5 )
		end
		if x203814_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203814_var_BonusMoney6 )
		end
		for varI, item in x203814_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203814_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203814_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203814_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203814_var_QuestId) > 0 then
			if x203814_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203814_var_QuestName)
						TalkAppendString(varMap,x203814_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203814_var_FileId, x203814_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203814_var_QuestName)
						TalkAppendString(varMap,x203814_var_QuestCompleted)
						TalkAppendString(varMap," ")
						
						x203814_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )  
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203814_var_FileId, x203814_var_QuestId);
			end
  elseif x203814_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203814_var_QuestName)
			TalkAppendString(varMap,x203814_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 		  
			for varI, item in x203814_var_ExtTarget do  	
			TalkAppendString( varMap,item.target)		
			end 
			if x203814_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203814_var_QuestHelp )
			end
			x203814_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203814_var_FileId, x203814_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 ) 	
  end
	
end


function x203814_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203814_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203814_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203814_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203814_var_QuestId  )
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
		if x203814_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203814_var_QuestId, x203814_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then                                          
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203814_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203814_var_QuestId)       
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                 
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                 
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )   
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203814_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203814_var_QuestId) <= 0 then
				return 
		end
		StartTalkTask(varMap)
		  TalkAppendString(varMap,"您无法放弃此任务！") 
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
			
end

function x203814_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203814_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x203814_var_BonusChoiceItem do
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

function x203814_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203814_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203814_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203814_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203814_var_QuestId) > 0 then
				x203814_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203814_var_QuestId)
				x203814_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203814_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x203814_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   local zhiye =GetZhiye( varMap, varPlayer)+1
  
end

function x203814_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203814_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203814_var_ExpBonus);
  	end
		if x203814_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203814_var_BonusMoney1 )
	  end
		if x203814_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203814_var_BonusMoney2 )
	  end
		if x203814_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203814_var_BonusMoney3 )
		end
		if x203814_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203814_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203814_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203814_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203814_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203814_var_BonusMoney6)
		end
end

function x203814_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203814_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203814_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203814_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203814_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203814_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203814_var_QuestName.."！", 0, 3)
				if x203814_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203814_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203814_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203814_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203814_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203814_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203814_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203814_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203814_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203814_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203814_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203814_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203814_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203814_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203814_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203814_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203814_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203814_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203814_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203814_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203814_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203814_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203814_var_QuestId)        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203814_var_QuestId, varState, -1 )
		end
end

function x203814_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203814_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203814_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203814_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203814_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203814_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
