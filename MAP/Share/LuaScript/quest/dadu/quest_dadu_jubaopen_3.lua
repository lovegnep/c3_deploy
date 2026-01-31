

--DECLARE_QUEST_INFO_START--
x270016_var_FileId = 270016
x270016_var_QuestIdPre =3603
x270016_var_QuestId = 3604
x270016_var_LevelLess	= 	55 
x270016_var_QuestIdNext = 3605
x270016_var_Name	={}
x270016_var_ExtTarget={{type=20,n=1,target="把@itemid_13020328带给@npc_143008"}}
x270016_var_QuestName="【主线】珍珠翡翠白玉汤<四>"
x270016_var_QuestInfo="\t这就是“珍珠翡翠白玉汤”？！这味道。。。\n\t这玩意儿能治病？还不把人臭晕了！算了，你赶紧把它端给沈阔吧，让他送进去，给帮主吧！"  
x270016_var_QuestTarget=""		
x270016_var_QuestCompleted="\t（沈阔似乎恶心欲呕，一手捂住口鼻，一手将这碗“汤”远远地端着）\n\t这。。。这。。。"					
x270016_var_ContinueInfo=""
x270016_var_QuestHelp =	""
x270016_var_DemandItem ={{item=13020328,varNum=1}}
x270016_var_BonusMoney1 =376
x270016_var_BonusMoney2 =0
x270016_var_BonusMoney3 =0
x270016_var_BonusMoney4 =0
x270016_var_BonusMoney5 =66
x270016_var_BonusMoney6 =0
x270016_var_BonusItem	=	{}
x270016_var_BonusChoiceItem ={}
x270016_var_ExpBonus = 171000
x270016_var_NpcGUID ={{ guid = 143172, varName = "沈阔"} }
--DECLARE_QUEST_INFO_STOP--
x270016_var_shenwansan =-1
x270016_var_doing =0
x270016_var_jubaopen =-1
x270016_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}


function x270016_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270016_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270016_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x270016_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270016_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270016_var_QuestId, varState, -1 )
						end
			
	end
end

function x270016_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270016_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270016_var_ExpBonus )
		end
		if x270016_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270016_var_BonusMoney1 )
		end
		if x270016_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270016_var_BonusMoney2 )
		end
		if x270016_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270016_var_BonusMoney3 )
		end
		if x270016_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270016_var_BonusMoney4 )
		end
		if x270016_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270016_var_BonusMoney5 )
		end
		if x270016_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270016_var_BonusMoney6 )
		end
		for varI, item in x270016_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270016_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270016_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270016_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270016_var_QuestId) > 0 then
			if x270016_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270016_var_QuestName)
						TalkAppendString(varMap,x270016_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270016_var_FileId, x270016_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270016_var_QuestName)
						TalkAppendString(varMap,x270016_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270016_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270016_var_FileId, x270016_var_QuestId);
			end
  elseif x270016_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270016_var_QuestName)
			TalkAppendString(varMap,x270016_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270016_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270016_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270016_var_QuestHelp )
			end
			x270016_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270016_var_FileId, x270016_var_QuestId);
  end
	
end


function x270016_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x270016_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x270016_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270016_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270016_var_QuestId  )
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
		
		
		if x270016_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartItemTask(varMap)                                                    
			ItemAppend( varMap,x270016_var_DemandItem[1].item, x270016_var_DemandItem[1].varNum )             
			local varRet = StopItemTask(varMap,varPlayer)                                 
	  		if varRet > 0 then
	  			local retmiss = AddQuest( varMap, varPlayer, x270016_var_QuestId, x270016_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270016_Msg2toplayer( varMap, varPlayer,0)
		  			DeliverItemListSendToPlayer(varMap,varPlayer) 
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270016_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	   				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		  		end
	  		else                                                             
		  		StartTalkTask(varMap)                                      
		  		TalkAppendString(varMap,"物品栏已满，请整理下再来！")                    
		  		StopTalkTask(varMap)                                        
		  		DeliverTalkTips(varMap,varPlayer)                      
	   		end           
		  
	 	end                                                                    
	     
end


function x270016_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270016_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270016_var_QuestId)
	  x270016_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x270016_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.item, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x270016_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270016_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270016_var_BonusChoiceItem do
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

function x270016_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270016_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270016_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270016_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270016_var_QuestId) > 0 then
				x270016_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270016_var_QuestId)
				x270016_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270016_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270016_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		for varI, item in x270016_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.item, item.varNum ) ~= 1 then return 0 end
				end
    		StopItemTask(varMap,varPlayer)
    		if x270016_var_doing==0 then      
    			      x270016_var_PROTECTINFO.StartTime = GetCurrentTime()
								x270016_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270016, "ProcScneneTimer", 1)
								if x270016_var_PROTECTINFO.ScneneTimerIndex >= 0 then
										x270016_var_doing = 1
										x270016_var_shenwansan =CreateMonster(varMap, 75,152,95,3,1,-1,-1,20,24000,270,"沈万三")
								end
    		end
    			
	 	end
