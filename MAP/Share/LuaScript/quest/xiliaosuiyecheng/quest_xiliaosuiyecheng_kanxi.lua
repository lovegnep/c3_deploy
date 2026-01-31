

--DECLARE_QUEST_INFO_START--
x203312_var_FileId = 203312
x203312_var_QuestIdPre ={623,624}
x203312_var_QuestId = 625
x203312_var_LevelLess	= 	65 
x203312_var_QuestIdNext = 626
x203312_var_Name	={}
x203312_var_ExtTarget={{type=20,n=1,target="到@npc_113123处寻找逃亡的屈出律"}}
x203312_var_QuestName="【剧场】最强的劲敌"
x203312_var_QuestInfo="\t大营的一侧有条小路，屈出律一定是从那里跑了，想不到堂堂的太阳之子竟然不能像男子汉一样战死，反而茍且偷生。\n\t绝不能再让他逃走，快追！"  
x203312_var_QuestTarget=""		
x203312_var_QuestCompleted="\t（成吉思汗沉吟半响，自言自语道）\n\t摩诃末？亚洲之王……？"					
x203312_var_ContinueInfo="\t屈出律应该还没逃远，速度去追上他！"
x203312_var_QuestHelp =	""
x203312_var_DemandItem ={}
x203312_var_ExpBonus = 248000
x203312_var_BonusMoney1 =650
x203312_var_BonusMoney2 =0
x203312_var_BonusMoney3 =0
x203312_var_BonusMoney4 =0
x203312_var_BonusMoney5 =76
x203312_var_BonusMoney6 =0
x203312_var_BonusItem	=	{}
x203312_var_BonusChoiceItem ={}
x203312_var_doing = 0
x203312_var_mohemo = -1
x203312_var_zhalanding = -1
x203312_var_quchulv = -1
x203312_var_shibing1 = -1
x203312_var_shibing2 = -1
x203312_var_NpcGUID ={{ guid = 113001, varName = "成吉思汗"}}
x203312_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
--DECLARE_QUEST_INFO_STOP--


function x203312_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x203312_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203312_var_QuestIdPre[1])> 0 and IsQuestHaveDone(varMap, varPlayer, x203312_var_QuestIdPre[2])> 0 then
		if IsHaveQuest(varMap,varPlayer, x203312_var_QuestId) <= 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203312_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203312_var_QuestId, varState, -1 )
		end
	end
end

function x203312_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203312_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203312_var_ExpBonus )
		end
		if x203312_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203312_var_BonusMoney1 )
		end
		if x203312_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203312_var_BonusMoney2 )
		end
		if x203312_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203312_var_BonusMoney3 )
		end
		if x203312_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203312_var_BonusMoney4 )
		end
		if x203312_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203312_var_BonusMoney5 )
		end
		if x203312_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203312_var_BonusMoney6 )
		end
		for varI, item in x203312_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203312_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203312_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203312_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203312_var_QuestId) > 0 then
			if x203312_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203312_var_QuestName)
						TalkAppendString(varMap,x203312_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203312_var_FileId, x203312_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203312_var_QuestName)
						TalkAppendString(varMap,x203312_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203312_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203312_var_FileId, x203312_var_QuestId);
			end
  elseif x203312_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203312_var_QuestName)
			TalkAppendString(varMap,x203312_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203312_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203312_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203312_var_QuestHelp )
			end
			x203312_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203312_var_FileId, x203312_var_QuestId);
  end
	
end


function x203312_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x203312_var_QuestIdPre[1])> 0 and IsQuestHaveDone(varMap, varPlayer, x203312_var_QuestIdPre[2])> 0 then
					return 1
		end
		return 0

end

function x203312_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x203312_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
	
end

function x203312_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203312_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203312_var_QuestId  )
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
		if x203312_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203312_var_QuestId, x203312_var_FileId, 1, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203312_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x203312_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203312_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203312_var_QuestId)
	  x203312_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203312_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203312_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203312_var_BonusChoiceItem do
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

function x203312_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203312_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203312_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203312_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203312_var_QuestId) > 0 then
				x203312_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203312_var_QuestId)
				x203312_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203312_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203312_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203312_var_QuestIdNext )	
end

function x203312_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203312_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203312_var_ExpBonus);
  	end
		if x203312_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203312_var_BonusMoney1 )
	  end
		if x203312_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203312_var_BonusMoney2 )
	  end
		if x203312_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203312_var_BonusMoney3 )
		end
		if x203312_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203312_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203312_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203312_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203312_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203312_var_BonusMoney6)
		end
end

function x203312_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203312_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203312_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203312_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203312_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203312_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203312_var_QuestName.."！", 0, 3)
				if x203312_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203312_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203312_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203312_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203312_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203312_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203312_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203312_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203312_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203312_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203312_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203312_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203312_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203312_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203312_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end


