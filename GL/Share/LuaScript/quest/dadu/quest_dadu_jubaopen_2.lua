

--DECLARE_QUEST_INFO_START--
x270015_var_FileId = 270015
x270015_var_QuestIdPre =3599
x270015_var_QuestId = 3600
x270015_var_LevelLess	= 	55 
x270015_var_QuestIdNext = 3601
x270015_var_Name	={}
x270015_var_noDemandItem ={{varId=13020325,varNum=1},{varId=13020326,varNum=1}}
x270015_var_ExtTarget ={{type=20,n=1,target="到@npc_143176把红焖田鸡倒入海中"}}
x270015_var_ExtTargetmul={{type=20,n=1,target="到@npc_143176把红焖田鸡倒入海中"},
												{type=20,n=1,target="到@npc_143176捞一网"},
												{type=20,n=1,target="到@npc_143177捞一网"},
												{type=20,n=1,target="到@npc_143178捞一网"},
												{type=20,n=1,target="到@npc_143179捞一网"},
												{type=20,n=1,target="打捞聚宝盆"}}
x270015_var_QuestName="【主线】照葫芦画瓢<三>"
x270015_var_QuestInfo="\t这是我刚命人在醉仙楼买回来的红焖田鸡，你带上网和这些田鸡，记得撒网之前先把田鸡丢进海里。"  
x270015_var_QuestTarget=""		
x270015_var_QuestCompleted="\t什么？聚宝盆已经被老天爷收走了？！"					
x270015_var_ContinueInfo="\t捞到了么？要是一次不行，那就多捞几次。"
x270015_var_QuestHelp =	""
x270015_var_DemandItem ={}
x270015_var_BonusMoney1 =376
x270015_var_BonusMoney2 =0
x270015_var_BonusMoney3 =0
x270015_var_BonusMoney4 =0
x270015_var_BonusMoney5 =66
x270015_var_BonusMoney6 =0
x270015_var_BonusItem	=	{}
x270015_var_BonusChoiceItem ={}
x270015_var_ExpBonus = 171000
--DECLARE_QUEST_INFO_STOP--
x270015_var_doing = 0
x270015_var_longwang =-1
x270015_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}


function x270015_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270015_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270015_var_QuestIdPre)> 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270015_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270015_var_QuestId, varState, -1 )
	end
end

function x270015_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270015_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270015_var_ExpBonus )
		end
		if x270015_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270015_var_BonusMoney1 )
		end
		if x270015_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270015_var_BonusMoney2 )
		end
		if x270015_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270015_var_BonusMoney3 )
		end
		if x270015_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270015_var_BonusMoney4 )
		end
		if x270015_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270015_var_BonusMoney5 )
		end
		if x270015_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270015_var_BonusMoney6 )
		end
		for varI, item in x270015_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270015_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270015_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270015_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270015_var_QuestId) > 0 then
			if x270015_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270015_var_QuestName)
						TalkAppendString(varMap,x270015_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270015_var_FileId, x270015_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270015_var_QuestName)
						TalkAppendString(varMap,x270015_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270015_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270015_var_FileId, x270015_var_QuestId);
			end
  elseif x270015_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270015_var_QuestName)
			TalkAppendString(varMap,x270015_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270015_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270015_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270015_var_QuestHelp )
			end
			x270015_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270015_var_FileId, x270015_var_QuestId);
  end
	
end


function x270015_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x270015_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270015_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
			return 1
	end
	return 0
end

function x270015_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270015_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270015_var_QuestId  )
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
		
		if x270015_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
		  StartItemTask(varMap)                                                    
			ItemAppend( varMap,x270015_var_noDemandItem[1].varId, x270015_var_noDemandItem[1].varNum ) 
			ItemAppend( varMap,x270015_var_noDemandItem[2].varId, x270015_var_noDemandItem[2].varNum )              
			local varRet = StopItemTask(varMap,varPlayer)                                 
	  		if varRet > 0 then
	  			local retmiss = AddQuest( varMap, varPlayer, x270015_var_QuestId, x270015_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270015_Msg2toplayer( varMap, varPlayer,0)
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


function x270015_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270015_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270015_var_QuestId)
	  x270015_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x270015_var_noDemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x270015_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270015_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270015_var_BonusChoiceItem do
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

