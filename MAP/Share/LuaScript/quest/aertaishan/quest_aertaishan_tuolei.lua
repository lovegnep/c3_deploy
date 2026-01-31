

--DECLARE_QUEST_INFO_START--
x203110_var_FileId = 203110
x203110_var_QuestIdPre =-1
x203110_var_QuestId = 500
x203110_var_LevelLess	= 	60 
x203110_var_MaxLevel  =   90
x203110_var_QuestIdNext = 501
x203110_var_Name	={"铁木真"}
x203110_var_ExtTarget={{type=20,n=1,target="和@npc_111000交谈"}}
x203110_var_QuestName="【剧场】千里追袭"
x203110_var_QuestTalk={"这西夏军却为何在此地？","看来我军此次势在必得！","的确如此。"}
x203110_var_QuestInfo="\t#Y@myname#W，很高兴再次见到你。这次我率领大军深入这阿尔金山腹地，为的就是除掉那罪魁祸首--瓣Ч肅瑇疨"  
x203110_var_QuestTarget=""		
x203110_var_QuestCompleted="\t高级的技能能让你更轻松的解决掉你的敌人，所以记得当你的等级提高以后经常回来学习新的技能。\n\t人不能一口吃成胖子，但胖子却是一口一口吃出来的。持之以恒的练习，才能成为一代宗师。"
x203110_var_ContinueInfo={"\t此次父汗命我亲率西征十万大军，深入阿尔金山，誓要拦住完颜洪烈，决不能让他逃出中土！",
												"\t当年，完颜洪烈也曾在西夏国犯下累累罪行，听说他兵败后逃入此地，西夏国主自愿派出其国内的精锐军队，协助我军追击那完颜洪烈。",
												"\t当年在塔塔尔部，完颜老贼曾试图在背后偷袭我军，如今的局势，真可谓天网恢恢，疏而不漏。此次我蒙古和西夏合作，他定然逃不出这阿尔金山！"}
x203110_var_QuestHelp =	""
x203110_var_DemandItem ={}
x203110_var_ExpBonus = 214000
x203110_var_BonusMoney1 =376
x203110_var_BonusMoney2 =0
x203110_var_BonusMoney3 =0
x203110_var_BonusMoney4 =0
x203110_var_BonusMoney5 =71
x203110_var_BonusMoney6 =0
x203110_var_BonusItem	=	{}
x203110_var_BonusChoiceItem ={}
x203110_var_NpcGUID = { }
--DECLARE_QUEST_INFO_STOP--

function x203110_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203110_var_LevelLess or varLevel > x203110_var_MaxLevel then
		return
	end
	if IsQuestHaveDone(varMap, varPlayer, x203110_var_QuestId) > 0 then
		return 
	end
	if GetLevel(varMap, varPlayer)>= x203110_var_LevelLess then
			
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203110_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203110_var_QuestId, varState, -1 )
		
	end
end

function x203110_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203110_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203110_var_ExpBonus )
		end
		if x203110_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203110_var_BonusMoney1 )
		end
		if x203110_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203110_var_BonusMoney2 )
		end
		if x203110_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203110_var_BonusMoney3 )
		end
		if x203110_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203110_var_BonusMoney4 )
		end
		if x203110_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203110_var_BonusMoney5 )
		end
		if x203110_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203110_var_BonusMoney6 )
		end
		for varI, item in x203110_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203110_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203110_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x203110_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203110_var_QuestId) > 0 then
			if x203110_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203110_var_QuestName)
						TalkAppendString(varMap,x203110_var_ContinueInfo[1])
						TalkAppendButton(varMap, varQuest, x203110_var_QuestTalk[1],0,0)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203110_var_FileId, x203110_var_QuestId);
					elseif which ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203110_var_QuestName)
						TalkAppendString(varMap,x203110_var_ContinueInfo[2])
						TalkAppendButton(varMap, varQuest, x203110_var_QuestTalk[2],1,1)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203110_var_FileId, x203110_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203110_var_QuestId)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)                                                
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203110_var_QuestName)
						TalkAppendString(varMap,x203110_var_ContinueInfo[3])
						TalkAppendString(varMap," ")
						x203110_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203110_var_FileId, x203110_var_QuestId);
			end
  elseif x203110_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203110_var_QuestName)
			TalkAppendString(varMap,x203110_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203110_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203110_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203110_var_QuestHelp )
			end
			x203110_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203110_var_FileId, x203110_var_QuestId);
  end
end

function x203110_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203110_var_QuestId) > 0 then
		return 0
	elseif GetLevel(varMap, varPlayer)< x203110_var_LevelLess then
		return 0
	end
	return 1
end

function x203110_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203110_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 1 then
	        return 1
	end
	return 0
end

function x203110_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203110_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203110_var_QuestId  )
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
		
		if x203110_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203110_var_QuestId, x203110_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203110_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203110_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end

function x203110_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203110_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203110_var_QuestId)
	  x203110_Msg2toplayer( varMap, varPlayer,1)
end

function x203110_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203110_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203110_var_BonusChoiceItem do
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

function x203110_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203110_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203110_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203110_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203110_var_QuestId) > 0 then
				x203110_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203110_var_QuestId)
				x203110_GetBonus( varMap, varPlayer,varTalknpc)
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203110_var_QuestIdNext )	
   end
end

function x203110_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
   
end

function x203110_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203110_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203110_var_ExpBonus);
  	end
		if x203110_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203110_var_BonusMoney1 )
	  end
		if x203110_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203110_var_BonusMoney2 )
	  end
		if x203110_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203110_var_BonusMoney3 )
		end
		if x203110_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203110_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203110_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203110_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203110_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203110_var_BonusMoney6)
		end
end

function x203110_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203110_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203110_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203110_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203110_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203110_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203110_var_QuestName.."！", 0, 3)
				if x203110_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203110_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203110_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203110_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203110_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203110_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203110_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203110_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203110_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203110_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203110_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203110_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203110_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203110_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end



function x203110_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203110_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203110_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203110_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203110_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203110_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203110_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203110_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203110_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203110_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203110_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





