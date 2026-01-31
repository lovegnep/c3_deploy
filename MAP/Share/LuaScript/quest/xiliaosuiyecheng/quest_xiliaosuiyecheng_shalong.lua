

--DECLARE_QUEST_INFO_START--
x203311_var_FileId = 203311
x203311_var_QuestIdPre ={613,614,615}
x203311_var_QuestId = 619
x203311_var_LevelLess	= 	65 
x203311_var_QuestIdNext = 621
x203311_var_Name	={}
x203311_var_ExtTarget={{type=20,n=1,target="到@npc_113120处招出并消灭@npc_113115"}}
x203311_var_QuestName="【剧场】三头魔龙"
x203311_var_QuestInfo="\t太好了，金火水三龙之魂都已经拿到了，只要把它们放在一起就会自动融合成龙之精华，带着龙之精华到东南面开阔地带召唤出那条魔龙，在他还没有完全恢复妖力之前，除掉他，快！"  
x203311_var_QuestTarget=""		
x203311_var_QuestCompleted="\t太好了，终于除掉了这头魔龙，希望长生天保佑旭烈兀安答平安无事。"					
x203311_var_ContinueInfo="\t除掉那条三头魔龙！"
x203311_var_QuestHelp =	""
x203311_var_DemandItem ={{varId=13020433,varNum=1}}
x203311_var_ExpBonus = 248000
x203311_var_BonusMoney1 =650
x203311_var_BonusMoney2 =0
x203311_var_BonusMoney3 =0
x203311_var_BonusMoney4 =0
x203311_var_BonusMoney5 =76
x203311_var_BonusMoney6 =0
x203311_var_BonusItem	=	{}
x203311_var_BonusChoiceItem ={}

x203311_var_NpcGUID ={ }
x203311_var_long = -1
--DECLARE_QUEST_INFO_STOP--


function x203311_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestIdPre[1])> 0  and IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestIdPre[2])> 0  and IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestIdPre[3])> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203311_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203311_var_QuestId, varState, -1 )
	end
end

function x203311_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203311_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203311_var_ExpBonus )
		end
		if x203311_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203311_var_BonusMoney1 )
		end
		if x203311_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203311_var_BonusMoney2 )
		end
		if x203311_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203311_var_BonusMoney3 )
		end
		if x203311_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203311_var_BonusMoney4 )
		end
		if x203311_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203311_var_BonusMoney5 )
		end
		if x203311_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203311_var_BonusMoney6 )
		end
		for varI, item in x203311_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203311_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203311_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
	if IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestId) > 0 then
		return 
	end
	if which == -1 then
		if IsHaveQuest(varMap,varPlayer, x203311_var_QuestId) > 0 then
			if x203311_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203311_var_QuestName)
						TalkAppendString(varMap,x203311_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203311_var_FileId, x203311_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203311_var_QuestName)
						TalkAppendString(varMap,x203311_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203311_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203311_var_FileId, x203311_var_QuestId);
			end
		elseif x203311_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203311_var_QuestName)
			TalkAppendString(varMap,x203311_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203311_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203311_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203311_var_QuestHelp )
			end
			x203311_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203311_var_FileId, x203311_var_QuestId);
  	end
  end
  
end


function x203311_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestIdPre[1])> 0 then
			if IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestIdPre[2])> 0 then
			if IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestIdPre[3])> 0 then
					return 1
			end
		end
		end
		return 0

end

function x203311_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203311_var_QuestId)
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) >= 1 then
					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		return 1
	    end
	 		return 0
end

function x203311_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203311_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203311_var_QuestId  )
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
		if x203311_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartItemTask(varMap)                                                    
			ItemAppend( varMap,x203311_var_DemandItem[1].varId, x203311_var_DemandItem[1].varNum )             
			local varRet = StopItemTask(varMap,varPlayer)                                 
	  		if varRet > 0 then
	  			local retmiss = AddQuest( varMap, varPlayer, x203311_var_QuestId, x203311_var_FileId, 1, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203311_Msg2toplayer( varMap, varPlayer,0)
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


function x203311_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203311_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203311_var_QuestId)
	  x203311_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x203311_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
end

function x203311_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203311_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203311_var_BonusChoiceItem do
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

function x203311_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203311_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203311_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203311_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203311_var_QuestId) > 0 then
				x203311_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203311_var_QuestId)
				x203311_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203311_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203311_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		for varI, item in x203311_var_DemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203311_var_QuestIdNext )	
end

function x203311_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203311_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203311_var_ExpBonus);
  	end
		if x203311_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203311_var_BonusMoney1 )
	  end
		if x203311_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203311_var_BonusMoney2 )
	  end
		if x203311_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203311_var_BonusMoney3 )
		end
		if x203311_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203311_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203311_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203311_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203311_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203311_var_BonusMoney6)
		end
end

function x203311_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203311_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203311_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203311_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203311_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203311_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203311_var_QuestName.."！", 0, 3)
				if x203311_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203311_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203311_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203311_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203311_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203311_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203311_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203311_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203311_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203311_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203311_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203311_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203311_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203311_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203311_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==1714 then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x203311_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203311_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 1 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
												Msg2Player(varMap, humanObjId, format("您击毙三头魔龙   %d/1", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x203311_CheckSubmit( varMap, humanObjId)
										end
                end
            end
		end
	end
end

function x203311_useitem(varMap,varPlayer)
		local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203311_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,1) == 0 then
				local distanceRet = 25 - (169 - PlayerPosX) * (169 - PlayerPosX) - (221 - PlayerPosZ) * (221 - PlayerPosZ)
				if distanceRet >= 0 then
					if IsObjValid (varMap,x203311_var_long) == 0 then
							if DelItem( varMap,varPlayer,x203311_var_DemandItem[1].varId, x203311_var_DemandItem[1].varNum ) ~= 1 then return 0 end
							x203311_var_long=CreateMonster(varMap, 1714,169,221,5,1,-1,-1,21,180000,45,"三头魔龙")
							return 1
					elseif IsObjValid (varMap,x203311_var_long) == 1 then
							if GetName(varMap,x203311_var_long)~="三头魔龙" then
									if DelItem( varMap,varPlayer,x203311_var_DemandItem[1].varId, x203311_var_DemandItem[1].varNum ) ~= 1 then return 0 end
									x203311_var_long=CreateMonster(varMap, 1714,169,221,5,1,-1,-1,21,180000,45,"三头魔龙")
									return 1
							end
					else
							Msg2Player(varMap, varPlayer, "你暂时无法这样做！", 0, 3)
					end
				else
						Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
						return 0
				end
		end
end


function x203311_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203311_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203311_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203311_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203311_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	 
end

function x203311_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203311_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203311_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203311_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203311_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203311_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
