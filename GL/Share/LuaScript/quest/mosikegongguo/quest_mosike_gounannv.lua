

--DECLARE_QUEST_INFO_START--
x203327_var_FileId = 203327
x203327_var_QuestIdPre = 808
x203327_var_QuestId = 809
x203327_var_LevelLess	= 	88
x203327_var_QuestIdNext = 810
x203327_var_Name	={}
x203327_var_ExtTarget={{type=20,n=1,target="找到@npc_117005"}}
x203327_var_QuestName="【剧场】策反喀山大公<二>"
x203327_var_QuestInfo="\t好，我这就去见艾尔莎，真不知道她突然找我到底有什么事，我，我有点激动……\n\t这样吧，你先去告诉她，我马上就到，我，我得准备一下！"  
x203327_var_QuestTarget=""		
x203327_var_QuestCompleted="\t好，我就在这里等他过来吧。"					
x203327_var_ContinueInfo=""
x203327_var_QuestHelp =	""
x203327_var_DemandItem ={}
x203327_var_ExpBonus = 684000
x203327_var_BonusMoney1 =880
x203327_var_BonusMoney2 =0
x203327_var_BonusMoney3 =0
x203327_var_BonusMoney4 =0
x203327_var_BonusMoney5 =106
x203327_var_BonusMoney6 =0
x203327_var_BonusItem	=	{}
x203327_var_BonusChoiceItem ={}
x203327_var_NpcGUID ={{ guid = 117005, varName = "立陶宛大公"} }

--DECLARE_QUEST_INFO_STOP--
x203327_var_litaowandagong =-1
x203327_var_doing =0
x203327_var_kashandagong =-1





x203327_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0} 
x203327_var_acceptid =-1


function x203327_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x203327_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203327_var_QuestIdPre)> 0 then
			if IsHaveQuest(varMap,varPlayer, x203327_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203327_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203327_var_QuestId, varState, -1 )
			end		
	end
end

function x203327_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203327_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203327_var_ExpBonus )
		end
		if x203327_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203327_var_BonusMoney1 )
		end
		if x203327_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203327_var_BonusMoney2 )
		end
		if x203327_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203327_var_BonusMoney3 )
		end
		if x203327_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203327_var_BonusMoney4 )
		end
		if x203327_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203327_var_BonusMoney5 )
		end
		if x203327_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203327_var_BonusMoney6 )
		end
		for varI, item in x203327_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203327_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203327_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203327_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203327_var_QuestId) > 0 then
			if x203327_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203327_var_QuestName)
						TalkAppendString(varMap,x203327_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203327_var_FileId, x203327_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203327_var_QuestName)
						TalkAppendString(varMap,x203327_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203327_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203327_var_FileId, x203327_var_QuestId);
			end
  elseif x203327_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203327_var_QuestName)
			TalkAppendString(varMap,x203327_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203327_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203327_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203327_var_QuestHelp )
			end
			x203327_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203327_var_FileId, x203327_var_QuestId);
  end
	
end


function x203327_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203327_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203327_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203327_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203327_var_QuestId  )
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
		
		if x203327_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203327_var_QuestId, x203327_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203327_Msg2toplayer( varMap, varPlayer,0)
		  			
						
 						
						
    				
    				
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203327_var_QuestId)								                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203327_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203327_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203327_var_QuestId)
	  x203327_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203327_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203327_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203327_var_BonusChoiceItem do
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

function x203327_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203327_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203327_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203327_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203327_var_QuestId) > 0 then
				x203327_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203327_var_QuestId)
				
				x203327_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203327_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203327_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		x203327_var_litaowandagong =FindMonsterByGUID( varMap,117005)
    			if x203327_var_doing==0 then
						if x203327_var_kashandagong==-1 then
								if IsObjValid (varMap,x203327_var_litaowandagong) == 1 then
    			    			NpcTalk(varMap, x203327_var_litaowandagong, "他来了！请你们帮我注意四周，不要被他们的爪牙听见！", -1)
    			    	end
    			    			x203327_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
										x203327_var_doing =1
										x203327_var_kashandagong=CreateMonster(varMap, 2106,140,48,3,1,-1,-1,20,52500,180)      
    			          x203327_var_PROTECTINFO.StartTime = GetCurrentTime()
										x203327_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203327, "ProcScneneTimer", 1)
    			  end
					end
	 	end        
									
    		

   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203327_var_QuestIdNext )	
end