function x270015_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270015_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270015_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270015_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270015_var_QuestId) > 0 then
				x270015_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270015_var_QuestId)
				x270015_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270015_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270015_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		for varI, item in x270015_var_noDemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270015_var_QuestIdNext )	
end

function x270015_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270015_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270015_var_ExpBonus);
  	end
		if x270015_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270015_var_BonusMoney1 )
	  end
		if x270015_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270015_var_BonusMoney2 )
	  end
		if x270015_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270015_var_BonusMoney3 )
		end
		if x270015_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270015_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270015_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270015_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270015_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270015_var_BonusMoney6)
		end
end

function x270015_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270015_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270015_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270015_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270015_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270015_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270015_var_QuestName.."！", 0, 3)
				if x270015_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270015_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270015_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270015_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270015_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270015_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270015_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270015_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270015_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270015_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270015_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270015_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270015_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270015_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270015_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270015_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
end

function x270015_ProcMapTimerTick(ssceneId, varPlayer, varScript, varQuest)
	
end

function x270015_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end

function x270015_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270015_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x270015_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270015_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270015_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270015_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270015_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270015_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270015_ProcScneneTimer(varMap, varPlayer)
	if x270015_var_longwang < 0 then
			x270015_CloseTimer(varMap, x270015_var_PROTECTINFO.ScneneTimerIndex)
			return
	end
	if x270015_var_doing==1   then
		if GetCurrentTime() - x270015_var_PROTECTINFO.StartTime >= 1   then
			if IsObjValid (varMap,x270015_var_longwang) == 1 then
				NpcTalk(varMap, x270015_var_longwang, "英雄！收了你的神通吧！", -1)
			end
      x270015_var_doing = 2
		end
	elseif x270015_var_doing == 2   then
			if GetCurrentTime() - x270015_var_PROTECTINFO.StartTime >= 5   then
				if IsObjValid (varMap,x270015_var_longwang) == 1 then
						NpcTalk(varMap, x270015_var_longwang, "我是威海的龙王，你要知道你的网不是普通的网。", -1)
				end
        x270015_var_doing =3
			end
	elseif x270015_var_doing == 3   then
			if GetCurrentTime() - x270015_var_PROTECTINFO.StartTime >= 8   then
				if IsObjValid (varMap,x270015_var_longwang) == 1 then
						NpcTalk(varMap, x270015_var_longwang, "你的网刚刚已经把龙宫搅得一团糟，龟丞相被你网上去之后一直躲在壳里不肯出来！", -1)
				end
						x270015_var_doing =4
			end
	elseif x270015_var_doing == 4   then
			if GetCurrentTime() - x270015_var_PROTECTINFO.StartTime >= 12   then
				if IsObjValid (varMap,x270015_var_longwang) == 1 then
						NpcTalk(varMap, x270015_var_longwang, "聚宝盆乃是神物，怎么会在此海里面停留呢？它早就已经回到天上去了！", -1)
				end
						x270015_var_doing =5
			end
	elseif x270015_var_doing == 5   then
			if GetCurrentTime() - x270015_var_PROTECTINFO.StartTime >= 16   then
				if IsObjValid (varMap,x270015_var_longwang) == 1 then
						NpcTalk(varMap, x270015_var_longwang, "这个网我就留下了，免得再危害龙宫！", -1)
				end
						x270015_var_doing =6
						x270015_CloseTimer(varMap, x270015_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end

function x270015_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270015_var_doing = 0
	x270015_var_longwang =-1
	x270015_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
	
end

function x270015_ProcQuestLogRefresh( varMap,varPlayer,varQuest)
				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270015_var_QuestId)
				local exttarget =GetQuestParam(varMap,varPlayer,varQuestIdx,1)+1
				StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    
                                "",                 
                                x270015_var_ExtTargetmul[exttarget].target,               
                                "",                         
                                "",                   
                                "",                
                                ""        
                                )

				StopTalkTask()
				DeliverTalkRefreshQuest(varMap, varPlayer, x270015_var_QuestId);

end

