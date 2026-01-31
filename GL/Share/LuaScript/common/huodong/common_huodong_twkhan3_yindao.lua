

--DECLARE_QUEST_INFO_START--
x205007_var_FileId = 205007
x205007_var_QuestId = 3217
x205007_var_LevelLess	= 	1 
x205007_var_gameid =2010

x205007_var_ExtTarget={{type=20,n=1,target="找到@npc_123760"}}
x205007_var_QuestName="【引导】开创新世纪"
x205007_var_QuestTalk=""
x205007_var_QuestInfo="\t欢迎来到成吉思汗的世界，请到#R新手领奖大使#W处，报名参加#G开创新世纪活动#W，领取第一份豪华大礼吧！"  
x205007_var_QuestTarget="  找到@npc_138038"		
x205007_var_QuestCompleted="\n \t参与#G开创新世纪活动#W,领取第一份豪华大礼吧！"
x205007_var_ContinueInfo=""
x205007_var_QuestHelp =	"#G找到新手领奖大使，参与开创新世纪活动！"
x205007_var_DemandItem ={}
x205007_var_ExpBonus = 88
x205007_var_BonusMoney1 =0
x205007_var_BonusMoney2 =0
x205007_var_BonusMoney3 =0
x205007_var_BonusMoney4 =0
x205007_var_BonusMoney5 =0
x205007_var_BonusMoney6 =0
x205007_var_BonusItem	=	{}
x205007_var_BonusChoiceItem ={}
x205007_var_NpcGUID = {{ guid = 123760, varName = "新手领奖大使"} }
x205007_var_QuestIdPre =3213

--DECLARE_QUEST_INFO_STOP--



function x205007_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(x205007_var_gameid) ~= 1 then
		return
	end
	if IsQuestHaveDone(varMap, varPlayer, x205007_var_QuestId) > 0 then
		return 
	end
	--不同的国家看不到任务
	local cid =GetCurCountry(varMap,varPlayer)
	if cid ~= 0 then return end
	if IsQuestHaveDone(varMap, varPlayer, x205007_var_QuestIdPre) > 0 then
		if IsHaveQuest(varMap,varPlayer, x205007_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x205007_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x205007_var_QuestId, varState, -1 )			 
		end
	end
end

function x205007_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x205007_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x205007_var_ExpBonus )
		end
		if x205007_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x205007_var_BonusMoney1 )
		end
		if x205007_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x205007_var_BonusMoney2 )
		end
		if x205007_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x205007_var_BonusMoney3 )
		end
		if x205007_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x205007_var_BonusMoney4 )
		end
		if x205007_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x205007_var_BonusMoney5 )
		end
		if x205007_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x205007_var_BonusMoney6 )
		end
		for varI, item in x205007_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x205007_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x205007_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x205007_var_QuestId)
   
	if IsQuestHaveDone(varMap, varPlayer, x205007_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x205007_var_QuestId) > 0 then
			if x205007_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x205007_var_QuestName)
				TalkAppendString(varMap,x205007_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x205007_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x205007_var_FileId, x205007_var_QuestId);
			end
  elseif x205007_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x205007_var_QuestName)
			TalkAppendString(varMap,x205007_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x205007_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x205007_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x205007_var_QuestHelp )
			end
			x205007_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x205007_var_FileId, x205007_var_QuestId);

  end
end

function x205007_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x205007_var_QuestId) > 0 then
		return 0
	end
	return 1
end

function x205007_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x205007_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
	        return 1
	end
	return 0
end

function x205007_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x205007_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x205007_var_QuestId  )
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
		if x205007_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x205007_var_QuestId, x205007_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x205007_Msg2toplayer( varMap, varPlayer,0)

		  		end
	 	end                                                                    
	     
end



function x205007_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x205007_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x205007_var_QuestId)
	  x205007_Msg2toplayer( varMap, varPlayer,1)
end

function x205007_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x205007_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x205007_var_BonusChoiceItem do
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

function x205007_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x205007_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x205007_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x205007_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x205007_var_QuestId) > 0 then
				x205007_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x205007_var_QuestId)
				x205007_GetBonus( varMap, varPlayer,varTalknpc)	  

   end
end

function x205007_GetBonus( varMap, varPlayer,varTalknpc)
	  if x205007_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x205007_var_ExpBonus);
  	end
		if x205007_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x205007_var_BonusMoney1 )
	  end
		if x205007_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x205007_var_BonusMoney2 )
	  end
		if x205007_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x205007_var_BonusMoney3 )
		end
		if x205007_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x205007_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x205007_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x205007_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x205007_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x205007_var_BonusMoney6)
		end
end

function x205007_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x205007_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x205007_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x205007_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x205007_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x205007_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x205007_var_QuestName.."！", 0, 3)
				if x205007_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x205007_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x205007_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x205007_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x205007_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x205007_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x205007_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x205007_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x205007_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x205007_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x205007_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x205007_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x205007_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x205007_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x205007_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x205007_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
     
		if IsHaveQuest(varMap,varPlayer, x205007_var_QuestId) > 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x205007_var_QuestId)
  			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x205007_var_QuestId, 7, -1 )
		end
end



function x205007_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x205007_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x205007_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x205007_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x205007_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x205007_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x205007_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x205007_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x205007_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x205007_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x205007_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
