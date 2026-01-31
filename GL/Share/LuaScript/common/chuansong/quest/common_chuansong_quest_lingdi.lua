

--DECLARE_QUEST_INFO_START--
x550522_var_FileId = 550522
x550522_var_QuestId = 1512
x550522_var_LevelLess	= 	1 
x550522_var_QuestIdPre= -1
x550522_var_QuestIdNext = -1
x550522_var_QuestHelp =	""
x550522_var_QuestName="启动领地传送"
x550522_var_QuestInfo="#cffcf00您已经开通了#G领地#W#cffcf00传送！#W"  
x550522_var_QuestTarget=""		
x550522_var_QuestCompleted=""					
x550522_var_ContinueInfo=""


x550522_var_BonusMoney1 =0
x550522_var_BonusMoney2 =0
x550522_var_BonusMoney3 =0
x550522_var_BonusItem	=	{}
x550522_var_BonusChoiceItem ={}
x550522_var_ExpBonus = 0
x550522_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550522_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
			return
	
	
end








function x550522_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		
	
	if IsQuestHaveDone(varMap, varPlayer, x550522_var_QuestId) > 0 then
		return 
	else
		Msg2Player(varMap,varPlayer,x550522_var_QuestInfo,8,3)
		QuestCom(varMap,varPlayer,varQuest)
	end
		
end









function x550522_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550522_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550522_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550522_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550522_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550522_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550522_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550522_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550522_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550522_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550522_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550522_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550522_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550522_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550522_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550522_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550522_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550522_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
