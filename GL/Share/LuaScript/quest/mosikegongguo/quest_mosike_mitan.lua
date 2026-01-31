

--DECLARE_QUEST_INFO_START--
x203325_var_FileId = 203325
x203325_var_QuestIdPre = 805
x203325_var_QuestId = 806
x203325_var_LevelLess	= 88
x203325_var_QuestIdNext = 807
x203325_var_DemandKill ={{varId=2137,varNum=1}}
x203325_var_Name	={"莫斯科密探"}
x203325_var_ExtTarget={{type=20,n=1,target="击败@npc_117014"}}
x203325_var_QuestName="【剧场】立陶宛女大公<二>"
x203325_var_QuestInfo="\t从刚才我们谈话的时候，我就发现那里有一个卫兵一直探头探脑，似乎是在偷听我们的谈话，他不是我的人，肯定是莫斯科大公派来监视我的，千万不能让他泄露了我们的密约！"  
x203325_var_QuestTarget="击败@npc_117014"		
x203325_var_QuestCompleted="\t果然是大蒙古国的勇士，三两下就收拾了这个狗腿子，剩下的事情交给我好了。"
x203325_var_ContinueInfo="\t怎么？那家伙不是莫斯科大公的眼线么？"
x203325_var_QuestHelp =	""

x203325_var_ExpBonus =684000
x203325_var_BonusMoney1 =880
x203325_var_BonusMoney2 =0
x203325_var_BonusMoney3 =0
x203325_var_BonusMoney4 =0
x203325_var_BonusMoney5 =106
x203325_var_BonusMoney6 =0
x203325_var_BonusItem	={}
x203325_var_BonusChoiceItem ={}
x203325_var_NpcGUID = 117014

x203325_var_npcid = 0
x203325_var_chaerke =0
x203325_var_dog =0
x203325_var_pangxie = 0
x203325_var_acceptid =0
--DECLARE_QUEST_INFO_STOP--


function x203325_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    
	if IsQuestHaveDone(varMap, varPlayer, x203325_var_QuestId) > 0 then
		return 
	else
	if IsQuestHaveDone(varMap, varPlayer, x203325_var_QuestIdPre)> 0 then 
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203325_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203325_var_QuestId, varState, -1 )
	end
	end
end

function x203325_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203325_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203325_var_ExpBonus )
		end
		if x203325_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203325_var_BonusMoney1 )
		end
		if x203325_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203325_var_BonusMoney2 )
		end
		if x203325_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203325_var_BonusMoney3 )
		end
		if x203325_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203325_var_BonusMoney4 )
		end
		if x203325_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203325_var_BonusMoney5 )
		end
		if x203325_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203325_var_BonusMoney6 )
		end
		for varI, item in x203325_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203325_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end





function x203325_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
    x203325_var_npcid =   varTalknpc
	if IsQuestHaveDone(varMap, varPlayer, x203325_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203325_var_QuestId) > 0 then
			if x203325_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203325_var_QuestName)
						TalkAppendString(varMap,x203325_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203325_var_FileId, x203325_var_QuestId);
			else
          
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203325_var_QuestName)
						TalkAppendString(varMap,x203325_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203325_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203325_var_FileId, x203325_var_QuestId);
			end
  elseif x203325_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203325_var_QuestName)
			TalkAppendString(varMap,x203325_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203325_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203325_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203325_var_QuestHelp )
			end
			x203325_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203325_var_FileId, x203325_var_QuestId);
  end
end

function x203325_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203325_var_QuestId) > 0 then
		return 0
	elseif GetLevel(varMap, varPlayer)< x203325_var_LevelLess then
		return 0
	end
	return 1
end

function x203325_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203325_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203325_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	        return 1
	end
	return 0
end

function x203325_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203325_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then     
				StartTalkTask(varMap)                 
				TalkAppendString(varMap,"可接任务数量已满") 
				StopTalkTask(varMap)                   
				DeliverTalkTips(varMap,varPlayer)  
				return                                   
		end                                          
		
		
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203325_var_QuestId  )
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
		
		if x203325_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
		x203325_var_mitan =FindMonsterByGUID( varMap,117014)
					local retmiss = AddQuest( varMap, varPlayer, x203325_var_QuestId, x203325_var_FileId, 1, 0, 0)  
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)                                         
						return 0
					else
						if IsObjValid (varMap,x203325_var_mitan) == 1 then                                                       
							
			  			SetMonsterCamp(varMap,x203325_var_mitan,21)
			  		end
            
						x203325_Msg2toplayer( varMap, varPlayer,0)
						
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203325_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	    			
		  		end
	 	end                                                                    
	     
end

function x203325_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203325_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203325_var_QuestId)
	  x203325_Msg2toplayer( varMap, varPlayer,1)
end

function x203325_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203325_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203325_var_BonusChoiceItem do
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

function x203325_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x203325_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203325_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203325_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203325_var_QuestId) > 0 then
				x203325_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203325_var_QuestId)
                x203325_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203325_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203325_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		    end
    		    StopItemTask(varMap,varPlayer)
    		
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203325_var_QuestIdNext )	
   end
end

function x203325_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
   
end

function x203325_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203325_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203325_var_ExpBonus);
  	end
		if x203325_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203325_var_BonusMoney1 )
	  end
		if x203325_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203325_var_BonusMoney2 )
	  end
		if x203325_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203325_var_BonusMoney3 )
		end
		if x203325_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203325_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203325_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203325_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203325_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203325_var_BonusMoney6)
		end
end

function x203325_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203325_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203325_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203325_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203325_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203325_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203325_var_QuestName.."！", 0, 3)
				if x203325_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203325_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203325_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203325_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203325_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203325_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203325_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203325_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203325_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203325_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203325_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203325_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203325_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203325_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end



function x203325_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
   if	varObjData ==x203325_var_DemandKill[1].varId then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,varPlayer, x203325_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203325_var_QuestId)
										if GetQuestParam(varMap,varPlayer,varQuestIdx,0) < 1 then
												SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)+1)
												SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
												Msg2Player(varMap, varPlayer, format("击败莫斯科密探  %d/1", GetQuestParam(varMap,varPlayer,varQuestIdx,0)), 0, 3)
												x203325_CheckSubmit( varMap, varPlayer)
										end
                end
            end
		end
	end 
end

function x203325_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203325_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203325_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203325_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203325_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203325_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203325_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203325_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203325_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203325_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





