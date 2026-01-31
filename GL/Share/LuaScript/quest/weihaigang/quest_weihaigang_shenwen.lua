

--DECLARE_QUEST_INFO_START--
x270203_var_FileId = 270203
x270203_var_QuestIdPre =2265
x270203_var_QuestId = 2266
x270203_var_LevelLess	= 	70 
x270203_var_QuestIdNext = 2267
x270203_var_ExtTarget={{type=20,n=1,target="审问@npcsp_俘虏_143175"}}
x270203_var_QuestName="【个人】骇人阴谋（一）"
x270203_var_QuestTalk={"你为什么身上会穿着冥甲？","你为什么会握着火把？","你的冥甲和火把早就出卖你了"}
x270203_var_QuestInfo="\t我已命人将那名俘虏带来，真想将他千刀万剐！但这之前，还望将军能在他口中套问出有用的军情。"  
x270203_var_QuestTarget=""		
x270203_var_QuestCompleted="\t既然被你们发现，说出来也无妨。是的，我伟大的主人就是#R万奴冥王#W，或者说曾经的#R蒲和万奴#W你可能更加熟悉。\n\t不过即使告诉你也来不及了，伟大的万奴冥王现在已经带兵到了你们大元最神秘的所在——#R后花园#W了。你们随时等着听到大元皇帝遇刺身亡的消息吧。哈哈哈哈。"
x270203_var_ContinueInfo={"\t你是什么人？我说了很多次了，我是无辜的，你们真的抓错人了。 ",
												"\t我不知道你在说什么，你说的的那东西我根本不知道。（他表情十分自然，看来还要再次突破他的心理防线。）",
												"\t你...你怎么知道这个的？（他表情十分慌张，趁此继续审问他！）"}
x270203_var_QuestHelp =	""
x270203_var_DemandItem ={}
x270203_var_ExpBonus = 382000
x270203_var_BonusMoney1 =700
x270203_var_BonusMoney2 =0
x270203_var_BonusMoney3 =0
x270203_var_BonusMoney4 =0
x270203_var_BonusMoney5 =81
x270203_var_BonusMoney6 =0
x270203_var_BonusItem	=	{}
x270203_var_BonusChoiceItem ={}
x270203_var_NpcGUID = {{ guid = 143175, varName = "金国俘虏"} }
--DECLARE_QUEST_INFO_STOP--


function x270203_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x270203_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270203_var_QuestIdPre) > 0 then
				if IsHaveQuest(varMap,varPlayer, x270203_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270203_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270203_var_QuestId, varState, -1 )
				end
	end
end

function x270203_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270203_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270203_var_ExpBonus )
		end
		if x270203_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270203_var_BonusMoney1 )
		end
		if x270203_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270203_var_BonusMoney2 )
		end
		if x270203_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270203_var_BonusMoney3 )
		end
		if x270203_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270203_var_BonusMoney4 )
		end
		if x270203_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270203_var_BonusMoney5 )
		end
		if x270203_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270203_var_BonusMoney6 )
		end
		for varI, item in x270203_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270203_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x270203_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x270203_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270203_var_QuestId) > 0 then
			if x270203_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						local ran =random(1,5)
						if ran <3 then
							ran = 1
						else
							ran = 2	
						end				
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270203_var_QuestName)
						TalkAppendString(varMap,x270203_var_ContinueInfo[1])
						TalkAppendButton(varMap, varQuest, x270203_var_QuestTalk[1],0,ran)
						TalkAppendButton(varMap, varQuest, x270203_var_QuestTalk[2],0,ran)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270203_var_FileId, x270203_var_QuestId);
					elseif which ==1 then
						local ran =random(1,5)
						if ran <3 then
							ran = 1
						else
							ran = 2	
						end
						if ran ==2 then
							Msg2Player(varMap, varPlayer, "他表情十分自然，看来还要再次突破他的心理防线。", 0, 3)
						end
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270203_var_QuestName)
						TalkAppendString(varMap,x270203_var_ContinueInfo[2])
						TalkAppendButton(varMap, varQuest, x270203_var_QuestTalk[1],0,ran)
						TalkAppendButton(varMap, varQuest, x270203_var_QuestTalk[2],0,ran)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270203_var_FileId, x270203_var_QuestId);
					elseif which ==2 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270203_var_QuestName)
						TalkAppendString(varMap,x270203_var_ContinueInfo[3])
						TalkAppendButton(varMap, varQuest, x270203_var_QuestTalk[3],0,3)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270203_var_FileId, x270203_var_QuestId);
	    	elseif which ==3 then
	    			StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270203_var_QuestName)
						TalkAppendString(varMap,x270203_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270203_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270203_var_FileId, x270203_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270203_var_QuestId)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                                
	  				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    	
	    	
		--				StartTalkTask(varMap)
		--				TalkAppendString(varMap,"#Y"..x270203_var_QuestName)
		--				TalkAppendString(varMap,x270203_var_QuestCompleted)
		--				StopTalkTask()
		--				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270203_var_FileId, x270203_var_QuestId);
		--				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270203_var_QuestId)  
		--				SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)                                                
	  --  			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
			else
					  StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270203_var_QuestName)
						TalkAppendString(varMap,x270203_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270203_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270203_var_FileId, x270203_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270203_var_QuestId) 
			end
  elseif x270203_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270203_var_QuestName)
			TalkAppendString(varMap,x270203_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270203_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270203_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270203_var_QuestHelp )
			end
			x270203_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270203_var_FileId, x270203_var_QuestId);
  end
end

function x270203_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x270203_var_QuestId) > 0 then
		return 0
	--elseif IsQuestHaveDone(varMap, varPlayer, x270203_var_QuestIdPre) <= 0 then
		--return 0
	end
	return 1
end

function x270203_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270203_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
	        return 1
	end
	return 0
end

function x270203_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270203_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270203_var_QuestId  )
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
		
		if x270203_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270203_var_QuestId, x270203_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270203_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270203_var_QuestId)                                                  
	    					--SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end

function x270203_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270203_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270203_var_QuestId)
	  x270203_Msg2toplayer( varMap, varPlayer,1)
end

function x270203_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270203_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x270203_var_BonusChoiceItem do
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

function x270203_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270203_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270203_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270203_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270203_var_QuestId) > 0 then
				x270203_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270203_var_QuestId)
				x270203_GetBonus( varMap, varPlayer,varTalknpc)
				
				StartItemTask(varMap)
				for varI, item in x270203_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x270203_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    			end
    			StopItemTask(varMap,varPlayer)
    			--DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270203_var_QuestIdNext )	
end

function x270203_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270203_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270203_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270203_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270203_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270203_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270203_var_QuestName.."！", 0, 3)
				if x270203_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270203_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270203_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270203_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270203_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270203_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270203_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270203_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270203_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270203_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270203_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270203_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270203_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270203_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270203_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x270203_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270203_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270203_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270203_var_QuestId, varState, -1 )
		end
end

function x270203_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270203_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270203_var_ExpBonus);
  	end
		if x270203_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270203_var_BonusMoney1 )
	  end
		if x270203_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270203_var_BonusMoney2 )
	  end
		if x270203_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270203_var_BonusMoney3 )
		end
		if x270203_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270203_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270203_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270203_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270203_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270203_var_BonusMoney6)
		end
end



function x270203_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x270203_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270203_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270203_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270203_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270203_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270203_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270203_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270203_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270203_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270203_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





