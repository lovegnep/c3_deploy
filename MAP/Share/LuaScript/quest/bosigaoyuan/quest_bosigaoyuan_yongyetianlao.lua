

--DECLARE_QUEST_INFO_START--
x203320_var_FileId = 203320
x203320_var_QuestIdPre =753
x203320_var_QuestId = 754
x203320_var_LevelLess	= 	84
x203320_var_QuestIdNext = -1
x203320_var_Name	={}
x203320_var_ExtTarget={{type=20,n=1,target="找到@npc_116000"}}
x203320_var_QuestName="【剧场】永夜天牢<五>"
x203320_var_QuestInfo="\t我已用定天罗盘测量好了封印这几个魔头的位置，就在离这里不远处的山脚下，我这就去准备，请你通知大汗。"  
x203320_var_QuestTarget=""		
x203320_var_QuestCompleted="\t好，今天就要将这魔头永远封印在永夜天牢之中！ "					
x203320_var_ContinueInfo=""
x203320_var_QuestHelp =	""
x203320_var_DemandItem ={}
x203320_var_ExpBonus = 626000
x203320_var_BonusMoney1 =840
x203320_var_BonusMoney2 =0
x203320_var_BonusMoney3 =0
x203320_var_BonusMoney4 =0
x203320_var_BonusMoney5 =96
x203320_var_BonusMoney6 =0
x203320_var_BonusItem	=	{}
x203320_var_BonusChoiceItem ={}
x203320_var_NpcGUID ={{ guid = 116000, varName = "成吉思汗"} }

--DECLARE_QUEST_INFO_STOP--
x203320_var_chengjisihan =-1
x203320_var_doing =0
x203320_var_mohemo =-1
x203320_var_wosilahei =-1
x203320_var_mengguwushi1 =-1
x203320_var_mengguwushi2 =-1
x203320_var_mengguwushi3 =-1
x203320_var_mengguwushi4 =-1
x203320_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x203320_var_acceptid =-1


function x203320_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x203320_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203320_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x203320_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203320_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203320_var_QuestId, varState, -1 )
						end
			
	end
end

function x203320_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203320_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203320_var_ExpBonus )
		end
		if x203320_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203320_var_BonusMoney1 )
		end
		if x203320_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203320_var_BonusMoney2 )
		end
		if x203320_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203320_var_BonusMoney3 )
		end
		if x203320_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203320_var_BonusMoney4 )
		end
		if x203320_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203320_var_BonusMoney5 )
		end
		if x203320_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203320_var_BonusMoney6 )
		end
		for varI, item in x203320_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203320_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203320_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203320_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203320_var_QuestId) > 0 then
			if x203320_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203320_var_QuestName)
						TalkAppendString(varMap,x203320_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203320_var_FileId, x203320_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203320_var_QuestName)
						TalkAppendString(varMap,x203320_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203320_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203320_var_FileId, x203320_var_QuestId);
			end
  elseif x203320_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203320_var_QuestName)
			TalkAppendString(varMap,x203320_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203320_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203320_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203320_var_QuestHelp )
			end
			x203320_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203320_var_FileId, x203320_var_QuestId);
  end
	
end


function x203320_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203320_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203320_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203320_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203320_var_QuestId  )
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
		
		if x203320_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203320_var_QuestId, x203320_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203320_Msg2toplayer( varMap, varPlayer,0)
		  			
						
 						
						
    				
    				
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203320_var_QuestId)								                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203320_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203320_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203320_var_QuestId)
	  x203320_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203320_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203320_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203320_var_BonusChoiceItem do
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

function x203320_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203320_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203320_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203320_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203320_var_QuestId) > 0 then
				x203320_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203320_var_QuestId)
				
				x203320_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203320_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203320_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		x203320_var_chengjisihan =FindMonsterByGUID( varMap,116000)
    			if x203320_var_doing==0 then
						if x203320_var_mohemo==-1 then
								if IsObjValid (varMap,x203320_var_chengjisihan) == 1 then
    			    			NpcTalk(varMap, x203320_var_chengjisihan, "把暴君摩诃末带上来！", -1)
    			    	end
    			    			x203320_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
										x203320_var_doing =2
										x203320_var_mengguwushi1=CreateMonster(varMap, 932,126,35,3,1,-1,-1,20,23000,180)
    			          x203320_var_mengguwushi2=CreateMonster(varMap, 932,126,37,3,1,-1,-1,20,23000,180)
    			          x203320_var_mengguwushi3=CreateMonster(varMap, 932,130,37,3,1,-1,-1,20,23000,180)
    			          x203320_var_mengguwushi4=CreateMonster(varMap, 932,130,35,3,1,-1,-1,20,23000,180)
    			          x203320_var_wosilahei=CreateMonster(varMap, 934,127,34,3,1,-1,-1,20,23000,180)
										x203320_var_mohemo=CreateMonster(varMap, 919,129,34,3,1,-1,-1,20,23000,180)
										
    			    			
										
    			          x203320_var_PROTECTINFO.StartTime = GetCurrentTime()
										x203320_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203320, "ProcScneneTimer", 1)
    			  end
    			
    								
												
										
									
										
						  		
					  			
					
								
								
								
								
								
					end
	 	end        
									
    		

   
