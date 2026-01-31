

--DECLARE_QUEST_INFO_START--
x203112_var_FileId = 203112
x203112_var_QuestIdPre =520
x203112_var_QuestId = 522
x203112_var_LevelLess	= 	60 
x203112_var_QuestIdNext = 523
x203112_var_Name	={}
x203112_var_ExtTarget={{type=20,n=1,target="击杀完颜洪烈"}}
x203112_var_QuestName="【剧场】枭雄的陨落"
x203112_var_QuestInfo="\t完颜洪烈拒绝了你的劝降请求。"  
x203112_var_QuestTarget=""		
x203112_var_QuestCompleted="\t没想到一代枭雄完颜洪烈就这样。。。终于结束了，从此以后完颜洪烈与金国将永远的退出历史舞台！"					
x203112_var_ContinueInfo="\t一定不能让完颜洪烈走掉。"
x203112_var_QuestHelp =	""
x203112_var_DemandItem ={}
x203112_var_ExpBonus = 93000
x203112_var_BonusMoney1 =376
x203112_var_BonusMoney2 =0
x203112_var_BonusMoney3 =0
x203112_var_BonusMoney4 =0
x203112_var_BonusMoney5 =51
x203112_var_BonusMoney6 =0
x203112_var_BonusItem	=	{}
x203112_var_BonusChoiceItem ={}
x203112_var_doing = 0
x203112_var_acceptid =-1
x203112_var_tuolei = -1
x203112_var_xuliewu = -1
x203112_var_yelvchucai = -1
x203112_var_hedan =-1
x203112_var_chahetai = -1
x203112_var_quchulv = -1
x203112_var_wanyanhonglie = -1
x203112_var_2feiqi = -1
x203112_var_3feiqi = -1
x203112_var_4feiqi = -1
x203112_var_5feiqi = -1
x203112_var_6feiqi = -1
x203112_var_7feiqi = -1
x203112_var_8feiqi =-1
x203112_var_9feiqi =-1
x203112_var_10feiqi =0
x203112_var_11feiqi =0
x203112_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x203112_var_NpcGUID ={{ guid = 111007, varName = "耶律楚材"} }
--DECLARE_QUEST_INFO_STOP--


function x203112_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203112_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203112_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x203112_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203112_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203112_var_QuestId, varState, -1 )
		end
	end
end

function x203112_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203112_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203112_var_ExpBonus )
		end
		if x203112_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203112_var_BonusMoney1 )
		end
		if x203112_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203112_var_BonusMoney2 )
		end
		if x203112_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203112_var_BonusMoney3 )
		end
		if x203112_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203112_var_BonusMoney4 )
		end
		if x203112_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203112_var_BonusMoney5 )
		end
		if x203112_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203112_var_BonusMoney6 )
		end
		for varI, item in x203112_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203112_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203112_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203112_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203112_var_QuestId) > 0 then
			if x203112_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203112_var_QuestName)
						TalkAppendString(varMap,x203112_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203112_var_FileId, x203112_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203112_var_QuestName)
						TalkAppendString(varMap,x203112_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203112_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203112_var_FileId, x203112_var_QuestId);
			end
  elseif x203112_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203112_var_QuestName)
			TalkAppendString(varMap,x203112_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203112_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203112_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203112_var_QuestHelp )
			end
			x203112_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203112_var_FileId, x203112_var_QuestId);
	else
			Msg2Player(varMap, varPlayer, "您现在的状态无法接受此任务！", 0, 3)
  end
	
end


function x203112_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203112_var_QuestIdPre)> 0 then
				if IsHaveQuest(varMap,varPlayer, 7537) > 0 then
						return 0
				elseif IsHaveQuest(varMap,varPlayer, 7538) > 0 then
						return 0
				elseif IsHaveQuest(varMap,varPlayer, 7539) > 0 then
						return 0
				elseif IsHaveSpecificImpact(varMap, varPlayer, 7516) > 0 then
						return 0
				elseif IsHaveSpecificImpact(varMap, varPlayer, 7517) > 0 then
						return 0
				end
				return 1
		end
		return 0

end

function x203112_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x203112_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
	
end