function x203327_ProcScneneTimer(varMap)
	if x203327_var_doing==1   then				
	   if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 4   then
			  x203327_var_doing = 3
			 
				if IsObjValid (varMap,x203327_var_litaowandagong) == 1 then
				
						NpcTalk(varMap, x203327_var_litaowandagong, "山德鲁，你身为喀山大公真的想一辈子被人欺淩，被人看不起么？你，和他们一样，是个大公！", -1)
				end
     end
	 elseif x203327_var_doing == 3   then
			if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 9   then
						x203327_var_doing =5
						if IsObjValid (varMap,x203327_var_kashandagong) == 1 then
								NpcTalk(varMap, x203327_var_kashandagong, "我，我不想，可是我打不过他们，我怕……", -1)
						end
			end
	 elseif x203327_var_doing == 5   then
			if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 13  then
						x203327_var_doing =6
						if IsObjValid (varMap,x203327_var_litaowandagong) == 1 then
								NpcTalk(varMap, x203327_var_litaowandagong, "怕？你怕什么？作为一个男人，统治喀山的大公，你竟然和一个女人说害怕！", -1)
						end
			end
	 elseif x203327_var_doing == 6   then
			if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 18   then
						x203327_var_doing =7
						if IsObjValid (varMap,x203327_var_kashandagong) == 1 then
								NpcTalk(varMap, x203327_var_kashandagong, "不，不，我不是怕他们，我是怕，怕，我怕失败了，你会看不起我，怕会牵连你！", -1)
						end
			end
	 elseif x203327_var_doing == 7   then
			
						
						
								
						
	    
	
			if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 23   then
						x203327_var_doing =9
						if IsObjValid (varMap,x203327_var_litaowandagong) == 1 then
								NpcTalk(varMap, x203327_var_litaowandagong, "他们几个狼狈为奸，早已惹起众怒，今天的形势，蒙古大军一统斯拉夫地区已经是必然之势！", -1)
						end
			end
	 elseif x203327_var_doing == 9  then   
			if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 28   then 	
						x203327_var_doing =10			
						if IsObjValid (varMap,x203327_var_litaowandagong) == 1 then
								NpcTalk(varMap, x203327_var_litaowandagong, "我，艾尔莎，不仅是立陶宛的统治者，也是一个女人，我只想嫁给一个英雄，而不是一个委曲求全的狗熊！", -1)
						end
			end
	 elseif x203327_var_doing == 10   then	
			if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 32   then 
				x203327_var_doing =11		                                     				
						if IsObjValid (varMap,x203327_var_kashandagong) == 1 then
								NpcTalk(varMap, x203327_var_kashandagong, "好，既然你这么说，我也要让你看看，我山德鲁，喀山大公，也是一个男子汉！", -1)
						end
			end
	 elseif x203327_var_doing == 11   then
			if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 37   then      
				x203327_var_doing =12	
				if IsObjValid (varMap,x203327_var_litaowandagong) == 1 then 
					NpcTalk(varMap, x203327_var_litaowandagong, "好，等蒙古大军发出信号，我们就里应外合。事不成，我和你一起去上帝那里控诉他们！", -1)                                          
						
				end		
						
								
						
			end
	 elseif x203327_var_doing == 12   then 
	     if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 42  then 
				x203327_var_doing =13		                                     				
						if IsObjValid (varMap,x203327_var_kashandagong) == 1 then
	  				NpcTalk(varMap, x203327_var_kashandagong, "好，我宁愿体无完肤的去见上帝，也不愿在恶魔爪下完整的生活！等着我，我要请大主教来替我们主持婚礼！", -1)
	
			
						
						
								
						end
			end
    elseif x203327_var_doing==13 then
			 if GetCurrentTime() - x203327_var_PROTECTINFO.StartTime >= 45  then
			  x203327_var_doing=13
			   x203327_CloseTimer(varMap, x203327_var_PROTECTINFO.ScneneTimerIndex)
			 end
	 end
end






function x203327_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203327_var_doing =0
	x203327_var_litaowandagong =-1
  x203327_var_doing =0
  x203327_var_kashandagong =-1
  
  
  
  
  
	x203327_var_acceptid =-1
	x203327_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x203327_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203327_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203327_var_ExpBonus);
  	end
		if x203327_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203327_var_BonusMoney1 )
	  end
		if x203327_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203327_var_BonusMoney2 )
	  end
		if x203327_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203327_var_BonusMoney3 )
		end
		if x203327_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203327_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203327_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203327_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203327_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203327_var_BonusMoney6)
		end
end

function x203327_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203327_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203327_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203327_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203327_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203327_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203327_var_QuestName.."！", 0, 3)
				if x203327_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203327_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203327_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203327_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203327_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203327_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203327_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203327_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203327_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203327_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203327_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203327_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203327_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203327_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203327_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203327_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203327_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203327_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203327_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203327_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203327_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203327_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203327_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203327_var_QuestId, varState, -1 )
		end
end

function x203327_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203327_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203327_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203327_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203327_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203327_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
