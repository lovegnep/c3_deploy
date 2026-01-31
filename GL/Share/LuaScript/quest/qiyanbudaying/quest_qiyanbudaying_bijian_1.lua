

--DECLARE_QUEST_INFO_START--
x200503_var_FileId = 200503
x200503_var_QuestIdPre =63
x200503_var_QuestId = 64
x200503_var_LevelLess	= 	15 
x200503_var_QuestIdNext = 66
x200503_var_Name	={}
x200503_var_ExtTarget={{type=20,n=1,target="回复@npc_102004"}}
x200503_var_QuestName="【剧场】真相<三>"
x200503_var_QuestInfo="\t虽然我很难相信这个事实，但现在只有从郭靖这孩子身上下手了，希望他这次不要因为倔强吃太多苦头，你先等等。我这就派人把郭靖叫来。"  
x200503_var_QuestTarget=""		
x200503_var_QuestCompleted="铁木真这次大败蔑里岂，这蒙古草原上就又少了一个与我们为敌的势力。"					
x200503_var_ContinueInfo=""
x200503_var_QuestHelp =	""
x200503_var_DemandItem ={}
x200503_var_ExpBonus = 3618
x200503_var_BonusMoney1 =231
x200503_var_BonusMoney2 =0
x200503_var_BonusMoney3 =0
x200503_var_BonusMoney4 =0
x200503_var_BonusMoney5 =31
x200503_var_BonusMoney6 =0
x200503_var_BonusItem	=	{{item=13020012,n=1}}
x200503_var_BonusChoiceItem ={}
x200503_var_NpcGUID ={{ guid = 102004, varName = "王汗"} }

--DECLARE_QUEST_INFO_STOP--
x200503_var_wanghan =-1
x200503_var_doing =0
x200503_var_huoadai =-1
x200503_var_guojing =-1
x200503_var_tuolei =-1
x200503_var_shibing2 =-1
x200503_var_shibing3 =-1
x200503_var_shibing4 =-1
x200503_var_tiemuzhen =-1
x200503_var_zhamuhe =-1
x200503_var_muhuali =-1

x200503_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x200503_var_acceptid =-1


function x200503_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x200503_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x200503_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x200503_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200503_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200503_var_QuestId, varState, -1 )
						end
			
	end
end

function x200503_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x200503_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x200503_var_ExpBonus )
		end
		if x200503_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x200503_var_BonusMoney1 )
		end
		if x200503_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x200503_var_BonusMoney2 )
		end
		if x200503_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x200503_var_BonusMoney3 )
		end
		if x200503_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x200503_var_BonusMoney4 )
		end
		if x200503_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x200503_var_BonusMoney5 )
		end
		if x200503_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x200503_var_BonusMoney6 )
		end
		for varI, item in x200503_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x200503_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x200503_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x200503_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x200503_var_QuestId) > 0 then
			if x200503_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200503_var_QuestName)
						TalkAppendString(varMap,x200503_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x200503_var_FileId, x200503_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200503_var_QuestName)
						TalkAppendString(varMap,x200503_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x200503_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x200503_var_FileId, x200503_var_QuestId);
			
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
    
 end
  elseif x200503_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x200503_var_QuestName)
			TalkAppendString(varMap,x200503_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x200503_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x200503_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x200503_var_QuestHelp )
			end
			x200503_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x200503_var_FileId, x200503_var_QuestId);
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
   end
	
end


