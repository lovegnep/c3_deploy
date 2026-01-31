

--DECLARE_QUEST_INFO_START--
x256248_var_FileId =256248 
x256248_var_QuestIdPre =3062
x256248_var_QuestId = 3063
x256248_var_LevelLess	= 	24 

x256248_var_Name	={}
x256248_var_ExtTarget={{type=20,n=1,target="找到@npc_138511的传送人"}}
x256248_var_QuestName="【个人】囚龙岛的梦魇"
x256248_var_QuestInfo="\t关于囚笼岛的那个传说你可曾知晓？\n\t原来你也不清楚，哎，我也是知之不详，你若有兴趣可以@npc_138511，也许会有意外的收获。"  
x256248_var_QuestTarget=""		
x256248_var_QuestCompleted="\t那是一个百余年前的传说，只有进入过囚笼岛的人才有机会探明真相，你若有兴趣不妨进去#G试炼#W一下，一探究竟。"					
x256248_var_ContinueInfo=""
x256248_var_QuestHelp =	""
x256248_var_DemandItem ={}
x256248_var_BonusMoney1 =176
x256248_var_BonusMoney2 =0
x256248_var_BonusMoney3 =0
x256248_var_BonusMoney4 =0
x256248_var_BonusMoney5 =21
x256248_var_BonusMoney6 =0
x256248_var_BonusItem	=	{}
x256248_var_BonusChoiceItem ={}
x256248_var_ExpBonus = 745
x256248_var_NpcGUID ={{ guid = 138511, varName = "特木隆"} }
--DECLARE_QUEST_INFO_STOP--

x256248_var_MaxLevel   = 40

function x256248_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256248_var_LevelLess or varLevel >= x256248_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256248_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x256248_var_QuestIdPre)> 0 then
						if IsHaveQuest(varMap,varPlayer, x256248_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256248_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256248_var_QuestId, varState, -1 )
						end
	end
end

function x256248_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256248_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256248_var_ExpBonus )
		end
		if x256248_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256248_var_BonusMoney1 )
		end
		if x256248_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256248_var_BonusMoney2 )
		end
		if x256248_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256248_var_BonusMoney3 )
		end
		if x256248_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256248_var_BonusMoney4 )
		end
		if x256248_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256248_var_BonusMoney5 )
		end
		if x256248_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256248_var_BonusMoney6 )
		end
		for varI, item in x256248_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256248_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256248_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256248_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256248_var_QuestId) > 0 then
			if x256248_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256248_var_QuestName)
						TalkAppendString(varMap,x256248_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256248_var_FileId, x256248_var_QuestId);
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 31,0 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256248_var_QuestName)
						TalkAppendString(varMap,x256248_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256248_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256248_var_FileId, x256248_var_QuestId);
			end
  elseif x256248_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256248_var_QuestName)
			TalkAppendString(varMap,x256248_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256248_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256248_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256248_var_QuestHelp )
			end
			x256248_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256248_var_FileId, x256248_var_QuestId);
  end
	
end


function x256248_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x256248_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x256248_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256248_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256248_var_QuestId  )
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
		
		if x256248_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256248_var_QuestId, x256248_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256248_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256248_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x256248_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256248_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256248_var_QuestId)
	  x256248_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 31,0 )
			
end

function x256248_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256248_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256248_var_BonusChoiceItem do
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

function x256248_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256248_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256248_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256248_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256248_var_QuestId) > 0 then
				x256248_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256248_var_QuestId)
				x256248_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256248_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256248_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
  
end

function x256248_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256248_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256248_var_ExpBonus);
  	end
		if x256248_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256248_var_BonusMoney1 )
	  end
		if x256248_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256248_var_BonusMoney2 )
	  end
		if x256248_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256248_var_BonusMoney3 )
		end
		if x256248_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256248_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256248_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256248_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256248_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256248_var_BonusMoney6)
		end
end

function x256248_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256248_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256248_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256248_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256248_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256248_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256248_var_QuestName.."！", 0, 3)
				if x256248_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256248_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256248_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256248_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256248_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256248_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256248_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256248_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256248_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256248_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256248_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256248_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256248_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256248_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256248_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256248_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256248_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256248_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256248_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256248_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256248_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256248_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256248_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256248_var_QuestId, varState, -1 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 31,1 )
		end
end

function x256248_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256248_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256248_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256248_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256248_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256248_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
