

--DECLARE_QUEST_INFO_START--
x270011_var_FileId = 270011
x270011_var_QuestIdPre =3505
x270011_var_QuestId = 3506
x270011_var_LevelLess	= 	45 
x270011_var_QuestIdNext = 3507
x270011_var_Name	={}
x270011_var_ExtTarget={{type=20,n=1,target="到@npc_141219处等待张生把孙飞虎引开后杀了孙飞虎"}}
x270011_var_QuestName="【主线】美人计<二>"
x270011_var_QuestInfo="\t好，我这就依计行事，换上这套衣服前去汉军营附近，诱那飞虎校尉出来，剩下的事就靠侠士你多帮忙了。"  
x270011_var_QuestTarget=""		
x270011_var_QuestCompleted="\t想不到张生一个文弱书生还有这个能耐和胆量。"					
x270011_var_ContinueInfo="\t这计划能行吗？还是让莺莺快跑吧！"
x270011_var_QuestHelp =	""
x270011_var_DemandItem ={}
x270011_var_BonusMoney1 =376
x270011_var_BonusMoney2 =0
x270011_var_BonusMoney3 =0
x270011_var_BonusMoney4 =0
x270011_var_BonusMoney5 =56
x270011_var_BonusMoney6 =0
x270011_var_BonusItem	=	{}
x270011_var_BonusChoiceItem ={}
x270011_var_ExpBonus = 112000
x270011_var_doing = 0
x270011_var_sunfeihu = -1
x270011_var_zhangsheng = -1
x270011_var_huwei1 = -1
x270011_var_huwei2 = -1
x270011_var_NpcGUID ={{ guid = 141201, varName = "崔母"}}
x270011_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
--DECLARE_QUEST_INFO_STOP--


function x270011_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270011_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270011_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x270011_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270011_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270011_var_QuestId, varState, -1 )
		end
	end
end

function x270011_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270011_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270011_var_ExpBonus )
		end
		if x270011_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270011_var_BonusMoney1 )
		end
		if x270011_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270011_var_BonusMoney2 )
		end
		if x270011_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270011_var_BonusMoney3 )
		end
		if x270011_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270011_var_BonusMoney4 )
		end
		if x270011_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270011_var_BonusMoney5 )
		end
		if x270011_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270011_var_BonusMoney6 )
		end
		for varI, item in x270011_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270011_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270011_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270011_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270011_var_QuestId) > 0 then
			if x270011_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270011_var_QuestName)
						TalkAppendString(varMap,x270011_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270011_var_FileId, x270011_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270011_var_QuestName)
						TalkAppendString(varMap,x270011_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270011_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270011_var_FileId, x270011_var_QuestId);
			end
  elseif x270011_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270011_var_QuestName)
			TalkAppendString(varMap,x270011_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270011_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270011_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270011_var_QuestHelp )
			end
			x270011_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270011_var_FileId, x270011_var_QuestId);
  end
	
end


function x270011_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270011_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270011_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270011_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
	
end

function x270011_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270011_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270011_var_QuestId  )
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
		if x270011_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270011_var_QuestId, x270011_var_FileId, 1, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270011_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x270011_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270011_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270011_var_QuestId)
	  x270011_Msg2toplayer( varMap, varPlayer,1)
			
end

function x270011_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270011_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270011_var_BonusChoiceItem do
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

function x270011_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270011_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270011_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270011_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270011_var_QuestId) > 0 then
				x270011_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270011_var_QuestId)
				x270011_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270011_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270011_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270011_var_QuestIdNext )	
end

function x270011_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270011_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270011_var_ExpBonus);
  	end
		if x270011_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270011_var_BonusMoney1 )
	  end
		if x270011_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270011_var_BonusMoney2 )
	  end
		if x270011_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270011_var_BonusMoney3 )
		end
		if x270011_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270011_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270011_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270011_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270011_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270011_var_BonusMoney6)
		end
end

