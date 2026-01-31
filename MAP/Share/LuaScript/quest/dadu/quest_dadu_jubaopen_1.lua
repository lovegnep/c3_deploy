

--DECLARE_QUEST_INFO_START--
x270014_var_FileId = 270014
x270014_var_QuestIdPre =3595
x270014_var_QuestId = 3596
x270014_var_LevelLess	= 	55 
x270014_var_QuestIdNext = 3597
x270014_var_Name	={}
x270014_var_ExtTarget={{type=20,n=1,target="从@npc_140039处得到答案"}}
x270014_var_QuestName="【主线】聚宝盆<三>"
x270014_var_QuestInfo="\t你是第9100个来找我问这件事的人了，我有一个规矩，就是我说你猜，你要是够聪明，很快就能知道捞出这聚宝盆的关键是什么。当然了，每问一个问题，我都要收取一定费用。怎么样，准备好了么？"  
x270014_var_QuestTarget=""		
x270014_var_QuestCompleted="\t你还真有两下子！没错，当年沈万三得到聚宝盆的关键，正是因为放了一盆田鸡！"					
x270014_var_ContinueInfo=""
x270014_var_QuestHelp =	"此任务回答错误或者寻求乞丐提示会分别扣除银卡10文和5文！"
x270014_var_DemandItem ={}
x270014_var_BonusMoney1 =376
x270014_var_BonusMoney2 =0
x270014_var_BonusMoney3 =0
x270014_var_BonusMoney4 =0
x270014_var_BonusMoney5 =66
x270014_var_BonusMoney6 =0
x270014_var_BonusItem	=	{}
x270014_var_BonusChoiceItem ={}
x270014_var_ExpBonus = 171000
x270014_var_NpcGUID ={}
x270014_var_answer1 ={"田鸡","蛇","鳄鱼","再给我点提示"}
x270014_var_answer2 ={"田鸡","蛇","鳄鱼","再给我点提示"}
x270014_var_answer3 ={"田鸡","蛇","鳄鱼","再给我点提示"}
x270014_var_answer4 ={"田鸡","蛇","鳄鱼"}
x270014_var_question1 ={"\t这种东西你可以在水里面找到。"}
x270014_var_question2 ={"\t这东西不仅在水里能找到，在岸上也能找到！"}
x270014_var_question3 ={"\t这东西不仅在水里能找到，在岸上也能找到，而且有四条腿！"}
x270014_var_question4 ={"\t这东西不仅在水里能找到，在岸上也能找到，而且有四条腿，并且跳的还很高！"}
--DECLARE_QUEST_INFO_STOP--


function x270014_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270014_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270014_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270014_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270014_var_QuestId, varState, -1 )
	end
end