end


function x203320_ProcScneneTimer(varMap)
	if x203320_var_doing==2   then
		
					x203320_var_doing = 3
					
						
					
					
        		
        	
		
	
	if GetCurrentTime() - x203320_var_PROTECTINFO.StartTime >= 2   then
			  x203320_var_doing =3
				if IsObjValid (varMap,x203320_var_chengjisihan) == 1 then
						NpcTalk(varMap, x203320_var_chengjisihan, "摩诃末，你暴虐成性，今天就是你的末日", -1)
				end
  end
	elseif x203320_var_doing == 3   then
			if GetCurrentTime() - x203320_var_PROTECTINFO.StartTime >= 4   then
						x203320_var_doing =5
						if IsObjValid (varMap,x203320_var_wosilahei) == 1 then
								NpcTalk(varMap, x203320_var_wosilahei, "哼！", -1)
						end
			end
	elseif x203320_var_doing == 5   then
			if GetCurrentTime() - x203320_var_PROTECTINFO.StartTime >= 6  then
						x203320_var_doing =6
						if IsObjValid (varMap,x203320_var_chengjisihan) == 1 then
								NpcTalk(varMap, x203320_var_chengjisihan, "我知道你们都是不死之身，我会在此处为你们建一间永远沉没于黑暗之中的天牢，你们也将永生永世被囚禁！", -1)
						end
			end
	elseif x203320_var_doing == 6   then
			if GetCurrentTime() - x203320_var_PROTECTINFO.StartTime >= 9   then
						x203320_var_doing =7
						if IsObjValid (varMap,x203320_var_mohemo) == 1 then
								NpcTalk(varMap, x203320_var_mohemo, "成吉思汗，我们不会屈服，我相信，总有一天，我的儿子扎兰丁会冲破这永远黑夜的天牢，让我们的王朝重现光辉！", -1)
						end
			end
	elseif x203320_var_doing == 7   then
			
						
						
								
						
	    
	
			if GetCurrentTime() - x203320_var_PROTECTINFO.StartTime >= 13   then
						x203320_var_doing =9
						if IsObjValid (varMap,x203320_var_chengjisihan) == 1 then
								NpcTalk(varMap, x203320_var_chengjisihan, "把他们拉下去，封印在永远是黑夜的天牢里。", -1)
						end
						if IsObjValid (varMap,x203320_var_mengguwushi1) == 1 then
								NpcTalk(varMap, x203320_var_mengguwushi1, "是！", -1)
						end
						if IsObjValid (varMap,x203320_var_mengguwushi4) == 1 then
								NpcTalk(varMap, x203320_var_mengguwushi4, "是！", -1)
						end
			end
	
	elseif x203320_var_doing == 9   then
			
						
						
								
						
			
	
			
						
						
								
						
			
  
			if GetCurrentTime() - x203320_var_PROTECTINFO.StartTime >= 20   then
			x203320_var_doing=12
			x203320_CloseTimer(varMap, x203320_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
	end






function x203320_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203320_var_doing =0
	x203320_var_chengjisihan =-1
  x203320_var_doing =0
  x203320_var_mohemo =-1
  x203320_var_wosilahei =-1
  x203320_var_mengguwushi1 =-1
  x203320_var_mengguwushi2 =-1
  x203320_var_mengguwushi3 =-1
  x203320_var_mengguwushi4 =-1
	x203320_var_acceptid =-1
	x203320_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x203320_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203320_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203320_var_ExpBonus);
  	end
		if x203320_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203320_var_BonusMoney1 )
	  end
		if x203320_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203320_var_BonusMoney2 )
	  end
		if x203320_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203320_var_BonusMoney3 )
		end
		if x203320_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203320_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203320_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203320_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203320_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203320_var_BonusMoney6)
		end
end

function x203320_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203320_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203320_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203320_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203320_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203320_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203320_var_QuestName.."！", 0, 3)
				if x203320_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203320_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203320_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203320_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203320_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203320_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203320_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203320_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203320_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203320_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203320_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203320_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203320_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203320_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203320_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203320_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203320_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203320_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203320_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203320_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203320_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203320_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203320_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203320_var_QuestId, varState, -1 )
		end
end

function x203320_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203320_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203320_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203320_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203320_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203320_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
