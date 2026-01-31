

--DECLARE_QUEST_INFO_START--
x203346_var_FileId = 203346
x203346_var_QuestIdPre = 921
x203346_var_QuestId = 922
x203346_var_LevelLess	= 92
x203346_var_QuestIdNext = 923
x203346_var_DemandKill ={{varId=78,varNum=1}}
x203346_var_Name	={"末路"}
x203346_var_ExtTarget={{type=20,n=1,target="击败@npc_118107"}}
x203346_var_QuestName="【剧场】末路"
x203346_var_QuestInfo="\t捷克大公，杀了这个蒙古人，你就是我的女婿！"  
x203346_var_QuestTarget="击败@npc_118107"		
x203346_var_QuestCompleted="\t我是波兰大公，为什么你们都要反我。。。。为什么？（大公在懊恼的叫声中瘫软的坐到了地上）"
x203346_var_ContinueInfo="\t怕了吧？"
x203346_var_QuestHelp =	""

x203346_var_ExpBonus =800000
x203346_var_BonusMoney1 =960
x203346_var_BonusMoney2 =0
x203346_var_BonusMoney3 =0
x203346_var_BonusMoney4 =0
x203346_var_BonusMoney5 =126
x203346_var_BonusMoney6 =0
x203346_var_BonusItem	={}
x203346_var_BonusChoiceItem ={}
x203346_var_NpcGUID = 118107

x203346_var_npcid = 0
x203346_var_chaerke =0
x203346_var_dog =0
x203346_var_pangxie = 0
x203346_var_acceptid =0
--DECLARE_QUEST_INFO_STOP--


function x203346_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    
	if IsQuestHaveDone(varMap, varPlayer, x203346_var_QuestId) > 0 then
		return 
	else
	if IsQuestHaveDone(varMap, varPlayer, x203346_var_QuestIdPre)> 0 then 
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203346_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203346_var_QuestId, varState, -1 )
	end
	end
end

function x203346_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203346_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203346_var_ExpBonus )
		end
		if x203346_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203346_var_BonusMoney1 )
		end
		if x203346_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203346_var_BonusMoney2 )
		end
		if x203346_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203346_var_BonusMoney3 )
		end
		if x203346_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203346_var_BonusMoney4 )
		end
		if x203346_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203346_var_BonusMoney5 )
		end
		if x203346_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203346_var_BonusMoney6 )
		end
		for varI, item in x203346_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203346_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end





function x203346_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
    x203346_var_npcid =   varTalknpc
	if IsQuestHaveDone(varMap, varPlayer, x203346_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203346_var_QuestId) > 0 then
			if x203346_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203346_var_QuestName)
						TalkAppendString(varMap,x203346_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203346_var_FileId, x203346_var_QuestId);
			else
          
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203346_var_QuestName)
						TalkAppendString(varMap,x203346_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203346_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203346_var_FileId, x203346_var_QuestId);
			end
  elseif x203346_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203346_var_QuestName)
			TalkAppendString(varMap,x203346_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203346_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203346_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203346_var_QuestHelp )
			end
			x203346_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203346_var_FileId, x203346_var_QuestId);
  end
end

function x203346_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203346_var_QuestId) > 0 then
		return 0
	elseif GetLevel(varMap, varPlayer)< x203346_var_LevelLess then
		return 0
	end
	return 1
end

function x203346_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203346_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203346_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	        return 1
	end
	return 0
end

function x203346_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203346_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then     
				StartTalkTask(varMap)                 
				TalkAppendString(varMap,"可接任务数量已满") 
				StopTalkTask(varMap)                   
				DeliverTalkTips(varMap,varPlayer)  
				return                                   
		end                                          
		
		
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203346_var_QuestId  )
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
		
		if x203346_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
		x203346_var_mitan =FindMonsterByGUID( varMap,118107)
					local retmiss = AddQuest( varMap, varPlayer, x203346_var_QuestId, x203346_var_FileId, 1, 0, 0)  
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)                                         
						return 0
					else
						if IsObjValid (varMap,x203346_var_mitan) == 1 then                                                       
							
			  			SetMonsterCamp(varMap,x203346_var_mitan,21)
			  		end
            
						x203346_Msg2toplayer( varMap, varPlayer,0)
						
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203346_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	    			
		  		end
	 	end                                                                    
	     
end

function x203346_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203346_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203346_var_QuestId)
	  x203346_Msg2toplayer( varMap, varPlayer,1)
end

function x203346_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203346_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203346_var_BonusChoiceItem do
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

function x203346_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x203346_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203346_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203346_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203346_var_QuestId) > 0 then
				x203346_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203346_var_QuestId)
                x203346_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203346_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203346_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		    end
    		    StopItemTask(varMap,varPlayer)
    		
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203346_var_QuestIdNext )	
   end
end

function x203346_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
   
end

function x203346_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203346_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203346_var_ExpBonus);
  	end
		if x203346_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203346_var_BonusMoney1 )
	  end
		if x203346_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203346_var_BonusMoney2 )
	  end
		if x203346_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203346_var_BonusMoney3 )
		end
		if x203346_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203346_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203346_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203346_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203346_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203346_var_BonusMoney6)
		end
end

function x203346_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203346_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203346_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203346_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203346_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203346_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203346_var_QuestName.."！", 0, 3)
				if x203346_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203346_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203346_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203346_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203346_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203346_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203346_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203346_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203346_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203346_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203346_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203346_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203346_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203346_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end



function x203346_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
   if	varObjData ==x203346_var_DemandKill[1].varId then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,varPlayer, x203346_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203346_var_QuestId)
										if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 1 then
												SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
												SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
												Msg2Player(varMap, varPlayer, format("击败捷克大公  %d/1", GetQuestParam(varMap,varPlayer,varQuestIdx,0)), 0, 3)
												x203346_CheckSubmit( varMap, varPlayer)
										end
                end
            end
		end
	end 
end

function x203346_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203346_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203346_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203346_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203346_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203346_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203346_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203346_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203346_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203346_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





