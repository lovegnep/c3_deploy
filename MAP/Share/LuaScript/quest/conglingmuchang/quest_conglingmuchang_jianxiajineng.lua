

--DECLARE_QUEST_INFO_START--
x203528_var_FileId = 203528
x203528_var_QuestIdPre =3229
x203528_var_QuestId = 3253
x203528_var_LevelLess	= 	1 
x203528_var_QuestIdNext = 3206
x203528_var_DemandKill ={{varId=11971,varNum=5}}

x203528_var_ExtTarget={{type=20,n=5,target="消灭5只@npc_125021"}}
x203528_var_QuestName="【新手】新兵器的威力"

x203528_var_QuestInfo="\t获得新兵器之后，记得按下“B”键打开背包，右键点击你刚刚获得的武器，就可以装备上新武器了。村西有一些草原狼，建议你在装备武器后去拿它们检验一下你新武器的威力。\n\t在这之后，你可以去找雄鹰长老请教一番。"  
x203528_var_QuestTarget=""		
x203528_var_QuestCompleted="\t（雄鹰长老满意的对你点点头说道）\n\t有了新兵器之后，是不是感觉自己的实力有明显的提升？\n\t不过，年轻的勇士，新的兵器需要搭配新的技能才能让你的实力更进一步。这2个技能就送给你了，希望你能迅速它们的精髓。"
x203528_var_ContinueInfo={"\t你还是再去熟悉熟悉手里的兵器，我再传授给你技能。","\t你还是再去熟悉熟悉手里的兵器，我再传授给你技能。","\t你还是再去熟悉熟悉手里的兵器，我再传授给你技能。"}
x203528_var_QuestHelp =	"按下“B”键打开背包，右键点击就可以装备你刚刚获得的武器。"
x203528_var_DemandItem ={}
x203528_var_ExpBonus = 230
x203528_var_BonusMoney1 =11
x203528_var_BonusMoney2 =0
x203528_var_BonusMoney3 =0
x203528_var_BonusMoney4 =0
x203528_var_BonusMoney5 =12
x203528_var_BonusMoney6 =0
x203528_var_BonusItem	=	{{varId=13030005,varNum=1},{varId=13030006,varNum=1}}
x203528_var_BonusChoiceItem ={}
x203528_var_NpcGUID = {{ guid = 125015, varName = "雄鹰长老"} }
x203528_var_Skill	= {{varId=204, varLevel=1, pos=4},{varId=208, varLevel=1, pos=3}}
--DECLARE_QUEST_INFO_STOP--



function x203528_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 ) 
	if IsQuestHaveDone(varMap, varPlayer, x203528_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203528_var_QuestIdPre) > 0 then
		if GetZhiye( varMap, varPlayer)==1 then
				if IsHaveQuest(varMap,varPlayer, x203528_var_QuestId) <= 0 then
						local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203528_var_QuestId)
						TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203528_var_QuestId, varState, -1 )
				end
		end
	end
end

function x203528_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203528_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203528_var_ExpBonus )
		end
		if x203528_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203528_var_BonusMoney1 )
		end
		if x203528_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203528_var_BonusMoney2 )
		end
		if x203528_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203528_var_BonusMoney3 )
		end
		if x203528_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203528_var_BonusMoney4 )
		end
		if x203528_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203528_var_BonusMoney5 )
		end
		if x203528_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203528_var_BonusMoney6 )
		end
		for varI, item in x203528_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.varId, item.varNum)
	  end
		for varI, item in x203528_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end






