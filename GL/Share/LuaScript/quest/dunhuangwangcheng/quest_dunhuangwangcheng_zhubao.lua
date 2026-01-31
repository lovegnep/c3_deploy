

--DECLARE_QUEST_INFO_START--
x256055_var_FileId = 256055
x256055_var_QuestIdPre =1614
x256055_var_QuestId = 1615
x256055_var_LevelLess	= 	10 
x256055_var_QuestIdNext = 1616
x256055_var_Name	={}
x256055_var_ExtTarget={{type=20,n=2,target="回答@npc_138500的问题"}}
x256055_var_QuestName="【主线】蒙古秘史<五>"
x256055_var_QuestInfo="\t看你这么聪明伶俐，我考你几个问题如何？"  
x256055_var_QuestTarget=""		
x256055_var_QuestCompleted="\t真是不错，有没有兴趣和我的姐妹学习学习珠宝加工？"					
x256055_var_ContinueInfo=""
x256055_var_QuestHelp =	""
x256055_var_DemandItem ={}
x256055_var_BonusMoney1 =176
x256055_var_BonusMoney2 =0
x256055_var_BonusMoney3 =0
x256055_var_BonusMoney4 =0
x256055_var_BonusMoney5 =56
x256055_var_BonusMoney6 =0
x256055_var_BonusItem	=	{}
x256055_var_BonusChoiceItem ={}
x256055_var_ExpBonus = 2280
x256055_var_NpcGUID ={}
x256055_var_answer1 ={"算命老人","钥匙老人","烧饼老人"}
x256055_var_answer2 ={"声望商店","武器商人","帮会商人"}
x256055_var_question1 ={"\t王城有个神秘的老人，他能将人传送回过去的年代，他叫什么名字？ "}
x256055_var_question2 ={"\t在哪里可以买到非常好用的声望装备？"}
--DECLARE_QUEST_INFO_STOP--


function x256055_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x256055_var_QuestId) > 0 then
		return 
	end
    
	if IsQuestHaveDone(varMap, varPlayer, x256055_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256055_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256055_var_QuestId, varState, -1 )
	end
end

function x256055_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256055_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256055_var_ExpBonus )
		end
		if x256055_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256055_var_BonusMoney1 )
		end
		if x256055_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256055_var_BonusMoney2 )
		end
		if x256055_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256055_var_BonusMoney3 )
		end
		if x256055_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256055_var_BonusMoney4 )
		end
		if x256055_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256055_var_BonusMoney5 )
		end
		if x256055_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256055_var_BonusMoney6 )
		end
		for varI, item in x256055_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256055_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256055_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x256055_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256055_var_QuestId) > 0 then
	local zhiye =GetZhiye( varMap, varPlayer)+1
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256055_var_QuestId)
	local daan =0
			if x256055_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which ==-1 then
						daan =2
						if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x256055_var_QuestName)
							TalkAppendString(varMap,x256055_var_question1[1])
							for varI, item in x256055_var_answer1 do
								TalkAppendButton(varMap, varQuest, x256055_var_answer1[varI],3,varI)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256055_var_FileId, x256055_var_QuestId);
					  elseif GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x256055_var_QuestName)
							TalkAppendString(varMap,x256055_var_question2[1])
							for varI, item in x256055_var_answer2 do
								TalkAppendButton(varMap, varQuest, x256055_var_answer2[varI],3,varI+6)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256055_var_FileId, x256055_var_QuestId);
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
						TalkAppendString(varMap,"你答错了！") 
						StopTalkTask()
						DeliverTalkTips(varMap, varPlayer)
					elseif daan ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"不错不错，继续下个问题。") 
						StopTalkTask()
						DeliverTalkTips(varMap, varPlayer)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
						x256055_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,-1)
					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256055_var_QuestName)
						TalkAppendString(varMap,x256055_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256055_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256055_var_FileId, x256055_var_QuestId);
			end
  elseif x256055_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256055_var_QuestName)
			TalkAppendString(varMap,x256055_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256055_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256055_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256055_var_QuestHelp )
			end
			x256055_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256055_var_FileId, x256055_var_QuestId);
  end
	
end


function x256055_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x256055_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x256055_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256055_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==2 then
	        return 1
	  end
	  return 0
	
end

function x256055_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256055_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256055_var_QuestId  )
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
		
		
		if x256055_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256055_var_QuestId, x256055_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			 	x256055_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,-1)
		  			 	x256055_Msg2toplayer( varMap, varPlayer,0)
						 	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256055_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    				if x256055_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,2)
	    				end
		  		end
	 	end                                                                    
	     
end


function x256055_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256055_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256055_var_QuestId)
	  x256055_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256055_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256055_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256055_var_BonusChoiceItem do
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

function x256055_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x256055_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256055_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256055_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256055_var_QuestId) > 0 then
				x256055_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256055_var_QuestId)
				x256055_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256055_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256055_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256055_var_QuestIdNext )	
end

function x256055_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256055_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256055_var_ExpBonus);
  	end
		if x256055_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256055_var_BonusMoney1 )
	  end
		if x256055_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256055_var_BonusMoney2 )
	  end
		if x256055_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256055_var_BonusMoney3 )
		end
		if x256055_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256055_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256055_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256055_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256055_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256055_var_BonusMoney6)
		end
end

function x256055_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256055_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256055_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256055_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256055_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256055_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256055_var_QuestName.."！", 0, 3)
				if x256055_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256055_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256055_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256055_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256055_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256055_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256055_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256055_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256055_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256055_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256055_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256055_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256055_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256055_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256055_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256055_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256055_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256055_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256055_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256055_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	 
end

function x256055_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256055_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256055_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256055_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256055_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256055_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





