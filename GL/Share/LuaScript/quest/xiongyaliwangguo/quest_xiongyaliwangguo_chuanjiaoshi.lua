

--DECLARE_QUEST_INFO_START--
x203351_var_FileId = 203351
x203351_var_QuestIdPre =969
x203351_var_QuestId = 970
x203351_var_LevelLess	= 	94 
x203351_var_QuestIdNext = 971
x203351_var_Name	={}
x203351_var_ExtTarget={{type=20,n=1,target="回复@npc_120016"}}
x203351_var_QuestName="【剧场】真相<三>"
x203351_var_QuestInfo="\t教皇信不过贝拉四世，所以也将他变成了吸血鬼，你刚才杀死的正是贝拉四世。\n\t教皇也有句话要我带给拔都大人，如果你们能放弃进攻神圣罗马帝国，我们也能为你们制造一批的吸血鬼不死军团！"  
x203351_var_QuestTarget=""		
x203351_var_QuestCompleted="\t看来我们是时候好好与幕后主使者谈一谈了！"					
x203351_var_ContinueInfo=""
x203351_var_QuestHelp =	""
x203351_var_DemandItem ={}
x203351_var_ExpBonus = 3618
x203351_var_BonusMoney1 =231
x203351_var_BonusMoney2 =0
x203351_var_BonusMoney3 =0
x203351_var_BonusMoney4 =0
x203351_var_BonusMoney5 =31
x203351_var_BonusMoney6 =0
x203351_var_BonusItem	=	{}
x203351_var_BonusChoiceItem ={}
x203351_var_NpcGUID ={{ guid = 120016, varName = "拔都"} }

--DECLARE_QUEST_INFO_STOP--
x203351_var_badu =-1
x203351_var_doing =0
x203351_var_chuanjiaoshi =-1
x203351_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x203351_var_acceptid =-1


function x203351_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203351_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203351_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x203351_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203351_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203351_var_QuestId, varState, -1 )
						end
			
	end
end

function x203351_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203351_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203351_var_ExpBonus )
		end
		if x203351_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203351_var_BonusMoney1 )
		end
		if x203351_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203351_var_BonusMoney2 )
		end
		if x203351_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203351_var_BonusMoney3 )
		end
		if x203351_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203351_var_BonusMoney4 )
		end
		if x203351_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203351_var_BonusMoney5 )
		end
		if x203351_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203351_var_BonusMoney6 )
		end
		for varI, item in x203351_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203351_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203351_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

	if IsQuestHaveDone(varMap, varPlayer, x203351_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203351_var_QuestId) > 0 then
			if x203351_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203351_var_QuestName)
						TalkAppendString(varMap,x203351_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203351_var_FileId, x203351_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203351_var_QuestName)
						TalkAppendString(varMap,x203351_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203351_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203351_var_FileId, x203351_var_QuestId);
			end
  elseif x203351_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203351_var_QuestName)
			TalkAppendString(varMap,x203351_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203351_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203351_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203351_var_QuestHelp )
			end
			x203351_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203351_var_FileId, x203351_var_QuestId);
  end
	
end


function x203351_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203351_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203351_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203351_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203351_var_QuestId  )
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
		
		if x203351_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203351_var_QuestId, x203351_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203351_Msg2toplayer( varMap, varPlayer,0)
		  			
						

						
		  			StartItemTask(varMap)
							
 							
							
    				StopItemTask(varMap,varPlayer)
    				
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203351_var_QuestId)								                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203351_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203351_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203351_var_QuestId)
	  x203351_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203351_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203351_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203351_var_BonusChoiceItem do
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


function x203351_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203351_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203351_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203351_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203351_var_QuestId) > 0 then
				x203351_Msg2toplayer( varMap, varPlayer,2)
				
				
				x203351_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203351_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203351_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		

	 	end        
									
    		
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203351_var_QuestIdNext )

   	 x203351_var_badu =FindMonsterByGUID( varMap,120016)

    							if x203351_var_doing==0 then
    							if IsObjValid (varMap,x203351_var_badu) == 1 then

    							    			NpcTalk(varMap, x203351_var_badu, "我是拔都我说111111111111！", -1)
    				      end
    							    	x203351_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
														x203351_var_doing =2

														x203351_var_chuanjiaoshi=CreateMonster(varMap, 16117,198,33,3,1,-1,120071,20,20000,135,"欧也纹朗")
						 	if IsObjValid (varMap,x203351_var_chuanjiaoshi) == 1 then
								SetPatrolId(varMap, x203351_var_chuanjiaoshi, 9)	           
							end
						 x203351_var_PROTECTINFO.StartTime = GetCurrentTime()  
							 if x203351_var_doing == 2   then
			         if GetCurrentTime() - x203351_var_PROTECTINFO.StartTime >= 4   then
			        end 
			         if IsObjValid (varMap,x203351_var_chuanjiaoshi) == 1 then                                                         						
								NpcTalk(varMap, x203351_var_chuanjiaoshi, "我是传教士我说几？？？？？？？", -1) 
							end						
		          end			 
          
    							         
      end
				x203351_CloseTimer(varMap, x203351_var_PROTECTINFO.ScneneTimerIndex)						
 
 end
 


	




function x203351_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203351_var_doing =0
	x203351_var_badu =-1
	x203351_var_chuanjiaoshi =-1
	
	
	x203351_var_acceptid =-1
	x203351_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x203351_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203351_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203351_var_ExpBonus);
  	end
		if x203351_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203351_var_BonusMoney1 )
	  end
		if x203351_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203351_var_BonusMoney2 )
	  end
		if x203351_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203351_var_BonusMoney3 )
		end
		if x203351_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203351_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203351_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203351_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203351_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203351_var_BonusMoney6)
		end
end

function x203351_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203351_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203351_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203351_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203351_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203351_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203351_var_QuestName.."！", 0, 3)
				if x203351_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203351_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203351_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203351_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203351_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203351_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203351_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203351_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203351_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203351_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203351_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203351_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203351_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203351_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203351_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203351_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203351_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203351_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203351_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203351_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203351_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203351_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203351_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203351_var_QuestId, varState, -1 )
		end
end

function x203351_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203351_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203351_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203351_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203351_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203351_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
