

--DECLARE_QUEST_INFO_START--
x203372_var_FileId = 203372
x203372_var_QuestIdPre =3211
x203372_var_QuestId = 3207
x203372_var_LevelLess	= 	1 
x203372_var_QuestIdNext = 3208
x203372_var_DemandKill ={}

x203372_var_ExtTarget={{type=20,n=1,target="拜访@npc_138006请他传授技能"}}
x203372_var_QuestName="【新手】第一个技能"

x203372_var_QuestInfo="\t听说哈日巴日大师可以让草原上的勇士变得更强更厉害，你一定也想变得更加强大吧！如果你的武艺再高强一点，那我对你的仰慕之情可就更多了！"  
x203372_var_QuestTarget=""		
x203372_var_QuestCompleted="\t果然还是姑娘能给草原的勇士带来神奇的力量！哈哈哈！不错，为了保卫我们的家园，我们的姑娘，你确实需要变得更加强大一些！"
x203372_var_ContinueInfo="\t你是真正的勇士么？"
x203372_var_QuestHelp =	""
x203372_var_DemandItem ={}
x203372_var_ExpBonus = 310
x203372_var_BonusMoney1 =5
x203372_var_BonusMoney2 =0
x203372_var_BonusMoney3 =0
x203372_var_BonusMoney4 =0
x203372_var_BonusMoney5 =12
x203372_var_BonusMoney6 =0
x203372_var_BonusChoiceItem ={}

x203372_var_NpcGUID = {{ guid = 138006, varName = "哈日巴日 技能大师"} }

--DECLARE_QUEST_INFO_STOP--
x203372_var_Skill	= {
				   {varId=123, varLevel=1, pos=4},{varId=132, varLevel=1, pos=3},
				   {varId=204, varLevel=1, pos=4},{varId=208, varLevel=1, pos=3},
				   {varId=306, varLevel=1, pos=4},{varId=309, varLevel=1, pos=3},
				   {varId=406, varLevel=1, pos=4},{varId=409, varLevel=1, pos=3},
				   {varId=502, varLevel=1, pos=4},{varId=508, varLevel=1, pos=3},
				   {varId=601, varLevel=1, pos=4},{varId=610, varLevel=1, pos=3},
				   {varId=1104, varLevel=1, pos=4},{varId=1102, varLevel=1, pos=3},
				   {varId=1207, varLevel=1, pos=4},{varId=1206, varLevel=1, pos=3},
				   {varId=1307, varLevel=1, pos=4},{varId=1306, varLevel=1, pos=3},
				   {varId=1406, varLevel=1, pos=3},{varId=1407, varLevel=1, pos=4},
				   {varId=1506, varLevel=1, pos=3},{varId=1507, varLevel=1, pos=4},
				   {varId=1600, varLevel=1, pos=4},{varId=1605, varLevel=1, pos=3}
				   }
x203372_var_BonusItem	=	{
						 {varId=13030003,varNum=1},{varId=13030004,varNum=1},
						 {varId=13030005,varNum=1},{varId=13030006,varNum=1},
						 {varId=13030007,varNum=1},{varId=13030008,varNum=1},
						 {varId=13030009,varNum=1},{varId=13030010,varNum=1},
						 {varId=13030011,varNum=1},{varId=13030012,varNum=1},
						 {varId=13030013,varNum=1},{varId=13030014,varNum=1},
						 {varId=13030129,varNum=1},{varId=13030130,varNum=1},
						 {varId=13030131,varNum=1},{varId=13030132,varNum=1},
						 {varId=13030133,varNum=1},{varId=13030134,varNum=1},
						 {varId=13030135,varNum=1},{varId=13030136,varNum=1},
						 {varId=13030137,varNum=1},{varId=13030138,varNum=1},
						 {varId=13030140,varNum=1},{varId=13030139,varNum=1}
}
x203372_var_NPCTalk ={
"只有掌握的了强大的技能，你才能成为真正的英雄",
}

function x203372_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203372_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203372_var_QuestIdPre) > 0 then
	
				if IsHaveQuest(varMap,varPlayer, x203372_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203372_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203372_var_QuestId, varState, -1 )
				end

	end
end

