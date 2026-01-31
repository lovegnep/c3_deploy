

--DECLARE_QUEST_INFO_START--
x202002_var_FileId = 202002
x202002_var_QuestIdPre = 1012
x202002_var_QuestId = 1020
x202002_var_LevelLess	= 30	 
x202002_var_QuestIdNext = 1013
x202002_var_Name	={}
x202002_var_ExtTarget={{type=20,n=1,target="找到@npcsp_潜伏的忽必来_105191"}}
x202002_var_QuestName="【剧场】敌营密探"
x202002_var_QuestInfo="\t忽必来是很擅长潜伏在敌营之内的，他一定还藏在敌营外的草丛中，去到乃蛮部大营找到他吧！"  
x202002_var_QuestTarget=""		
x202002_var_QuestCompleted="\t你怎么会知道我藏在这里？难道是赤老温让你来找我的？"					
x202002_var_ContinueInfo=""
x202002_var_QuestHelp =	""
x202002_var_DemandItem ={}
x202002_var_ExpBonus = 55000
x202002_var_BonusMoney1 =285
x202002_var_BonusMoney2 =0
x202002_var_BonusMoney3 =0
x202002_var_BonusMoney4 =0
x202002_var_BonusMoney5 =49
x202002_var_BonusMoney6 =0
x202002_var_BonusItem	=	{{item = 11000200,n=10}}
x202002_var_BonusChoiceItem ={}
x202002_var_NpcGUID ={{ guid = 105191, varName = "忽必来"} }
x202002_var_GroupPoint	={ {type=10,varId =312,target = "忽必来"} }
x202002_var_npcid = -1
--DECLARE_QUEST_INFO_STOP--


function x202002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x202002_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x202002_var_QuestIdPre)> 0 then
		
		
				
						if IsHaveQuest(varMap,varPlayer, x202002_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x202002_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x202002_var_QuestId, varState, -1 )
						end
				
		
		
	end
end

function x202002_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x202002_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x202002_var_ExpBonus )
		end
		if x202002_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x202002_var_BonusMoney1 )
		end
		if x202002_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x202002_var_BonusMoney2 )
		end
		if x202002_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x202002_var_BonusMoney3 )
		end
		if x202002_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x202002_var_BonusMoney4 )
		end
		if x202002_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x202002_var_BonusMoney5 )
		end
		if x202002_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x202002_var_BonusMoney6 )
		end
		for varI, item in x202002_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x202002_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x202002_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x202002_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x202002_var_QuestId) > 0 then
			if x202002_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x202002_var_QuestName)
						TalkAppendString(varMap,x202002_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x202002_var_FileId, x202002_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x202002_var_QuestName)
						TalkAppendString(varMap,x202002_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x202002_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x202002_var_FileId, x202002_var_QuestId);
			end
  elseif x202002_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x202002_var_QuestName)
			TalkAppendString(varMap,x202002_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x202002_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x202002_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x202002_var_QuestHelp )
			end
			x202002_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x202002_var_FileId, x202002_var_QuestId);
  end
	
end


function x202002_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x202002_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x202002_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x202002_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x202002_var_QuestId  )
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
		
		if x202002_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x202002_var_QuestId, x202002_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x202002_Msg2toplayer( varMap, varPlayer,0)
						
	    			
		  		end
	 	end                                                                    
	     
end


function x202002_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x202002_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x202002_var_QuestId)
	  x202002_Msg2toplayer( varMap, varPlayer,1)
			
end

function x202002_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x202002_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x202002_var_BonusChoiceItem do
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

function x202002_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x202002_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x202002_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x202002_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x202002_var_QuestId) > 0 then
				x202002_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x202002_var_QuestId)
				x202002_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x202002_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x202002_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x202002_var_QuestIdNext )	
end

function x202002_GetBonus( varMap, varPlayer,varTalknpc)
	  if x202002_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x202002_var_ExpBonus);
  	end
		if x202002_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x202002_var_BonusMoney1 )
	  end
		if x202002_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x202002_var_BonusMoney2 )
	  end
		if x202002_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x202002_var_BonusMoney3 )
		end
		if x202002_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x202002_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x202002_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x202002_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x202002_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x202002_var_BonusMoney6)
		end
end

function x202002_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x202002_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x202002_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x202002_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x202002_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x202002_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x202002_var_QuestName.."！", 0, 3)
				if x202002_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x202002_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x202002_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x202002_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x202002_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x202002_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x202002_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x202002_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x202002_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x202002_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x202002_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x202002_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x202002_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x202002_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x202002_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x202002_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x202002_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x202002_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x202002_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x202002_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x202002_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x202002_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x202002_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x202002_var_QuestId, varState, -1 )
		end
end

function x202002_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x202002_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x202002_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
		if IsQuestHaveDone(varMap, varPlayer, x202002_var_QuestIdNext) > 0 then
			if IsHaveQuest( varMap, varPlayer, x202002_var_QuestId) == 0 then
  		      Msg2Player( varMap, varPlayer, "你没有接受【剧情】敌营密探，不能采集", 8, 3)
  		      return 1
  		  end
  		end	  
    		if IsObjValid (varMap,x202002_var_npcid) == 1 then
					if GetName(varMap,x202002_var_npcid)=="忽必来" then
							Msg2Player(varMap, varPlayer, "忽必来就站在你对面看着你", 0, 3)
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202002_var_QuestId)                                                  
			    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
			    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
							return 1
					else
							return 0
					end
			else
					return 0
			end					

end

function x202002_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	if IsObjValid (varMap,x202002_var_npcid) == 1 then
			if GetName(varMap,x202002_var_npcid)=="忽必来" then
					Msg2Player(varMap, varPlayer, "忽必来就站在你对面看着你", 0, 3)
					return 1
			else
					x202002_var_npcid=CreateMonster(varMap, 153,173,188,3,1,-1,105191,20,30000,0,"忽必来")
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202002_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					return 1
			end
	else
			x202002_var_npcid=CreateMonster(varMap, 153,173,188,3,1,-1,105191,20,30000,180,"忽必来")
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202002_var_QuestId)                                                  
	    	SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    	SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
			return 1
	end				
end

function x202002_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x202002_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
