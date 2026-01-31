

--DECLARE_QUEST_INFO_START--
x270201_var_FileId = 270201
x270201_var_QuestIdPre =2261
x270201_var_QuestId = 2262
x270201_var_LevelLess	= 	70 
x270201_var_QuestIdNext = 2263

x270201_var_ExtTarget={{type=20,n=1,target="向@npc_143029询问详情"}}
x270201_var_QuestName="【个人】威海劫难"
x270201_var_QuestTalk={"遇袭的时间？","来的是什么人？","现在的情况"}
x270201_var_QuestInfo="\t我即刻派人前去调查信使失踪一事，将军可先向范文虎将军了解#R威海港惨遭洗劫#W的事情。"  
x270201_var_QuestTarget="向@npc_143029询问威海港遇袭详情"		
x270201_var_QuestCompleted="\t我军包围整个威海港，与这支偷袭威海港的神秘敌军僵持了一日，就在今天早上我们打算总攻的时候，发现他们竟然神秘的失踪了！"
x270201_var_ContinueInfo={"\t可恶的贼寇，三更突袭我威海港，放火趁乱大肆杀戮掠夺，无数无辜的百姓遇难，若让我抓到他们，定要他们碎尸万段！",
												"\t那是三天前的淩晨，我如往常巡视完回到营帐后的半个时辰后，突然威海港响起了警报，我冲出营帐后发现,城中出现了众多不明身份的人，他们遍布威海港各处，见人就杀，见屋就烧。",
												"\t敌人身份十分神秘，暂时还没查出来他们的来历。不过他们每人的装备都十分精良，在搜集研究后发现似乎是来自举世闻名的圣城#R耶路撒冷#W。\n"}
x270201_var_QuestHelp =	""
x270201_var_DemandItem ={}
x270201_var_ExpBonus = 382000
x270201_var_BonusMoney1 =700
x270201_var_BonusMoney2 =0
x270201_var_BonusMoney3 =0
x270201_var_BonusMoney4 =0
x270201_var_BonusMoney5 =81
x270201_var_BonusMoney6 =0
x270201_var_BonusItem	=	{}
x270201_var_BonusChoiceItem ={}
x270201_var_NpcGUID = {{ guid = 143029, varName = "范文虎"} }

--DECLARE_QUEST_INFO_STOP--



function x270201_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x270201_var_QuestId) > 0 then
		return 
	end

	if IsQuestHaveDone(varMap, varPlayer, x270201_var_QuestIdPre) > 0 then
				if IsHaveQuest(varMap,varPlayer, x270201_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270201_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270201_var_QuestId, varState, -1 )					 
				end
	end
end

function x270201_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270201_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270201_var_ExpBonus )
		end
		if x270201_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270201_var_BonusMoney1 )
		end
		if x270201_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270201_var_BonusMoney2 )
		end
		if x270201_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270201_var_BonusMoney3 )
		end
		if x270201_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270201_var_BonusMoney4 )
		end
		if x270201_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270201_var_BonusMoney5 )
		end
		if x270201_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270201_var_BonusMoney6 )
		end
		for varI, item in x270201_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x270201_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x270201_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270201_var_QuestId)
	if IsQuestHaveDone(varMap, varPlayer, x270201_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270201_var_QuestId) > 0 then
			if x270201_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270201_var_QuestName) 
						TalkAppendString(varMap,x270201_var_ContinueInfo[1])
						TalkAppendButton(varMap, varQuest, x270201_var_QuestTalk[1],0,0)
						StopTalkTask()	
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270201_var_FileId, x270201_var_QuestId); 
								
					elseif which ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270201_var_QuestName)
						TalkAppendString(varMap,x270201_var_ContinueInfo[2])
						TalkAppendButton(varMap, varQuest, x270201_var_QuestTalk[2],1,1)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270201_var_FileId, x270201_var_QuestId);
					elseif which ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270201_var_QuestName)
						TalkAppendString(varMap,x270201_var_ContinueInfo[3])
						TalkAppendButton(varMap, varQuest, x270201_var_QuestTalk[3],0,2)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270201_var_FileId, x270201_var_QuestId);
					elseif which ==2 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270201_var_QuestName)
						TalkAppendString(varMap,x270201_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270201_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270201_var_FileId, x270201_var_QuestId); 
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
            SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                    	    						
			    end
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"#Y"..x270201_var_QuestName)
					TalkAppendString(varMap,x270201_var_QuestCompleted)
					TalkAppendString(varMap," ")
					x270201_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
					StopTalkTask()
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,3)
					DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270201_var_FileId, x270201_var_QuestId); 
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
          SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)                                    	   
			end
  elseif x270201_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270201_var_QuestName)
			TalkAppendString(varMap,x270201_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x270201_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270201_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270201_var_QuestHelp )
			end
			x270201_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270201_var_FileId, x270201_var_QuestId);
  end
end

function x270201_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x270201_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x270201_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x270201_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270201_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 1 then
	        return 1
	end
	return 0
end

function x270201_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270201_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270201_var_QuestId  )
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
		if x270201_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270201_var_QuestId, x270201_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270201_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270201_var_QuestId)                                                  
	    					--SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end

function x270201_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270201_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270201_var_QuestId)
	  x270201_Msg2toplayer( varMap, varPlayer,1)
	  
end

function x270201_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270201_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x270201_var_BonusChoiceItem do
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

function x270201_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270201_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270201_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270201_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270201_var_QuestId) > 0 then
				x270201_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270201_var_QuestId)
				QuestCom(varMap, varPlayer, 3240)
				x270201_GetBonus( varMap, varPlayer,varTalknpc)
				
					
				
				
					
				
			  
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270201_var_QuestIdNext )	
   end
end

function x270201_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270201_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270201_var_ExpBonus);
  	end
		if x270201_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270201_var_BonusMoney1 )
	  end
		if x270201_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270201_var_BonusMoney2 )
	  end
		if x270201_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270201_var_BonusMoney3 )
		end
		if x270201_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270201_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270201_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270201_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270201_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270201_var_BonusMoney6)
		end
end

function x270201_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270201_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270201_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270201_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270201_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270201_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270201_var_QuestName.."！", 0, 3)
				if x270201_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x270201_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x270201_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x270201_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x270201_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x270201_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x270201_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x270201_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x270201_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x270201_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x270201_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x270201_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x270201_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x270201_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x270201_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x270201_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270201_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270201_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270201_var_QuestId, 7, -1 )
		end
end



function x270201_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x270201_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270201_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270201_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270201_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270201_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270201_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270201_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270201_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270201_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270201_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
