

--DECLARE_QUEST_INFO_START--
x256057_var_FileId = 256057
x256057_var_QuestIdPre =1607
x256057_var_QuestId = 1608
x256057_var_QuestIdNext = 1609
x256057_var_LevelLess	= 	10
x256057_var_Name	={}
x256057_var_ExtTarget={{type=20,n=1,target="去@npc_82003烤鱼"}}
x256057_var_QuestName="【主线】头领的要求<二>"
x256057_var_QuestInfo="\t（胡和鲁瞪着眼睛对你大吼）\n\t你还愣着干什么，还不快把鱼给老子烤熟了！惹急了，我拿你下酒！"  
x256057_var_QuestTarget=""		
x256057_var_QuestCompleted="\t真没看出来，你烤的这鱼还真不错，明天不用原来那个阿六送了，以后就你来吧。"					
x256057_var_ContinueInfo="\t烤鱼呢！"
x256057_var_QuestHelp =	"#G胡和鲁前方就有一个火堆，看起来很适合烤鱼。"
x256057_var_DemandItem ={{varId=13030089,varNum=1}}
x256057_var_BonusMoney1 =176
x256057_var_BonusMoney2 =0
x256057_var_BonusMoney3 =0
x256057_var_BonusMoney4 =0
x256057_var_BonusMoney5 =21
x256057_var_BonusMoney6 =0
x256057_var_BonusItem	=	{}
x256057_var_BonusChoiceItem ={}
x256057_var_ExpBonus = 1140
x256057_var_NpcGUID ={}
x256057_var_GroupPoint	=	{ {type=10,varId =178,target = "火堆"} }
--DECLARE_QUEST_INFO_STOP--


function x256057_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x256057_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x256057_var_QuestIdPre)> 0 then 
			
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256057_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256057_var_QuestId, varState, -1 )
		
	end
end

function x256057_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256057_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256057_var_ExpBonus )
		end
		if x256057_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256057_var_BonusMoney1 )
		end
		if x256057_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256057_var_BonusMoney2 )
		end
		if x256057_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256057_var_BonusMoney3 )
		end
		if x256057_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256057_var_BonusMoney4 )
		end
		if x256057_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256057_var_BonusMoney5 )
		end
		if x256057_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256057_var_BonusMoney6 )
		end
		for varI, item in x256057_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256057_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256057_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256057_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256057_var_QuestId) > 0 then
			if x256057_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256057_var_QuestName)
						TalkAppendString(varMap,x256057_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256057_var_FileId, x256057_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256057_var_QuestName)
						TalkAppendString(varMap,x256057_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256057_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256057_var_FileId, x256057_var_QuestId);
			end
  elseif x256057_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256057_var_QuestName)
			TalkAppendString(varMap,x256057_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256057_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256057_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256057_var_QuestHelp )
			end
			x256057_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256057_var_FileId, x256057_var_QuestId);
  end
	
end


function x256057_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x256057_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x256057_CheckSubmit( varMap, varPlayer, varTalknpc)
		if GetItemCount(varMap,varPlayer,x256057_var_DemandItem[1].varId) >= x256057_var_DemandItem[1].varNum then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256057_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256057_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
	  return 0
	
end

function x256057_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256057_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256057_var_QuestId  )
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
		
		if x256057_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256057_var_QuestId, x256057_var_FileId, 0, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
									StartItemTask(varMap)   
									ItemAppend( varMap,13030087, 1 ) 
									StopTalkTask()
									TalkAppendString(varMap,"您获得了物品：鲜鱼")
			  					
			 					 DeliverItemListSendToPlayer(varMap,varPlayer) 
		  			x256057_Msg2toplayer( varMap, varPlayer,0)
		  			x256057_ProcQuestItemChanged(varMap, varPlayer, -1, varQuest)
						if x256057_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256057_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x256057_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256057_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256057_var_QuestId)
		if DelItem(varMap, varPlayer, 13030087, 1) ~= 1 then return 0 end
		if DelItem(varMap, varPlayer, 13030089, 1) ~= 1 then return 0 end
		
	  x256057_Msg2toplayer( varMap, varPlayer,1)
	  
end

function x256057_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256057_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256057_var_BonusChoiceItem do
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

function x256057_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256057_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256057_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256057_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256057_var_QuestId) > 0 then
				x256057_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256057_var_QuestId)
				x256057_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256057_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256057_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		for varI, item in x256057_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		
    		LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256057_var_QuestIdNext )	
   end
end

function x256057_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256057_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256057_var_ExpBonus);
  	end
		if x256057_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256057_var_BonusMoney1 )
	  end
		if x256057_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256057_var_BonusMoney2 )
	  end
		if x256057_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256057_var_BonusMoney3 )
		end
		if x256057_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256057_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256057_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256057_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256057_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256057_var_BonusMoney6)
		end
end

function x256057_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256057_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256057_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256057_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256057_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256057_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256057_var_QuestName.."！", 0, 3)
				if x256057_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256057_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256057_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256057_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256057_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256057_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256057_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256057_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256057_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256057_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256057_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256057_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256057_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256057_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256057_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256057_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256057_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256057_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256057_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
		if GetItemCount(varMap,varPlayer,x256057_var_DemandItem[1].varId) >= x256057_var_DemandItem[1].varNum then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256057_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetItemCount(varMap,varPlayer,x256057_var_DemandItem[1].varId))
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256057_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetItemCount(varMap,varPlayer,x256057_var_DemandItem[1].varId))
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
end


function x256057_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x256057_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256057_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256057_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256057_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256057_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256057_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
