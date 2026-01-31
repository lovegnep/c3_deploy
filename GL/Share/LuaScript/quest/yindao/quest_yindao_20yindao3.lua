

--DECLARE_QUEST_INFO_START--
x203793_var_FileId = 203793
x203793_var_QuestIdPre =3663
x203793_var_QuestId = 4263
x203793_var_LevelLess	= 	20
x203793_var_QuestIdNext = {4300,4301,4302,4303,4304,4305,4306,4307,4308,4309,4310,4311}
x203793_var_Name	={}
x203793_var_ExtTarget={{type=20,n=1,target="找到@npc_132023"}}
x203793_var_QuestName="【个人】寻求名师"
x203793_var_QuestInfo="\t你是否觉得现在升级速度变慢了？对这个世界有很多不解的地方？现在的你需要一位师傅帮助你你更加快速的升级。\n\t去找@npc_132023吧，他会帮你找到理想的师傅。"  
x203793_var_QuestTarget=""		
x203793_var_QuestCompleted="\t你需要一位元贤明的师傅？没问题，在我的帮助下，一定如你所愿。"					
x203793_var_ContinueInfo=""
x203793_var_QuestHelp =	""
x203793_var_DemandItem ={}
x203793_var_ExpBonus = 1500
x203793_var_BonusMoney1 =258
x203793_var_BonusMoney2 =0
x203793_var_BonusMoney3 =0
x203793_var_BonusMoney4 =0
x203793_var_BonusMoney5 =37
x203793_var_BonusMoney6 =0
x203793_var_BonusItem	=	{}
x203793_var_BonusChoiceItem ={}
x203793_var_NpcGUID ={{ guid = 132023, varName = "师徒管理员"} }
--DECLARE_QUEST_INFO_STOP--     
x203793_var_FileIdNext =203737


function x203793_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varLevel = GetLevel( varMap, varPlayer)
	if IsQuestHaveDone(varMap, varPlayer, x203793_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203793_var_QuestIdPre)> 0 then
			local varHaveQuest = IsHaveQuestNM(varMap,varPlayer, x203793_var_QuestId)
			if (varHaveQuest <= 0 and varLevel >= x203793_var_LevelLess ) then						
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203793_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203793_var_QuestId, varState, -1 )
				 
			end
	end
		
end

function x203793_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203793_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203793_var_ExpBonus )
		end
		if x203793_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203793_var_BonusMoney1 )
		end
		if x203793_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203793_var_BonusMoney2 )
		end
		if x203793_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203793_var_BonusMoney3 )
		end
		if x203793_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203793_var_BonusMoney4 )
		end
		if x203793_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203793_var_BonusMoney5 )
		end
		if x203793_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203793_var_BonusMoney6 )
		end
		for varI, item in x203793_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203793_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203793_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203793_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203793_var_QuestId) > 0 then
			if x203793_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203793_var_QuestName)
						TalkAppendString(varMap,x203793_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203793_var_FileId, x203793_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203793_var_QuestName)
						TalkAppendString(varMap,x203793_var_QuestCompleted)
						TalkAppendString(varMap," ")
						
						x203793_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203793_var_FileId, x203793_var_QuestId);
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   end
  elseif x203793_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203793_var_QuestName)
			TalkAppendString(varMap,x203793_var_QuestInfo)
			TalkAppendString( varMap,"\n#Y任务目标：") 		  
			for varI, item in x203793_var_ExtTarget do  	
			TalkAppendString( varMap,item.target)		
			end 
			if x203793_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203793_var_QuestHelp )
			end
			x203793_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203793_var_FileId, x203793_var_QuestId);
			
			
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
 
  end
	
end


function x203793_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203793_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203793_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203793_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203793_var_QuestId  )
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
		if x203793_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203793_var_QuestId, x203793_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then                                          
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203793_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203793_var_QuestId)       
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                 
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                 
	    					
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203793_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203793_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203793_var_QuestId)
	  x203793_Msg2toplayer( varMap, varPlayer,1) 
			
end

function x203793_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203793_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203793_var_BonusChoiceItem do
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

function x203793_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203793_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203793_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203793_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203793_var_QuestId) > 0 then
				x203793_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203793_var_QuestId)
				x203793_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203793_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203793_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   local zhiye =GetZhiye( varMap, varPlayer)+1
   LuaCallNoclosure( x203793_var_FileIdNext, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203793_var_QuestIdNext[zhiye] )	
end

function x203793_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203793_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203793_var_ExpBonus);
  	end
		if x203793_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203793_var_BonusMoney1 )
	  end
		if x203793_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203793_var_BonusMoney2 )
	  end
		if x203793_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203793_var_BonusMoney3 )
		end
		if x203793_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203793_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203793_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203793_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203793_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203793_var_BonusMoney6)
		end
end

function x203793_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203793_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203793_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203793_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203793_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203793_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203793_var_QuestName.."！", 0, 3)
				if x203793_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203793_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203793_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203793_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203793_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203793_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203793_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203793_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203793_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203793_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203793_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203793_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203793_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203793_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203793_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203793_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203793_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203793_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203793_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203793_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203793_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203793_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203793_var_QuestId)        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203793_var_QuestId, varState, -1 )
		end
end

function x203793_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203793_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203793_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203793_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203793_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203793_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
