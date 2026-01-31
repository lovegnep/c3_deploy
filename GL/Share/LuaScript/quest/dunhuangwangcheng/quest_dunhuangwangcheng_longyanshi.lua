

--DECLARE_QUEST_INFO_START--
x256228_var_FileId = 256228
x256228_var_QuestIdPre = 1306
x256228_var_QuestId = 3090
x256228_var_LevelLess	= 	36
x256228_var_QuestIdNext = -1
x256228_var_Name	={}
x256228_var_ExtTarget={{type=20,n=1,target="询问@npc_138563"}}
x256228_var_QuestName="【个人】珍宝龙眼石"
x256228_var_QuestInfo="\t前几天我击败了盗墓贼之后缴获了几颗龙眼石，我还不知有何作用，请你帮我去请教一下@npc_138563，她对这些东西很有研究，问问这些龙眼石有什么作用。"  
x256228_var_QuestTarget=""		
x256228_var_QuestCompleted="\t龙眼石本是炼金的极品材料，如今可是取之不易啊！你如果对此物感兴趣我倒是可以赠与你几颗 。"					
x256228_var_ContinueInfo=""
x256228_var_QuestHelp =	""
x256228_var_DemandItem ={}
x256228_var_BonusMoney1 =176
x256228_var_BonusMoney2 =0
x256228_var_BonusMoney3 =0
x256228_var_BonusMoney4 =0
x256228_var_BonusMoney5 =21
x256228_var_BonusMoney6 =0
x256228_var_BonusItem	=	{{item=11050001,n=15}}
x256228_var_BonusChoiceItem ={}
x256228_var_ExpBonus = 24000
x256228_var_NpcGUID ={{ guid = 138563, varName = "龙眼石兑换"} }
--DECLARE_QUEST_INFO_STOP--

x256228_var_MaxLevel   = 40

function x256228_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
  local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256228_var_LevelLess or varLevel >= x256228_var_MaxLevel then
	return 
	end
	
	


	if IsQuestHaveDone(varMap, varPlayer, x256228_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x256228_var_QuestIdPre)> 0 then

						if IsHaveQuest(varMap,varPlayer, x256228_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256228_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256228_var_QuestId, varState, -1 )
						end
		
	end
end

function x256228_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256228_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256228_var_ExpBonus )
		end
		if x256228_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256228_var_BonusMoney1 )
		end
		if x256228_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256228_var_BonusMoney2 )
		end
		if x256228_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256228_var_BonusMoney3 )
		end
		if x256228_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256228_var_BonusMoney4 )
		end
		if x256228_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256228_var_BonusMoney5 )
		end
		if x256228_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256228_var_BonusMoney6 )
		end
		for varI, item in x256228_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256228_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256228_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256228_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256228_var_QuestId) > 0 then
			if x256228_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256228_var_QuestName)
						TalkAppendString(varMap,x256228_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256228_var_FileId, x256228_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256228_var_QuestName)
						TalkAppendString(varMap,x256228_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256228_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256228_var_FileId, x256228_var_QuestId);
			end
  elseif x256228_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256228_var_QuestName)
			TalkAppendString(varMap,x256228_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256228_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256228_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256228_var_QuestHelp )
			end
			x256228_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256228_var_FileId, x256228_var_QuestId);
  end
	
end


function x256228_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x256228_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x256228_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256228_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256228_var_QuestId  )
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
		
		if x256228_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256228_var_QuestId, x256228_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256228_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256228_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x256228_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256228_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256228_var_QuestId)
	  x256228_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256228_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256228_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256228_var_BonusChoiceItem do
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

function x256228_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256228_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256228_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256228_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256228_var_QuestId) > 0 then
				x256228_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256228_var_QuestId)
				x256228_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256228_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256228_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   
end

function x256228_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256228_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256228_var_ExpBonus);
  	end
		if x256228_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256228_var_BonusMoney1 )
	  end
		if x256228_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256228_var_BonusMoney2 )
	  end
		if x256228_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256228_var_BonusMoney3 )
		end
		if x256228_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256228_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256228_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256228_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256228_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256228_var_BonusMoney6)
		end
end

function x256228_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x256228_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x256228_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256228_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256228_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256228_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256228_var_QuestName.."！", 0, 3)
				if x256228_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256228_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256228_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256228_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256228_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256228_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256228_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256228_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256228_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256228_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256228_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256228_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256228_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256228_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256228_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256228_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	

end

function x256228_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	
		
end

function x256228_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	
end

function x256228_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end


function x256228_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256228_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256228_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256228_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256228_var_QuestId, varState, -1 )
		end
end

function x256228_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
end

function x256228_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	
end

function x256228_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256228_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
end

function x256228_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	
end

function x256228_OpenCheck( varMap, varPlayer, varTalknpc )
	
end
