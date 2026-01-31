

--DECLARE_QUEST_INFO_START--
x202000_var_FileId = 202000
x202000_var_QuestIdPre =1022
x202000_var_QuestId = 1023
x202000_var_LevelLess	= 	30 
x202000_var_QuestIdNext = 1012
x202000_var_Name	={}
x202000_var_ExtTarget={{type=20,n=5,target="解救5名@npc_105322"}}
x202000_var_QuestName="【剧场】营救"
x202000_var_QuestInfo="\t我知道你的能力，你会有办法救出我们乞颜的勇士他们都被装在麻袋里面，要赶紧救出他们，不能让他们葬身熊口！"  
x202000_var_QuestTarget=""		
x202000_var_QuestCompleted="\t看来还是有些兄弟葬身熊口了！他们会得到长生天的祝福的！这些活下来的人都是你救的，我们欠你一条命！"					
x202000_var_ContinueInfo="\t这些都是跟我出生入死的弟兄，一定要救他们出来！"
x202000_var_QuestHelp =	""
x202000_var_DemandItem ={}
x202000_var_ExpBonus = 55000
x202000_var_BonusMoney1 =285
x202000_var_BonusMoney2 =0
x202000_var_BonusMoney3 =0
x202000_var_BonusMoney4 =0
x202000_var_BonusMoney5 =49
x202000_var_BonusMoney6 =0
x202000_var_BonusItem	=	{}
x202000_var_BonusChoiceItem ={}
x202000_var_GroupPoint	={ {type=10,varId =311,target = "装人麻袋"} }
--DECLARE_QUEST_INFO_STOP--


function x202000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x202000_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x202000_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x202000_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x202000_var_QuestId, varState, -1 )
	end
end

function x202000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x202000_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x202000_var_ExpBonus )
		end
		if x202000_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x202000_var_BonusMoney1 )
		end
		if x202000_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x202000_var_BonusMoney2 )
		end
		if x202000_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x202000_var_BonusMoney3 )
		end
		if x202000_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x202000_var_BonusMoney4 )
		end
		if x202000_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x202000_var_BonusMoney5 )
		end
		if x202000_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x202000_var_BonusMoney6 )
		end
		for varI, item in x202000_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x202000_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x202000_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, which)	
	if IsQuestHaveDone(varMap, varPlayer, x202000_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x202000_var_QuestId) > 0 then
			if x202000_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x202000_var_QuestName)
						TalkAppendString(varMap,x202000_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x202000_var_FileId, x202000_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x202000_var_QuestName)
						TalkAppendString(varMap,x202000_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x202000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x202000_var_FileId, x202000_var_QuestId);
			end
  elseif x202000_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x202000_var_QuestName)
			TalkAppendString(varMap,x202000_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x202000_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x202000_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x202000_var_QuestHelp )
			end
			x202000_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x202000_var_FileId, x202000_var_QuestId);
  end
	
end


function x202000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x202000_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x202000_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202000_var_QuestId)
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) >= 5 then
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	    end
	 		return 0
	
end

function x202000_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x202000_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x202000_var_QuestId  )
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
		if x202000_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x202000_var_QuestId, x202000_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x202000_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x202000_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x202000_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x202000_var_QuestId)
	  x202000_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x202000_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x202000_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x202000_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x202000_var_BonusChoiceItem do
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

function x202000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x202000_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x202000_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x202000_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x202000_var_QuestId) > 0 then
				x202000_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x202000_var_QuestId)
				x202000_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x202000_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x202000_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		for varI, item in x202000_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x202000_var_QuestIdNext )	
end

function x202000_GetBonus( varMap, varPlayer,varTalknpc)
	  if x202000_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x202000_var_ExpBonus);
  	end
		if x202000_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x202000_var_BonusMoney1 )
	  end
		if x202000_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x202000_var_BonusMoney2 )
	  end
		if x202000_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x202000_var_BonusMoney3 )
		end
		if x202000_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x202000_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x202000_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x202000_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x202000_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x202000_var_BonusMoney6)
		end
end

function x202000_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x202000_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x202000_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x202000_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x202000_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x202000_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x202000_var_QuestName.."！", 0, 3)
				if x202000_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x202000_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x202000_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x202000_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x202000_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x202000_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x202000_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x202000_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x202000_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x202000_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x202000_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x202000_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x202000_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x202000_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x202000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x202000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x202000_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x202000_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x202000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x202000_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x202000_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x202000_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x202000_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x202000_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x202000_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x202000_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x202000_Growpoint(varMap,varPlayer,which)
		if IsHaveQuest(varMap,varPlayer, x202000_var_QuestId) <= 0 then
				return 1
		end
		if which ==0 then
							return 0
		elseif which == 1 then
				if IsHaveQuest(varMap,varPlayer, x202000_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x202000_var_QuestId)
										if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 5 then
												SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
												Msg2Player(varMap, varPlayer, format("解救被俘的勇士   %d/5", GetQuestParam(varMap,varPlayer,varQuestIdx,0)), 0, 3)
												x202000_CheckSubmit( varMap, varPlayer)
										end
										local varX,z =GetWorldPos(varMap,varPlayer)
										local creatid =CreateMonster(varMap, 152,varX,z,3,1,-1,-1,20,4000,180,"被俘的勇士")
										SendSpecificImpactToUnit(varMap, creatid, creatid, creatid, 8712, 0);
        end
    		return 1
    end
		
end