function x203312_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
		if IsHaveQuest(varMap,varPlayer, x203312_var_QuestId) > 0 then
			if x203312_var_doing == 0 then
				if x203312_CheckSubmit(varMap, varPlayer) <= 0 then
					
							local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x203312_var_QuestId)
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
							x203312_CheckSubmit( varMap, varPlayer)
								x203312_var_PROTECTINFO.StartTime = GetCurrentTime()
							x203312_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203312, "ProcScneneTimer", 1)
							if x203312_var_PROTECTINFO.ScneneTimerIndex >= 0 then
									x203312_var_doing = 1
									x203312_var_mohemo=CreateMonster(varMap, 1715,60,178,3,1,-1,-1,20,30000,180,"摩诃末")
									x203312_var_zhalanding=CreateMonster(varMap, 1716,56,176,3,1,-1,-1,20,30000,180,"扎兰丁")
									x203312_var_quchulv=CreateMonster(varMap, 1717,64,179,3,1,-1,-1,20,30000,180,"屈出律")
									x203312_var_shibing1=CreateMonster(varMap, 1718,61,181,3,1,-1,-1,20,30000,220,"突厥士兵")
									x203312_var_shibing2=CreateMonster(varMap, 1718,58,180,3,1,-1,-1,20,30000,220,"突厥士兵")
							end
					
				end
			
			end
		end

end

function x203312_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
end

function x203312_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end

function x203312_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203312_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203312_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203312_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203312_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203312_var_QuestId, varState, -1 )
		end
end

function x203312_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203312_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203312_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203312_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203312_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203312_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203312_ProcScneneTimer(varMap)
	if x203312_var_doing==1   then
		if GetCurrentTime() - x203312_var_PROTECTINFO.StartTime >= 3   then
						x203312_var_doing = 2
						if IsObjValid (varMap,x203312_var_zhalanding) == 1 then
								NpcTalk(varMap, x203312_var_zhalanding, "哈哈，又来了一个！", -1)
						end
		end
	elseif x203312_var_doing==2   then
		if GetCurrentTime() - x203312_var_PROTECTINFO.StartTime >= 6   then
						x203312_var_doing = 3
						if IsObjValid (varMap,x203312_var_mohemo) == 1 then
								NpcTalk(varMap, x203312_var_mohemo, "你很幸运！", -1)
						end
		end
	elseif x203312_var_doing==3   then
		if GetCurrentTime() - x203312_var_PROTECTINFO.StartTime >= 10   then
						x203312_var_doing = 4
						if IsObjValid (varMap,x203312_var_zhalanding) == 1 then
								NpcTalk(varMap, x203312_var_zhalanding, "我们需要一个活口去给铁木真带口信，所以你可以不死了！", -1)
						end
		end
	elseif x203312_var_doing==4   then
		if GetCurrentTime() - x203312_var_PROTECTINFO.StartTime >= 15   then
						x203312_var_doing = 5
						if IsObjValid (varMap,x203312_var_quchulv) == 1 then
								NpcTalk(varMap, x203312_var_quchulv, "不行，放了谁也不能放了这个！每次都是这个人出现坏了我的事！", -1)
						end
		end
	elseif x203312_var_doing==5   then
		if GetCurrentTime() - x203312_var_PROTECTINFO.StartTime >= 20   then
						x203312_var_doing = 6
						if IsObjValid (varMap,x203312_var_zhalanding) == 1 then
								NpcTalk(varMap, x203312_var_zhalanding, "放轻松些！在我眼里，他，还有这些尸体，都一样！", -1)
						end
		end
	elseif x203312_var_doing==6   then
		if GetCurrentTime() - x203312_var_PROTECTINFO.StartTime >= 25   then
						x203312_var_doing = 7
						if IsObjValid (varMap,x203312_var_mohemo) == 1 then
								NpcTalk(varMap, x203312_var_mohemo, "我一直在思考，怎样才能成为真正的亚洲之王。现在看来，机会终于来了，回去告诉铁木真，我们在花剌子模等着他，到时候，神会给我明示！", -1)
						end
		end
	elseif x203312_var_doing==7   then
		if GetCurrentTime() - x203312_var_PROTECTINFO.StartTime >= 31   then
						x203312_var_doing = 8
						x203312_CloseTimer(varMap, x203312_var_PROTECTINFO.ScneneTimerIndex)
		end
	end
end





function x203312_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203312_var_doing = 0
	x203312_var_mohemo = -1
	x203312_var_zhalanding = -1
	x203312_var_quchulv = -1
	x203312_var_shibing1 = -1
	x203312_var_shibing2 = -1
	x203312_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end
