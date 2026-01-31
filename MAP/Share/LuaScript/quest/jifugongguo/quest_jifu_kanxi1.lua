

--DECLARE_QUEST_INFO_START--
x203336_var_FileId = 203336
x203336_var_QuestIdPre = 851
x203336_var_QuestId = 852
x203336_var_LevelLess	= 90
x203336_var_QuestIdNext = 853
x203336_var_Name	={}
x203336_var_ExtTarget={{type=20,n=1,target="询问@npc_118011"}}
x203336_var_QuestName="【剧场】暴虐之举<一>"
x203336_var_QuestInfo="\t你是我军中的骁勇之士，每日这么苦于军务何必哪！等等再走吧，我送你件礼物，你可以挑选一个。"  
x203336_var_QuestTarget=""		
x203336_var_QuestCompleted="\t别那么心急，马上就来了。"	
x203336_var_ContinueInfo=	""
x203336_var_QuestHelp =	""
x203336_var_DemandItem ={}
x203336_var_BonusMoney1 =920
x203336_var_BonusMoney2 =0
x203336_var_BonusMoney3 =0
x203336_var_BonusMoney4 =0
x203336_var_BonusMoney5 =116
x203336_var_BonusMoney6 =0
x203336_var_BonusItem	=	{}
x203336_var_BonusChoiceItem ={}
x203336_var_ExpBonus = 742000
x203336_var_NpcGUID ={{ guid = 118011, varName = "海都"}}

--DECLARE_QUEST_INFO_STOP--
x203336_var_doing = 0
x203336_var_shibing1 = -1
x203336_var_shibing2 = -1
x203336_var_meinv1 = -1
x203336_var_meinv2 = -1
x203336_var_meinv3 = -1
x203336_var_meinv4 = -1
x203336_var_meinv5 = -1
x203336_var_alibuge = -1
x203336_var_baierda = -1
x203336_var_mengguyongshi1 = -1
x203336_var_mengguyongshi2 = -1
x203336_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}





  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

function x203336_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel( varMap, varPlayer) < x203336_var_LevelLess then
		return
   end

	if IsQuestHaveDone(varMap, varPlayer, x203336_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203336_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x203336_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203336_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203336_var_QuestId, varState, -1 )
						end
			
	end
end

function x203336_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203336_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203336_var_ExpBonus )
		end
		if x203336_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203336_var_BonusMoney1 )
		end
		if x203336_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203336_var_BonusMoney2 )
		end
		if x203336_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203336_var_BonusMoney3 )
		end
		if x203336_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203336_var_BonusMoney4 )
		end
		if x203336_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203336_var_BonusMoney5 )
		end
		if x203336_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203336_var_BonusMoney6 )
		end
		for varI, item in x203336_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203336_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203336_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203336_var_QuestId) > 0 then
		return 
	end
	if GetLevel( varMap, varPlayer) < x203336_var_LevelLess then
		return
   end
	if IsHaveQuest(varMap,varPlayer, x203336_var_QuestId) > 0 then
			if x203336_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203336_var_QuestName)
						TalkAppendString(varMap,x203336_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203336_var_FileId, x203336_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203336_var_QuestName)
						TalkAppendString(varMap,x203336_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203336_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203336_var_FileId, x203336_var_QuestId);
			end
  elseif x203336_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203336_var_QuestName)
			TalkAppendString(varMap,x203336_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203336_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203336_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203336_var_QuestHelp )
			end
			x203336_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203336_var_FileId, x203336_var_QuestId);
  end
	
end


function x203336_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		
						return 1
		

end

function x203336_CheckSubmit( varMap, varPlayer, varTalknpc)


	        return 1
	
end

function x203336_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203336_var_QuestId) > 0 then
				return 
		end
			if GetLevel( varMap, varPlayer) < x203336_var_LevelLess then
		return
   end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203336_var_QuestId  )
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
	
		if x203336_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203336_var_QuestId, x203336_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
				
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203336_Msg2toplayer( varMap, varPlayer,0)
		  			StartItemTask(varMap)
							for varI, item in x203336_var_DemandItem do
 								ItemAppend( varMap, item.item, item.varNum )
							end
    				StopItemTask(varMap,varPlayer)
    				
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203336_var_QuestId)								                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203336_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203336_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203336_var_QuestId)
	  x203336_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203336_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203336_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203336_var_BonusChoiceItem do
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

