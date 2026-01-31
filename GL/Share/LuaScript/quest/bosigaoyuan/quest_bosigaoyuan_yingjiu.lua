

--DECLARE_QUEST_INFO_START--
x203317_var_FileId = 203317
x203317_var_QuestIdPre ={767,768}
x203317_var_QuestId = 769
x203317_var_LevelLess	= 84
x203317_var_QuestIdNext = -1
x203317_var_Name	={}
x203317_var_ExtTarget={{type=20,n=2,target="解救2名@npc_115520"}}
x203317_var_QuestName="【剧场】救出灾民"
x203317_var_QuestInfo="\t暴虐的扎兰丁抓走了很多无辜的百姓，大汗常对我们说，欲取天下，先取民心。我一定要救出他们。"  
x203317_var_QuestTarget=""		
x203317_var_QuestCompleted="\t看来还是有些可怜的百姓丧生于此！他们会得到长生天的祝福的！这些活下来的人都是你救的，他们一定会终身感谢你！"					
x203317_var_ContinueInfo="\t这些都是无辜的百姓，一定要救他们出来！"
x203317_var_QuestHelp =	""
x203317_var_DemandItem ={}
x203317_var_ExpBonus = 626000
x203317_var_BonusMoney1 =840
x203317_var_BonusMoney2 =0
x203317_var_BonusMoney3 =0
x203317_var_BonusMoney4 =0
x203317_var_BonusMoney5 =96
x203317_var_BonusMoney6 =0
x203317_var_BonusItem	=	{}
x203317_var_BonusChoiceItem ={}
x203317_var_GroupPoint	={ {type=10,varId =333,target = "装人麻袋"} }
--DECLARE_QUEST_INFO_STOP--


function x203317_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203317_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203317_var_QuestIdPre[1])> 0 then
	   if IsQuestHaveDone(varMap, varPlayer, x203317_var_QuestIdPre[2])> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203317_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203317_var_QuestId, varState, -1 )
		 end
	end
end

function x203317_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203317_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203317_var_ExpBonus )
		end
		if x203317_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203317_var_BonusMoney1 )
		end
		if x203317_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203317_var_BonusMoney2 )
		end
		if x203317_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203317_var_BonusMoney3 )
		end
		if x203317_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203317_var_BonusMoney4 )
		end
		if x203317_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203317_var_BonusMoney5 )
		end
		if x203317_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203317_var_BonusMoney6 )
		end
		for varI, item in x203317_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203317_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203317_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, which)	
	if IsQuestHaveDone(varMap, varPlayer, x203317_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203317_var_QuestId) > 0 then
			if x203317_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203317_var_QuestName)
						TalkAppendString(varMap,x203317_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203317_var_FileId, x203317_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203317_var_QuestName)
						TalkAppendString(varMap,x203317_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203317_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203317_var_FileId, x203317_var_QuestId);
			end
  elseif x203317_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203317_var_QuestName)
			TalkAppendString(varMap,x203317_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203317_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203317_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203317_var_QuestHelp )
			end
			x203317_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203317_var_FileId, x203317_var_QuestId);
  end
	
end


function x203317_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203317_var_QuestIdPre[1])> 0 then
		   if IsQuestHaveDone(varMap, varPlayer, x203317_var_QuestIdPre[2])> 0 then
					return 1
			 end
		end
		      return 0

end

function x203317_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203317_var_QuestId)
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) >= 2 then
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	    end
	 		return 0
	
end

function x203317_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203317_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203317_var_QuestId  )
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
		if x203317_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203317_var_QuestId, x203317_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203317_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x203317_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203317_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203317_var_QuestId)
	  x203317_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x203317_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x203317_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203317_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203317_var_BonusChoiceItem do
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

function x203317_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203317_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203317_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203317_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203317_var_QuestId) > 0 then
				x203317_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203317_var_QuestId)
				x203317_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203317_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203317_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		for varI, item in x203317_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		
   end
   
end

function x203317_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203317_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203317_var_ExpBonus);
  	end
		if x203317_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203317_var_BonusMoney1 )
	  end
		if x203317_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203317_var_BonusMoney2 )
	  end
		if x203317_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203317_var_BonusMoney3 )
		end
		if x203317_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203317_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203317_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203317_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203317_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203317_var_BonusMoney6)
		end
end

function x203317_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203317_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203317_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203317_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203317_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203317_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203317_var_QuestName.."！", 0, 3)
				if x203317_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203317_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203317_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203317_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203317_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203317_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203317_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203317_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203317_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203317_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203317_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203317_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203317_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203317_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203317_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203317_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203317_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203317_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203317_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203317_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x203317_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203317_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203317_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203317_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203317_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203317_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203317_Growpoint(varMap,varPlayer,which)
		if IsHaveQuest(varMap,varPlayer, x203317_var_QuestId) <= 0 then
				return 1
		end
		if which ==0 then
							return 0
		elseif which == 1 then
				if IsHaveQuest(varMap,varPlayer, x203317_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203317_var_QuestId)
										if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 2 then		                                     
												SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
												Msg2Player(varMap, varPlayer, format("无辜的百姓   %d/2", GetQuestParam(varMap,varPlayer,varQuestIdx,0)), 0, 3)
												x203317_CheckSubmit( varMap, varPlayer)
										end
										local varX,z =GetWorldPos(varMap,varPlayer)
										local creatid =CreateMonster(varMap, 933,varX,z,3,1,-1,-1,20,4000,180,"无辜的百姓")
										SendSpecificImpactToUnit(varMap, creatid, creatid, creatid, 8712, 0);
        end
    		return 1
    end
		
end