end


function x270016_ProcScneneTimer(varMap)
	if x270016_var_shenwansan < 0 then
			x270016_CloseTimer(varMap, x270016_var_PROTECTINFO.ScneneTimerIndex)
			return
	end
	if x270016_var_doing==1   then
		if GetCurrentTime() - x270016_var_PROTECTINFO.StartTime >= 2   then
			if IsObjValid (varMap,x270016_var_shenwansan) == 1 then
						NpcTalk(varMap, x270016_var_shenwansan, "真是一副良药！", -1)
			end
						x270016_var_doing = 2
		end
	elseif x270016_var_doing == 2   then
			if GetCurrentTime() - x270016_var_PROTECTINFO.StartTime >= 5   then
				if IsObjValid (varMap,x270016_var_shenwansan) == 1 then
						NpcTalk(varMap, x270016_var_shenwansan, "近些年已经完全忘了穷苦的日子了！", -1)
				end
            x270016_var_doing =3
			end
	elseif x270016_var_doing == 3   then
			if GetCurrentTime() - x270016_var_PROTECTINFO.StartTime >= 8   then
				if IsObjValid (varMap,x270016_var_shenwansan) == 1 then
						NpcTalk(varMap, x270016_var_shenwansan, "有了这么多钱又有什么用呢！", -1)
				end
        		x270016_var_doing =4
			end
	elseif x270016_var_doing == 4   then
			if GetCurrentTime() - x270016_var_PROTECTINFO.StartTime >= 11   then
				if IsObjValid (varMap,x270016_var_shenwansan) == 1 then
						NpcTalk(varMap, x270016_var_shenwansan, "钱够买一碗饭就行了，从今天起我要散尽家财来行善！", -1)
				end
						x270016_var_jubaopen =CreateMonster(varMap, 3903,752,95,3,1,-1,-1,20,13000,270," ")
        		x270016_var_doing =5
			end
	elseif x270016_var_doing == 5   then
			if GetCurrentTime() - x270016_var_PROTECTINFO.StartTime >= 14   then
				if IsObjValid (varMap,x270016_var_shenwansan) == 1 then
						NpcTalk(varMap, x270016_var_shenwansan, "恩？这不是聚宝盆吗？", -1)
				end
        		x270016_var_doing =6
			end
	elseif x270016_var_doing == 6   then
			if GetCurrentTime() - x270016_var_PROTECTINFO.StartTime >= 17   then
				if IsObjValid (varMap,x270016_var_shenwansan) == 1 then
						NpcTalk(varMap, x270016_var_shenwansan, "我懂得上天的意思，聚宝盆是用来行善的！", -1)
				end
        		x270016_var_doing =7
			end
	elseif x270016_var_doing == 7   then
			if GetCurrentTime() - x270016_var_PROTECTINFO.StartTime >= 20   then
				if IsObjValid (varMap,x270016_var_shenwansan) == 1 then
						NpcTalk(varMap, x270016_var_shenwansan, "了解这些之后，有没有聚宝盆已经无所谓了，我会收好它，避免他被坏人利用！", -1)
				end
        		x270016_var_doing =8
			end
	elseif x270016_var_doing==8 then
			if GetCurrentTime() - x270016_var_PROTECTINFO.StartTime >= 23   then
					x270016_var_doing=9
					x270016_CloseTimer(varMap, x270016_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x270016_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270016_var_doing =0
	x270016_var_shenwansan =-1
	x270016_var_jubaopen =-1
	x270016_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x270016_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270016_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270016_var_ExpBonus);
  	end
		if x270016_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270016_var_BonusMoney1 )
	  end
		if x270016_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270016_var_BonusMoney2 )
	  end
		if x270016_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270016_var_BonusMoney3 )
		end
		if x270016_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270016_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270016_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270016_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270016_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270016_var_BonusMoney6)
		end
end

function x270016_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270016_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270016_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270016_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270016_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270016_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270016_var_QuestName.."！", 0, 3)
				if x270016_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270016_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270016_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270016_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270016_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270016_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270016_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270016_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270016_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270016_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270016_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270016_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270016_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270016_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270016_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270016_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270016_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270016_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270016_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270016_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x270016_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270016_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270016_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270016_var_QuestId, varState, -1 )
		end
end

function x270016_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270016_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270016_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270016_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270016_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270016_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