function x200503_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x200503_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x200503_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x200503_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x200503_var_QuestId  )
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
		
		if x200503_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x200503_var_QuestId, x200503_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x200503_Msg2toplayer( varMap, varPlayer,0)
		  			
						
						  
 					 x200503_var_wanghan =FindMonsterByGUID( varMap,102004)
    							if x200503_var_doing==0 then
										if x200503_var_huoadai==-1 then
												if IsObjValid (varMap,x200503_var_wanghan) == 1 then
    							    			NpcTalk(varMap, x200503_var_wanghan, "把郭靖这小子带上来！", -1)
    							    	end
														x200503_var_doing =2
														x200503_var_guojing=CreateMonster(varMap, 498,101,149,3,1,-1,102000,20,30000,250)
    							          x200503_var_shibing3=CreateMonster(varMap, 639,102,151,3,1,-1,102016,20,30000,250)
    							          x200503_var_shibing4=CreateMonster(varMap, 639,104,149,3,1,-1,102016,20,30000,250)
    							          
    							          
														x200503_var_tuolei=CreateMonster(varMap, 306,92,145,3,1,-1,102030,20,30000)
														x200503_var_huoadai=CreateMonster(varMap, 308,110,158,3,1,-1,102031,20,30000)
														
    							    			
														
    							          x200503_var_PROTECTINFO.StartTime = GetCurrentTime()
														x200503_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 200503, "ProcScneneTimer", 1)
    							  end
    							
    												
																
														
													
														
										  		
									  			
									
												
												
												
												
												
									end
 
						
		  			StartItemTask(varMap)
							
 							
							
    				StopItemTask(varMap,varPlayer)
    				
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200503_var_QuestId)								                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x200503_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x200503_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x200503_var_QuestId)
	  x200503_Msg2toplayer( varMap, varPlayer,1)
			
end

function x200503_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x200503_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x200503_var_BonusChoiceItem do
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

function x200503_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x200503_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200503_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200503_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x200503_var_QuestId) > 0 then
				x200503_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x200503_var_QuestId)
				
				x200503_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x200503_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x200503_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		
	 	end        
									
    		DeliverItemListSendToPlayer(varMap,varPlayer)

   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x200503_var_QuestIdNext )	
