

--DECLARE_QUEST_INFO_START--
x203829_var_FileId = 203829
x203829_var_QuestIdPre = -1
x203829_var_QuestId = 4082
x203829_var_LevelLess	= 	80 
x203829_var_QuestIdNext = -1
x203829_var_Name	={}
x203829_var_ExtTarget={{type=20,n=1,target="在@npc_141103处完成一次专攻训练"}}
x203829_var_QuestName="【引导】攻无不克"
x203829_var_QuestInfo="\t学习专精天赋之后可以提升你对其他玩家的伤害。现在你就将专攻点数分配到自身之上吧。\n \n#G小提示:#W\n\t1.学习专精天赋需要#R天赋等级达到50级以上#W。\n\t2.学习专精天赋方法：与大都专精天赋大师对话，选择【专攻训练】打开专攻分配介面，将自己的剩余点数分配到相应职业上。"  
x203829_var_QuestTarget=""		
x203829_var_QuestCompleted="\t很好，这是一个好的开始。继续学习专精天赋的话，你对其他玩家的伤害会更高。"					
x203829_var_ContinueInfo="\t你不想让自己更加强大起来吗？\n天赋等级到达50级后，可以找我进行专精天赋专攻训练，提高自己对某一特定职业的伤害。"
x203829_var_QuestHelp =	""
x203829_var_DemandItem ={}
x203829_var_ExpBonus = 500000
x203829_var_BonusMoney1 =800
x203829_var_BonusMoney2 =0
x203829_var_BonusMoney3 =0
x203829_var_BonusMoney4 =0
x203829_var_BonusMoney5 =90
x203829_var_BonusMoney6 =0
x203829_var_BonusItem	=	{}
x203829_var_BonusChoiceItem ={}
x203829_var_NpcGUID ={{ guid = 141103, varName = "专精天赋大师"} }
--DECLARE_QUEST_INFO_STOP--


x203829_var_MaxLevel      = 120

function x203829_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
     local varLevel = GetLevel(varMap, varPlayer)
	   if varLevel < x203829_var_LevelLess or varLevel >= x203829_var_MaxLevel then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x203829_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x203829_var_QuestId) <= 0 then
		
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203829_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203829_var_QuestId, varState, -1 )
		end
	

end

function x203829_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203829_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203829_var_ExpBonus )
		end
		if x203829_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203829_var_BonusMoney1 )
		end
		if x203829_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203829_var_BonusMoney2 )
		end
		if x203829_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203829_var_BonusMoney3 )
		end
		if x203829_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203829_var_BonusMoney4 )
		end
		if x203829_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203829_var_BonusMoney5 )
		end
		if x203829_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203829_var_BonusMoney6 )
		end
		for varI, item in x203829_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x203829_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x203829_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203829_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203829_var_QuestId) > 0 then
			if x203829_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203829_var_QuestName)
				TalkAppendString(varMap,x203829_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203829_var_FileId, x203829_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203829_var_QuestName)
				TalkAppendString(varMap,x203829_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x203829_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203829_var_FileId, x203829_var_QuestId);
			end
  elseif x203829_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203829_var_QuestName)
			TalkAppendString(varMap,x203829_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203829_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203829_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203829_var_QuestHelp )
			end
			x203829_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203829_var_FileId, x203829_var_QuestId);
  end
	
end


function x203829_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x203829_CheckSubmit( varMap, varPlayer, varTalknpc)                                                 
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203829_var_QuestId)
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
	    return 1
	else
	    return 0
	end
end


function x203829_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203829_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203829_var_QuestId  )
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
		
		if x203829_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203829_var_QuestId, x203829_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203829_Msg2toplayer( varMap, varPlayer,0)
					
					local retComplete = GetPlayerGameData( varMap, varPlayer, MD_ZHUANGONG_COEFFICIENT[1], MD_ZHUANGONG_COEFFICIENT[2], MD_ZHUANGONG_COEFFICIENT[3] )
					if retComplete == 1 then
						local misidx = GetQuestIndexByID(varMap,varPlayer,x203829_var_QuestId)
						SetQuestByIndex(varMap,varPlayer,misidx,0,1)
						SetQuestByIndex(varMap,varPlayer,misidx,7,1)
					end
				end
	 	end                                                                    
	     
end


function x203829_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203829_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203829_var_QuestId)
	  x203829_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203829_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203829_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x203829_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppendBind( varMap, item.item, item.n )
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

function x203829_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203829_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203829_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203829_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203829_var_QuestId) > 0 then
				x203829_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203829_var_QuestId)
				x203829_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203829_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x203829_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x203829_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203829_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203829_var_ExpBonus);
  	end
		if x203829_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203829_var_BonusMoney1 )
	  end
		if x203829_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203829_var_BonusMoney2 )
	  end
		if x203829_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203829_var_BonusMoney3 )
		end
		if x203829_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203829_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203829_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203829_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203829_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203829_var_BonusMoney6)
		end
end

function x203829_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203829_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203829_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203829_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203829_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203829_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203829_var_QuestName.."！", 0, 3)
				if x203829_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203829_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203829_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203829_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203829_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203829_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203829_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203829_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203829_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203829_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203829_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203829_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203829_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203829_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203829_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203829_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203829_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203829_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203829_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203829_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203829_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203829_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203829_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203829_var_QuestId, varState, -1 )
		end
end

function x203829_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203829_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203829_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203829_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203829_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203829_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
