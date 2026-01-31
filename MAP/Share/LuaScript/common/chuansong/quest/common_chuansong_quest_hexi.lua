

--DECLARE_QUEST_INFO_START--
x550521_var_FileId = 550521
x550521_var_QuestId = 1511
x550521_var_LevelLess	= 	1 
x550521_var_QuestIdPre= -1
x550521_var_QuestIdNext = -1
x550521_var_QuestHelp =	""
x550521_var_QuestName="启动领地匈牙利王国传送"
x550521_var_QuestInfo="#cffcf00您已经开通了#G领地匈牙利王国#W#cffcf00传送！#W"  
x550521_var_QuestTarget=""		
x550521_var_QuestCompleted=""					
x550521_var_ContinueInfo=""


x550521_var_BonusMoney1 =0
x550521_var_BonusMoney2 =0
x550521_var_BonusMoney3 =0
x550521_var_BonusItem	=	{}
x550521_var_BonusChoiceItem ={}
x550521_var_ExpBonus = 0
x550521_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550521_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

	return
	

end








function x550521_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550521_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550521_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
		end
	else 
			return
	end		
end









function x550521_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550521_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550521_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550521_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550521_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550521_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550521_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550521_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550521_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550521_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550521_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550521_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550521_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550521_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550521_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550521_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550521_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550521_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
