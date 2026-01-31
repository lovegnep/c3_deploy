

--DECLARE_QUEST_INFO_START--
x203101_var_FileId = 203101
x203101_var_QuestIdPre =355
x203101_var_QuestId = 356
x203101_var_LevelLess	= 	50 
x203101_var_QuestIdNext = 357
x203101_var_Name	={}
x203101_var_ExtTarget={{type=20,n=2,target="试着回答@npc_108002的问题"}}
x203101_var_QuestName="【剧场】周伯通的问题"
x203101_var_QuestInfo="\t（你看到这个怪人身穿破破烂烂的道袍，便报出丘处机座下的名号）什么？你说你是丘处机那小子的弟子？怎么，有啥好惊讶的！马钰，丘处机之辈在我周伯通面前，都得老老实实的！来来，我们做个游戏，若是你能回答上来我两个问题，便算你赢！"  
x203101_var_QuestTarget=""		
x203101_var_QuestCompleted="\t想不到你聪明的很啊，不过太可惜了，我准备你一个也答不上来就教你左右互搏的。嘿嘿，伤心了吧！"					
x203101_var_ContinueInfo=""
x203101_var_QuestHelp =	""
x203101_var_DemandItem ={}
x203101_var_ExpBonus = 112000
x203101_var_BonusMoney1 =295
x203101_var_BonusMoney2 =0
x203101_var_BonusMoney3 =0
x203101_var_BonusMoney4 =0
x203101_var_BonusMoney5 =56
x203101_var_BonusMoney6 =0
x203101_var_BonusItem	=	{}
x203101_var_BonusChoiceItem ={}
x203101_var_NpcGUID ={}
x203101_var_answer1 ={"酒","女人","武功"}
x203101_var_answer2 ={"终南山","花果山","断背山"}
x203101_var_question1 ={"\t你猜猜老叫花子最怕什么？ "}
x203101_var_question2 ={"\t据说我们全真教那里还有个什么劳什子古墓派，喜欢住地洞里。你知道他们住在哪座山的底下？"}
--DECLARE_QUEST_INFO_STOP--


function x203101_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203101_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203101_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203101_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203101_var_QuestId, varState, -1 )
	end
end

function x203101_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203101_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203101_var_ExpBonus )
		end
		if x203101_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203101_var_BonusMoney1 )
		end
		if x203101_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203101_var_BonusMoney2 )
		end
		if x203101_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203101_var_BonusMoney3 )
		end
		if x203101_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203101_var_BonusMoney4 )
		end
		if x203101_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203101_var_BonusMoney5 )
		end
		if x203101_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203101_var_BonusMoney6 )
		end
		for varI, item in x203101_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203101_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203101_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x203101_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203101_var_QuestId) > 0 then
	local zhiye =GetZhiye( varMap, varPlayer)+1
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203101_var_QuestId)
	local daan =0
			if x203101_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which ==-1 then
						daan =2
						if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x203101_var_QuestName)
							TalkAppendString(varMap,x203101_var_question1[1])
							for varI, item in x203101_var_answer1 do
								TalkAppendButton(varMap, varQuest, x203101_var_answer1[varI],3,varI)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203101_var_FileId, x203101_var_QuestId);
					  elseif GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x203101_var_QuestName)
							TalkAppendString(varMap,x203101_var_question2[1])
							for varI, item in x203101_var_answer2 do
								TalkAppendButton(varMap, varQuest, x203101_var_answer2[varI],3,varI+6)
							end 
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203101_var_FileId, x203101_var_QuestId);
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
						TalkAppendString(varMap,"你答错了，请重新答！") 
						StopTalkTask()
						DeliverTalkTips(varMap, varPlayer)
					elseif daan ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"恭喜你答对了！") 
						StopTalkTask()
						DeliverTalkTips(varMap, varPlayer)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
						x203101_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,-1)
					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203101_var_QuestName)
						TalkAppendString(varMap,x203101_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203101_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203101_var_FileId, x203101_var_QuestId);
			end
  elseif x203101_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203101_var_QuestName)
			TalkAppendString(varMap,x203101_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203101_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203101_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203101_var_QuestHelp )
			end
			x203101_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203101_var_FileId, x203101_var_QuestId);
  end
	
end


function x203101_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203101_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203101_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203101_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==2 then
	        return 1
	  end
	  return 0
	
end

function x203101_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203101_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203101_var_QuestId  )
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
		
		if x203101_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203101_var_QuestId, x203101_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203101_Msg2toplayer( varMap, varPlayer,0)
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203101_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			if x203101_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,2)
	    			end
		  		end
	 	end                                                                    
	     
end


function x203101_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203101_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203101_var_QuestId)
	  x203101_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203101_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203101_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203101_var_BonusChoiceItem do
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

function x203101_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x203101_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203101_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203101_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203101_var_QuestId) > 0 then
				x203101_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203101_var_QuestId)
				x203101_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203101_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203101_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x203101_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203101_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203101_var_ExpBonus);
  	end
		if x203101_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203101_var_BonusMoney1 )
	  end
		if x203101_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203101_var_BonusMoney2 )
	  end
		if x203101_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203101_var_BonusMoney3 )
		end
		if x203101_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203101_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203101_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203101_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203101_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203101_var_BonusMoney6)
		end
end

function x203101_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203101_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203101_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203101_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203101_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203101_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203101_var_QuestName.."！", 0, 3)
				if x203101_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203101_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203101_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203101_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203101_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203101_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203101_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203101_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203101_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203101_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203101_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203101_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203101_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203101_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203101_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203101_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203101_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203101_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203101_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203101_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	 
end

function x203101_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203101_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203101_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203101_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203101_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203101_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