function x203112_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203112_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203112_var_QuestId  )
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
		if x203112_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
				if x203112_var_doing == 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203112_var_QuestId, x203112_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203112_Msg2toplayer( varMap, varPlayer,0)
		  			x203112_var_PROTECTINFO.StartTime = GetCurrentTime()
						x203112_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203112, "ProcScneneTimer", 1)
						if x203112_var_PROTECTINFO.ScneneTimerIndex >= 0 then
								x203112_var_doing = 1
								x203112_var_acceptid = varPlayer
								x203112_var_tuolei=CreateMonster(varMap, 1407,203.588943,213.748093,3,1,-1,-1,20,38000,180,"拖雷")
								x203112_var_xuliewu=CreateMonster(varMap, 153,202.679352,215.773346,3,1,-1,-1,20,38000,180,"旭烈兀")
								x203112_var_yelvchucai=CreateMonster(varMap, 213,204.524567,211.764801,3,1,-1,-1,20,38000,180,"耶律楚材")
								x203112_var_hedan=CreateMonster(varMap, 153,201.728653,217.573944,3,1,-1,-1,20,38000,180,"合丹")
								x203112_var_chahetai=CreateMonster(varMap, 153,205.507416,209.875259,3,1,-1,-1,20,38000,180,"察合台")
								SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7712, 0);
								Msg2Player(varMap, varPlayer, "你闻到一阵奇异的香气，使你一阵阵头晕无力！", 0, 3)
								
								
								
						end
		  		end
				else
					Msg2Player(varMap, varPlayer, "任务暂时无法接受！", 0, 3)
				end
		else
				Msg2Player(varMap, varPlayer, "您现在的状态无法接受此任务！", 0, 3)
	 	end                                                                    
	     
end


function x203112_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203112_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203112_var_QuestId)
	  x203112_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203112_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203112_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203112_var_BonusChoiceItem do
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

function x203112_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203112_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203112_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203112_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203112_var_QuestId) > 0 then
				x203112_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203112_var_QuestId)
				x203112_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203112_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203112_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203112_var_QuestIdNext )	
end

function x203112_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203112_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203112_var_ExpBonus);
  	end
		if x203112_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203112_var_BonusMoney1 )
	  end
		if x203112_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203112_var_BonusMoney2 )
	  end
		if x203112_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203112_var_BonusMoney3 )
		end
		if x203112_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203112_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203112_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203112_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203112_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203112_var_BonusMoney6)
		end
end

function x203112_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203112_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203112_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203112_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203112_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203112_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203112_var_QuestName.."！", 0, 3)
				if x203112_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203112_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203112_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203112_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203112_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203112_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203112_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203112_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203112_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203112_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203112_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203112_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203112_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203112_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203112_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203112_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203112_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203112_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203112_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203112_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203112_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203112_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203112_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203112_var_QuestId, varState, -1 )
		end
end