function x270014_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270014_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270014_var_ExpBonus )
		end
		if x270014_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270014_var_BonusMoney1 )
		end
		if x270014_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270014_var_BonusMoney2 )
		end
		if x270014_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270014_var_BonusMoney3 )
		end
		if x270014_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270014_var_BonusMoney4 )
		end
		if x270014_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270014_var_BonusMoney5 )
		end
		if x270014_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270014_var_BonusMoney6 )
		end
		for varI, item in x270014_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270014_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270014_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x270014_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270014_var_QuestId) > 0 then
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270014_var_QuestId)
	local daan =0
			if x270014_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which ==-1 then
						daan =4
						if GetQuestParam(varMap,varPlayer,varQuestIdx,1) ==0 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x270014_var_QuestName)
							TalkAppendString(varMap,x270014_var_question1[1])
							for varI, item in x270014_var_answer1 do
								TalkAppendButton(varMap, varQuest, x270014_var_answer1[varI],3,varI)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270014_var_FileId, x270014_var_QuestId);
					  elseif GetQuestParam(varMap,varPlayer,varQuestIdx,1) ==1 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x270014_var_QuestName)
							TalkAppendString(varMap,x270014_var_question2[1])
							for varI, item in x270014_var_answer2 do
								TalkAppendButton(varMap, varQuest, x270014_var_answer2[varI],3,varI)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270014_var_FileId, x270014_var_QuestId);
						elseif GetQuestParam(varMap,varPlayer,varQuestIdx,1) ==2 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x270014_var_QuestName)
							TalkAppendString(varMap,x270014_var_question3[1])
							for varI, item in x270014_var_answer3 do
								TalkAppendButton(varMap, varQuest, x270014_var_answer3[varI],3,varI)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270014_var_FileId, x270014_var_QuestId);
						elseif GetQuestParam(varMap,varPlayer,varQuestIdx,1) ==3 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x270014_var_QuestName)
							TalkAppendString(varMap,x270014_var_question4[1])
							for varI, item in x270014_var_answer4 do
								TalkAppendButton(varMap, varQuest, x270014_var_answer4[varI],3,varI)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270014_var_FileId, x270014_var_QuestId);
					  end
					elseif GetMoney(varMap, varPlayer, 1) < 10 then
									daan =3
					elseif which == 1 then
									daan =1
					elseif which == 2 then
									daan =0
					elseif which == 3 then
									daan =0
					elseif which == 4 then
									daan =2
					end
					if daan ==0 then
						CostMoney( varMap , varPlayer, 1 , 10 )
						Msg2Player(varMap, varPlayer, "猜错了，你损失了10文钱！", 0, 3)
					elseif daan ==1 then
						Msg2Player(varMap, varPlayer, "恭喜你猜对了！", 0, 3)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
						x270014_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,-1)
					elseif daan ==2 then
						CostMoney( varMap , varPlayer, 1 , 5 )
						Msg2Player(varMap, varPlayer, "你给了乞丐5文钱！", 0, 3)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,GetQuestParam(varMap,varPlayer,varQuestIdx,1)+1)
						x270014_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,-1)
					elseif daan ==3 then
						Msg2Player(varMap, varPlayer, "您的银卡不足10文", 0, 3)
					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270014_var_QuestName)
						TalkAppendString(varMap,x270014_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270014_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270014_var_FileId, x270014_var_QuestId);
			end
  elseif x270014_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270014_var_QuestName)
			TalkAppendString(varMap,x270014_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270014_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270014_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270014_var_QuestHelp )
			end
			x270014_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270014_var_FileId, x270014_var_QuestId);
  end
	
end


function x270014_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270014_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270014_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270014_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then
	        return 1
	  end
	  return 0
	
end

function x270014_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270014_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270014_var_QuestId  )
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
		if x270014_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			local retmiss = AddQuest( varMap, varPlayer, x270014_var_QuestId, x270014_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270014_Msg2toplayer( varMap, varPlayer,0)
		  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270014_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			if x270014_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x270014_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270014_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270014_var_QuestId)
	  x270014_Msg2toplayer( varMap, varPlayer,1)
			
end

function x270014_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270014_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270014_var_BonusChoiceItem do
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

function x270014_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x270014_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270014_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270014_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270014_var_QuestId) > 0 then
				x270014_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270014_var_QuestId)
				x270014_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270014_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270014_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270014_var_QuestIdNext )	
end

function x270014_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270014_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270014_var_ExpBonus);
  	end
		if x270014_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270014_var_BonusMoney1 )
	  end
		if x270014_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270014_var_BonusMoney2 )
	  end
		if x270014_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270014_var_BonusMoney3 )
		end
		if x270014_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270014_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270014_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270014_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270014_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270014_var_BonusMoney6)
		end
end

function x270014_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270014_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270014_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270014_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270014_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270014_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270014_var_QuestName.."！", 0, 3)
				if x270014_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270014_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270014_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270014_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270014_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270014_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270014_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270014_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270014_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270014_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270014_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270014_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270014_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270014_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270014_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270014_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270014_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270014_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270014_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270014_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	 
end

function x270014_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270014_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270014_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270014_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270014_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270014_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





