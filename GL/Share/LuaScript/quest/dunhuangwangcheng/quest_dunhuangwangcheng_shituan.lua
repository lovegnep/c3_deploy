

--DECLARE_QUEST_INFO_START--
x256056_var_FileId = 256056
x256056_var_QuestIdPre =1615
x256056_var_QuestId = 1616
x256056_var_LevelLess	= 	10 
x256056_var_QuestIdNext = 1617
x256056_var_Name	={}
x256056_var_ExtTarget={{type=20,n=1,target="找到@npc_138050"}}
x256056_var_QuestName="【主线】蒙古秘史<六>"
x256056_var_QuestInfo="\t用了美容秘方，我忽然间觉得皮肤好了很多，记忆也……恢复过来了，嘻嘻，哈喇图老爷子是寄放了一件羊皮袄在这，我拿给你。"  
x256056_var_QuestTarget=""		
x256056_var_QuestCompleted="\t（哈喇图轻轻撕开羊皮袄的内衬，取出几页纸。）\n\t其实，他们所有人想要的秘密就在这件破旧的羊皮袄之中。 "					
x256056_var_ContinueInfo=""
x256056_var_QuestHelp =	""

x256056_var_BonusMoney1 =253
x256056_var_BonusMoney2 =0
x256056_var_BonusMoney3 =0
x256056_var_BonusMoney4 =0
x256056_var_BonusMoney5 =26
x256056_var_BonusMoney6 =0
x256056_var_BonusItem	=	{}
x256056_var_BonusChoiceItem ={}
x256056_var_ExpBonus = 2932
x256056_var_NpcGUID ={{ guid = 138050, varName = "哈喇图"} }

--DECLARE_QUEST_INFO_STOP--
x256056_var_zhubaoshangren =0
x256056_var_doing =0
x256056_var_huhelu =-1
x256056_var_huwei1 =-1
x256056_var_huwei2 =-1
x256056_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x256056_var_acceptid =-1


function x256056_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x256056_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x256056_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x256056_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256056_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256056_var_QuestId, varState, -1 )
						end
			
	end
end

function x256056_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256056_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256056_var_ExpBonus )
		end
		if x256056_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256056_var_BonusMoney1 )
		end
		if x256056_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256056_var_BonusMoney2 )
		end
		if x256056_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256056_var_BonusMoney3 )
		end
		if x256056_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256056_var_BonusMoney4 )
		end
		if x256056_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256056_var_BonusMoney5 )
		end
		if x256056_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256056_var_BonusMoney6 )
		end
		for varI, item in x256056_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256056_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256056_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256056_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256056_var_QuestId) > 0 then
			if x256056_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256056_var_QuestName)
						TalkAppendString(varMap,x256056_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256056_var_FileId, x256056_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256056_var_QuestName)
						TalkAppendString(varMap,x256056_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256056_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256056_var_FileId, x256056_var_QuestId);
			end
  elseif x256056_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256056_var_QuestName)
			TalkAppendString(varMap,x256056_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256056_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256056_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256056_var_QuestHelp )
			end
			x256056_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256056_var_FileId, x256056_var_QuestId);
  end
	
end


function x256056_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x256056_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x256056_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256056_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256056_var_QuestId  )
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
		
		if x256056_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256056_var_QuestId, x256056_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256056_Msg2toplayer( varMap, varPlayer,0)
						
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256056_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			x256056_var_zhubaoshangren =FindMonsterByGUID( varMap,138500)
    				if x256056_var_doing==0 then
								if x256056_var_huhelu==-1 then
										x256056_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 256056, "ProcScneneTimer", 1)
										if x256056_var_PROTECTINFO.ScneneTimerIndex >= 0 then
											if IsObjValid (varMap,x256056_var_zhubaoshangren) == 1 then
    			    					NpcTalk(varMap, x256056_var_zhubaoshangren, "哎呀，不好，有人找上门了。", -1)
    			    				end
    			    					x256056_var_doing =2
												x256056_var_huhelu=CreateMonster(varMap, 139,285,126,3,1,-1,-1,20,-1,90,"胡和鲁","窝阔台汗国")
    			          		x256056_var_huwei1=CreateMonster(varMap, 141,282,128,3,1,-1,-1,20,-1,90,"胡和鲁护卫")
    			          		x256056_var_huwei2=CreateMonster(varMap, 141,282,124,3,1,-1,-1,20,-1,90,"胡和鲁护卫")		      
												
    			    					
												
    			          		x256056_var_PROTECTINFO.StartTime = GetCurrentTime()
    			          end
    			  		end
    						
    								
												
										
									
										
						  		
					  			
							
								
								
								
								
								
						end
	    			
		  		end
	 	end                                                                    
	     
end