function x270011_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270011_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270011_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270011_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270011_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270011_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270011_var_QuestName.."！", 0, 3)
				if x270011_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270011_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270011_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270011_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270011_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270011_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270011_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270011_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270011_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270011_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270011_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270011_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270011_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270011_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270011_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if	varObjData ==1617 then
	 local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
            if humanObjId ~= -1 then
                 if IsHaveQuest(varMap,humanObjId, x270011_var_QuestId) > 0 then
                    local varQuestIdx = GetQuestIndexByID(varMap,humanObjId,x270011_var_QuestId)
										if GetQuestParam(varMap,humanObjId,varQuestIdx,0) < 1 then
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,0,GetQuestParam(varMap,humanObjId,varQuestIdx,0)+1)
												SetQuestByIndex(varMap,humanObjId,varQuestIdx,7,1)
												    
												Msg2Player(varMap, humanObjId, format("杀死孙飞虎   %d/1", GetQuestParam(varMap,humanObjId,varQuestIdx,0)), 0, 3)
												x270011_CheckSubmit( varMap, humanObjId)
										end
                end
            end
		end
	end
end


function x270011_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
		if IsHaveQuest(varMap,varPlayer, x270011_var_QuestId) > 0 then
			if x270011_var_doing == 0 then
				if x270011_CheckSubmit(varMap, varPlayer) <= 0 then
					
							x270011_var_PROTECTINFO.StartTime = GetCurrentTime()
							x270011_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270011, "ProcScneneTimer", 1)
							if x270011_var_PROTECTINFO.ScneneTimerIndex >= 0 then
								
											x270011_var_doing = 1
											x270011_var_sunfeihu=CreateMonster(varMap, 1617,63,38,5,1,-1,-1,20,80000,180,"孙飞虎")
											x270011_var_huwei1=CreateMonster(varMap, 1618,62,41,3,1,-1,-1,20,80000,180,"护卫")
											x270011_var_huwei2=CreateMonster(varMap, 1618,62,38,3,1,-1,-1,20,80000,180,"护卫")
											if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
													SetPatrolId(varMap, x270011_var_sunfeihu, 0)
											end
											if IsObjValid (varMap,x270011_var_huwei1) == 1 then
													SetPatrolId(varMap, x270011_var_huwei1, 1)
											end
											if IsObjValid (varMap,x270011_var_huwei2) == 1 then
													SetPatrolId(varMap, x270011_var_huwei2, 2)
											end
								
							end
					
				end
			end
		end

end

function x270011_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
end

function x270011_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end

function x270011_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270011_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x270011_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270011_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270011_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270011_var_QuestId, varState, -1 )
		end
end

