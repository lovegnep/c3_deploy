

--DECLARE_QUEST_INFO_START--
x550516_var_FileId = 550516
x550516_var_QuestId = 1506
x550516_var_LevelLess	= 	1 
x550516_var_QuestIdPre= -1
x550516_var_QuestIdNext = -1
x550516_var_QuestHelp =	""
x550516_var_QuestName="激活威海港传送"
x550516_var_QuestInfo="#cffcf00您开通了此地的传送！"  
x550516_var_QuestTarget=""		
x550516_var_QuestCompleted=""					
x550516_var_ContinueInfo=""


x550516_var_BonusMoney1 =0
x550516_var_BonusMoney2 =0
x550516_var_BonusMoney3 =0
x550516_var_BonusItem	=	{}
x550516_var_BonusChoiceItem ={}
x550516_var_ExpBonus = 0
x550516_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550516_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

	return
end








function x550516_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		
	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550516_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550516_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550516_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550516_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550516_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550516_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550516_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550516_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550516_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550516_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550516_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550516_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550516_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550516_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550516_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550516_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550516_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550516_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550516_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550516_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550516_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550516_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
