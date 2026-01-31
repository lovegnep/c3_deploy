

--DECLARE_QUEST_INFO_START--
x200500_var_FileId = 200500
x200500_var_QuestIdPre ={58,60}
x200500_var_QuestId = 59
x200500_var_LevelLess	= 	15 
x200500_var_QuestIdNext = 61
x200500_var_Name	={}
x200500_var_ExtTarget={{type=20,n=1,target="到不尔罕雪山找回@npc_14019后拿给@npc_102024"}}
x200500_var_QuestName="【剧场】寻回马刀"
x200500_var_QuestInfo="\t我们匆忙逃出的时候，马刀丢在了不尔罕雪山的山谷里。你帮我去把我的武器取出来吧，小心那里的雪狼。"  
x200500_var_QuestTarget=""		
x200500_var_QuestCompleted="\t很好，我这就可以动身了。"					
x200500_var_ContinueInfo="\t要是没有武器就去见铁木真可太丢脸了，拜托你了。"   
x200500_var_QuestHelp =	""
x200500_var_DemandItem ={13010031}
x200500_var_BonusMoney1 =231
x200500_var_BonusMoney2 =0
x200500_var_BonusMoney3 =0
x200500_var_BonusMoney4 =0
x200500_var_BonusMoney5 =31
x200500_var_BonusMoney6 =0
x200500_var_BonusItem	=	{}
x200500_var_BonusChoiceItem ={}
x200500_var_ExpBonus = 3618
x200500_var_NpcGUID ={{ guid = 102024, varName = "木华黎"} }
x200500_var_GroupPoint	=	{ {type=10,varId =3,target = "马刀"} }

--DECLARE_QUEST_INFO_STOP--
x200500_var_muhuali =-1
x200500_var_doing =0
x200500_var_zhamuhe =-1
x200500_var_tiemuzhen =-1

x200500_var_shibing2 =-1
x200500_var_shibing4 =-1
x200500_var_shibing5 =-1
x200500_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x200500_var_acceptid =-1


function x200500_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x200500_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x200500_var_QuestIdPre[1])> 0 then
		if IsQuestHaveDone(varMap, varPlayer, x200500_var_QuestIdPre[2])> 0 then
						if IsHaveQuest(varMap,varPlayer, x200500_var_QuestId) <= 0 then
								x200500_CheckSubmit(varMap, varPlayer, varTalknpc)
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200500_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200500_var_QuestId, varState, -1 )
						end
		end	
			
	end
end

function x200500_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x200500_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x200500_var_ExpBonus )
		end
		if x200500_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x200500_var_BonusMoney1 )
		end
		if x200500_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x200500_var_BonusMoney2 )
		end
		if x200500_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x200500_var_BonusMoney3 )
		end
		if x200500_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x200500_var_BonusMoney4 )
		end
		if x200500_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x200500_var_BonusMoney5 )
		end
		if x200500_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x200500_var_BonusMoney6 )
		end
		for varI, item in x200500_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x200500_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x200500_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x200500_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x200500_var_QuestId) > 0 then
			if x200500_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200500_var_QuestName)
						TalkAppendString(varMap,x200500_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x200500_var_FileId, x200500_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200500_var_QuestName)
						TalkAppendString(varMap,x200500_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x200500_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x200500_var_FileId, x200500_var_QuestId);
			
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   			end
  elseif x200500_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x200500_var_QuestName)
			TalkAppendString(varMap,x200500_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x200500_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x200500_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x200500_var_QuestHelp )
			end
			x200500_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x200500_var_FileId, x200500_var_QuestId);
  
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
  end
	
end


function x200500_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x200500_CheckSubmit( varMap, varPlayer, varTalknpc)
	if GetItemCount(varMap,varPlayer,x200500_var_DemandItem[1]) >= 1 then
				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200500_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 ) 
	    		return 1
	    		
	  else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200500_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
	  return 0
	
end

function x200500_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x200500_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x200500_var_QuestId  )
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
		
		if x200500_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x200500_var_QuestId, x200500_var_FileId, 1, 1, 1,1)
					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,1 )
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			
		  			
						
 						
						
    				
    				
						
							
	    				
	    				
	    					for varI, item in x200500_var_DemandItem do                                            
	    								if GetItemCount(varMap,varPlayer,item) >= 1 then		                              
	    									local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200500_var_QuestId)        
	    			    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)                                			
	    			    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1) 
	    			    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 ) 
	    			    			end
	    			    end					
	    			
		  		end
	 	end                                                                    
	     
end


function x200500_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x200500_var_QuestId) <= 0 then
				return 
		end
		if DelItem( varMap,varPlayer,x200500_var_DemandItem[1],1 ) ~= 1 then return 0 end
		DelQuest(varMap, varPlayer, x200500_var_QuestId)
	  x200500_Msg2toplayer( varMap, varPlayer,1)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 ) 		
end

