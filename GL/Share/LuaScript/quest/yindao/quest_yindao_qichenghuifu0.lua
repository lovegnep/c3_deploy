

--DECLARE_QUEST_INFO_START--
x203778_var_FileId = 203778
x203778_var_QuestIdPre =2679
x203778_var_QuestId = 4244
x203778_var_LevelLess	= 	20
x203778_var_QuestIdNext = 4360
x203778_var_Name	={}
x203778_var_ExtTarget={{type=20,n=1,target="找到@npc_123710"}}
x203778_var_QuestName="【个人】骑乘恢复"
x203778_var_QuestInfo="\t你的骑乘似乎有些疲倦，王城里的@npc_123710可以为你的骑乘回复活力而且不需要草料。\n\t记住，对待它就要像对待亲人一样，它也需要你的关注和照顾。"  
x203778_var_QuestTarget=""		
x203778_var_QuestCompleted="\t要给骑乘恢复体力？你这可是问对地方了，就连王城的阿塔儿大人都常来请教我，我可以瞬间将所有的骑乘恢复到最佳状态，你只需要付出一点点金钱，仅仅是一点点而已。"					
x203778_var_ContinueInfo=""
x203778_var_QuestHelp =	""
x203778_var_DemandItem ={}
x203778_var_BonusMoney1 =0
x203778_var_BonusMoney2 =0
x203778_var_BonusMoney3 =0
x203778_var_BonusMoney4 =0
x203778_var_BonusMoney5 =0
x203778_var_BonusMoney6 =0
x203778_var_BonusItem	=	{}
x203778_var_BonusChoiceItem ={}
x203778_var_ExpBonus = 11500
x203778_var_NpcGUID ={{ guid = 123710, varName = "奥尔格"} }
--DECLARE_QUEST_INFO_STOP--

x203778_var_MaxLevel   = 40

function x203778_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203778_var_LevelLess or varLevel >= x203778_var_MaxLevel then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x203778_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203778_var_QuestIdPre)> 0 then
						if IsHaveQuest(varMap,varPlayer, x203778_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203778_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203778_var_QuestId, varState, -1 )
						end
	end
end

function x203778_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203778_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203778_var_ExpBonus )
		end
		if x203778_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203778_var_BonusMoney1 )
		end
		if x203778_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203778_var_BonusMoney2 )
		end
		if x203778_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203778_var_BonusMoney3 )
		end
		if x203778_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203778_var_BonusMoney4 )
		end
		if x203778_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203778_var_BonusMoney5 )
		end
		if x203778_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203778_var_BonusMoney6 )
		end
		for varI, item in x203778_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203778_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203778_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203778_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203778_var_QuestId) > 0 then
			if x203778_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203778_var_QuestName)
						TalkAppendString(varMap,x203778_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203778_var_FileId, x203778_var_QuestId);
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 40,0 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203778_var_QuestName)
						TalkAppendString(varMap,x203778_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203778_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203778_var_FileId, x203778_var_QuestId);
			
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   			end
  elseif x203778_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203778_var_QuestName)
			TalkAppendString(varMap,x203778_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203778_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203778_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203778_var_QuestHelp )
			end
			x203778_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203778_var_FileId, x203778_var_QuestId);
  
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
  end
	
end


function x203778_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203778_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203778_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203778_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203778_var_QuestId  )
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
		
		if x203778_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203778_var_QuestId, x203778_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203778_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203778_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203778_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203778_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203778_var_QuestId)
	  x203778_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 40,0 )
			
end

function x203778_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203778_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203778_var_BonusChoiceItem do
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

function x203778_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203778_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203778_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203778_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203778_var_QuestId) > 0 then
				x203778_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203778_var_QuestId)
				x203778_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203778_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203778_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
  LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203778_var_QuestIdNext )	
end

function x203778_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203778_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203778_var_ExpBonus);
  	end
		if x203778_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203778_var_BonusMoney1 )
	  end
		if x203778_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203778_var_BonusMoney2 )
	  end
		if x203778_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203778_var_BonusMoney3 )
		end
		if x203778_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203778_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203778_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203778_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203778_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203778_var_BonusMoney6)
		end
end

function x203778_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203778_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203778_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203778_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203778_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203778_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203778_var_QuestName.."！", 0, 3)
				if x203778_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203778_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203778_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203778_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203778_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203778_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203778_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203778_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203778_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203778_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203778_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203778_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203778_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203778_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203778_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203778_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203778_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203778_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203778_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203778_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203778_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203778_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203778_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203778_var_QuestId, varState, -1 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 40,1 )
		end
end

function x203778_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203778_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203778_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203778_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203778_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203778_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
