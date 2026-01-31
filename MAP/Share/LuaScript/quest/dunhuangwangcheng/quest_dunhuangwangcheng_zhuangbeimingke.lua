

--DECLARE_QUEST_INFO_START--
x256303_var_FileId = 256303
x256303_var_QuestIdPre = -1
x256303_var_QuestId = 3950
x256303_var_LevelLess	= 	45
x256303_var_QuestIdNext = 3949
x256303_var_Name	={}
x256303_var_ExtTarget={{type=20,n=1,target="找到@npc_139052"}}
x256303_var_QuestName="【个人】装备铭刻（一）"
x256303_var_QuestInfo="\t在这大都之内有着一位出色的装备铭刻大师，他可以帮你把装备通过铭刻其他物品的方式提高装备属性，你倘若有兴趣不妨过去看一看。"  
x256303_var_QuestTarget=""		
x256303_var_QuestCompleted="\t你想把你的装备进行铭刻吗？\n\t其实王城中也有一位装备铭刻大师，你一定见过，只是没有打过交道吧 。"					
x256303_var_ContinueInfo=""
x256303_var_QuestHelp =	""
x256303_var_DemandItem ={}
x256303_var_BonusMoney1 =376
x256303_var_BonusMoney2 =0
x256303_var_BonusMoney3 =0
x256303_var_BonusMoney4 =0
x256303_var_BonusMoney5 =71
x256303_var_BonusMoney6 =0
x256303_var_BonusItem	=	{{item=11000302,n=1}}
x256303_var_BonusChoiceItem ={}
x256303_var_ExpBonus = 104000
x256303_var_NpcGUID ={{ guid = 139052, varName = "李定邦"} }
--DECLARE_QUEST_INFO_STOP--

x256303_var_MaxLevel   = 65

function x256303_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
  local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256303_var_LevelLess or varLevel > x256303_var_MaxLevel then
	return 
	end
	
	


	if IsQuestHaveDone(varMap, varPlayer, x256303_var_QuestId) > 0 then
		return 
	end
	

						if IsHaveQuest(varMap,varPlayer, x256303_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256303_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256303_var_QuestId, varState, -1 )
						end
		
	
end

function x256303_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256303_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256303_var_ExpBonus )
		end
		if x256303_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256303_var_BonusMoney1 )
		end
		if x256303_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256303_var_BonusMoney2 )
		end
		if x256303_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256303_var_BonusMoney3 )
		end
		if x256303_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256303_var_BonusMoney4 )
		end
		if x256303_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256303_var_BonusMoney5 )
		end
		if x256303_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256303_var_BonusMoney6 )
		end
		for varI, item in x256303_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256303_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256303_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256303_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256303_var_QuestId) > 0 then
			if x256303_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256303_var_QuestName)
						TalkAppendString(varMap,x256303_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256303_var_FileId, x256303_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256303_var_QuestName)
						TalkAppendString(varMap,x256303_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256303_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256303_var_FileId, x256303_var_QuestId);
			end
  elseif x256303_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256303_var_QuestName)
			TalkAppendString(varMap,x256303_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256303_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256303_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256303_var_QuestHelp )
			end
			x256303_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256303_var_FileId, x256303_var_QuestId);
  end
	
end


function x256303_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x256303_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x256303_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256303_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256303_var_QuestId  )
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
		
		if x256303_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256303_var_QuestId, x256303_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256303_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256303_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x256303_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256303_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256303_var_QuestId)
	  x256303_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256303_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256303_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x256303_var_BonusChoiceItem do
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

function x256303_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256303_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256303_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256303_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256303_var_QuestId) > 0 then
				x256303_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256303_var_QuestId)
				x256303_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256303_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256303_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256303_var_QuestIdNext )	
end

function x256303_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256303_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256303_var_ExpBonus);
  	end
		if x256303_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256303_var_BonusMoney1 )
	  end
		if x256303_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256303_var_BonusMoney2 )
	  end
		if x256303_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256303_var_BonusMoney3 )
		end
		if x256303_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256303_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256303_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256303_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256303_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256303_var_BonusMoney6)
		end
end

function x256303_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x256303_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x256303_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256303_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256303_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256303_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256303_var_QuestName.."！", 0, 3)
				if x256303_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256303_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256303_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256303_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256303_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256303_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256303_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256303_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256303_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256303_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256303_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256303_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256303_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256303_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256303_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256303_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	

end

function x256303_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	
		
end

function x256303_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	
end

function x256303_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end


function x256303_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256303_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256303_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256303_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256303_var_QuestId, varState, -1 )
		end
end

function x256303_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
end

function x256303_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	
end

function x256303_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256303_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256303_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	
end

function x256303_OpenCheck( varMap, varPlayer, varTalknpc )
	
end