function x200500_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x200500_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x200500_var_BonusChoiceItem do
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

 function x200500_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x200500_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200500_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200500_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x200500_var_QuestId) > 0 then
				x200500_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x200500_var_QuestId)
				if DelItem( varMap,varPlayer,13010031,1 ) ~= 1 then return 0 end
				
				x200500_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x200500_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x200500_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    	end
     LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x200500_var_QuestIdNext )
     
     	
      x200500_var_muhuali =FindMonsterByGUID( varMap,102024)
  			if x200500_var_doing==0 then
					
							if IsObjValid (varMap,x200500_var_muhuali) == 1 then
  			    			NpcTalk(varMap, x200500_var_muhuali, "看，是我们的安答铁木真！你怎么来了，就知道长生天一定会保佑你没事的。", -1)
  			    	end
  			    			x200500_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
									x200500_var_doing =2
									x200500_var_shibing2=CreateMonster(varMap, 663,50,74,3,1,-1,102016,20,23000,180)
  			          x200500_var_shibing4=CreateMonster(varMap, 663,46,74,3,1,-1,102016,20,23000,180)
  			          
  			          x200500_var_tiemuzhen=CreateMonster(varMap, 662,48,70,3,1,-1,102005,20,23000,180)
									
									
									
  			    			
									
  			          x200500_var_PROTECTINFO.StartTime = GetCurrentTime()
									x200500_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 200500, "ProcScneneTimer", 1)
  			  
  			
  								
											
									
								
									
					  		
				  			
				
							
							
							
							
							
				
			
				end      
end
  
						
    		

function x200500_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

			if GetItemCount(varMap,varPlayer,x200500_var_DemandItem[1]) >= 1 then
			
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200500_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 18,0 ) 	
	 		else
	  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200500_var_QuestId)                                                  
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  	end
end

function x200500_ProcScneneTimer(varMap)
	if x200500_var_doing==2   then
		if GetCurrentTime() - x200500_var_PROTECTINFO.StartTime >= 2   then
					x200500_var_doing = 3
				
				
				
					if IsObjValid (varMap,x200500_var_tiemuzhen) == 1 then
        		SetPatrolId(varMap, x200500_var_tiemuzhen, 9)
        						if IsObjValid (varMap,x200500_var_shibing2) == 1 then
        		SetPatrolId(varMap, x200500_var_shibing2, 13)
        						if IsObjValid (varMap,x200500_var_shibing4) == 1 then
        		SetPatrolId(varMap, x200500_var_shibing4, 14)
        	end
        	end
        	end
		end
	elseif x200500_var_doing == 3   then
			if GetCurrentTime() - x200500_var_PROTECTINFO.StartTime >= 7   then
			  x200500_var_doing =4
				if IsObjValid (varMap,x200500_var_muhuali) == 1 then
						NpcTalk(varMap, x200500_var_muhuali, "铁木真，我们的好安答，你平安无事真是太好了。", -1)
				end
      end
	
	
	
	
	
	
	
	elseif x200500_var_doing == 4   then
			if GetCurrentTime() - x200500_var_PROTECTINFO.StartTime >= 10   then
						x200500_var_doing =5
						if IsObjValid (varMap,x200500_var_tiemuzhen) == 1 then
								NpcTalk(varMap, x200500_var_tiemuzhen, "我的好安答，知道你们来了，我的病马上就都好了。", -1)
						end
			end
	elseif x200500_var_doing == 5   then
			if GetCurrentTime() - x200500_var_PROTECTINFO.StartTime >= 14   then
						x200500_var_doing =6
						if IsObjValid (varMap,x200500_var_tiemuzhen) == 1 then
								NpcTalk(varMap, x200500_var_tiemuzhen, "蔑里岂人大肆侵扰我乞颜部，掠我土地，夺我妻子，暗箭伤我。这仇我一定要报！", -1)
						end
			end
			x200500_var_zhamuhe =FindMonsterByGUID( varMap,102019)
	elseif x200500_var_doing == 6   then
			if GetCurrentTime() - x200500_var_PROTECTINFO.StartTime >= 17   then
						x200500_var_doing =7
						if IsObjValid (varMap,x200500_var_muhuali) == 1 then
								NpcTalk(varMap, x200500_var_muhuali, "这仇，我们要一起报。", -1)       
									if IsObjValid (varMap,x200500_var_zhamuhe) == 1 then                  
											NpcTalk(varMap, x200500_var_zhamuhe, "这仇，我们要一起报。", -1)  
						end    
						x200500_CloseTimer(varMap, x200500_var_PROTECTINFO.ScneneTimerIndex)
								end
			end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	end
end





function x200500_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x200500_var_doing =0
	x200500_var_zhamuhe =-1
	x200500_var_muhuali =-1
	
	
	x200500_var_tiemuzhen =-1
	x200500_var_shibing2 =-1
	x200500_var_shibing4 =-1
	
	x200500_var_acceptid =-1
	x200500_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end
    		
   


function x200500_GetBonus( varMap, varPlayer,varTalknpc)
	  if x200500_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x200500_var_ExpBonus);
  	end
		if x200500_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x200500_var_BonusMoney1 )
	  end
		if x200500_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x200500_var_BonusMoney2 )
	  end
		if x200500_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x200500_var_BonusMoney3 )
		end
		if x200500_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x200500_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x200500_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x200500_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x200500_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x200500_var_BonusMoney6)
		end
end

function x200500_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x200500_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x200500_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200500_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200500_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200500_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200500_var_QuestName.."！", 0, 3)
				if x200500_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x200500_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x200500_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x200500_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x200500_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x200500_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x200500_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x200500_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x200500_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x200500_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x200500_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x200500_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x200500_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x200500_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x200500_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x200500_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x200500_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x200500_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end


function x200500_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x200500_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x200500_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200500_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200500_var_QuestId, varState, -1 )
		end
end

function x200500_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x200500_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x200500_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200500_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200500_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x200500_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
