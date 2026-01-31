

--DECLARE_QUEST_INFO_START--
x270101_var_FileId = 270101
x270101_var_QuestIdPre = 3132
x270101_var_QuestId = 3131
x270101_var_LevelLess	= 65 

x270101_var_DemandKill ={}
x270101_var_Name	={}
x270101_var_ExtTarget={{type=20,n=1,target="@npc_140910找到#G陶录#W兑换钻石原石"}}
x270101_var_QuestName="【个人】换取钻石"
x270101_var_QuestInfo="\t既然都是熟人介绍，我也不妨对你明言，装备升星所需要的钻石和金刚必须使用钻石原石来提炼，钻石原石的唯一出处就在钧窑。\n\t你可以通过石不破进入钧窑，帮助陶录击败怪物后，可使用次生或原生钻石矿和他兑换成钻石原石，石不破就在西边，你现在就可以去找他。钻石原石是勇气和力量的象征，如果你能交给我一颗原石，我将免费送给你两颗这种原石，快去吧，你一生只有这一次机会！"  
x270101_var_QuestTarget="@npc_140910找到#G陶录#W兑换钻石原石"		
x270101_var_QuestCompleted="\t等你拿到了一定数量的钻石原石就可以在我这里兑换成打造极品星装的钻石或者金刚。"
x270101_var_ContinueInfo="\t如果你能交给我一颗原石，我将免费送给你两颗这种原石，快去吧，你一生只有这一次机会！"
x270101_var_QuestHelp =	""
x270101_var_DemandItem ={11990113}
x270101_var_BonusMoney1 =0
x270101_var_BonusMoney2 =0
x270101_var_BonusMoney3 =0
x270101_var_BonusMoney4 =0
x270101_var_BonusMoney5 =0
x270101_var_BonusMoney6 =0
x270101_var_BonusItem	={{varId=11990113,varNum=2}}
x270101_var_BonusChoiceItem ={}
x270101_var_ExpBonus = 10000









--DECLARE_QUEST_INFO_STOP--


function x270101_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
   
	if IsQuestHaveDone(varMap, varPlayer, x270101_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270101_var_QuestIdPre)> 0 then 
			
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270101_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270101_var_QuestId, varState, -1 )
			
	end
end

function x270101_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270101_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270101_var_ExpBonus )
		end
		if x270101_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270101_var_BonusMoney1 )
		end
		if x270101_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270101_var_BonusMoney2 )
		end
		if x270101_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270101_var_BonusMoney3 )
		end
		if x270101_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270101_var_BonusMoney4 )
		end
		if x270101_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270101_var_BonusMoney5 )
		end
		if x270101_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270101_var_BonusMoney6 )
		end
		for varI, item in x270101_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x270101_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end





function x270101_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x270101_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270101_var_QuestId) > 0 then
			if x270101_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270101_var_QuestName)
						TalkAppendString(varMap,x270101_var_ContinueInfo)
					  
					  
						
					StopTalkTask()
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc);
			else
          
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270101_var_QuestName)
						TalkAppendString(varMap,x270101_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270101_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270101_var_FileId, x270101_var_QuestId);
			end
  elseif x270101_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270101_var_QuestName)
			TalkAppendString(varMap,x270101_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270101_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270101_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270101_var_QuestHelp )
			end
			x270101_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270101_var_FileId, x270101_var_QuestId);
  end
end

function x270101_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x270101_var_QuestId) > 0 then
		return 0
	elseif GetLevel(varMap, varPlayer)< x270101_var_LevelLess then
		return 0
	end
	return 1
	
end

function x270101_CheckSubmit( varMap, varPlayer, varTalknpc)
		if  IsHaveQuest(varMap, varPlayer,x270101_var_QuestId) ~=1 then
			return 0
		end
		
	   	local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x270101_var_QuestId)                                                  
	   	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	   		return 1
	   	else 
	   		return 0
	   	end
	   	
end

function x270101_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		
		
		if IsQuestHaveDone(varMap, varPlayer, x270101_var_QuestId) > 0 then
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270101_var_QuestId  )
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
		if x270101_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270101_var_QuestId, x270101_var_FileId, 0, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "任务已满，无法接受任务！", 0, 3)
						return 0
					else
		  			
            
						x270101_Msg2toplayer( varMap, varPlayer,0)
						
					for varI, item in x270101_var_DemandItem do
						if GetItemCount(varMap,varPlayer,item) >= 1 then		
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270101_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						end
					end
	    			
		  		end
	 	end                                                                    
	     
end

function x270101_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270101_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270101_var_QuestId)

	  x270101_Msg2toplayer( varMap, varPlayer,1)
end

function x270101_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270101_var_BonusItem do
		ItemAppendBind( varMap, item.varId, item.varNum )
  end
  for j, item in x270101_var_BonusChoiceItem do
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

function x270101_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
  
  
	if IsHaveQuest(varMap,varPlayer, x270101_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270101_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270101_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270101_var_QuestId) > 0 then
				x270101_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270101_var_QuestId)
				
				
				
				
				
        x270101_GetBonus( varMap, varPlayer,varTalknpc)			
				StartItemTask(varMap)
				for varI, item in x270101_var_BonusItem do
 						ItemAppendBind( varMap, item.varId, item.varNum )
				end
				for varI, item in x270101_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		    end
    		    
    		    StopItemTask(varMap,varPlayer)
    		    DeliverItemListSendToPlayer(varMap,varPlayer)
						if DelItem(varMap, varPlayer, x270101_var_DemandItem[1], 1) ~= 1 then return 0 end
				
				
   end
end

function x270101_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

   
end

function x270101_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270101_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270101_var_ExpBonus);
  	end
		if x270101_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270101_var_BonusMoney1 )
	  end
		if x270101_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270101_var_BonusMoney2 )
	  end
		if x270101_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270101_var_BonusMoney3 )
		end
		if x270101_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270101_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270101_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270101_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270101_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270101_var_BonusMoney6)
		end
end



function x270101_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

 
	
	
	
 
 
 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
 
	
	
	
	
	
 
 
 
 
 
end


function x270101_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x270101_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x270101_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x270101_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x270101_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务："..x270101_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务："..x270101_var_QuestName.."！", 0, 3)
				if x270101_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270101_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270101_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270101_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270101_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270101_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270101_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270101_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270101_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270101_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270101_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270101_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270101_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270101_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end
function x270101_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270101_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270101_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270101_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest,optype)
	if	optype	==	0	then
		return
	end
	
	for varI, item in x270101_var_DemandItem do
	
		if varItemData == item then

			if GetItemCount(varMap,varPlayer,item) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270101_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		  	else
		  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270101_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
		  	end
		  	
		  	break
	  	
	  	end
	  	
	end

end


function x270101_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270101_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270101_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270101_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270101_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270101_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





