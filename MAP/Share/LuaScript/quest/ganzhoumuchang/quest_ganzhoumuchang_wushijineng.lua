

--DECLARE_QUEST_INFO_START--
x203677_var_FileId = 203677
x203677_var_QuestIdPre =3710
x203677_var_QuestId = 3711
x203677_var_LevelLess	= 	1 
x203677_var_QuestIdNext = 3743
x203677_var_DemandKill ={{varId=11971,varNum=5}}

x203677_var_ExtTarget={{type=20,n=1,target="在@npc_134026处学习技能"}}
x203677_var_QuestName="【新手】新兵的技能"

x203677_var_QuestInfo="\t虽然你是三位长老推荐而来，但是你的技能似乎有所欠缺。\n\t每一位来应征的新兵，都可以从教官铁力那里学到两个新的技能，快去找他吧。"  
x203677_var_QuestTarget=""		
x203677_var_QuestCompleted="\t这两个最初级的技能就传授给你了，但是要牢记：只有勤加修炼才能学会更高级的技能。"
x203677_var_ContinueInfo={""}
x203677_var_QuestHelp =	""
x203677_var_DemandItem ={}
x203677_var_ExpBonus = 1600
x203677_var_BonusMoney1 =5
x203677_var_BonusMoney2 =0
x203677_var_BonusMoney3 =0
x203677_var_BonusMoney4 =0
x203677_var_BonusMoney5 =12
x203677_var_BonusMoney6 =0
x203677_var_BonusChoiceItem ={}

x203677_var_NpcGUID = {{ guid = 134026, varName = "雄鹰长老"} }

--DECLARE_QUEST_INFO_STOP--
x203677_var_Skill	= {{varId=123, varLevel=1, pos=4},{varId=132, varLevel=1, pos=3},
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
x203677_var_BonusItem	=	{{varId=13030003,varNum=1},{varId=13030004,varNum=1},
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


function x203677_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203677_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203677_var_QuestIdPre) > 0 then
	
				if IsHaveQuest(varMap,varPlayer, x203677_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203677_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203677_var_QuestId, varState, -1 )
				end

	end
end

function x203677_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203677_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203677_var_ExpBonus )
		end
		if x203677_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203677_var_BonusMoney1 )
		end
		if x203677_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203677_var_BonusMoney2 )
		end
		if x203677_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203677_var_BonusMoney3 )
		end
		if x203677_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203677_var_BonusMoney4 )
		end
		if x203677_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203677_var_BonusMoney5 )
		end
		if x203677_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203677_var_BonusMoney6 )
		end
		local zhiye = GetZhiye( varMap, varPlayer)+1
			
					AddQuestItemBonus(varMap, x203677_var_BonusItem[zhiye+zhiye-1].varId,  x203677_var_BonusItem[zhiye+zhiye-1].varNum)
					AddQuestItemBonus(varMap, x203677_var_BonusItem[zhiye+zhiye].varId,  x203677_var_BonusItem[zhiye+zhiye].varNum)
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			



		for varI, item in x203677_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203677_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203677_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203677_var_QuestId) > 0 then
			if x203677_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203677_var_QuestName) 
						TalkAppendString(varMap,x203677_var_ContinueInfo[1])
						
						StopTalkTask()	
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203677_var_FileId, x203677_var_QuestId); 
						
					elseif which ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203677_var_QuestName)
						TalkAppendString(varMap,x203677_var_ContinueInfo[2])
						
						StopTalkTask()
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203677_var_FileId, x203677_var_QuestId);
					elseif which ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203677_var_QuestName)
						TalkAppendString(varMap,x203677_var_ContinueInfo[3])
						
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203677_var_FileId, x203677_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203677_var_QuestId)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)                                                
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203677_var_QuestName)
						TalkAppendString(varMap,x203677_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203677_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203677_var_FileId, x203677_var_QuestId);
			end
  elseif x203677_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203677_var_QuestName)
			TalkAppendString(varMap,x203677_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x203677_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203677_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203677_var_QuestHelp )
			end
			x203677_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203677_var_FileId, x203677_var_QuestId);
  end
end



function x203677_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203677_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203677_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203677_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203677_var_QuestId)
	
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		
	        return 1
	
	
end

function x203677_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203677_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		if x203677_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203677_var_QuestId, x203677_var_FileId, 1, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203677_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203677_var_QuestId) 
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )                                                 
								  
                                           
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203677_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203677_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203677_var_QuestId)
	  x203677_Msg2toplayer( varMap, varPlayer,1)
	  
end

function x203677_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	
		
 
  for j, item in x203677_var_BonusChoiceItem do
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

function x203677_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203677_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203677_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203677_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203677_var_QuestId) > 0 then
				x203677_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203677_var_QuestId)
				
				x203677_GetBonus( varMap, varPlayer,varTalknpc)
				local zhiye = GetZhiye( varMap, varPlayer)+1
				
					if HaveSkill(varMap, varPlayer,x203677_var_Skill[zhiye+zhiye-1].varId)<=0 then
						AddSkillToPlayer(varMap, varPlayer, x203677_var_Skill[zhiye+zhiye-1].varId, x203677_var_Skill[zhiye+zhiye-1].varLevel, x203677_var_Skill[zhiye+zhiye-1].pos)
					end
					if HaveSkill(varMap, varPlayer,x203677_var_Skill[zhiye+zhiye].varId)<=0 then
						AddSkillToPlayer(varMap, varPlayer, x203677_var_Skill[zhiye+zhiye].varId, x203677_var_Skill[zhiye+zhiye].varLevel, x203677_var_Skill[zhiye+zhiye].pos)
					end       
			  	
			  	
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203677_var_QuestIdNext )	
				
   end
end

function x203677_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203677_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203677_var_ExpBonus);
  	end
		if x203677_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203677_var_BonusMoney1 )
	  end
		if x203677_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203677_var_BonusMoney2 )
	  end
		if x203677_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203677_var_BonusMoney3 )
		end
		if x203677_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203677_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203677_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203677_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203677_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203677_var_BonusMoney6)
		end
end

function x203677_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203677_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203677_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203677_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203677_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203677_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203677_var_QuestName.."！", 0, 3)
				if x203677_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203677_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203677_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203677_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203677_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203677_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203677_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203677_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203677_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203677_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203677_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203677_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203677_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203677_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203677_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203677_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203677_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203677_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203677_var_QuestId, varState, -1 )
		end
end



function x203677_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
















end


function x203677_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203677_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203677_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203677_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203677_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203677_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203677_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203677_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203677_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203677_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