function x203112_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203112_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203112_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203112_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203112_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203112_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203112_ProcScneneTimer(varMap)
	if x203112_var_doing==1   then
		if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 2   then
						x203112_var_doing = 2
						if IsObjValid (varMap,x203112_var_tuolei) == 1 then
								NpcTalk(varMap, x203112_var_tuolei, "恶贼休要伤人！", -1)
								x203112_var_wanyanhonglie =FindMonsterByGUID( varMap,111009)
								SetPatrolId(varMap, x203112_var_tuolei, 0)
								SetPatrolId(varMap, x203112_var_xuliewu, 1)  
								SetPatrolId(varMap, x203112_var_yelvchucai, 2) 
								SetPatrolId(varMap, x203112_var_hedan, 3)
								SetPatrolId(varMap, x203112_var_chahetai, 4)
						end
		end
	elseif x203112_var_doing==2   then
		if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 4   then
						x203112_var_doing = 3
						if IsObjValid (varMap,x203112_var_xuliewu) == 1 then
								NpcTalk(varMap, x203112_var_xuliewu, "大家小心，前面有恶贼布下的毒。", -1)
								SetPatrolId(varMap, x203112_var_wanyanhonglie, 5)
						end
		end
	elseif x203112_var_doing == 3   then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 7   then
        		x203112_var_doing =4
						if IsObjValid (varMap,x203112_var_wanyanhonglie) == 1 then
								NpcTalk(varMap, x203112_var_wanyanhonglie, "拖雷你果然还是来了，没能让我踏入突厥！", -1)
						end
			end
	elseif x203112_var_doing == 4   then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 15   then
						x203112_var_doing =5
						if IsObjValid (varMap,x203112_var_wanyanhonglie) == 1 then
								SetMonsterDir(varMap,x203112_var_wanyanhonglie,120)
								if IsObjValid (varMap,x203112_var_tuolei) == 1 then
									NpcTalk(varMap, x203112_var_tuolei, "完颜洪烈你身后已无退路，不要再试图逃跑了！", -1)
								end	
						end
						
						
						x203112_var_quchulv=CreateMonster(varMap, 1712,217.006226,205.074417,3,1,-1,-1,20,31000,180,"屈出律")   
						
						
						
						
						
						
						
						
						
						
							
						
						if IsObjValid (varMap,x203112_var_quchulv) == 1 then
								SetPatrolId(varMap, x203112_var_quchulv, 6)
						end
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
			end
	elseif x203112_var_doing == 5   then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 18   then
				x203112_var_doing =6
				if IsObjValid (varMap,x203112_var_wanyanhonglie) == 1 then
						NpcTalk(varMap, x203112_var_wanyanhonglie, "突厥之王！屈出律你还真是守信约的来了！", -1)
				end
			end
	elseif x203112_var_doing == 6   then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 21   then
						x203112_var_doing =7
						if IsObjValid (varMap,x203112_var_quchulv) == 1 then
								NpcTalk(varMap, x203112_var_quchulv, "你就是完颜洪烈么？早听说你要前往我突厥，我也是前来追杀你献于蒙古的，你不要胡乱说话！", -1)
						end
			end
	elseif x203112_var_doing == 7   then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 24   then
						x203112_var_doing =8
						if IsObjValid (varMap,x203112_var_wanyanhonglie) == 1 then
								NpcTalk(varMap, x203112_var_wanyanhonglie, "好，算我完颜洪烈看错人了。我死也不会死于你们手中！", -1)
								SendSpecificImpactToUnit(varMap, x203112_var_wanyanhonglie, x203112_var_wanyanhonglie, x203112_var_wanyanhonglie, 3060, 0)	
						end
			end
	elseif x203112_var_doing == 8   then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 28   then
						x203112_var_doing =9
						SetPos(varMap,x203112_var_wanyanhonglie,0,0)
						if IsObjValid (varMap,x203112_var_tuolei) == 1 then
								NpcTalk(varMap, x203112_var_tuolei, "！", -1)
						end
						if IsObjValid (varMap,x203112_var_xuliewu) == 1 then
								NpcTalk(varMap, x203112_var_xuliewu, "！", -1)
						end
						if IsObjValid (varMap,x203112_var_yelvchucai) == 1 then
								NpcTalk(varMap, x203112_var_yelvchucai, "！", -1)
						end
						if IsObjValid (varMap,x203112_var_hedan) == 1 then
								NpcTalk(varMap, x203112_var_hedan, "！", -1)
						end
						if IsObjValid (varMap,x203112_var_chahetai) == 1 then
								NpcTalk(varMap, x203112_var_chahetai, "！", -1)
						end						
			end
	elseif x203112_var_doing == 9   then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 32   then
						x203112_var_doing =10
				if IsObjValid (varMap,x203112_var_quchulv) == 1 then
								NpcTalk(varMap, x203112_var_quchulv, "久闻蒙古勇士们英勇，今日一见果然名不虚传，这是你所中之毒的解药。咱们后会有期了！", -1)
								SetPatrolId(varMap, x203112_var_quchulv, 7)
						end
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
			end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	elseif x203112_var_doing==10 then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 34   then
				x203112_var_doing=11
				if IsPlayerStateNormal(varMap,x203112_var_acceptid) ==1 then
					if IsHaveQuest(varMap,x203112_var_acceptid, x203112_var_QuestId) > 0 then
									local varQuestIdx = GetQuestIndexByID(varMap, x203112_var_acceptid, x203112_var_QuestId)
									SetQuestByIndex(varMap,x203112_var_acceptid,varQuestIdx,0,1)
									SetQuestByIndex(varMap,x203112_var_acceptid,varQuestIdx,7,1)
									StartTalkTask(varMap)
									TalkAppendString(varMap,format("击杀完颜洪烈   %d/1", GetQuestParam(varMap,x203112_var_acceptid,varQuestIdx,0) ))
									StopTalkTask(varMap)
									DeliverTalkTips(varMap,x203112_var_acceptid)
									CancelSpecificImpact(varMap,x203112_var_acceptid,7712)		
									SetPos(varMap,x203112_var_tuolei,0,0)
									SetPos(varMap,x203112_var_xuliewu,0,0)
									SetPos(varMap,x203112_var_yelvchucai,0,0)
									SetPos(varMap,x203112_var_hedan,0,0)
									SetPos(varMap,x203112_var_chahetai,0,0)		
									SetPos(varMap,x203112_var_quchulv,0,0)					
					end
				end
			end
elseif x203112_var_doing==11 then
			if GetCurrentTime() - x203112_var_PROTECTINFO.StartTime >= 38   then
				x203112_var_doing=12
				x203112_CloseTimer(varMap, x203112_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x203112_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203112_var_doing =0
	x203112_var_acceptid =-1
	x203112_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
	
	
	
	
	
	
	
	SetPatrolId(varMap, x203112_var_wanyanhonglie, -1)
	
	
	
	
	
	SetPos(varMap,x203112_var_wanyanhonglie,216,221)
	
	
	
	
	
	
	
	
	
	
	
	
	
	SetMonsterDir(varMap,x203112_var_wanyanhonglie,320)
	
	
end

function x203112_ProcQuestLogRefresh( varMap,varPlayer,varQuest)

    
    
		

end
