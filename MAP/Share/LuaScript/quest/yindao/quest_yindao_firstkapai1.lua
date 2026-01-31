

--DECLARE_QUEST_INFO_START--
x203833_var_FileId = 203833
x203833_var_QuestIdPre =3295
x203833_var_QuestId = 3620
x203833_var_LevelLess	= 	10 
x203833_var_QuestIdNext = 6002
x203833_var_Name	={}
x203833_var_ExtTarget={{type=20,n=1,target="找到@npc_123702"}}
x203833_var_QuestName="【个人】初识将星"
x203833_var_QuestInfo="\t传说大元的国都有座浮屠塔，塔内是历代风云人物修炼的圣地。等你到了45级一定要去里面历练一番，说不定会获得意想不到的好东西。\n\t（说着说着他手中拿出2张卡牌。）就说这个将星卡，它可以说是浮屠塔的代表了。千万不要小看这小小的卡牌，它的用处可多了。"  
x203833_var_QuestTarget=""		
x203833_var_QuestCompleted="\t我看咱们这么投缘，我就将这两张将星卡送与你。他们可以在将星介面（快速键：H）里面启动一个组合，使你更加的强大。"			
x203833_var_ContinueInfo=""
x203833_var_QuestHelp =	""
x203833_var_DemandItem ={}
x203833_var_ExpBonus = 6
x203833_var_BonusMoney1 =6
x203833_var_BonusMoney2 =0
x203833_var_BonusMoney3 =0
x203833_var_BonusMoney4 =0
x203833_var_BonusMoney5 =12
x203833_var_BonusMoney6 =0
x203833_var_BonusItem	={{item=45013681,n=1},{item=45013686,n=1}}
x203833_var_BonusChoiceItem ={}
x203833_var_NpcGUID = { }
--DECLARE_QUEST_INFO_STOP--


function x203833_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varLevel = GetLevel( varMap, varPlayer)
 	
	if IsQuestHaveDone(varMap, varPlayer, x203833_var_QuestId) > 0 or IsQuestHaveDone(varMap, varPlayer, x203833_var_QuestIdPre) <= 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203833_var_QuestId) <= 0 then
		if varLevel <10 then
			return 
		end		
	end
	local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203833_var_QuestId)
	TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203833_var_QuestId, varState, -1 )
end

function x203833_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203833_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203833_var_ExpBonus )
		end
		if x203833_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203833_var_BonusMoney1 )
		end
		if x203833_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203833_var_BonusMoney2 )
		end
		if x203833_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203833_var_BonusMoney3 )
		end
		if x203833_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203833_var_BonusMoney4 )
		end
		if x203833_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203833_var_BonusMoney5 )
		end
		if x203833_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203833_var_BonusMoney6 )
		end
		for varI, item in x203833_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203833_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203833_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

	--if IsQuestHaveDone(varMap, varPlayer, x203833_var_QuestId) > 0 then
	--	return 
	--end
	if IsHaveQuest(varMap,varPlayer, x203833_var_QuestId) > 0 then

			if x203833_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203833_var_QuestName)
						TalkAppendString(varMap,x203833_var_QuestCompleted)
						StopTalkTask()
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203833_var_FileId, x203833_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203833_var_QuestName)
						TalkAppendString(varMap,x203833_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203833_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203833_var_FileId, x203833_var_QuestId);
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   end
  elseif x203833_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203833_var_QuestName)
			TalkAppendString(varMap,x203833_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")  
			for varI, item in x203833_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203833_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203833_var_QuestHelp )
			end
			x203833_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203833_var_FileId, x203833_var_QuestId);
 
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
  end
	
end


function x203833_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

					return 1

end

function x203833_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203833_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203833_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203833_var_QuestId  )
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
		
		
		if x203833_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203833_var_QuestId, x203833_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203833_Msg2toplayer( varMap, varPlayer,0)
						if x203833_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203833_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x203833_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203833_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203833_var_QuestId)
		Msg2Player(varMap, varPlayer, "您放弃了任务："..x203833_var_QuestName.."！", 0, 2)
		Msg2Player(varMap, varPlayer, "您放弃了任务："..x203833_var_QuestName.."！", 0, 3)	  
end

function x203833_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203833_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203833_var_BonusChoiceItem do
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

function x203833_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203833_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203833_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203833_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203833_var_QuestId) > 0 then
				x203833_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203833_var_QuestId)
				x203833_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203833_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203833_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap, varPlayer)
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 91,1 )
    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 94,1 )
   end
  LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203833_var_QuestIdNext)	
end

function x203833_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203833_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203833_var_ExpBonus);
  	end
		if x203833_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203833_var_BonusMoney1 )
	  end
		if x203833_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203833_var_BonusMoney2 )
	  end
		if x203833_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203833_var_BonusMoney3 )
		end
		if x203833_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203833_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203833_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203833_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203833_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203833_var_BonusMoney6)
		end
end

function x203833_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203833_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203833_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203833_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203833_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203833_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203833_var_QuestName.."！", 0, 3)
				if x203833_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203833_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203833_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203833_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203833_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203833_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203833_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203833_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203833_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203833_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203833_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203833_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203833_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203833_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203833_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203833_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203833_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203833_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203833_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203833_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x203833_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203833_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203833_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203833_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203833_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203833_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
