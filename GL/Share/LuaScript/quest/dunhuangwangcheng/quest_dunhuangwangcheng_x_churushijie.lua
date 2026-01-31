

--DECLARE_QUEST_INFO_START--
x256009_var_FileId = 256009

x256009_var_QuestId = 3000
x256009_var_LevelLess	= 	1 
x256009_var_QuestIdNext = 3001
x256009_var_Name	={}
x256009_var_ExtTarget={{type=20,n=1,target="找到@npc_138023"}}
x256009_var_QuestName="【新手】使团的偶遇"
x256009_var_QuestInfo="\t欢迎来到成吉思汗的世界，勇士#Y@myname#W。\n\t在你下山历练之前，请去和你身边的郭守谦谈一谈。"  
x256009_var_QuestTarget=""		
x256009_var_QuestCompleted="\t#Y@myname#W你回来的刚好，我正有些重要的事情要告诉你。"					
x256009_var_ContinueInfo=""
x256009_var_QuestHelp =	"您可以用鼠标#R左键#G点击郭守谦，和他对话。您可以点击键盘上的#RQ#G键，打开任务列表，选中你要完成的任务，点击#R任务目标#G中的蓝色字体来进行自动寻路。"
x256009_var_DemandItem ={}
x256009_var_BonusMoney1 =6
x256009_var_BonusMoney2 =0
x256009_var_BonusMoney3 =0
x256009_var_BonusMoney4 =0
x256009_var_BonusMoney5 =12
x256009_var_BonusMoney6 =0
x256009_var_BonusItem	=	{}
x256009_var_BonusChoiceItem ={}
x256009_var_ExpBonus = 5
x256009_var_NpcGUID = {}
--DECLARE_QUEST_INFO_STOP--


function x256009_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
	if IsQuestHaveDone(varMap, varPlayer, x256009_var_QuestId) > 0 then
		return 
	end
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256009_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256009_var_QuestId, varState, -1 )
	  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 ) 
end

function x256009_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256009_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256009_var_ExpBonus )
		end
		if x256009_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256009_var_BonusMoney1 )
		end
		if x256009_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256009_var_BonusMoney2 )
		end
		if x256009_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256009_var_BonusMoney3 )
		end
		if x256009_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256009_var_BonusMoney4 )
		end
		if x256009_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256009_var_BonusMoney5 )
		end
		if x256009_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256009_var_BonusMoney6 )
		end
		for varI, item in x256009_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x256009_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x256009_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256009_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256009_var_QuestId) > 0 then
			if x256009_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256009_var_QuestName)
						TalkAppendString(varMap,x256009_var_QuestCompleted)
						StopTalkTask()
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256009_var_FileId, x256009_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256009_var_QuestName)
						TalkAppendString(varMap,x256009_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256009_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 ) 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1 ) 
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256009_var_FileId, x256009_var_QuestId);
			end
  elseif x256009_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256009_var_QuestName)
			TalkAppendString(varMap,x256009_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")  
			for varI, item in x256009_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256009_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256009_var_QuestHelp )
			end
			x256009_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256009_var_FileId, x256009_var_QuestId);
  end
	
end


function x256009_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

					return 1

end

function x256009_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x256009_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256009_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256009_var_QuestId  )
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
		
		
		if x256009_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256009_var_QuestId, x256009_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256009_Msg2toplayer( varMap, varPlayer,0)
						if x256009_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256009_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x256009_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256009_var_QuestId) > 0 then
				return 
		end
	  	StartTalkTask(varMap)
		  TalkAppendString(varMap,"您无法放弃此任务！") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			
end

function x256009_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256009_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256009_var_BonusChoiceItem do
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

function x256009_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256009_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256009_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256009_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256009_var_QuestId) > 0 then
				x256009_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256009_var_QuestId)
				x256009_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256009_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x256009_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
   end
   LuaCallNoclosure(203419, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256009_var_QuestIdNext )	
end

function x256009_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256009_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256009_var_ExpBonus);
  	end
		if x256009_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256009_var_BonusMoney1 )
	  end
		if x256009_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256009_var_BonusMoney2 )
	  end
		if x256009_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256009_var_BonusMoney3 )
		end
		if x256009_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256009_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256009_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256009_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256009_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256009_var_BonusMoney6)
		end
end

function x256009_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x256009_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x256009_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256009_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x256009_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256009_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256009_var_QuestName.."！", 0, 3)
				if x256009_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256009_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256009_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256009_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256009_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256009_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256009_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256009_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256009_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256009_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256009_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256009_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256009_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256009_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256009_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256009_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256009_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256009_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256009_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256009_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x256009_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256009_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256009_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256009_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256009_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256009_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
