

--DECLARE_QUEST_INFO_START--
x550593_var_FileId = 550593
x550593_var_QuestId = 1607
x550593_var_LevelLess	= 	1 
x550593_var_QuestIdPre= -1
x550593_var_QuestIdNext = -1
x550593_var_QuestHelp =	""
x550593_var_QuestName="启动锡拉库萨港传送"
x550593_var_QuestInfo="#cffcf00您已经开通了#G锡拉库萨港#W#cffcf00传送！#W"  
x550593_var_QuestTarget=""		
x550593_var_QuestCompleted=""					
x550593_var_ContinueInfo=""


x550593_var_BonusMoney1 =0
x550593_var_BonusMoney2 =0
x550593_var_BonusMoney3 =0
x550593_var_BonusItem	=	{}
x550593_var_BonusChoiceItem ={}
x550593_var_ExpBonus = 0
x550593_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550593_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	
	return
	
	
end








function x550593_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550593_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550593_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550593_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550593_var_ExpBonus)
			end
		end
	else 
			return
	end	
end









function x550593_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550593_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550593_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550593_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550593_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550593_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550593_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550593_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550593_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550593_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550593_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550593_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550593_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550593_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550593_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550593_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550593_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550593_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
