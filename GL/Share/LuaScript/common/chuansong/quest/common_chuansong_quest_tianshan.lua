

--DECLARE_QUEST_INFO_START--
x550518_var_FileId = 550518
x550518_var_QuestId = 1508
x550518_var_LevelLess	= 	1 
x550518_var_QuestIdPre= -1
x550518_var_QuestIdNext = -1
x550518_var_QuestHelp =	""
x550518_var_QuestName="启动领地阿尔金山传送"
x550518_var_QuestInfo="#cffcf00您已经开通了#G领地阿尔金山#W#cffcf00传送！#W"  
x550518_var_QuestTarget=""		
x550518_var_QuestCompleted=""					
x550518_var_ContinueInfo=""


x550518_var_BonusMoney1 =0
x550518_var_BonusMoney2 =0
x550518_var_BonusMoney3 =0
x550518_var_BonusItem	=	{}
x550518_var_BonusChoiceItem ={}
x550518_var_ExpBonus = 0
x550518_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550518_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

		return
	
	
end








function x550518_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550518_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550518_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
		end
	else 
			return
	end		
end









function x550518_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550518_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550518_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550518_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550518_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550518_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550518_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550518_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550518_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550518_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550518_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550518_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550518_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550518_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550518_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550518_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550518_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550518_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
