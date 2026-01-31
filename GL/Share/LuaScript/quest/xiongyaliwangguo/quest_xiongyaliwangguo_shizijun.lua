

--DECLARE_QUEST_INFO_START--
x203350_var_FileId = 203350
x203350_var_QuestIdPre =965
x203350_var_QuestId = 966
x203350_var_LevelLess	= 	94 
x203350_var_QuestIdNext = 967
x203350_var_Name	={}
x203350_var_ExtTarget={{type=20,n=1,target="回复@npc_120106"}}
x203350_var_QuestName="【剧场】真相<三>"
x203350_var_QuestInfo="\t贝拉……曾经的贝拉四世与我是手足兄弟，可在他得到神圣罗马帝国的扶持登上国王宝座后整个人也变了！开始残暴不仁，暗地中更是勾结吸血鬼妄图建立不死军团！我为了阻止他，失败后也被驱逐出王室落魄此处！\n\t王室的守护军--竧返瓁Τ獶盽纔╭参ī焊弧琌иま滤тぇ獺穦籔酵酵临Τ程ぃ璶籔寄"  
x203350_var_QuestTarget=""		
x203350_var_QuestCompleted="就是你们消灭的吸血鬼公爵？恩......斯道尔公爵叫你们来找我，看来他也是极为信任你们了。"					
x203350_var_ContinueInfo=""
x203350_var_QuestHelp =	""
x203350_var_DemandItem ={}
x203350_var_ExpBonus = 858000
x203350_var_BonusMoney1 =1000
x203350_var_BonusMoney2 =0
x203350_var_BonusMoney3 =0
x203350_var_BonusMoney4 =0
x203350_var_BonusMoney5 =136
x203350_var_BonusMoney6 =0
x203350_var_BonusItem	=	{}
x203350_var_BonusChoiceItem ={}
x203350_var_NpcGUID ={{ guid = 120106, varName = "贝尔"} }

--DECLARE_QUEST_INFO_STOP--
x203350_var_beier =-1
x203350_var_doing =0
x203350_var_shizijunzhongqishi1 =-1
x203350_var_shizijunzhongqishi2 =-1
x203350_var_shizijunzhongqishi3 =-1
x203350_var_shizijunzhongqishi4 =-1
x203350_var_shizijunzhongqishi5 =-1
x203350_var_shizijunzhongqishi6 =-1
x203350_var_badu =-1
x203350_var_boyan =-1
x203350_var_guobaoyu =-1
x203350_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x203350_var_acceptid =-1


function x203350_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203350_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203350_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x203350_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203350_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203350_var_QuestId, varState, -1 )
						end
			
	end
end

function x203350_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203350_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203350_var_ExpBonus )
		end
		if x203350_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203350_var_BonusMoney1 )
		end
		if x203350_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203350_var_BonusMoney2 )
		end
		if x203350_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203350_var_BonusMoney3 )
		end
		if x203350_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203350_var_BonusMoney4 )
		end
		if x203350_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203350_var_BonusMoney5 )
		end
		if x203350_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203350_var_BonusMoney6 )
		end
		for varI, item in x203350_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203350_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203350_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

	if IsQuestHaveDone(varMap, varPlayer, x203350_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203350_var_QuestId) > 0 then
			if x203350_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203350_var_QuestName)
						TalkAppendString(varMap,x203350_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203350_var_FileId, x203350_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203350_var_QuestName)
						TalkAppendString(varMap,x203350_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203350_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203350_var_FileId, x203350_var_QuestId);
			end
  elseif x203350_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203350_var_QuestName)
			TalkAppendString(varMap,x203350_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203350_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203350_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203350_var_QuestHelp )
			end
			x203350_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203350_var_FileId, x203350_var_QuestId);
  end
	
end


function x203350_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203350_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203350_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203350_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203350_var_QuestId  )
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
		
		if x203350_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203350_var_QuestId, x203350_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203350_Msg2toplayer( varMap, varPlayer,0)
		  			
						

						
		  			StartItemTask(varMap)
							
 							
							
    				StopItemTask(varMap,varPlayer)
    				
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203350_var_QuestId)								                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203350_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203350_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203350_var_QuestId)
	  x203350_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203350_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203350_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203350_var_BonusChoiceItem do
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