function x203528_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x203528_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203528_var_QuestId) > 0 then
			if x203528_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					if which == -1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203528_var_QuestName) 
						TalkAppendString(varMap,x203528_var_ContinueInfo[1])
						
						StopTalkTask()	
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203528_var_FileId, x203528_var_QuestId); 
						
					elseif which ==0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203528_var_QuestName)
						TalkAppendString(varMap,x203528_var_ContinueInfo[2])
						
						StopTalkTask()
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203528_var_FileId, x203528_var_QuestId);
					elseif which ==1 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203528_var_QuestName)
						TalkAppendString(varMap,x203528_var_ContinueInfo[3])
						
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203528_var_FileId, x203528_var_QuestId);
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203528_var_QuestId)  
						SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)                                                
	    			SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203528_var_QuestName)
						TalkAppendString(varMap,x203528_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203528_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203528_var_FileId, x203528_var_QuestId);
			end
  elseif x203528_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 5,0 )
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203528_var_QuestName)
			TalkAppendString(varMap,x203528_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：") 
			for varI, item in x203528_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203528_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203528_var_QuestHelp )
			end
			x203528_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
			StopTalkTask()
		
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203528_var_FileId, x203528_var_QuestId);
  end
end



function x203528_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if IsQuestHaveDone(varMap, varPlayer, x203528_var_QuestId) > 0 then
		return 0
	elseif IsQuestHaveDone(varMap, varPlayer, x203528_var_QuestIdPre) <= 0 then
		return 0
	end
	return 1
end

function x203528_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203528_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == x203528_var_DemandKill[1].varNum then
             
	    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 21,0 )
	        return 1
	end
	return 0
end

function x203528_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203528_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203528_var_QuestId  )
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
		if x203528_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203528_var_QuestId, x203528_var_FileId, 1, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203528_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203528_var_QuestId)                                                  
								  
                                           
	    					
	    			
		  		end
	 	end                                                                    
	     
end


function x203528_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203528_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203528_var_QuestId)
	  x203528_Msg2toplayer( varMap, varPlayer,1)
	  
end

function x203528_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203528_var_BonusItem do
		ItemAppend( varMap, item.varId, item.varNum )
  end
  for j, item in x203528_var_BonusChoiceItem do
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

function x203528_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203528_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203528_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203528_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203528_var_QuestId) > 0 then
				x203528_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203528_var_QuestId)
				QuestCom(varMap, varPlayer, 3264)
				x203528_GetBonus( varMap, varPlayer,varTalknpc)
				if HaveSkill(varMap, varPlayer,x203528_var_Skill[1].varId)<=0 then
					AddSkillToPlayer(varMap, varPlayer, x203528_var_Skill[1].varId, x203528_var_Skill[1].varLevel, x203528_var_Skill[1].pos)
				end
				if HaveSkill(varMap, varPlayer,x203528_var_Skill[2].varId)<=0 then
					AddSkillToPlayer(varMap, varPlayer, x203528_var_Skill[2].varId, x203528_var_Skill[2].varLevel, x203528_var_Skill[2].pos)
				end       
			  	
				LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203528_var_QuestIdNext )	
			  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 17,1 ) 
   end
end

function x203528_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203528_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203528_var_ExpBonus);
  	end
		if x203528_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203528_var_BonusMoney1 )
	  end
		if x203528_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203528_var_BonusMoney2 )
	  end
		if x203528_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203528_var_BonusMoney3 )
		end
		if x203528_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203528_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203528_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203528_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203528_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203528_var_BonusMoney6)
		end
end

function x203528_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203528_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203528_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203528_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203528_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203528_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203528_var_QuestName.."！", 0, 3)
				if x203528_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203528_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203528_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203528_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203528_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203528_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203528_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203528_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203528_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203528_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203528_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203528_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203528_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203528_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203528_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    local bFind  = 0
    for varI ,item in x203528_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203528_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203528_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203528_var_QuestId, varState, -1 )
		end
end



function x203528_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==x203528_var_DemandKill[1].varId then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x203528_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x203528_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 5 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
												Msg2Player(varMap, humanObjId, format("你击毙了草原狼   %d/5", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x203528_CheckSubmit( varMap, humanObjId)
										end
                end
            end
		end
	end
end


function x203528_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203528_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203528_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203528_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203528_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203528_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203528_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203528_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203528_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203528_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
