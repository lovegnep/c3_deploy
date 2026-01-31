

--DECLARE_QUEST_INFO_START--
x550520_var_FileId = 550520
x550520_var_QuestId = 1510
x550520_var_LevelLess	= 	1 
x550520_var_QuestIdPre= -1
x550520_var_QuestIdNext = -1
x550520_var_QuestHelp =	""
x550520_var_QuestName="启动领地莫斯科公国传送"
x550520_var_QuestInfo="#cffcf00您已经开通了#G领地莫斯科公国#W#cffcf00传送！#W"  
x550520_var_QuestTarget=""		
x550520_var_QuestCompleted=""					
x550520_var_ContinueInfo=""


x550520_var_BonusMoney1 =0
x550520_var_BonusMoney2 =0
x550520_var_BonusMoney3 =0
x550520_var_BonusItem	=	{}
x550520_var_BonusChoiceItem ={}
x550520_var_ExpBonus = 0
x550520_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550520_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
		return
	
end








function x550520_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
	
		if IsQuestHaveDone(varMap, varPlayer, x550520_var_QuestId) > 0 then
			return 
		else
				Msg2Player(varMap,varPlayer,x550520_var_QuestInfo,8,3)
				QuestCom(varMap,varPlayer,varQuest)
		end
	else 
		return
	end	
end









function x550520_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550520_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550520_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550520_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550520_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550520_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550520_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550520_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550520_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550520_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550520_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550520_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550520_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550520_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550520_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550520_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550520_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550520_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
