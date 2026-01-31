

--DECLARE_QUEST_INFO_START--
x203370_var_FileId = 203370
x203370_var_QuestIdPre =3205
x203370_var_QuestId =3206
x203370_var_LevelLess	= 	1 
x203370_var_QuestIdNext = 3211
x203370_var_Name	={}
x203370_var_ExtTarget={{type=20,n=1,target="采集一朵@npc_80001"}}
x203370_var_QuestName="【新手】塔娜的请求"
x203370_var_QuestInfo="\t鹿茸是有了，可是要想这药的效果神奇，听圣山的钥匙老人说，还得有那雪山脚下生长的赤龙胆草做药引。\n\t看见我身后小河了么，你仔细找找，一定能帮我找到那美丽的赤龙胆草的！"  
x203370_var_QuestTarget="  采集一朵@npc_80001"		
x203370_var_QuestCompleted="\t噢，真是太感谢你了。这些生病的马总算是有药可医了！"					
x203370_var_ContinueInfo="\t河边很美，不是么？"
x203370_var_QuestHelp =	""
x203370_var_DemandItem ={13810500}
x203370_var_ExpBonus = 230
x203370_var_BonusMoney1 =5
x203370_var_BonusMoney2 =0
x203370_var_BonusMoney3 =0
x203370_var_BonusMoney4 =0
x203370_var_BonusMoney5 =12
x203370_var_BonusMoney6 =0
x203370_var_BonusChoiceItem ={}
x203370_var_BonusItem	=	{}
x203370_var_NpcGUID ={{ guid = 137833, varName = "驯马大师"}}
x203370_var_GroupPoint	=	{ {type=10,varId =230,target = "赤龙胆草"} }
--DECLARE_QUEST_INFO_STOP--
x203370_var_NPCTalk = {
"父亲说，这草原上的赤龙胆草，是长生天赐给我们的宝贝。",
}

function x203370_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 )
   
	if IsQuestHaveDone(varMap, varPlayer, x203370_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203370_var_QuestIdPre)> 0 then
	  
	  if IsHaveQuest(varMap,varPlayer, x203370_var_QuestId) <= 0 then
			x203370_CheckSubmit(varMap, varPlayer, varTalknpc)
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203370_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203370_var_QuestId, varState, -1 )
		
		end
	end
end

function x203370_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203370_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203370_var_ExpBonus )
		end
		if x203370_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203370_var_BonusMoney1 )
		end
		if x203370_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203370_var_BonusMoney2 )
		end
		if x203370_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203370_var_BonusMoney3 )
		end
		if x203370_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203370_var_BonusMoney4 )
		end
		if x203370_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203370_var_BonusMoney5 )
		end
		if x203370_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203370_var_BonusMoney6 )
		end
		for varI, item in x203370_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203370_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203370_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203370_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203370_var_QuestId) > 0 then
			if x203370_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203370_var_QuestName)
						TalkAppendString(varMap,x203370_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203370_var_FileId, x203370_var_QuestId);
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 )
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203370_var_QuestName)
						TalkAppendString(varMap,x203370_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203370_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203370_var_FileId, x203370_var_QuestId);
			end
  elseif x203370_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
  			
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203370_var_QuestName)
			TalkAppendString(varMap,x203370_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x203370_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203370_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203370_var_QuestHelp )
			end
			x203370_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203370_var_FileId, x203370_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
			--NpcTalk(varMap,varTalknpc,x203370_var_NPCTalk[2],varPlayer)
  end
	
end


function x203370_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203370_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203370_CheckSubmit( varMap, varPlayer, varTalknpc)
		
		if GetItemCount(varMap,varPlayer,x203370_var_DemandItem[1]) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203370_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 ) 
	    		return 1
	    		
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203370_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
	  return 0
	
end

function x203370_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203370_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203370_var_QuestId  )
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
		if x203370_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203370_var_QuestId, x203370_var_FileId, 1, 1, 1,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
	    		
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,1 )
	    							for varI, item in x203370_var_DemandItem do                                            
	    								if GetItemCount(varMap,varPlayer,item) >= 1 then		                              
	    									local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203370_var_QuestId)        
	    			    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                			
	    			    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1) 
	    			    			end                               			
	    					end
	    			end
		  		end
	 	end                                                                    
	     



function x203370_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203370_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203370_var_QuestId)
	 	 x203370_Msg2toplayer( varMap, varPlayer,1)
		local num = GetItemCount(varMap, varPlayer,x203370_var_DemandItem[1])
		  if num >0 then
		  DelItem(varMap, varPlayer,x203370_var_DemandItem[1],num)
		  end
			
end

function x203370_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203370_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203370_var_BonusChoiceItem do
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

function x203370_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203370_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203370_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203370_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203370_var_QuestId) > 0 then
				x203370_Msg2toplayer( varMap, varPlayer,2)			
				QuestCom(varMap, varPlayer, x203370_var_QuestId)
				
				x203370_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203370_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203370_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		if DelItem( varMap,varPlayer,x203370_var_DemandItem[1],1 ) ~= 1 then return 0 end
    		--DeliverItemListSendToPlayer(varMap,varPlayer)
   end    
   LuaCallNoclosure( 203376, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203370_var_QuestIdNext )	
end

function x203370_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203370_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203370_var_ExpBonus);
  	end
		if x203370_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203370_var_BonusMoney1 )
	  end
		if x203370_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203370_var_BonusMoney2 )
	  end
		if x203370_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203370_var_BonusMoney3 )
		end
		if x203370_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203370_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203370_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203370_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203370_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203370_var_BonusMoney6)
		end
end

function x203370_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203370_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203370_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203370_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203370_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203370_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203370_var_QuestName.."！", 0, 3)
				if x203370_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203370_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203370_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203370_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203370_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203370_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203370_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203370_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203370_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203370_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203370_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203370_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203370_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203370_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203370_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203370_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203370_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203370_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203370_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

		if GetItemCount(varMap,varPlayer,x203370_var_DemandItem[1]) >= 1 then
			
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203370_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 ) 
	    	--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203370_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
end

function x203370_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )  
   local bFind  = 0                                                             
  for varI ,item in x203370_var_NpcGUID do                                          
     if item.guid == varTalkNpcGUID then                                             
        bFind = 1                                                            
        break                                                                
     end                                                                      
   end                                                                          
   if bFind == 0 then                                                           
    return                                                                   
    end                                                                          
  if IsHaveQuest(varMap,varPlayer, x203370_var_QuestId) > 0 then                 
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203370_var_QuestId)  
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203370_var_QuestId, varState, -1 ) 
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 )
	end
end    
                                                                      
function x203370_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203370_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203370_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203370_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203370_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203370_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
