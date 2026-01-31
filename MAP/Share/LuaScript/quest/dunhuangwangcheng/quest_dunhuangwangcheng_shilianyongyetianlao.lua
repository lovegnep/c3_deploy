

--DECLARE_QUEST_INFO_START--
x256251_var_FileId = 256251
x256251_var_QuestIdPre =3056
x256251_var_QuestId = 1303
x256251_var_LevelLess	= 	27 
x256251_var_QuestIdNext = {}
x256251_var_Name	= {}
x256251_var_ExtTarget={{type=20,n=1,target=" @npc_138510"}}
x256251_var_QuestName="【试练】永夜天牢"
x256251_var_QuestInfo="\t怎么？你最近也经常失眠么？是啊，永夜天牢的吵声太大了，不过，这吵闹声并不是最麻烦的，听说很久前被成吉思汗封印在这里的摩诃末和“不死魔君”扎兰丁父子正在挣脱封印，真不敢想像他们逃出天牢后会是多么可怕的屠戮和血腥报复，听说扎兰丁曾发誓要用人头填满曾经幽禁自己的天牢。\n\t特木天正在四处招募勇士，我想你这样的身手正是最合适的人选。"  
x256251_var_QuestTarget=""		
x256251_var_QuestCompleted="\t哎呀，又来了一个勇士，太好了，你看，那边也有一些勇敢的人在等待着一起进入，加入他们吧，记住，人多力量大。"					
x256251_var_ContinueInfo=""
x256251_var_QuestHelp =	""
x256251_var_DemandItem ={}
x256251_var_BonusMoney1 =176
x256251_var_BonusMoney2 =0
x256251_var_BonusMoney3 =0
x256251_var_BonusMoney4 =0
x256251_var_BonusMoney5 =21
x256251_var_BonusMoney6 =0
x256251_var_BonusItem	=	{}
x256251_var_BonusChoiceItem ={}
x256251_var_ExpBonus = 745
x256251_var_NpcGUID ={{ guid = 138510, varName = "特木天"} }
--DECLARE_QUEST_INFO_STOP--



function x256251_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
   local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256251_var_LevelLess  then
		return
	end

	if IsQuestHaveDone(varMap, varPlayer, x256251_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x256251_var_QuestIdPre)> 0 then
						if IsHaveQuest(varMap,varPlayer, x256251_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256251_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256251_var_QuestId, varState, -1 )
						end
	end
end

function x256251_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256251_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256251_var_ExpBonus )
		end
		if x256251_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256251_var_BonusMoney1 )
		end
		if x256251_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256251_var_BonusMoney2 )
		end
		if x256251_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256251_var_BonusMoney3 )
		end
		if x256251_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256251_var_BonusMoney4 )
		end
		if x256251_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256251_var_BonusMoney5 )
		end
		if x256251_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256251_var_BonusMoney6 )
		end
		for varI, item in x256251_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256251_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256251_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256251_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256251_var_QuestId) > 0 then
			if x256251_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256251_var_QuestName)
						TalkAppendString(varMap,x256251_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256251_var_FileId, x256251_var_QuestId);
			else
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 42,0 )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256251_var_QuestName)
						TalkAppendString(varMap,x256251_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256251_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256251_var_FileId, x256251_var_QuestId);
			end
  elseif x256251_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256251_var_QuestName)
			TalkAppendString(varMap,x256251_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256251_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256251_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256251_var_QuestHelp )
			end
			x256251_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256251_var_FileId, x256251_var_QuestId);
  end
	
end


function x256251_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x256251_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x256251_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256251_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256251_var_QuestId  )
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
		
		if x256251_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256251_var_QuestId, x256251_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256251_Msg2toplayer( varMap, varPlayer,0)
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256251_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x256251_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256251_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256251_var_QuestId)
	  x256251_Msg2toplayer( varMap, varPlayer,1)
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 42,0 )
			
end

function x256251_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256251_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256251_var_BonusChoiceItem do
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

function x256251_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256251_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256251_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256251_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256251_var_QuestId) > 0 then
				x256251_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256251_var_QuestId)
				x256251_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256251_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256251_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
  
end

function x256251_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256251_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256251_var_ExpBonus);
  	end
		if x256251_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256251_var_BonusMoney1 )
	  end
		if x256251_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256251_var_BonusMoney2 )
	  end
		if x256251_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256251_var_BonusMoney3 )
		end
		if x256251_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256251_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256251_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256251_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256251_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256251_var_BonusMoney6)
		end
end

function x256251_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256251_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256251_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256251_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256251_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256251_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256251_var_QuestName.."！", 0, 3)
				if x256251_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256251_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256251_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256251_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256251_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256251_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256251_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256251_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256251_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256251_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256251_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256251_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256251_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256251_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256251_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256251_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256251_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256251_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256251_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256251_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256251_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256251_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256251_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256251_var_QuestId, varState, -1 )
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 42,1 )
		end
end

function x256251_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256251_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256251_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256251_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256251_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256251_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