function x203350_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203350_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203350_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203350_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203350_var_QuestId) > 0 then
				x203350_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203350_var_QuestId)
				
				x203350_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203350_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203350_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		

	 	end        
									
    		
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203350_var_QuestIdNext )

   	 x203350_var_beier =FindMonsterByGUID( varMap,120106)
    							if x203350_var_doing==0 then
										
												if IsObjValid (varMap,x203350_var_beier) == 1 then
    							    			NpcTalk(varMap, x203350_var_beier, "不过你私闯我大营，想要离开这里，得露两手本事了！", -1)
    							    	end
    							    	x203350_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
														x203350_var_doing =2
														x203350_var_shizijunzhongqishi1=CreateMonster(varMap, 16127,80.1,105.8,3,1,-1,120018,20,30000,135)
    							          x203350_var_shizijunzhongqishi2=CreateMonster(varMap, 16127,69.6,106.0,3,1,-1,120018,20,30000,325)
    							          x203350_var_shizijunzhongqishi3=CreateMonster(varMap, 16127,80.3,102.0,3,1,-1,120018,20,30000,180)
    							          x203350_var_shizijunzhongqishi4=CreateMonster(varMap, 16127,69.3,102.1,3,1,-1,120018,20,30000,360)
    							          x203350_var_shizijunzhongqishi5=CreateMonster(varMap, 16127,69.5,97.7,3,1,-1,120018,20,30000,315)
														x203350_var_shizijunzhongqishi6=CreateMonster(varMap, 16127,80.0,98.3,3,1,-1,120018,20,30000,225)
							if IsObjValid (varMap,x203350_var_shizijunzhongqishi1) == 1 then
								SetPatrolId(varMap, x203350_var_shizijunzhongqishi1, 0)	             
							if IsObjValid (varMap,x203350_var_shizijunzhongqishi2) == 1 then 
							SetPatrolId(varMap, x203350_var_shizijunzhongqishi2, 1)	      
							if IsObjValid (varMap,x203350_var_shizijunzhongqishi3) == 1 then 
							SetPatrolId(varMap, x203350_var_shizijunzhongqishi3, 2)	
							if IsObjValid (varMap,x203350_var_shizijunzhongqishi4) == 1 then
							SetPatrolId(varMap, x203350_var_shizijunzhongqishi4, 3)	             
							if IsObjValid (varMap,x203350_var_shizijunzhongqishi5) == 1 then 
							SetPatrolId(varMap, x203350_var_shizijunzhongqishi5, 4)	      
							if IsObjValid (varMap,x203350_var_shizijunzhongqishi6) == 1 then 
							SetPatrolId(varMap, x203350_var_shizijunzhongqishi6, 5)  
							end
							end
							end
							end
							end
							end
														
														
    							    			
														
    							          x203350_var_PROTECTINFO.StartTime = GetCurrentTime()
														x203350_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203350, "ProcScneneTimer", 1)
    							  end
    							
    												
																
														
													
														
										  		
									  			
									
												
												
												
												
												
									
 
 end
 


