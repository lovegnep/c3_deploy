

--DECLARE_QUEST_INFO_START--
x203333_var_FileId = 203333
x203333_var_QuestIdPre =2282
x203333_var_QuestId = 2283
x203333_var_LevelLess	= 	70 
x203333_var_QuestIdNext = 2284

x203333_var_ExtTarget={{type=20,n=1,target="通过@npc_144741渡海找到@npc_144742"}}
x203333_var_QuestName="【个人】营救船员"
x203333_var_QuestTalk="带我去找船长吧"
x203333_var_QuestInfo="\t听那群歹人之言，带头的似乎叫万奴冥王。要求赶在今日天还未亮到达此地，未料想到达之后却把船长与其他船夫扔到海中小岛求生不得求死不能！看我瘦小留下来以便再次掌船，而那群歹人便此行踪不明。（说着，说着陈送眼泪便流了下来。）勇士，救人救到底，请救救船长吧。他们在海中不远处，我这就去准备小船。"  
x203333_var_QuestTarget="通过@npc_144741找到@npc_144742"		
x203333_var_QuestCompleted="\t多谢勇士相救。我认得您，您是大元将军#Y@myname#W，您的威名远播万里，无人不知啊！"
x203333_var_ContinueInfo={"\t将军可是为了那个俘虏而来？说来真是幸运，我们正在扬武号甲板之上维修，偶然发现海中有人。救上来才发现竟是可恶的敌人。",
												"\t此等军情大事我们不敢信口雌黄，救他的时候他身上穿着与神秘入侵者一样的#R铠甲#W，而且当时他手中还握着放火的#R火把#W。",}
x203333_var_QuestHelp =	""
x203333_var_DemandItem ={}
x203333_var_ExpBonus = 382000
x203333_var_BonusMoney1 =700
x203333_var_BonusMoney2 =0
x203333_var_BonusMoney3 =0
x203333_var_BonusMoney4 =0
x203333_var_BonusMoney5 =81
x203333_var_BonusMoney6 =0
x203333_var_BonusItem	=	{}
x203333_var_BonusChoiceItem ={}
x203333_var_NpcGUID = {{ guid = 144742, varName = "船长"} }

--DECLARE_QUEST_INFO_STOP--



function x203333_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x203333_var_QuestId) > 0 then
		return 
	end

	if IsQuestHaveDone(varMap, varPlayer, x203333_var_QuestIdPre) > 0 then
				if IsHaveQuest(varMap,varPlayer, x203333_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203333_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203333_var_QuestId, varState, -1 )					 
				end
	end
end

function x203333_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203333_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203333_var_ExpBonus )
		end
		if x203333_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203333_var_BonusMoney1 )
		end
		if x203333_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203333_var_BonusMoney2 )
		end
		if x203333_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203333_var_BonusMoney3 )
		end
		if x203333_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203333_var_BonusMoney4 )
		end
		if x203333_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203333_var_BonusMoney5 )
		end
		if x203333_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203333_var_BonusMoney6 )
		end
		for varI, item in x203333_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203333_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203333_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203333_var_QuestId)
	if IsQuestHaveDone(varMap, varPlayer, x203333_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203333_var_QuestId) > 0 then
			if x203333_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which ==1 then
						SetPos( varMap, varPlayer, 85 + random( -1,1 ), 435 + random( -1, 1), 203333)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                           	    						                                        	    						                                                	    						
				   end    
			elseif which ==2 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203333_var_QuestName)
						TalkAppendString(varMap,x203333_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203333_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203333_var_FileId, x203333_var_QuestId);    	           	   
			end
  elseif x203333_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203333_var_QuestName)
			TalkAppendString(varMap,x203333_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x203333_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203333_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203333_var_QuestHelp )
			end
			x203333_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203333_var_FileId, x203333_var_QuestId);
  end
end

function x203333_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203333_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203333_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203333_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203333_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 1 then
	        return 1
	end
	return 0
end

function x203333_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203333_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203333_var_QuestId  )
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
		if x203333_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203333_var_QuestId, x203333_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203333_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203333_var_QuestId)                                                  
	    					--SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end

function x203333_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203333_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203333_var_QuestId)
	  x203333_Msg2toplayer( varMap, varPlayer,1)
	  
end

function x203333_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203333_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203333_var_BonusChoiceItem do
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

function x203333_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203333_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203333_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203333_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203333_var_QuestId) > 0 then
				x203333_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203333_var_QuestId)
				QuestCom(varMap, varPlayer, 3240)
				x203333_GetBonus( varMap, varPlayer,varTalknpc)
				
					
				
				
					
				
			  
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203333_var_QuestIdNext )	
   end
end

function x203333_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203333_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203333_var_ExpBonus);
  	end
		if x203333_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203333_var_BonusMoney1 )
	  end
		if x203333_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203333_var_BonusMoney2 )
	  end
		if x203333_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203333_var_BonusMoney3 )
		end
		if x203333_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203333_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203333_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203333_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203333_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203333_var_BonusMoney6)
		end
end

function x203333_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203333_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203333_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203333_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203333_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203333_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203333_var_QuestName.."！", 0, 3)
				if x203333_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203333_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203333_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203333_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203333_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203333_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203333_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203333_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203333_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203333_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203333_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203333_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203333_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203333_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203333_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varMyQuest = x203333_var_QuestId
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	if varTalkNpcGUID ==144741 then
		if x203333_CheckSubmit(varMap, varPlayer, varTalknpc) < 1 then
			TalkAppendButton(varMap, x203333_var_QuestId, x203333_var_QuestTalk,0,1);
		end
	end

		
	if varTalkNpcGUID ==144742 then
		if x203333_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
			TalkAppendButton(varMap, x203333_var_QuestId, x203333_var_QuestName,7,2)
		end
	end

	
end



function x203333_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203333_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203333_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203333_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203333_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203333_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203333_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203333_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203333_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203333_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203333_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