function x203372_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203372_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203372_var_ExpBonus )
		end
		if x203372_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203372_var_BonusMoney1 )
		end
		if x203372_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203372_var_BonusMoney2 )
		end
		if x203372_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203372_var_BonusMoney3 )
		end
		if x203372_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203372_var_BonusMoney4 )
		end
		if x203372_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203372_var_BonusMoney5 )
		end
		if x203372_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203372_var_BonusMoney6 )
		end
		local zhiye = GetZhiye( varMap, varPlayer)+1
			
		AddQuestItemBonus(varMap, x203372_var_BonusItem[zhiye+zhiye-1].varId,  x203372_var_BonusItem[zhiye+zhiye-1].varNum)
		AddQuestItemBonus(varMap, x203372_var_BonusItem[zhiye+zhiye].varId,  x203372_var_BonusItem[zhiye+zhiye].varNum)
			
		for varI, item in x203372_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203372_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203372_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203372_var_QuestId) > 0 then
			if x203372_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 )
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203372_var_QuestName)
						TalkAppendString(varMap,x203372_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203372_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203372_var_FileId, x203372_var_QuestId);
			end
  elseif x203372_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
   			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203372_var_QuestName)
			TalkAppendString(varMap,x203372_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x203372_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203372_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203372_var_QuestHelp )
			end
			x203372_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203372_var_FileId, x203372_var_QuestId);
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 4,1 )
			
  end
end



function x203372_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203372_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203372_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203372_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203372_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
	        return 1
	end
	return 0
	    		
end

function x203372_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203372_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end

		if x203372_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203372_var_QuestId, x203372_var_FileId, 1, 1, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203372_Msg2toplayer( varMap, varPlayer,0)
					--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )  
                                                  			
		  		end
	 	end                                                                    
	     
end


function x203372_ProcQuestAbandon(varMap, varPlayer, varQuest)	
		Msg2Player(varMap, varPlayer, "新手任务无法放弃", 0, 3)
		do return end
		if IsHaveQuest(varMap,varPlayer, x203372_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203372_var_QuestId)
	  x203372_Msg2toplayer( varMap, varPlayer,1)
	  
end

function x203372_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	
		
 
  for j, item in x203372_var_BonusChoiceItem do
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

function x203372_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203372_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203372_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203372_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203372_var_QuestId) > 0 then
				x203372_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203372_var_QuestId)
				
				x203372_GetBonus( varMap, varPlayer,varTalknpc)
				local zhiye = GetZhiye( varMap, varPlayer)+1
				
					if HaveSkill(varMap, varPlayer,x203372_var_Skill[zhiye+zhiye-1].varId)<=0 then
						AddSkillToPlayer(varMap, varPlayer, x203372_var_Skill[zhiye+zhiye-1].varId, x203372_var_Skill[zhiye+zhiye-1].varLevel, x203372_var_Skill[zhiye+zhiye-1].pos)
					end
					if HaveSkill(varMap, varPlayer,x203372_var_Skill[zhiye+zhiye].varId)<=0 then
						AddSkillToPlayer(varMap, varPlayer, x203372_var_Skill[zhiye+zhiye].varId, x203372_var_Skill[zhiye+zhiye].varLevel, x203372_var_Skill[zhiye+zhiye].pos)
					end       

				LuaCallNoclosure( 203373, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203372_var_QuestIdNext )	
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,1 ) 
   end
end

function x203372_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203372_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203372_var_ExpBonus);
  	end
		if x203372_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203372_var_BonusMoney1 )
	  end
		if x203372_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203372_var_BonusMoney2 )
	  end
		if x203372_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203372_var_BonusMoney3 )
		end
		if x203372_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203372_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203372_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203372_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203372_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203372_var_BonusMoney6)
		end
end

function x203372_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203372_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203372_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203372_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203372_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203372_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203372_var_QuestName.."！", 0, 3)
				if x203372_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203372_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203372_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203372_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203372_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203372_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203372_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203372_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203372_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203372_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203372_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203372_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203372_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203372_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203372_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203372_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
	if IsHaveQuest(varMap,varPlayer, x203372_var_QuestId) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203372_var_QuestId) 
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203372_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203372_var_QuestId, varState, -1 )	
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 )			
	end
end



function x203372_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)


end


function x203372_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	if IsHaveQuest(varMap, varPlayer,x203372_var_QuestIdNext) > 0 and varArea == 4 then
		SetViewGroup(varMap, varPlayer,10)
	end
	if IsHaveQuest(varMap, varPlayer,x203372_var_QuestId) > 0 and varArea == 4 then
		SetViewGroup(varMap, varPlayer,10)
	end
end

function x203372_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203372_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	if IsHaveQuest(varMap, varPlayer,x203372_var_QuestIdNext) > 0  then
		SetViewGroup(varMap, varPlayer,0)
	end
	if IsHaveQuest(varMap, varPlayer,x203372_var_QuestId) > 0 then
		SetViewGroup(varMap, varPlayer,0)
	end
	
	
end

function x203372_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203372_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203372_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203372_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203372_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203372_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203372_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