function x203350_ProcScneneTimer(varMap)
 
	if x203350_var_doing == 2   then
			if GetCurrentTime() - x203350_var_PROTECTINFO.StartTime >= 2   then
				x203350_var_badu=CreateMonster(varMap, 16106,74.6,90,3,1,-1,120016,20,23000,270,"拔都")        
				x203350_var_guobaoyu=CreateMonster(varMap, 16100,77,88,3,1,-1,120001,20,23000,270,"郭宝玉")
		   	x203350_var_boyan=CreateMonster(varMap, 16104,72,88,3,1,-1,120012,20,23000,270,"伯颜")
			  x203350_var_doing =3
			  end
							if IsObjValid (varMap,x203350_var_badu) == 1 then
								SetPatrolId(varMap, x203350_var_badu, 6)	 
							end            
							if IsObjValid (varMap,x203350_var_guobaoyu) == 1 then 
								SetPatrolId(varMap, x203350_var_guobaoyu, 7)
							end	      
							if IsObjValid (varMap,x203350_var_boyan) == 1 then 
								SetPatrolId(varMap, x203350_var_boyan, 8)	      
							end
				elseif x203350_var_doing == 3   then
			if GetCurrentTime() - x203350_var_PROTECTINFO.StartTime >= 5   then
						x203350_var_doing =4
							if IsObjValid (varMap,x203350_var_badu) == 1 then                                                                                                                                  						
								NpcTalk(varMap, x203350_var_badu, "哈哈，堂堂圣殿骑士统帅如今怎么成了傀儡般的战争机器！？", -1) 
							end  
				end
				elseif x203350_var_doing == 4   then
			if GetCurrentTime() - x203350_var_PROTECTINFO.StartTime >= 7   then
						x203350_var_doing =5
							if IsObjValid (varMap,x203350_var_guobaoyu) == 1 then
								NpcTalk(varMap, x203350_var_guobaoyu, "贝尔统帅此次行事是否太过鲁莽？", -1)
							end
				end
				elseif x203350_var_doing == 5   then
			if GetCurrentTime() - x203350_var_PROTECTINFO.StartTime >= 9   then
						x203350_var_doing =6
							if IsObjValid (varMap,x203350_var_boyan) == 1 then
								NpcTalk(varMap, x203350_var_boyan, "匈牙利王国圣殿十字军果然威武非凡啊！", -1)
							end  
			end   
	elseif x203350_var_doing == 6   then
			if GetCurrentTime() - x203350_var_PROTECTINFO.StartTime >= 11   then
						x203350_var_doing =7
						if IsObjValid (varMap,x203350_var_beier) == 1 then
								NpcTalk(varMap, x203350_var_beier, "......没想到竟然是西征军统帅拔都，副统帅郭宝玉和西征大将军伯颜。大驾光临有失远迎啊！", -1)
						end
			end
	elseif x203350_var_doing == 7   then
			if GetCurrentTime() - x203350_var_PROTECTINFO.StartTime >= 13   then
						x203350_var_doing =8
						if IsObjValid (varMap,x203350_var_beier) == 1 then
								NpcTalk(varMap, x203350_var_beier, "三位真乃豪杰，单枪匹马也敢进我圣殿十字军要塞。", -1)
						end
			end
	elseif x203350_var_doing == 8   then
			if GetCurrentTime() - x203350_var_PROTECTINFO.StartTime >= 15   then
						x203350_var_doing =9
						if IsObjValid (varMap,x203350_var_badu) == 1 then
								NpcTalk(varMap, x203350_var_badu, "我们受匈牙利全国百姓所托，受斯道尔公爵所托，前来与贝尔统领言和。", -1)
						end
			end
	elseif x203350_var_doing == 9   then
			if GetCurrentTime() - x203350_var_PROTECTINFO.StartTime >= 17   then
						x203350_var_doing =10
						if IsObjValid (varMap,x203350_var_guobaoyu) == 1 then
								NpcTalk(varMap, x203350_var_guobaoyu, "贝尔统帅深明大义，也不想国家处于暴政与战乱之中吧！", -1)
						end
						x203350_CloseTimer(varMap, x203350_var_PROTECTINFO.ScneneTimerIndex) 
			end			
  end    
      end  	




function x203350_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203350_var_doing =0
	x203350_var_shizijunzhongqishi1 =-1
	x203350_var_shizijunzhongqishi2 =-1
	x203350_var_shizijunzhongqishi3 =-1
	x203350_var_shizijunzhongqishi4 =-1
	x203350_var_shizijunzhongqishi5 =-1
	x203350_var_shizijunzhongqishi6 =-1
	x203350_var_badu =-1
	x203350_var_boyan =-1
	x203350_var_guobaoyu =-1  
	
	x203350_var_acceptid =-1
	x203350_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x203350_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203350_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203350_var_ExpBonus);
  	end
		if x203350_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203350_var_BonusMoney1 )
	  end
		if x203350_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203350_var_BonusMoney2 )
	  end
		if x203350_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203350_var_BonusMoney3 )
		end
		if x203350_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203350_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203350_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203350_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203350_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203350_var_BonusMoney6)
		end
end

function x203350_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203350_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203350_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203350_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203350_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203350_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203350_var_QuestName.."！", 0, 3)
				if x203350_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203350_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203350_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203350_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203350_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203350_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203350_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203350_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203350_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203350_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203350_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203350_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203350_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203350_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203350_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203350_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203350_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203350_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203350_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203350_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203350_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203350_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203350_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203350_var_QuestId, varState, -1 )
		end
end

function x203350_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203350_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203350_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203350_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203350_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203350_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
