

--DECLARE_QUEST_INFO_START--
x256107_var_FileId = 256107
x256107_var_QuestIdPre =375
x256107_var_QuestId = 381
x256107_var_LevelLess	= 	50
x256107_var_Name	={}
x256107_var_ExtTarget={{type=20,n=1,target="将悲痛神箭交给@npc_108025，回到王城。"}}
x256107_var_QuestName="【剧场】悲痛神箭"
x256107_var_QuestInfo="\t金朝皇帝见河北和山东的很多州府均已残毁，已率宗室逃亡蔡州，我们现在又斩断了他西逃四川的途径。现在，我们就要瓮中捉鳖，直捣蔡州城！"  
x256107_var_QuestTarget=""		
x256107_var_QuestCompleted="\t当你年老之时，回忆起往昔，有什么会最能激起你的回忆？唯有家人和朋友。面对与自己并肩作战四十年的挚友的离去，成吉思汗表现出作为平凡人的一面。但，逝者长已矣，存者定会继承遗志，继续前行。"					
x256107_var_ContinueInfo="\t河北，山东被成吉思汗攻占后，金朝皇帝准备南下侵宋，意图打通陜西与四川之间的道路，南逃入蜀。所以，及时攻占凤翔府，至关重要。"
x256107_var_QuestHelp =	""
x256107_var_DemandItem ={{varId=13020018,varNum=1}}
x256107_var_ExpBonus = 1050000
x256107_var_BonusMoney1 =906
x256107_var_BonusMoney2 =0
x256107_var_BonusMoney3 =0
x256107_var_BonusMoney4 =0
x256107_var_BonusMoney5 =61
x256107_var_BonusMoney6 =0
x256107_var_BonusItem	=	{{item=11050002,n=20}}
x256107_var_BonusChoiceItem ={}
x256107_var_NpcGUID ={{ guid = 108025, varName = "钥匙老人"}}
--DECLARE_QUEST_INFO_STOP--


function x256107_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x256107_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256107_var_QuestId) > 0 then
	return 
	end	
	if GetLevel(varMap, varPlayer) >= x256107_var_LevelLess then
		if IsQuestHaveDone(varMap, varPlayer, x256107_var_QuestIdPre)> 0 then
	   	if IsHaveQuest(varMap,varPlayer, x256107_var_QuestId) <= 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256107_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256107_var_QuestId, varState, -1 )
			end
		end
	end
end

function x256107_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256107_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256107_var_ExpBonus )
		end
		if x256107_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256107_var_BonusMoney1 )
		end
		if x256107_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256107_var_BonusMoney2 )
		end
		if x256107_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256107_var_BonusMoney3 )
		end
		if x256107_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256107_var_BonusMoney4 )
		end
		if x256107_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256107_var_BonusMoney5 )
		end
		if x256107_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256107_var_BonusMoney6 )
		end
		for varI, item in x256107_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256107_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256107_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256107_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256107_var_QuestId) > 0 then
			if x256107_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256107_var_QuestName)
						TalkAppendString(varMap,x256107_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256107_var_FileId, x256107_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256107_var_QuestName)
						TalkAppendString(varMap,x256107_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256107_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256107_var_FileId, x256107_var_QuestId);
			end
  elseif x256107_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256107_var_QuestName)
			TalkAppendString(varMap,x256107_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256107_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256107_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256107_var_QuestHelp )
			end
			x256107_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256107_var_FileId, x256107_var_QuestId);
  end
	
end


function x256107_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
					return 1
		
		

end

function x256107_CheckSubmit( varMap, varPlayer, varTalknpc)
		if GetItemCount(varMap,varPlayer,x256107_var_DemandItem[1].varId) >= x256107_var_DemandItem[1].varNum then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256107_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256107_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
	  return 0
	
end

function x256107_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256107_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256107_var_QuestId  )
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
		
		
		if x256107_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256107_var_QuestId, x256107_var_FileId, 1, 0, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256107_Msg2toplayer( varMap, varPlayer,0)
		  			x256107_ProcQuestItemChanged(varMap, varPlayer, -1, varQuest)
						if x256107_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256107_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x256107_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256107_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256107_var_QuestId)
	  x256107_Msg2toplayer( varMap, varPlayer,1)
end

function x256107_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256107_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x256107_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppendBind( varMap, item.item, item.n )
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

function x256107_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256107_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256107_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256107_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256107_var_QuestId) > 0 then
				x256107_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256107_var_QuestId)
				x256107_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256107_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256107_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppendBind( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		for varI, item in x256107_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
end

function x256107_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256107_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256107_var_ExpBonus);
  	end
		if x256107_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256107_var_BonusMoney1 )
	  end
		if x256107_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256107_var_BonusMoney2 )
	  end
		if x256107_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256107_var_BonusMoney3 )
		end
		if x256107_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256107_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256107_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256107_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256107_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256107_var_BonusMoney6)
		end
end

function x256107_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256107_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256107_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256107_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256107_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256107_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256107_var_QuestName.."！", 0, 3)
				if x256107_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256107_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256107_var_BonusMoney1 > 0 then
					local money =x256107_var_BonusMoney1
	  		  Msg2Player( varMap, varPlayer, format( "#Y获得#R银卡#{_MONEY%d}#cffcf00#Y的奖励", money).."。", 8, 2)
	  		end
				if x256107_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256107_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256107_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256107_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256107_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256107_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256107_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256107_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256107_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256107_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256107_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256107_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256107_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256107_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256107_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
		if GetItemCount(varMap,varPlayer,x256107_var_DemandItem[1].varId) >= x256107_var_DemandItem[1].varNum then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256107_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetItemCount(varMap,varPlayer,x256107_var_DemandItem[1].varId))
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256107_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetItemCount(varMap,varPlayer,x256107_var_DemandItem[1].varId))
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
end


function x256107_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
local bFind  = 0
    for varI ,item in x256107_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256107_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256107_var_QuestId)        
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256107_var_QuestId, varState, -1 )
		end
end

function x256107_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256107_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256107_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256107_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256107_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256107_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
