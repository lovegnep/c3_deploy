

--DECLARE_QUEST_INFO_START--
x550537_var_FileId = 550537
x550537_var_QuestId = 1519
x550537_var_LevelLess	= 	1 
x550537_var_QuestIdPre= -1
x550537_var_QuestIdNext = -1
x550537_var_QuestHelp =	""
x550537_var_QuestName="启动草原居庸关外传送"
x550537_var_QuestInfo="#cffcf00您已经开通了#G草原居庸关外#W#cffcf00传送！#W"  
x550537_var_QuestTarget=""		
x550537_var_QuestCompleted=""					
x550537_var_ContinueInfo=""


x550537_var_BonusMoney1 =0
x550537_var_BonusMoney2 =0
x550537_var_BonusMoney3 =0
x550537_var_BonusItem	=	{}
x550537_var_BonusChoiceItem ={}
x550537_var_ExpBonus = 0
x550537_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550537_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
end








function x550537_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550537_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550537_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550537_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550537_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550537_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550537_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550537_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550537_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550537_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550537_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550537_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550537_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550537_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550537_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550537_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550537_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550537_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550537_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550537_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550537_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550537_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550537_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
