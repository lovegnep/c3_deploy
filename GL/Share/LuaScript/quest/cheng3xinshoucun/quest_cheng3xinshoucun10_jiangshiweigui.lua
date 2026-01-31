

--DECLARE_QUEST_INFO_START--
x203374_var_FileId = 203374
x203374_var_QuestIdPre =3208
x203374_var_QuestId =3209
x203374_var_LevelLess	= 	1 
x203374_var_QuestIdNext = 3210
x203374_var_Name	={}
x203374_var_ExtTarget={{type=20,n=1,target="救治@npc_80002"}}
x203374_var_QuestName="【新手】救助守卫"
x203374_var_QuestInfo="\t海都这个魔头，没想到他竟然在我们防备最松懈的时候前来偷袭，你去看看前几天去草原巡岗的几个将士，这些天他们一直没有回信，我怕他们遭遇什么不测！\n\t见到他们，一定要赶紧回来禀报！"  
x203374_var_QuestTarget="  救治@npc_80002"		
x203374_var_QuestCompleted="\t没想到，他们竟然真的遭遇了海都的偷袭，这个仇我们一定要报！\n\t这些装备你就拿着吧，穿上这战甲，吹响征战的号角吧！"					
x203374_var_ContinueInfo="\找到那些将士了么？"
x203374_var_QuestHelp =	""
x203374_var_DemandItem ={13010121}
x203374_var_ExpBonus = 1200
x203374_var_BonusMoney1 =5
x203374_var_BonusMoney2 =0
x203374_var_BonusMoney3 =0
x203374_var_BonusMoney4 =0
x203374_var_BonusMoney5 =12
x203374_var_BonusMoney6 =0
x203374_var_BonusChoiceItem ={}
x203374_var_BonusItem	=	{{item =13010122, n = 1}}
x203374_var_NpcGUID ={{ guid = 138007, varName = "铁力"}}
x203374_var_GroupPoint	=	{{type=10,varId =195,target = "新兵装备"}}
--DECLARE_QUEST_INFO_STOP--
x203374_var_NPCTalk ={
"总算打退了这些匪帮，去看看那些受伤的守卫，希望不要有太大的伤亡。",
"这件事很不正常，前面抓获了一个可疑的探子，你去审问一番，看能否问出点什么。",
}

function x203374_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
   --LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,0 )
   
	if IsQuestHaveDone(varMap, varPlayer, x203374_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203374_var_QuestIdPre)> 0 then
	  
	  if IsHaveQuest(varMap,varPlayer, x203374_var_QuestId) <= 0 then
			x203374_CheckSubmit(varMap, varPlayer, varTalknpc)
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203374_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203374_var_QuestId, varState, -1 )
		
		end
	end
end

function x203374_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203374_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203374_var_ExpBonus )
		end
		if x203374_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203374_var_BonusMoney1 )
		end
		if x203374_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203374_var_BonusMoney2 )
		end
		if x203374_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203374_var_BonusMoney3 )
		end
		if x203374_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203374_var_BonusMoney4 )
		end
		if x203374_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203374_var_BonusMoney5 )
		end
		if x203374_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203374_var_BonusMoney6 )
		end
		for varI, item in x203374_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203374_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203374_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203374_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203374_var_QuestId) > 0 then
			if x203374_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203374_var_QuestName)
						TalkAppendString(varMap,x203374_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203374_var_FileId, x203374_var_QuestId);
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 )
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203374_var_QuestName)
						TalkAppendString(varMap,x203374_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203374_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203374_var_FileId, x203374_var_QuestId);
			end
  elseif x203374_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203374_var_QuestName)
			TalkAppendString(varMap,x203374_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x203374_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203374_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203374_var_QuestHelp )
			end
			x203374_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203374_var_FileId, x203374_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
	
end


function x203374_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203374_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x203374_CheckSubmit( varMap, varPlayer, varTalknpc)
		
		if GetItemCount(varMap,varPlayer,x203374_var_DemandItem[1]) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203374_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 ) 
	    		return 1
	    		
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203374_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
	  return 0
	
end

function x203374_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203374_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203374_var_QuestId  )
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
		if x203374_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203374_var_QuestId, x203374_var_FileId, 1, 1, 1,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  		
		    		NpcTalk(varMap,varTalknpc,x203374_var_NPCTalk[1],varPlayer)
		
	    		
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,1 )
	    							for varI, item in x203374_var_DemandItem do                                            
	    								if GetItemCount(varMap,varPlayer,item) >= 1 then		                              
	    									local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203374_var_QuestId)        
	    			    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                			
	    			    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1) 
	    			    			end                               			
	    					end
	    			end
		  		end
	 	end                                                                    
	     



function x203374_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203374_var_QuestId) <= 0 then
				return 
		end
		
			if DelItem( varMap,varPlayer,x203374_var_DemandItem[1],1 ) ~= 1 then return 0 end
		DelQuest(varMap, varPlayer, x203374_var_QuestId)
	  x203374_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203374_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203374_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203374_var_BonusChoiceItem do
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

function x203374_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203374_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203374_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203374_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203374_var_QuestId) > 0 then
				x203374_Msg2toplayer( varMap, varPlayer,2)			
				QuestCom(varMap, varPlayer, x203374_var_QuestId)
				
				x203374_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203374_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203374_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		if DelItem( varMap,varPlayer,x203374_var_DemandItem[1],1 )    		 ~= 1 then return 0 end
    		DeliverItemListSendToPlayer(varMap,varPlayer)
    		NpcTalk(varMap,varTalknpc,x203374_var_NPCTalk[2],varPlayer)
    		--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,11,1 )
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,19,1 )
   end    
   LuaCallNoclosure( 203375, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203374_var_QuestIdNext )	
end

function x203374_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203374_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203374_var_ExpBonus);
  	end
		if x203374_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203374_var_BonusMoney1 )
	  end
		if x203374_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203374_var_BonusMoney2 )
	  end
		if x203374_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203374_var_BonusMoney3 )
		end
		if x203374_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203374_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203374_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203374_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203374_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203374_var_BonusMoney6)
		end
end

function x203374_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203374_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203374_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203374_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203374_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203374_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203374_var_QuestName.."！", 0, 3)
				if x203374_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203374_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203374_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203374_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203374_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203374_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203374_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203374_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203374_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203374_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203374_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203374_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203374_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203374_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203374_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203374_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203374_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203374_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203374_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

		if GetItemCount(varMap,varPlayer,x203374_var_DemandItem[1]) >= 1 then
			
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203374_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 ) 
	    	--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203374_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
end

function x203374_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )  
   local bFind  = 0                                                             
  for varI ,item in x203374_var_NpcGUID do                                          
     if item.guid == varTalkNpcGUID then                                             
        bFind = 1                                                            
        break                                                                
     end                                                                      
   end                                                                          
   if bFind == 0 then                                                           
    return                                                                   
    end                                                                          
  if IsHaveQuest(varMap,varPlayer, x203374_var_QuestId) > 0 then                 
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203374_var_QuestId)  
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203374_var_QuestId, varState, -1 ) 
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 )
	end
end    
                                                                      
function x203374_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203374_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203374_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203374_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203374_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203374_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
