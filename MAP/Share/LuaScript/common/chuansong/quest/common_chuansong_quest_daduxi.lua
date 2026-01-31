

--DECLARE_QUEST_INFO_START--
x550499_var_FileId = 550499
x550499_var_QuestId = 1523
x550499_var_LevelLess	= 	1 
x550499_var_QuestIdPre= -1
x550499_var_QuestIdNext = -1
x550499_var_QuestHelp =	""
x550499_var_QuestName="启动大都·西传送"
x550499_var_QuestInfo="#cffcf00您已经开通了#G大都·西#W#cffcf00传送！#W"  
x550499_var_QuestTarget=""		
x550499_var_QuestCompleted=""					
x550499_var_ContinueInfo=""


x550499_var_BonusMoney1 =0
x550499_var_BonusMoney2 =0
x550499_var_BonusMoney3 =0
x550499_var_BonusItem	=	{}
x550499_var_BonusChoiceItem ={}
x550499_var_ExpBonus = 10000
x550499_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550499_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
			return
	
	
end








function x550499_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		
	
	if IsQuestHaveDone(varMap, varPlayer, x550499_var_QuestId) > 0 then
		return 
	else
		Msg2Player(varMap,varPlayer,x550499_var_QuestInfo,8,3)
		QuestCom(varMap,varPlayer,varQuest)
		if x550499_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer,x550499_var_ExpBonus)
		end
	end
		
end









function x550499_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550499_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550499_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550499_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550499_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550499_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550499_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550499_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550499_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550499_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550499_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550499_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550499_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550499_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550499_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550499_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550499_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550499_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
