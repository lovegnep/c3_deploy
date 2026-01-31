

--DECLARE_QUEST_INFO_START--
x203338_var_FileId = 203338
x203338_var_QuestIdPre =880
x203338_var_QuestId = 877
x203338_var_LevelLess	= 	90 
x203338_var_QuestIdNext = 878
x203338_var_DemandKill ={{varId=2246,varNum=1}}
x203338_var_Name	={"乌金娜"}
x203338_var_ExtTarget={{type=20,n=1,target="消灭@npc_11007"}}
x203338_var_QuestName="【剧场】大公的巫术<二>"
x203338_var_QuestInfo="\t你认为你可能战胜吗，以为杀了那几个巫师便可以战胜魔龙吗？"  
x203338_var_QuestTarget="消灭@npc_11007"		
x203338_var_QuestCompleted="\t（这人居然又是个冒牌的基辅大公）你杀了我吧，你要找的人已经离开了这里。"
x203338_var_ContinueInfo="\t怕了吧，快快受死吧！"
x203338_var_QuestHelp =	"#G如果您过久没有击败怪物，怪物会自行消失，您可以放弃并重新接取本任务。"
x203338_var_DemandItem ={}
x203338_var_ExpBonus = 742000
x203338_var_BonusMoney1 =920
x203338_var_BonusMoney2 =0
x203338_var_BonusMoney3 =0
x203338_var_BonusMoney4 =0
x203338_var_BonusMoney5 =116
x203338_var_BonusMoney6 =0
x203338_var_BonusItem	={}
x203338_var_BonusChoiceItem ={}
x203338_var_NpcGUID ={{ guid = 118047, varName = "乌金娜"} }
x203338_var_Buf1 = 2092
x203338_var_npcid = 0
--DECLARE_QUEST_INFO_STOP--


function x203338_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    
	if IsQuestHaveDone(varMap, varPlayer, x203338_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203338_var_QuestIdPre)> 0 then 		
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203338_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203338_var_QuestId, varState, -1 )						
	end
end

function x203338_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203338_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203338_var_ExpBonus )
		end
		if x203338_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203338_var_BonusMoney1 )
		end
		if x203338_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203338_var_BonusMoney2 )
		end
		if x203338_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203338_var_BonusMoney3 )
		end
		if x203338_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203338_var_BonusMoney4 )
		end
		if x203338_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203338_var_BonusMoney5 )
		end
		if x203338_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203338_var_BonusMoney6 )
		end
		for varI, item in x203338_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203338_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end





function x203338_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
    x203338_var_npcid =   varTalknpc
	if IsQuestHaveDone(varMap, varPlayer, x203338_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203338_var_QuestId) > 0 then
			if x203338_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
            
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203338_var_QuestName)
						TalkAppendString(varMap,x203338_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203338_var_FileId, x203338_var_QuestId);
			else
          
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203338_var_QuestName)
						TalkAppendString(varMap,x203338_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203338_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203338_var_FileId, x203338_var_QuestId);
			end
  elseif x203338_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203338_var_QuestName)
			TalkAppendString(varMap,x203338_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203338_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203338_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:")
				TalkAppendString(varMap,x203338_var_QuestHelp )
			end
			x203338_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203338_var_FileId, x203338_var_QuestId);
  end
end

function x203338_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203338_var_QuestId) > 0 then
		return 0
	elseif GetLevel(varMap, varPlayer)< x203338_var_LevelLess then
		return 0
	end
	return 1
end

function x203338_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203338_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203338_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	        return 1
	end
	return 0
end

function x203338_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203338_var_QuestId) > 0 then
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203338_var_QuestId  )
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
		if x203338_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203338_var_QuestId, x203338_var_FileId, 1, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			
						CreateMonster(varMap, 2246,224,49,5,1,-1,-1,21,60000)
						x203338_Msg2toplayer( varMap, varPlayer,0)
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203338_var_QuestId)                                                  
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
		  		end
		  
          
	  end                                                                    
	     
end

function x203338_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203338_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203338_var_QuestId)
	  x203338_Msg2toplayer( varMap, varPlayer,1)
end

function x203338_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203338_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203338_var_BonusChoiceItem do
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

function x203338_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected)
	if IsHaveQuest(varMap,varPlayer, x203338_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203338_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203338_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203338_var_QuestId) > 0 then
				x203338_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203338_var_QuestId)
                x203338_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203338_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203338_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		    end
    		    StopItemTask(varMap,varPlayer)
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203338_var_QuestIdNext )	
   end
end

function x203338_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
  
end

function x203338_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203338_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203338_var_ExpBonus);
  	end
		if x203338_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203338_var_BonusMoney1 )
	  end
		if x203338_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203338_var_BonusMoney2 )
	  end
		if x203338_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203338_var_BonusMoney3 )
		end
		if x203338_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203338_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203338_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203338_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203338_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203338_var_BonusMoney6)
		end
end

function x203338_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203338_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203338_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203338_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203338_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203338_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203338_var_QuestName.."！", 0, 3)
				if x203338_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203338_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203338_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203338_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203338_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203338_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203338_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203338_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203338_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203338_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203338_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203338_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203338_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203338_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end



function x203338_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==x203338_var_DemandKill[1].varId then
			local varQuest = x203338_var_QuestId
			local guid = GetMonsterGUID(varMap, varPlayer)
			local varX,z = GetWorldPos(varMap,varPlayer)
			local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
			for varI = 0, Num-1 do
				local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
				if humanObjId >= 0 then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						if IsHaveQuestNM(varMap, humanObjId, x203338_var_QuestId) == 1 then
	    	        local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, varQuest)
		            SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, 1)
				        SetQuestByIndex( varMap, humanObjId, varQuestIdx, 7, 1)
				        Msg2Player( varMap, humanObjId, format("击败黑衣魔龙   %d/1", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 8, 3)
				        Msg2Player( varMap, humanObjId, format("击败黑衣魔龙   %d/1", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 8, 2)
				 		end
			    end
				end
			end
	end 
end

function x203338_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203338_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203338_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203338_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203338_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203338_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203338_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203338_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203338_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203338_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end





