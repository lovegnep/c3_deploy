

--DECLARE_QUEST_INFO_START--
x203380_var_FileId = 203380
x203380_var_QuestIdPre =3200
x203380_var_QuestId = 3201
x203380_var_LevelLess	= 	1 
x203380_var_QuestIdNext = 3202

x203380_var_ExtTarget={{type=20,n=1,target="找到@npc_138001"}}
x203380_var_QuestName="【新手】雄鹰长老"
x203380_var_QuestTalk=""
x203380_var_QuestInfo="\t每一个来到圣山的草原人，都是长生天选择的勇士。\n\t前方的雄鹰长老，会让他的雄鹰带你领略这蒙古大草原的美丽风光。好好看看你的家乡吧，这美丽辽阔的大草原！"  
x203380_var_QuestTarget="  找到@npc_138001"		
x203380_var_QuestCompleted="\t你就是长生天选择的勇士么？我看你似乎也没有什么奇特之处啊！难道你身上隐藏着什么不一样的地方么？"
x203380_var_ContinueInfo=""
x203380_var_QuestHelp =	"#G您可以用滑鼠#R左键#G点击@npc_138001，和他对话。您可以点击键盘上的#RQ#G键，打开任务列表，选中你要完成的任务，点击#R任务目标#G中的蓝色字体来进行自动寻路。"
x203380_var_DemandItem ={}
x203380_var_ExpBonus = 23
x203380_var_BonusMoney1 =11
x203380_var_BonusMoney2 =0
x203380_var_BonusMoney3 =0
x203380_var_BonusMoney4 =0
x203380_var_BonusMoney5 =12
x203380_var_BonusMoney6 =0
x203380_var_BonusItem	=	{}
x203380_var_BonusChoiceItem ={}
x203380_var_NpcGUID = {{ guid = 138001, varName = "雄鹰长老"} }

--DECLARE_QUEST_INFO_STOP--



function x203380_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	
	if IsQuestHaveDone(varMap, varPlayer, x203380_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203380_var_QuestIdPre) > 0 then
		if IsHaveQuest(varMap,varPlayer, x203380_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203380_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203380_var_QuestId, varState, -1 )
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,1 )					 
		end
	end
end

function x203380_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203380_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203380_var_ExpBonus )
		end
		if x203380_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203380_var_BonusMoney1 )
		end
		if x203380_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203380_var_BonusMoney2 )
		end
		if x203380_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203380_var_BonusMoney3 )
		end
		if x203380_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203380_var_BonusMoney4 )
		end
		if x203380_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203380_var_BonusMoney5 )
		end
		if x203380_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203380_var_BonusMoney6 )
		end
		for varI, item in x203380_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203380_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203380_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203380_var_QuestId)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203380_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203380_var_QuestId) > 0 then
			if x203380_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 ) 
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 16,0)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1)
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203380_var_QuestName)
				TalkAppendString(varMap,x203380_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x203380_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203380_var_FileId, x203380_var_QuestId);
			end
  elseif x203380_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203380_var_QuestName)
			TalkAppendString(varMap,x203380_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )	
			for varI, item in x203380_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203380_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203380_var_QuestHelp )
			end
			x203380_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203380_var_FileId, x203380_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
  end
end

function x203380_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203380_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203380_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203380_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203380_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
	        return 1
	end
	return 0
end

function x203380_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203380_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203380_var_QuestId  )
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
		if x203380_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203380_var_QuestId, x203380_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203380_Msg2toplayer( varMap, varPlayer,0)

		  		end
	 	end                                                                    
	     
end



function x203380_ProcQuestAbandon(varMap, varPlayer, varQuest)
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203380_var_QuestId) <= 0 then
				return 
		end
	  	StartTalkTask(varMap)
		TalkAppendString(varMap,"您无法放弃此任务！") 
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
end

function x203380_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203380_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203380_var_BonusChoiceItem do
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

function x203380_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203380_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203380_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203380_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203380_var_QuestId) > 0 then
				x203380_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203380_var_QuestId)
				x203380_GetBonus( varMap, varPlayer,varTalknpc)	  
			  	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,0)
				LuaCallNoclosure( 203366, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203380_var_QuestIdNext )	

   end
end

function x203380_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203380_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203380_var_ExpBonus);
  	end
		if x203380_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203380_var_BonusMoney1 )
	  end
		if x203380_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203380_var_BonusMoney2 )
	  end
		if x203380_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203380_var_BonusMoney3 )
		end
		if x203380_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203380_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203380_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203380_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203380_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203380_var_BonusMoney6)
		end
end

function x203380_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203380_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203380_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203380_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203380_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203380_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203380_var_QuestName.."！", 0, 3)
				if x203380_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203380_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203380_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203380_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203380_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203380_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203380_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203380_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203380_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203380_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203380_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203380_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203380_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203380_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203380_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203380_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
     
		if IsHaveQuest(varMap,varPlayer, x203380_var_QuestId) > 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203380_var_QuestId)
  			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203380_var_QuestId, 7, -1 )
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 ) 
		end
end



function x203380_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end

function x203380_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203380_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203380_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203380_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203380_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203380_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203380_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203380_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203380_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203380_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