function x270011_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270011_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270011_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270011_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270011_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270011_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270011_ProcScneneTimer(varMap)
	if x270011_var_doing==1   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 2   then
						x270011_var_doing = 2
						if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
								NpcTalk(varMap, x270011_var_sunfeihu, "你说刚才那姑娘来了没？", -1)
						end
		end
	elseif x270011_var_doing==2   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 4   then
						x270011_var_doing = 3
						if IsObjValid (varMap,x270011_var_huwei1) == 1 then
								NpcTalk(varMap, x270011_var_huwei1, "看她刚才是吓傻了，没准跑了吧！", -1)
						end
		end
	elseif x270011_var_doing==3   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 6   then
						x270011_var_doing = 4
						if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
								NpcTalk(varMap, x270011_var_sunfeihu, "往哪里跑？跑到天边我也能抓回来！", -1)
						end

		end
	elseif x270011_var_doing==4   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 8   then
						x270011_var_doing = 5
						if IsObjValid (varMap,x270011_var_huwei2) == 1 then
								NpcTalk(varMap, x270011_var_huwei2, "没准看上孙将军英明神武自己颠颠过来了！", -1)
						end
		end
	elseif x270011_var_doing==5   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 10   then
						x270011_var_doing = 6
						if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
								NpcTalk(varMap, x270011_var_sunfeihu, "哈哈哈哈", -1)
						end
						if IsObjValid (varMap,x270011_var_huwei1) == 1 then
								NpcTalk(varMap, x270011_var_huwei1, "哈哈哈哈", -1)
						end
						x270011_var_zhangsheng=CreateMonster(varMap, 1621,95,45,3,1,-1,-1,20,30000,180,"崔莺莺","张生扮")
		end
	elseif x270011_var_doing==6   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 6  then
						x270011_var_doing = 7
						if IsObjValid (varMap,x270011_var_huwei1) == 1 then
								NpcTalk(varMap, x270011_var_huwei1, "诶，这不是来了？", -1)
						end
						if IsObjValid (varMap,x270011_var_huwei1) == 1 then
								SetMonsterDir(varMap,x270011_var_huwei1,1)
						end
		end
	elseif x270011_var_doing==7   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 8  then
						x270011_var_doing = 8
						if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
								NpcTalk(varMap, x270011_var_sunfeihu, "哈哈，来了！省了我不少麻烦！", -1)
						end
						if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
								SetMonsterDir(varMap,x270011_var_sunfeihu,0)
						end
						if IsObjValid (varMap,x270011_var_huwei2) == 1 then
								SetMonsterDir(varMap,x270011_var_huwei2,2)
						end
		end
	elseif x270011_var_doing==8   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 10 then
						x270011_var_doing = 9
						if IsObjValid (varMap,x270011_var_huwei2) == 1 then
								NpcTalk(varMap, x270011_var_huwei2, "呀！她怎么掉头走了！", -1)
						end
						if IsObjValid (varMap,x270011_var_zhangsheng) == 1 then
								SetPatrolId(varMap, x270011_var_zhangsheng, 3)
						end
		end
	elseif x270011_var_doing==9   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 12 then
						x270011_var_doing = 10
						if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
								NpcTalk(varMap, x270011_var_sunfeihu, "害羞了，这种我喜欢！", -1)
								SetPatrolId(varMap, x270011_var_sunfeihu, 0)
						end
		end
	elseif x270011_var_doing==10   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 20   then
						x270011_var_doing = 11
						if IsObjValid (varMap,x270011_var_huwei2) == 1 then
								NpcTalk(varMap, x270011_var_huwei2, "我们俩在这等着吧！", -1)
						end
		end
	elseif x270011_var_doing==11   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 14   then
						x270011_var_doing = 12
						if IsObjValid (varMap,x270011_var_huwei1) == 1 then
								NpcTalk(varMap, x270011_var_huwei1, "恩，我打赌一炷香时间他就能回来！", -1)
								SetMonsterDir(varMap,x270011_var_huwei1,1)
						end
						if IsObjValid (varMap,x270011_var_huwei2) == 1 then
								SetMonsterDir(varMap,x270011_var_huwei2,2)
						end
		end
	elseif x270011_var_doing==12   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 16  then
						x270011_var_doing = 13
						if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
								NpcTalk(varMap, x270011_var_sunfeihu, "我看你要跑到哪里！", -1)
						end
		end
	elseif x270011_var_doing==13   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 18  then
						x270011_var_doing = 14
						if IsObjValid (varMap,x270011_var_zhangsheng) == 1 then
								SetMonsterDir(varMap,x270011_var_zhangsheng, 3)
						end
		end
	elseif x270011_var_doing==14   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 20 then
						x270011_var_doing = 15
						if IsObjValid (varMap,x270011_var_sunfeihu) == 1 then
								NpcTalk(varMap, x270011_var_sunfeihu, "什么你居然是男的！你到底是谁？", -1)
								SetMonsterCamp(varMap,x270011_var_sunfeihu,21)
                SetMonsterDir(varMap,x270011_var_zhangsheng,45)
						end
		end
	elseif x270011_var_doing==15   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >=22 then
						x270011_var_doing = 16
						if IsObjValid (varMap,x270011_var_zhangsheng) == 1 then
								NpcTalk(varMap, x270011_var_zhangsheng, "壮士，剩下的拜托你了！", -1)
						end
		end
	elseif x270011_var_doing==16   then
		if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 24 then
						x270011_var_doing = 17
		end
	elseif x270011_var_doing==17 then
			if GetCurrentTime() - x270011_var_PROTECTINFO.StartTime >= 26 then
				x270011_var_doing=30
				x270011_CloseTimer(varMap, x270011_var_PROTECTINFO.ScneneTimerIndex)  
			end
	end
end





function x270011_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270011_var_doing =0
	x270011_var_sunfeihu = -1
	x270011_var_huwei1 = -1
	x270011_var_huwei2 = -1
	x270011_var_zhangsheng = -1
	x270011_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end
