

--DECLARE_QUEST_INFO_START--
x550654_var_FileId = 550654
x550654_var_QuestId = 1615
x550654_var_LevelLess	= 	1 
x550654_var_QuestIdPre= -1
x550654_var_QuestIdNext = -1
x550654_var_QuestHelp =	""
x550654_var_QuestName="启动王国西传送"
x550654_var_QuestInfo="#cffcf00您开通了#G灵宝村#W#cffcf00传送！#W"  
x550654_var_QuestTarget=""		
x550654_var_QuestCompleted=""					
x550654_var_ContinueInfo=""


x550654_var_BonusMoney1 =0
x550654_var_BonusMoney2 =0
x550654_var_BonusMoney3 =0
x550654_var_BonusItem	=	{}
x550654_var_BonusChoiceItem ={}
x550654_var_ExpBonus = 500
x550654_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550654_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550654_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550654_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550654_var_QuestInfo,x550654_var_ExpBonus),8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550654_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550654_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550654_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550654_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550654_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550654_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550654_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550654_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550654_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550654_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550654_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550654_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550654_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550654_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550654_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550654_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550654_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550654_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550654_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550654_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
