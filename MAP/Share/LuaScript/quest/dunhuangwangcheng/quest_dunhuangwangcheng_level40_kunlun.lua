

--DECLARE_QUEST_INFO_START--
x256258_var_FileId = 256258

x256258_var_QuestId = 1575
x256258_var_LevelLess	= 	37 
x256258_var_QuestIdNext = -1
x256258_var_Name	={}
x256258_var_ExtTarget={{type=20,n=1,target="按任务攻略的指引升级到40级"}}
x256258_var_QuestName="【个人】四十而明"
x256258_var_QuestInfo="\t又见面了，亲爱的朋友，是否在升级的途中感到有些疲惫？那么，请暂时的停下来，听我说说：\n\t和你的朋友一起每天@npcsp_前往轮回台_129009一次，是升级的最佳选择，@npc_129066会发布国家押运任务，@npc_131510会发布国家守边任务。\n\t也别忘记了那些老朋友@npc_129042，@npc_129179，@npc_129060，或者继续和你的朋友们@npcsp_前往三环副本_129041，当然，在@npc_129029领取双倍经验也是必不可少的。"  
x256258_var_QuestTarget=""		
x256258_var_QuestCompleted="\t四十级的你，已经具备在《成吉思汗3 恶狼传说》中立足的资本。\n\t我这里为你准备了一些小礼物，希望能对你今后的历程有所帮助。"					
x256258_var_ContinueInfo="别太心急，我为你的四十级准备了不少礼物，但是......你应该先到四十级再来。"
x256258_var_QuestHelp =	""
x256258_var_DemandItem ={}
x256258_var_ExpBonus = 1800000
x256258_var_BonusMoney1 =120000
x256258_var_BonusMoney2 =0
x256258_var_BonusMoney3 =0
x256258_var_BonusMoney4 =0
x256258_var_BonusMoney5 =2000
x256258_var_BonusMoney6 =0
x256258_var_BonusItem	=	{{item=11010002,n=1},{item=12030252,n=1},{item=11060002,n=1}}
x256258_var_BonusChoiceItem ={}
x256258_var_NpcGUID ={{ guid = 129056, varName = "万事通"} }
--DECLARE_QUEST_INFO_STOP--


x256258_var_MaxLevel      = 70

function x256258_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		local varLevel = GetLevel(varMap, varPlayer)
	  if varLevel < x256258_var_LevelLess or varLevel >= x256258_var_MaxLevel then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x256258_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x256258_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256258_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256258_var_QuestId, varState, -1 )
	end

end

function x256258_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256258_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256258_var_ExpBonus )
		end
		if x256258_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256258_var_BonusMoney1 )
		end
		if x256258_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256258_var_BonusMoney2 )
		end
		if x256258_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256258_var_BonusMoney3 )
		end
		if x256258_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256258_var_BonusMoney4 )
		end
		if x256258_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256258_var_BonusMoney5 )
		end
		if x256258_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256258_var_BonusMoney6 )
		end
		for varI, item in x256258_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x256258_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x256258_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256258_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256258_var_QuestId) > 0 then
			if x256258_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256258_var_QuestName)
				TalkAppendString(varMap,x256258_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256258_var_FileId, x256258_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256258_var_QuestName)
				TalkAppendString(varMap,x256258_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x256258_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256258_var_FileId, x256258_var_QuestId);
			end
  elseif x256258_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x256258_var_QuestName)
			TalkAppendString(varMap,x256258_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256258_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256258_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256258_var_QuestHelp )
			end
			x256258_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256258_var_FileId, x256258_var_QuestId);
  end
	
end


function x256258_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x256258_CheckSubmit( varMap, varPlayer, varTalknpc)                                                 
	if GetLevel(varMap, varPlayer)>= 40 then
	   return 1
	end
	 
	return 0
	
end


function x256258_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256258_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256258_var_QuestId  )
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
		
		if x256258_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256258_var_QuestId, x256258_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256258_Msg2toplayer( varMap, varPlayer,0)
					if GetLevel(varMap, varPlayer) >= 40 then
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256258_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x256258_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256258_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256258_var_QuestId)
	  x256258_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256258_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256258_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x256258_var_BonusChoiceItem do
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

function x256258_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256258_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256258_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256258_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256258_var_QuestId) > 0 then
				x256258_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256258_var_QuestId)
				x256258_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256258_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256258_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   
end

function x256258_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256258_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256258_var_ExpBonus);
  	end
		if x256258_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256258_var_BonusMoney1 )
	  end
		if x256258_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256258_var_BonusMoney2 )
	  end
		if x256258_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256258_var_BonusMoney3 )
		end
		if x256258_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256258_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256258_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256258_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256258_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256258_var_BonusMoney6)
		end
end

function x256258_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256258_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256258_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256258_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256258_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256258_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256258_var_QuestName.."！", 0, 3)
				if x256258_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256258_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256258_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256258_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256258_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256258_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256258_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256258_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256258_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256258_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256258_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256258_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256258_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256258_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256258_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256258_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256258_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256258_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256258_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256258_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256258_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256258_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256258_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256258_var_QuestId, varState, -1 )
		end
end

function x256258_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256258_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256258_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256258_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256258_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256258_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
