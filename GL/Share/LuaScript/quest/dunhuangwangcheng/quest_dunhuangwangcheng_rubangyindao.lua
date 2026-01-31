

--DECLARE_QUEST_INFO_START--
x256232_var_FileId = 256232
x256232_var_QuestIdPre = -1
x256232_var_QuestId = 3126
x256232_var_LevelLess	= 30
x256232_var_QuestIdNext = -1
x256232_var_Name	={}
x256232_var_ExtTarget={{type=20,n=1,target="在@npc_138535的帮助下#G加入一个帮会#W"},}
x256232_var_QuestName="【个人】第一次入帮"
x256232_var_QuestInfo="\t亲爱的朋友，一个人只身行走江湖的艰难恐怕你早有感触，加入一个帮会吧，它会给你家一样的温暖。\n\t滑鼠点击@npc_138535，点击#G加入帮会#W，在新介面上点击#G确定#W，在#G加入帮会#W模块栏中，用滑鼠点击你所选的帮会，最后点击#G申请加入#W等待帮主批准入帮。"  
x256232_var_QuestTarget=""		
x256232_var_QuestCompleted="\t看来你已经找到和你志同道合的兄弟，我在这里恭喜你了。\n\t在帮会中互助是十分重要的，努力增强帮会的实力，也会使你个人收获丰厚。"					
x256232_var_ContinueInfo="别太心急，加入帮会可不是轻易完成的，要等待机会啊！\n\t#G注：加入帮会完成帮会任务你会获得丰厚的奖励。#W"
x256232_var_QuestHelp =	"注：加入帮会完成帮会任务你会获得丰厚的奖励。"
x256232_var_DemandItem ={}
x256232_var_BonusMoney1 =176
x256232_var_BonusMoney2 =0
x256232_var_BonusMoney3 =0
x256232_var_BonusMoney4 =0
x256232_var_BonusMoney5 =21
x256232_var_BonusMoney6 =0
x256232_var_BonusItem	=	{}
x256232_var_BonusChoiceItem ={}
x256232_var_ExpBonus = 21000
x256232_var_NpcGUID ={{ guid = 138535, varName = "杰拜"} }
--DECLARE_QUEST_INFO_STOP--

function x256232_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)  
	if GetLevel(varMap, varPlayer)< x256232_var_LevelLess then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x256232_var_QuestId) > 0 then
		return 
	end

	if IsHaveQuest(varMap,varPlayer, x256232_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256232_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256232_var_QuestId, varState, -1 )
	end

end

function x256232_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256232_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256232_var_ExpBonus )
		end
		if x256232_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256232_var_BonusMoney1 )
		end
		if x256232_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256232_var_BonusMoney2 )
		end
		if x256232_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256232_var_BonusMoney3 )
		end
		if x256232_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256232_var_BonusMoney4 )
		end
		if x256232_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256232_var_BonusMoney5 )
		end
		if x256232_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256232_var_BonusMoney6 )
		end
		for varI, item in x256232_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x256232_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x256232_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256232_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256232_var_QuestId) > 0 then
			if x256232_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256232_var_QuestName)
				TalkAppendString(varMap,x256232_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256232_var_FileId, x256232_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256232_var_QuestName)
				TalkAppendString(varMap,x256232_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x256232_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256232_var_FileId, x256232_var_QuestId);
			end
  elseif x256232_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x256232_var_QuestName)
			TalkAppendString(varMap,x256232_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256232_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256232_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256232_var_QuestHelp )
			end
			x256232_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256232_var_FileId, x256232_var_QuestId);
  end
	
end


function x256232_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x256232_CheckSubmit( varMap, varPlayer, varTalknpc)                                                 
	if GetGuildID( varMap, varPlayer ) ~= -1 then
	   return 1
	else
	  StartTalkTask(varMap)
	  TalkAppendString(varMap,"你需要先加入一个帮会！")
	  StopTalkTask(varMap)
	  DeliverTalkTips(varMap,varPlayer)
	  return 0
	end
	
end


function x256232_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256232_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256232_var_QuestId  )
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
		
		if x256232_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256232_var_QuestId, x256232_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256232_Msg2toplayer( varMap, varPlayer,0)
						if GetGuildID( varMap, varPlayer ) ~= -1 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256232_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
							LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 43,0 )
		  				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 44,0 )
		  				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 45,0 )
						end

						
	    		end
		  		
	 	end                                                                    
	     
end


function x256232_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256232_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256232_var_QuestId)
	  x256232_Msg2toplayer( varMap, varPlayer,1)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 43,0 )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 44,0 )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 45,0 )	
end

function x256232_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256232_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256232_var_BonusChoiceItem do
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

function x256232_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256232_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256232_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256232_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256232_var_QuestId) > 0 then
				x256232_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256232_var_QuestId)
				x256232_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256232_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256232_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x256232_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256232_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256232_var_ExpBonus);
  	end
		if x256232_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256232_var_BonusMoney1 )
	  end
		if x256232_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256232_var_BonusMoney2 )
	  end
		if x256232_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256232_var_BonusMoney3 )
		end
		if x256232_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256232_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256232_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256232_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256232_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256232_var_BonusMoney6)
		end
end

function x256232_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x256232_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x256232_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256232_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256232_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256232_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256232_var_QuestName.."！", 0, 3)
				if x256232_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256232_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256232_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256232_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256232_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256232_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256232_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256232_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256232_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256232_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256232_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256232_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256232_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256232_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256232_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256232_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256232_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256232_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256232_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256232_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256232_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256232_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256232_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256232_var_QuestId, varState, -1 )
				if GetGuildID( varMap, varPlayer ) == -1 then	
					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 43,1 )
	  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 44,1 )
	  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 45,1 )
		end
		end

end

function x256232_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256232_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256232_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256232_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256232_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256232_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
