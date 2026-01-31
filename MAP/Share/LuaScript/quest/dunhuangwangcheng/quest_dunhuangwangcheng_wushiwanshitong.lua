

--DECLARE_QUEST_INFO_START--
x256242_var_FileId = 256242
x256242_var_QuestIdPre =3099
x256242_var_QuestId = 1530
x256242_var_LevelLess	= 	10
x256242_var_QuestIdNext = 1544
x256242_var_Name	={}
x256242_var_ExtTarget={{type=20,n=1,target="找到@npc_138575"}}
x256242_var_QuestName="【主线】初识万事通"
x256242_var_QuestInfo="\t王城内有一位万事通，他的身份非常神秘，据说合赞太子对他也是礼敬有加。\n\t刚刚来到王城的你，势必对王城还有些陌生，万事通对于整个王城了如指掌，如果你去找他，我想他会很乐意给你指点一二的。"  
x256242_var_QuestTarget=""		
x256242_var_QuestCompleted="\t你好啊，年轻人#Y@myname#W，来找我寻求指导么？"					
x256242_var_ContinueInfo=""
x256242_var_QuestHelp =	""
x256242_var_DemandItem ={}
x256242_var_BonusMoney1 =200
x256242_var_BonusMoney2 =0
x256242_var_BonusMoney3 =0
x256242_var_BonusMoney4 =0
x256242_var_BonusMoney5 =0
x256242_var_BonusMoney6 =0
x256242_var_BonusItem	=	{}
x256242_var_BonusChoiceItem ={}
x256242_var_ExpBonus = 1400
x256242_var_NpcGUID ={{ guid = 138575, varName = "万事通"} }
--DECLARE_QUEST_INFO_STOP--


function x256242_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x256242_var_QuestId) > 0 then
		return 
	end

				if IsQuestHaveDone(varMap, varPlayer, x256242_var_QuestIdPre)> 0 then
						if IsHaveQuest(varMap,varPlayer, x256242_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256242_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256242_var_QuestId, varState, -1 )
						end
				end

end

function x256242_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256242_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256242_var_ExpBonus )
		end
		if x256242_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256242_var_BonusMoney1 )
		end
		if x256242_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256242_var_BonusMoney2 )
		end
		if x256242_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256242_var_BonusMoney3 )
		end
		if x256242_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256242_var_BonusMoney4 )
		end
		if x256242_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256242_var_BonusMoney5 )
		end
		if x256242_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256242_var_BonusMoney6 )
		end
		for varI, item in x256242_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256242_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256242_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256242_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256242_var_QuestId) > 0 then
			if x256242_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256242_var_QuestName)
						TalkAppendString(varMap,x256242_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256242_var_FileId, x256242_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256242_var_QuestName)
						TalkAppendString(varMap,x256242_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256242_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256242_var_FileId, x256242_var_QuestId);
			end
  elseif x256242_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256242_var_QuestName)
			TalkAppendString(varMap,x256242_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256242_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256242_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256242_var_QuestHelp )
			end
			x256242_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256242_var_FileId, x256242_var_QuestId);
  end
	
end


function x256242_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x256242_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x256242_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256242_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256242_var_QuestId  )
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
		
		if x256242_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256242_var_QuestId, x256242_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256242_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256242_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,13,1 )
	    			
		  		end
	 	end                                                                    
	     
end


function x256242_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256242_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256242_var_QuestId)
	  x256242_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256242_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256242_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256242_var_BonusChoiceItem do
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

function x256242_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256242_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256242_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256242_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256242_var_QuestId) > 0 then
				x256242_Msg2toplayer( varMap, varPlayer,2)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,13,0)
				QuestCom(varMap, varPlayer, x256242_var_QuestId)
				QuestCom(varMap, varPlayer, 1536)
				x256242_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256242_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256242_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256242_var_QuestIdNext )	
end

function x256242_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256242_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256242_var_ExpBonus);
  	end
		if x256242_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256242_var_BonusMoney1 )
	  end
		if x256242_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256242_var_BonusMoney2 )
	  end
		if x256242_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256242_var_BonusMoney3 )
		end
		if x256242_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256242_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256242_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256242_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256242_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256242_var_BonusMoney6)
		end
end

function x256242_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256242_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256242_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256242_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256242_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256242_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256242_var_QuestName.."！", 0, 3)
				if x256242_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256242_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256242_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256242_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256242_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256242_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256242_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256242_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256242_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256242_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256242_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256242_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256242_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256242_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256242_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256242_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256242_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256242_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256242_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256242_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256242_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256242_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256242_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256242_var_QuestId, varState, -1 )
		end
end

function x256242_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256242_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256242_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256242_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256242_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256242_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
