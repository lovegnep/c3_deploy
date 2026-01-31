

--DECLARE_QUEST_INFO_START--
x203305_var_FileId = 203305
x203305_var_QuestIdPre =477
x203305_var_QuestId = 480
x203305_var_LevelLess	= 	45 
x203305_var_QuestIdNext = 481
x203305_var_Name	={}
x203305_var_ExtTarget={{type=20,n=2,target="解答@npc_110029的疑问"}}
x203305_var_QuestName="【剧场】回鹘公主的倾慕"
x203305_var_QuestInfo="\t本公主听说过很多大汗的传说，神往已久，可是传说中总有些不明之处，将军你和大汗并肩作战多年，一定对这些了解甚多，可否为我解答一番？"  
x203305_var_QuestTarget=""		
x203305_var_QuestCompleted="\t原来是这样，看来大汗也并非是无情之人……"					
x203305_var_ContinueInfo=""
x203305_var_QuestHelp =	""
x203305_var_DemandItem ={}
x203305_var_ExpBonus = 214000
x203305_var_BonusMoney1 =376
x203305_var_BonusMoney2 =0
x203305_var_BonusMoney3 =0
x203305_var_BonusMoney4 =0
x203305_var_BonusMoney5 =71
x203305_var_BonusMoney6 =0
x203305_var_BonusItem	=	{}
x203305_var_BonusChoiceItem ={}
x203305_var_NpcGUID ={}
x203305_var_answer1 ={"此事......不可明言","他们一直恩爱有加","大汗另有新欢"}
x203305_var_answer2 ={"大汗曾为此大病一场","大汗并不在意","大汗完全不知此事"}
x203305_var_question1 ={"\t听说大汗的第一位妻子孛儿贴曾被蔑里岂人抢走侮辱过，后来大汗救回她之后，他们之间感情如何？ "}
x203305_var_question2 ={"\t听说赫赫有名的木华黎将军，在金国凤翔府城下不幸遇伏身亡，大汗听闻此事后有何反应？"}
--DECLARE_QUEST_INFO_STOP--


function x203305_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203305_var_QuestId) > 0 then
		return 
	end
    
	if IsQuestHaveDone(varMap, varPlayer, x203305_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203305_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203305_var_QuestId, varState, -1 )
	end
end

function x203305_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203305_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203305_var_ExpBonus )
		end
		if x203305_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203305_var_BonusMoney1 )
		end
		if x203305_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203305_var_BonusMoney2 )
		end
		if x203305_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203305_var_BonusMoney3 )
		end
		if x203305_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203305_var_BonusMoney4 )
		end
		if x203305_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203305_var_BonusMoney5 )
		end
		if x203305_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203305_var_BonusMoney6 )
		end
		for varI, item in x203305_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203305_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203305_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x203305_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203305_var_QuestId) > 0 then
	local zhiye =GetZhiye( varMap, varPlayer)+1
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203305_var_QuestId)
	local daan =0
			if x203305_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which ==-1 then
						daan =2
						if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x203305_var_QuestName)
							TalkAppendString(varMap,x203305_var_question1[1])
							for varI, item in x203305_var_answer1 do
								TalkAppendButton(varMap, varQuest, x203305_var_answer1[varI],3,varI)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203305_var_FileId, x203305_var_QuestId);
					  elseif GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x203305_var_QuestName)
							TalkAppendString(varMap,x203305_var_question2[1])
							for varI, item in x203305_var_answer2 do
								TalkAppendButton(varMap, varQuest, x203305_var_answer2[varI],3,varI+6)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203305_var_FileId, x203305_var_QuestId);
					  end
					elseif which > -1 then
						if which <7 then
							if which ==2 then
									daan =1
							end
						elseif which == 7 then
									daan =1
						elseif daan == 2 then
							daan = 0
						end
					end
					if daan ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"原来你也不知道......") 
						StopTalkTask()
						DeliverTalkTips(varMap, varPlayer)
					elseif daan ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"原来是这样，我明白了。") 
						StopTalkTask()
						DeliverTalkTips(varMap, varPlayer)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)

						x203305_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,-1)
					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203305_var_QuestName)
						TalkAppendString(varMap,x203305_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203305_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203305_var_FileId, x203305_var_QuestId);
			end
  elseif x203305_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203305_var_QuestName)
			TalkAppendString(varMap,x203305_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203305_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203305_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203305_var_QuestHelp )
			end
			x203305_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203305_var_FileId, x203305_var_QuestId);
  end
	
end


function x203305_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203305_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203305_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203305_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==2 then
	        return 1
	  end
	  return 0
	
end

function x203305_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203305_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203305_var_QuestId  )
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
		
		if x203305_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203305_var_QuestId, x203305_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			  x203305_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,-1)
		  				x203305_Msg2toplayer( varMap, varPlayer,0)
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203305_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    				if x203305_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
									SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,2)
	    				end
		  		end
	 	end                                                                    
	     
end


function x203305_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203305_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203305_var_QuestId)
	  x203305_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203305_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203305_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203305_var_BonusChoiceItem do
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

function x203305_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x203305_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203305_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203305_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203305_var_QuestId) > 0 then
				x203305_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203305_var_QuestId)
				x203305_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203305_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203305_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203305_var_QuestIdNext )	
end

function x203305_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203305_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203305_var_ExpBonus);
  	end
		if x203305_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203305_var_BonusMoney1 )
	  end
		if x203305_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203305_var_BonusMoney2 )
	  end
		if x203305_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203305_var_BonusMoney3 )
		end
		if x203305_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203305_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203305_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203305_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203305_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203305_var_BonusMoney6)
		end
end

function x203305_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203305_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203305_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203305_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203305_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203305_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203305_var_QuestName.."！", 0, 3)
				if x203305_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203305_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203305_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203305_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203305_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203305_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203305_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203305_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203305_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203305_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203305_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203305_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203305_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203305_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203305_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203305_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203305_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203305_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203305_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203305_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	 
end

function x203305_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203305_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203305_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203305_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203305_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203305_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