end


  function x200503_ProcScneneTimer(varMap)
 
	if x200503_var_doing==2   then
		if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 2   then
					x200503_var_doing = 3
					if IsObjValid (varMap,x200503_var_tuolei) == 1 then
						SetPatrolId(varMap, x200503_var_tuolei, 5)	
					end
					if IsObjValid (varMap,x200503_var_huoadai) == 1 then
        		SetPatrolId(varMap, x200503_var_huoadai, 4)
        	end
		end
	elseif x200503_var_doing == 3   then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 3   then
			  x200503_var_doing =4
				if IsObjValid (varMap,x200503_var_wanghan) == 1 then
						NpcTalk(varMap, x200503_var_wanghan, "郭靖！这支刺杀铁木真的箭你从哪儿弄来的？", -1)
				end
      end
	elseif x200503_var_doing == 4   then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 5   then
						x200503_var_doing =5
						if IsObjValid (varMap,x200503_var_guojing) == 1 then
								NpcTalk(varMap, x200503_var_guojing, "......", -1)
						end
			end
	elseif x200503_var_doing == 5   then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 7   then
						x200503_var_doing =6
						if IsObjValid (varMap,x200503_var_wanghan) == 1 then
								NpcTalk(varMap, x200503_var_wanghan, "不说？好小子，拖出去砍了！", -1)
						end
			end
	elseif x200503_var_doing == 6   then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 9   then
						x200503_var_doing =7
						if IsObjValid (varMap,x200503_var_tuolei) == 1 then
								NpcTalk(varMap, x200503_var_tuolei, "不要！郭靖是我的安答，他......怎么可能会刺杀我的父汗啊。", -1)
						end
			end
	elseif x200503_var_doing == 7   then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 11   then    
			x200503_var_tiemuzhen=CreateMonster(varMap, 662,105,140,3,1,-1,102016,20,23000,320)        
			          x200503_var_zhamuhe=CreateMonster(varMap, 499,105,137,3,1,-1,102043,20,23000,320)
			          x200503_var_muhuali=CreateMonster(varMap, 1905,108,140,3,1,-1,102044,20,23000,320)
						x200503_var_doing =8
						if IsObjValid (varMap,x200503_var_huoadai) == 1 then
								NpcTalk(varMap, x200503_var_huoadai, "住手！我就是你要找的刺客，你堂堂王汗，难为一个小孩子算什么本事？", -1)
						end
			end
	elseif x200503_var_doing == 8   then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 13   then
						x200503_var_doing =9
						if IsObjValid (varMap,x200503_var_tiemuzhen) == 1 then
							SetPatrolId(varMap, x200503_var_tiemuzhen, 10)	             
							if IsObjValid (varMap,x200503_var_zhamuhe) == 1 then 
								SetPatrolId(varMap, x200503_var_zhamuhe, 11)	      
							if IsObjValid (varMap,x200503_var_muhuali) == 1 then 
								SetPatrolId(varMap, x200503_var_muhuali, 12)	      
						if IsObjValid (varMap,x200503_var_tiemuzhen) == 1 then                                                                                                                                  						
								NpcTalk(varMap, x200503_var_tiemuzhen, "这次真是一场大胜仗！哈哈，彻底的击溃蔑里岂人。", -1) 
						if IsObjValid (varMap,x200503_var_wanghan) == 1 then
								NpcTalk(varMap, x200503_var_wanghan, "好。我儿铁木真果然神勇过人，刺杀你的刺客我也给你抓到了，就交给你来处置！", -1)
						end     
						end
						end
						end
			end
	end  
	elseif x200503_var_doing == 9   then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 17   then
						x200503_var_doing =10
						if IsObjValid (varMap,x200503_var_tiemuzhen) == 1 then
								NpcTalk(varMap, x200503_var_tiemuzhen, "你终于出来了！好马不配两个鞍子，你当时刺杀本汗可称为蔑里乞的忠臣，本汗不再追究你的罪过。", -1)
						end
			end
	elseif x200503_var_doing == 10   then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 20   then
						x200503_var_doing =11
						if IsObjValid (varMap,x200503_var_tiemuzhen) == 1 then                                                                                       
								NpcTalk(varMap, x200503_var_tiemuzhen, "如今蔑里岂已败，你可以留在本汗营下效力。", -1)   
						end
			end
	elseif x200503_var_doing==11 then
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 23   then
			x200503_var_doing=12 
			  if IsObjValid (varMap,x200503_var_huoadai) == 1 then                                                                          
			  		NpcTalk(varMap, x200503_var_huoadai, "想不到......铁木真竟然如此大度，我愿为大汗出力，深水可使横断，坚石可使粉碎！", -1)  
			end
	end  
	elseif x200503_var_doing==12 then                                           
			if GetCurrentTime() - x200503_var_PROTECTINFO.StartTime >= 26   then    
	      if IsObjValid (varMap,x200503_var_tiemuzhen) == 1 then                                        
	      		NpcTalk(varMap, x200503_var_tiemuzhen, "好！从今以后，你就是我的---甮も", -1)  
	      		x200503_CloseTimer(varMap, x200503_var_PROTECTINFO.ScneneTimerIndex) 
	         		end 
	         end    
end
end

        	




function x200503_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x200503_var_doing =0
	x200503_var_huoadai =-1
	x200503_var_guojing =-1
	x200503_var_tuolei =-1
	x200503_var_shibing2 =-1
	x200503_var_shibing3 =-1
	x200503_var_shibing4 =-1
	x200503_var_tiemuzhen =-1 
	x200503_var_zhamuhe =-1   
	x200503_var_muhuali =-1   
	
	x200503_var_acceptid =-1
	x200503_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x200503_GetBonus( varMap, varPlayer,varTalknpc)
	  if x200503_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x200503_var_ExpBonus);
  	end
		if x200503_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x200503_var_BonusMoney1 )
	  end
		if x200503_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x200503_var_BonusMoney2 )
	  end
		if x200503_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x200503_var_BonusMoney3 )
		end
		if x200503_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x200503_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x200503_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x200503_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x200503_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x200503_var_BonusMoney6)
		end
end

function x200503_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x200503_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x200503_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200503_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200503_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200503_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200503_var_QuestName.."！", 0, 3)
				if x200503_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x200503_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x200503_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x200503_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x200503_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x200503_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x200503_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x200503_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x200503_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x200503_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x200503_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x200503_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x200503_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x200503_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x200503_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x200503_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x200503_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x200503_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x200503_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x200503_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x200503_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x200503_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200503_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200503_var_QuestId, varState, -1 )
		end
end

function x200503_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x200503_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x200503_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200503_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200503_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x200503_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