function x256056_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256056_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256056_var_QuestId)
	  x256056_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256056_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256056_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256056_var_BonusChoiceItem do
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

function x256056_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256056_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256056_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256056_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256056_var_QuestId) > 0 then
				x256056_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256056_var_QuestId)
				x256056_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256056_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256056_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		
	 	end        
									
    		

   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256056_var_QuestIdNext )	
end


function x256056_ProcScneneTimer(varMap)
	
		
		
			
			
				
					
					
					
					
						
					
				
			
		
		
	
	if x256056_var_doing==2   then
		if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 1   then
						x256056_var_doing = 3
		end
elseif x256056_var_doing == 3   then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 2   then
					if IsObjValid (varMap,x256056_var_zhubaoshangren) == 1 then
						NpcTalk(varMap, x256056_var_zhubaoshangren, "哎呀，几位将军大驾光临，要买点珠宝玉器么？", -1)
					end
                       
        		x256056_var_doing =4
			end
	elseif x256056_var_doing == 4   then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 5   then
					if IsObjValid (varMap,x256056_var_huhelu) == 1 then
						NpcTalk(varMap, x256056_var_huhelu, "少废话！听说哈喇图那老家伙在你这放了点东西？", -1)
          end        
						x256056_var_doing =5
			end
	elseif x256056_var_doing == 5   then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 8   then
					if IsObjValid (varMap,x256056_var_zhubaoshangren) == 1 then
						NpcTalk(varMap, x256056_var_zhubaoshangren, "......哈喇图？小女子不认识这人。", -1)
          end    
						x256056_var_doing =6
			end
	elseif x256056_var_doing == 6   then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 11   then
					if IsObjValid (varMap,x256056_var_huhelu) == 1 then
						NpcTalk(varMap, x256056_var_huhelu, "敢骗我？信不信老子当场把你给......", -1)
          end           
						x256056_var_doing =7
			end
	elseif x256056_var_doing == 7   then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 14   then
					if IsObjValid (varMap,x256056_var_huwei1) == 1 then
						NpcTalk(varMap, x256056_var_huwei1, "头！头！我看见那个刚才给我们送饭的......", -1)
					end
					if IsObjValid (varMap,x256056_var_huhelu) == 1 then
             SetMonsterDir(varMap,x256056_var_huhelu,330)
          end
						x256056_var_doing =8
			end
	elseif x256056_var_doing == 8   then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 16   then
					if IsObjValid (varMap,x256056_var_huhelu) == 1 then
						NpcTalk(varMap, x256056_var_huhelu, "饭什么饭！你这个蠢货就知道吃！找不到秘史，霍博大人怪罪下来，小心老子扒了你的皮！", -1)
          end
						x256056_var_doing =9
			end
	
	elseif x256056_var_doing == 9   then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 18   then
					if IsObjValid (varMap,x256056_var_huwei2) == 1 then
						NpcTalk(varMap, x256056_var_huwei2, "头！不好了，巡逻的军官过来了！", -1)
          end
						x256056_var_doing =10
			end
	elseif x256056_var_doing == 10   then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 19   then
					if IsObjValid (varMap,x256056_var_huhelu) == 1 then
						NpcTalk(varMap, x256056_var_huhelu, "什么?......走！", -1)
          end
						x256056_var_doing =11
			end
	elseif x256056_var_doing==11 then
			if GetCurrentTime() - x256056_var_PROTECTINFO.StartTime >= 23   then
				
					
						
							
							
						
								
								
								
								
								
								
								
						
					
				
			
			x256056_var_doing=12
			x256056_CloseTimer(varMap, x256056_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x256056_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	DeleteMonster (varMap,x256056_var_huhelu )
	DeleteMonster (varMap,x256056_var_huwei1 )
	DeleteMonster (varMap,x256056_var_huwei2 )
	x256056_var_doing =0
	x256056_var_huhelu =-1
	x256056_var_huwei1 =-1
	x256056_var_huwei2 =-1
	x256056_var_acceptid =-1
	x256056_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x256056_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256056_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256056_var_ExpBonus);
  	end
		if x256056_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256056_var_BonusMoney1 )
	  end
		if x256056_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256056_var_BonusMoney2 )
	  end
		if x256056_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256056_var_BonusMoney3 )
		end
		if x256056_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256056_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256056_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256056_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256056_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256056_var_BonusMoney6)
		end
end

function x256056_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256056_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256056_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256056_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256056_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256056_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256056_var_QuestName.."！", 0, 3)
				if x256056_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256056_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256056_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256056_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256056_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256056_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256056_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256056_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256056_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256056_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256056_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256056_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256056_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256056_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256056_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256056_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256056_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256056_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256056_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256056_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256056_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256056_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256056_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256056_var_QuestId, varState, -1 )
		end
end

function x256056_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256056_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256056_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256056_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256056_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256056_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