function x203336_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203336_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203336_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203336_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203336_var_QuestId) > 0 then
				x203336_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203336_var_QuestId)
				x203336_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203336_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203336_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		
    			if x203336_var_doing==0 then
						if x203336_var_shibing1==-1 then
    			    			x203336_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
										x203336_var_doing =1
										x203336_var_shibing1=CreateMonster(varMap,2117,117,202,3,1,-1,-1,20,30000,320,"蒙古士兵")
									    x203336_var_shibing2=CreateMonster(varMap,2117,122,204,3,1,-1,-1,20,30000,320,"蒙古士兵")
									    x203336_var_meinv2=CreateMonster(varMap,2502,118,203,3,1,-1,-1,20,30000,320,"被抓的姑娘")
									    x203336_var_meinv1=CreateMonster(varMap,71,119,204,3,1,-1,-1,20,30000,320,"被抓的姑娘")
									    x203336_var_meinv3=CreateMonster(varMap,73,121,203,3,1,-1,-1,20,30000,320,"被抓的姑娘")
									    x203336_var_meinv4=CreateMonster(varMap,74,120,202,3,1,-1,-1,20,30000,320,"被抓的姑娘")
									    x203336_var_meinv5=CreateMonster(varMap,71,121,201,3,1,-1,-1,20,30000,320,"被抓的姑娘")
									    x203336_var_PROTECTINFO.StartTime = GetCurrentTime()
										x203336_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203336, "ProcScneneTimer", 1)
    			  end
    			
    								
												
										
									
										
						  		
					  			
					
								
								
								
								
								
					end
	 	end        
									
    		

   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203336_var_QuestIdNext )	
end


function x203336_ProcScneneTimer(varMap)
	if x203336_var_doing==1   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 5   then
						x203336_var_doing = 2
						if IsObjValid (varMap,x203336_var_shibing2) == 1 then
								NpcTalk(varMap, x203336_var_shibing2, "王子殿下你要的人都带来了！", -1)
						end
		end
	elseif x203336_var_doing==2   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 2 then
						x203336_var_doing = 3
						if IsObjValid (varMap,x203336_var_shibing1) == 1 then
								NpcTalk(varMap, x203336_var_shibing1, "你们都跟上！", -1)
						end
		end
	elseif x203336_var_doing==3   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 2 then
						x203336_var_doing = 4
						if IsObjValid (varMap,x203336_var_meinv1) == 1 then
								NpcTalk(varMap, x203336_var_meinv1, "求求你们放我回家啊，呜呜！", -1)
						end
		end
	elseif x203336_var_doing==4   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 5  then
						x203336_var_doing = 5
						if IsObjValid (varMap,x203336_var_shibing2) == 1 then
								NpcTalk(varMap, x203336_var_shibing2, "都安静了！", -1)
						end
		end
	elseif x203336_var_doing==5   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 2  then
						x203336_var_doing = 6
						if IsObjValid (varMap,x203336_var_meinv4) == 1 then
								NpcTalk(varMap, x203336_var_meinv4, "呜呜……呜呜！", -1)
						end
	  end
	elseif x203336_var_doing==6   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 2 then
						x203336_var_doing = 7
						if IsObjValid (varMap,x203336_var_meinv5) == 1 then
								NpcTalk(varMap, x203336_var_meinv5, "我要回家，我要回家！", -1)
						end
		end
	elseif x203336_var_doing==7   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 5   then
						x203336_var_doing = 8
						if IsObjValid (varMap,x203336_var_shibing1) == 1 then
								NpcTalk(varMap, x203336_var_shibing1, "都安静了！", -1)
						end
		end
	elseif x203336_var_doing==8   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 5   then
						x203336_var_doing = 9
						if IsObjValid (varMap,x203336_var_meinv3) == 1 then
								NpcTalk(varMap, x203336_var_meinv3, "呜呜……呜呜！", -1)
						end						
		end
	elseif x203336_var_doing==9   then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 5  then
						x203336_var_doing = 10
						if IsObjValid (varMap,x203336_var_shibing2) == 1 then
								NpcTalk(varMap, x203336_var_shibing2, "将军后面还有几个模样不错的！", -1)					
						end
		end
	elseif x203336_var_doing==10  then
		if GetCurrentTime() - x203336_var_PROTECTINFO.StartTime >= 5   then
						x203336_var_doing = 11
						x203336_CloseTimer(varMap, x203336_var_PROTECTINFO.ScneneTimerIndex)
		        end
    end
   
end





function x203336_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203336_var_doing = 0
	x203336_var_shibing1 = -1
	x203336_var_shibing2 = -1
	x203336_var_meinv2 = -1
	x203336_var_meinv1 = -1
	x203336_var_meinv3 = -1
	x203336_var_meinv4 = -1
	x203336_var_meinv5 = -1
	x203336_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x203336_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203336_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203336_var_ExpBonus);
  	end
		if x203336_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203336_var_BonusMoney1 )
	  end
		if x203336_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203336_var_BonusMoney2 )
	  end
		if x203336_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203336_var_BonusMoney3 )
		end
		if x203336_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203336_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203336_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203336_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203336_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203336_var_BonusMoney6)
		end
end

function x203336_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203336_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203336_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203336_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203336_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203336_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203336_var_QuestName.."！", 0, 3)
				if x203336_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203336_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203336_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203336_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203336_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203336_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203336_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203336_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203336_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203336_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203336_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203336_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203336_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203336_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203336_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203336_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203336_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203336_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203336_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203336_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203336_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203336_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203336_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203336_var_QuestId, varState, -1 )
		end
end

function x203336_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203336_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203336_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203336_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203336_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203336_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
