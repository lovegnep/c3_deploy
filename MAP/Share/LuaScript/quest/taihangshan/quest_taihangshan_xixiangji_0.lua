

--DECLARE_QUEST_INFO_START--
x270010_var_FileId = 270010
x270010_var_QuestIdPre =3500
x270010_var_QuestId = 3501
x270010_var_LevelLess	= 	45 
x270010_var_QuestIdNext = 3502
x270010_var_Name	={}
x270010_var_noDemandItem ={{varId=13020314,varNum=1}}
x270010_var_ExtTarget={{type=20,n=1,target="到@npc_141218放下酒坛询问红娘的爷爷"}}
x270010_var_QuestName="【主线】天赐姻缘<二>"
x270010_var_QuestInfo="\t我看那张生也是一表人才，莺莺美貌贤淑，二人若能喜结良缘也不失为是一件美事，不过我还有些事情要向我爷爷问清楚。\n\t你现在去买一坛美酒，把它放在城边的大树下，请那里一个手拿红线和书的老头喝酒，等他喝到高兴时，再问他我说的这件事，他一定会告诉你。"  
x270010_var_QuestTarget=""		
x270010_var_QuestCompleted="\t（红娘欣喜地说道）\n\t爷爷真的这么说么？哎呀，那可真是太好了，我今日若是成人之美，从中撮合他们，也不失为功德一件。"					
x270010_var_ContinueInfo="\t见过我爷爷了吗？"
x270010_var_QuestHelp =	""
x270010_var_DemandItem ={}
x270010_var_BonusMoney1 =376
x270010_var_BonusMoney2 =0
x270010_var_BonusMoney3 =0
x270010_var_BonusMoney4 =0
x270010_var_BonusMoney5 =56
x270010_var_BonusMoney6 =0
x270010_var_BonusItem	=	{}
x270010_var_BonusChoiceItem ={}
x270010_var_ExpBonus = 112000
--DECLARE_QUEST_INFO_STOP--
x270010_var_doing = 0
x270010_var_yuelao =-1
x270010_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}


function x270010_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270010_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270010_var_QuestIdPre)> 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270010_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270010_var_QuestId, varState, -1 )
	end
end

function x270010_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270010_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270010_var_ExpBonus )
		end
		if x270010_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270010_var_BonusMoney1 )
		end
		if x270010_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270010_var_BonusMoney2 )
		end
		if x270010_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270010_var_BonusMoney3 )
		end
		if x270010_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270010_var_BonusMoney4 )
		end
		if x270010_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270010_var_BonusMoney5 )
		end
		if x270010_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270010_var_BonusMoney6 )
		end
		for varI, item in x270010_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270010_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270010_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270010_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270010_var_QuestId) > 0 then
			if x270010_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270010_var_QuestName)
						TalkAppendString(varMap,x270010_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270010_var_FileId, x270010_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270010_var_QuestName)
						TalkAppendString(varMap,x270010_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270010_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270010_var_FileId, x270010_var_QuestId);
			end
  elseif x270010_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270010_var_QuestName)
			TalkAppendString(varMap,x270010_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270010_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270010_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270010_var_QuestHelp )
			end
			x270010_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270010_var_FileId, x270010_var_QuestId);
  end
	
end


function x270010_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x270010_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270010_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
			return 1
	end
	return 0
end

function x270010_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270010_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270010_var_QuestId  )
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
		if x270010_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
		  StartItemTask(varMap)                                                    
			ItemAppend( varMap,x270010_var_noDemandItem[1].varId, x270010_var_noDemandItem[1].varNum )             
			local varRet = StopItemTask(varMap,varPlayer)                                 
	  		if varRet > 0 then
	  			local retmiss = AddQuest( varMap, varPlayer, x270010_var_QuestId, x270010_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270010_Msg2toplayer( varMap, varPlayer,0)
		  			DeliverItemListSendToPlayer(varMap,varPlayer) 
		  		end
	  		else                                                             
		  		StartTalkTask(varMap)                                      
		  		TalkAppendString(varMap,"物品栏已满，请整理下再来！")                    
		  		StopTalkTask(varMap)                                        
		  		DeliverTalkTips(varMap,varPlayer)                      
	   		end           	        
	 	end                                                                    
	     
end


function x270010_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270010_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270010_var_QuestId)
	  x270010_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x270010_var_noDemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x270010_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270010_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270010_var_BonusChoiceItem do
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