function x270015_useitem(varMap,varPlayer,which)
		local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270015_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 0 then
			if which == 1 then 
				local distanceRet = 25 - (185 - PlayerPosX) * (185 - PlayerPosX) - (201 - PlayerPosZ) * (201 - PlayerPosZ)
				if distanceRet >= 0 then
						if DelItem( varMap,varPlayer,x270015_var_noDemandItem[1].varId, x270015_var_noDemandItem[1].varNum ) ~= 1 then return 0 end
						Msg2Player(varMap, varPlayer, "任务目标改变", 0, 3)
						StartTalkTask(varMap)
						TalkAppendString(varMap,"\t你把田鸡倒入到水中，没有任何反应。接下来应该用网去捞一下了！")
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer, x270015_var_FileId, x270015_var_QuestId);
						x270015_ProcQuestLogRefresh( varMap,varPlayer,x270015_var_QuestId)
						return 1
				else
						Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
						return 0
				end
			else
						Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
						return 0
			end
		elseif GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 1 then
				local distanceRet = 25 - (185 - PlayerPosX) * (185 - PlayerPosX) - (201 - PlayerPosZ) * (201 - PlayerPosZ)
				if distanceRet >= 0 then
						Msg2Player(varMap, varPlayer, "任务目标改变", 0, 3)
						StartTalkTask(varMap)
						TalkAppendString(varMap,"\t一网下去捞上来一个破破烂烂的铁盆，怎么看也不像是聚宝盆，应该换个地方捞捞了。")
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,2)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer, x270015_var_FileId, x270015_var_QuestId);
						x270015_ProcQuestLogRefresh( varMap,varPlayer,x270015_var_QuestId)
						return 1
				else
						Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
						return 0
				end
		elseif GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 2 then
				local distanceRet = 25 - (185 - PlayerPosX) * (185 - PlayerPosX) - (190 - PlayerPosZ) * (190 - PlayerPosZ)
				if distanceRet >= 0 then
						Msg2Player(varMap, varPlayer, "任务目标改变", 0, 3)
						StartTalkTask(varMap)
						TalkAppendString(varMap,"\t一网下去又捞上来一个石盆，看起来年代久远，但与张士诚描述的聚宝盆还是有一定差别，再换一个地方吧。")
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,3)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer, x270015_var_FileId, x270015_var_QuestId);
						x270015_ProcQuestLogRefresh( varMap,varPlayer,x270015_var_QuestId)
						return 1
				else
						Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
						return 0
				end
		elseif GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 3 then
				local distanceRet = 25 - (200 - PlayerPosX) * (200 - PlayerPosX) - (185 - PlayerPosZ) * (185 - PlayerPosZ)
				if distanceRet >= 0 then
						Msg2Player(varMap, varPlayer, "任务目标改变", 0, 3)
						StartTalkTask(varMap)
						TalkAppendString(varMap,"\t一网下去这次不是盆了，而是一只大乌龟，看起来它的年龄不比刚才的石盆小。它的头脚都已经缩到了壳里，无奈之下你把它又扔到了海里！")
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,4)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer, x270015_var_FileId, x270015_var_QuestId);
						x270015_ProcQuestLogRefresh( varMap,varPlayer,x270015_var_QuestId)
						return 1
				else
						Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
						return 0
				end
		elseif GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 4 then
				local distanceRet = 25 - (174 - PlayerPosX) * (174 - PlayerPosX) - (206 - PlayerPosZ) * (206 - PlayerPosZ)
				if distanceRet >= 0 then
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,5)
						Msg2Player(varMap, varPlayer, "任务目标完成", 0, 3)
						if DelItem( varMap,varPlayer,x270015_var_noDemandItem[2].varId, x270015_var_noDemandItem[2].varNum ) ~= 1 then return 0 end
						StartTalkTask(varMap)
						TalkAppendString(varMap,"\t这次的网很沉，当你费劲拉上来时，看见网上挂着一个人！而且戴着王冠！")
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,5)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer, x270015_var_FileId, x270015_var_QuestId);
						if x270015_var_doing==0   then
								x270015_var_PROTECTINFO.StartTime = GetCurrentTime()
								x270015_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270015, "ProcScneneTimer", 1)
								if x270015_var_PROTECTINFO.ScneneTimerIndex >= 0 then
										x270015_var_doing = 1
										x270015_var_longwang =CreateMonster(varMap, 3902,170,203,3,1,-1,-1,20,20000,90,"龙王")
								end
						end
						return 1
				else
						Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
						return 0
				end
		end
end
