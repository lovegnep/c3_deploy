

--DECLARE_QUEST_INFO_START--
x203751_var_FileId = 203751
x203751_var_QuestIdPre = 4241
x203751_var_QuestId = 4205
x203751_var_LevelLess	= 	20
x203751_var_QuestIdNext = 4383
x203751_var_Name	={}
x203751_var_ExtTarget={{type=20,n=1,target="找到@npc_126028学习#G领取双倍经验#W时间"}}
x203751_var_QuestName="【个人】事半功倍"            
x203751_var_QuestInfo="\t在王城的每一个人都在努力地提升能力，在@npc_126028那里可以#G领取双倍经验#W时间，赶快找到她寻求帮助！\n\t可以点击#G领双管理员#W打开领取经验时间栏，根据情况选择领取#G双倍经验时间#W"  
x203751_var_QuestTarget=""		
x203751_var_QuestCompleted="\t那些想快速提高能力的人都会来找我，在我这里#G领取双倍经验#W时间，完成任务过程事半功倍。"					
x203751_var_ContinueInfo="\t我对没有能力的人不感兴趣！\n\t#G注：你可以点击梵贝领取双倍\n\t经验时间#W"
x203751_var_QuestHelp ="\t#G您可以在@npc_126028那里选择点击#G领取双倍经验#W时间"
x203751_var_DemandItem ={}
x203751_var_ExpBonus = 30000
x203751_var_BonusMoney1 =176
x203751_var_BonusMoney2 =0
x203751_var_BonusMoney3 =0
x203751_var_BonusMoney4 =0
x203751_var_BonusMoney5 =21
x203751_var_BonusMoney6 =0
x203751_var_BonusItem	=	{}
x203751_var_BonusChoiceItem ={}
x203751_var_NpcGUID ={{ guid = 126028, varName = "梵贝"} }
--DECLARE_QUEST_INFO_STOP--

x203751_var_MaxLevel   = 40

function x203751_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203751_var_LevelLess or varLevel >= x203751_var_MaxLevel then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x203751_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203751_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x203751_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203751_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203751_var_QuestId, varState, -1 )
		end
	end
end

function x203751_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203751_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203751_var_ExpBonus )
		end
		if x203751_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203751_var_BonusMoney1 )
		end
		if x203751_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203751_var_BonusMoney2 )
		end
		if x203751_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203751_var_BonusMoney3 )
		end
		if x203751_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203751_var_BonusMoney4 )
		end
		if x203751_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203751_var_BonusMoney5 )
		end
		if x203751_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203751_var_BonusMoney6 )
		end
		for varI, item in x203751_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203751_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203751_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203751_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203751_var_QuestId) > 0 then
			if x203751_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203751_var_QuestName)
						TalkAppendString(varMap,x203751_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203751_var_FileId, x203751_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203751_var_QuestName)
						TalkAppendString(varMap,x203751_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203751_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203751_var_FileId, x203751_var_QuestId);
			
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   			end
  elseif x203751_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203751_var_QuestName)
			TalkAppendString(varMap,x203751_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203751_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203751_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203751_var_QuestHelp )
			end
			x203751_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203751_var_FileId, x203751_var_QuestId);
  
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
  end
	
end


function x203751_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203751_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203751_CheckSubmit( varMap, varPlayer, varTalknpc)
	local buff = 7511
	if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 then 
	        return 1
	end
	return 0
	
end

function x203751_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203751_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203751_var_QuestId  )
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
		if x203751_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203751_var_QuestId, x203751_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			  x203751_Msg2toplayer( varMap, varPlayer,0)
		  				if x203751_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
									local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203751_var_QuestId)                                                  
	    						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
	    				end
		  		end
	 	end                                                                    
	     
end


function x203751_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203751_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203751_var_QuestId)
	  x203751_Msg2toplayer( varMap, varPlayer,1)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,0 )
end

function x203751_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203751_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203751_var_BonusChoiceItem do
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

function x203751_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203751_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203751_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203751_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203751_var_QuestId) > 0 then
				x203751_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203751_var_QuestId)
				x203751_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203751_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203751_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203751_var_QuestIdNext )	
end

function x203751_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203751_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203751_var_ExpBonus);
  	end
		if x203751_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203751_var_BonusMoney1 )
	  end
		if x203751_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203751_var_BonusMoney2 )
	  end
		if x203751_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203751_var_BonusMoney3 )
		end
		if x203751_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203751_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203751_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203751_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203751_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203751_var_BonusMoney6)
		end
end

function x203751_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x203751_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x203751_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x203751_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x203751_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203751_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203751_var_QuestName.."！", 0, 3)
				if x203751_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203751_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203751_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203751_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203751_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203751_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203751_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203751_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203751_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203751_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203751_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203751_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203751_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203751_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203751_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203751_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203751_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203751_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203751_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203751_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
  	local bFind  = 0
    for varI ,item in x203751_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203751_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203751_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203751_var_QuestId, varState, -1 )
				if x203751_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 41,1 )
				end 
		end
end

function x203751_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203751_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203751_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203751_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203751_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203751_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