function x270010_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270010_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270010_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270010_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270010_var_QuestId) > 0 then
				x270010_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270010_var_QuestId)
				x270010_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270010_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270010_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270010_var_QuestIdNext )	
end

function x270010_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270010_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270010_var_ExpBonus);
  	end
		if x270010_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270010_var_BonusMoney1 )
	  end
		if x270010_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270010_var_BonusMoney2 )
	  end
		if x270010_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270010_var_BonusMoney3 )
		end
		if x270010_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270010_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270010_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270010_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270010_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270010_var_BonusMoney6)
		end
end

function x270010_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270010_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270010_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270010_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270010_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270010_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270010_var_QuestName.."！", 0, 3)
				if x270010_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270010_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270010_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270010_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270010_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270010_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270010_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270010_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270010_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270010_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270010_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270010_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270010_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270010_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270010_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270010_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
end

function x270010_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	
end

function x270010_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end

function x270010_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270010_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x270010_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270010_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270010_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270010_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270010_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270010_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270010_ProcScneneTimer(varMap, varPlayer)
	if x270010_var_yuelao < 0 then
			x270010_CloseTimer(varMap, x270010_var_PROTECTINFO.ScneneTimerIndex)
			return
	end
	if x270010_var_doing==1   then
		if GetCurrentTime() - x270010_var_PROTECTINFO.StartTime >= 1   then
		  x270010_var_doing = 2
			if IsObjValid (varMap,x270010_var_yuelao) == 1 then
				NpcTalk(varMap, x270010_var_yuelao, "是我孙女让你来的吧！", -1)
			end
    end
	elseif x270010_var_doing == 2   then
			if GetCurrentTime() - x270010_var_PROTECTINFO.StartTime >= 5   then
			  	x270010_var_doing =3
					if IsObjValid (varMap,x270010_var_yuelao) == 1 then
						NpcTalk(varMap, x270010_var_yuelao, "你不用说我知道她要问什么。", -1)
					end
      end
	elseif x270010_var_doing == 3   then
			if GetCurrentTime() - x270010_var_PROTECTINFO.StartTime >= 8   then
					x270010_var_doing =4
					if IsObjValid (varMap,x270010_var_yuelao) == 1 then
						NpcTalk(varMap, x270010_var_yuelao, "你就告诉她这件事能成，是个很不错的事情。", -1)
					end
			end
	
	elseif x270010_var_doing == 4   then
			if GetCurrentTime() - x270010_var_PROTECTINFO.StartTime >= 12   then
					x270010_var_doing =5
					if IsObjValid (varMap,x270010_var_yuelao) == 1 then
						NpcTalk(varMap, x270010_var_yuelao, "好了我去喝酒了，你回去告诉她吧！", -1)
					end
						x270010_CloseTimer(varMap, x270010_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end

function x270010_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270010_var_doing = 0
	x270010_var_yuelao =-1
	x270010_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
	
end

function x270010_useitem(varMap,varPlayer)
		local varX,z = GetWorldPos(varMap,varPlayer)
		local distanceRet = 100 - (75 - varX) * (75 - varX) - (215 - z) * (215 - z)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270010_var_QuestId)
		if varMap == 21 then
  		if distanceRet >= 0 then
          SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		 			if x270010_var_doing==0 then
		 					StartTalkTask(varMap)
							TalkAppendString(varMap,"询问红娘的爷爷  1/1")
							DeliverTalkTips(varMap,varPlayer) 
							StopTalkTask(varMap)
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				 			x270010_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270010, "ProcScneneTimer", 1)
				 			if x270010_var_PROTECTINFO.ScneneTimerIndex >= 0 then
									x270010_var_yuelao=CreateMonster(varMap, 444,75,210,3,1,-1,-1,20,15000,0,"月老")
        					x270010_var_doing =1
									x270010_var_PROTECTINFO.StartTime = GetCurrentTime()
									if DelItem(varMap, varPlayer, 13020314, 1) ~= 1 then return 0 end
							end
					else
							StartTalkTask(varMap)
							TalkAppendString(varMap,"询问红娘的爷爷  1/1")
							DeliverTalkTips(varMap,varPlayer) 
							StopTalkTask(varMap)
							if DelItem(varMap, varPlayer, 13020314, 1) ~= 1 then return 0 end
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
     			  	return 1
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"这里不能使用")
				DeliverTalkTips(varMap,varPlayer) 
				StopTalkTask(varMap)
			end
		end
           
			return 0
end
