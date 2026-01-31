

--DECLARE_QUEST_INFO_START--
x550661_var_FileId = 550661
x550661_var_QuestId = 3922
x550661_var_LevelLess	= 	1 
x550661_var_QuestIdPre= -1
x550661_var_QuestIdNext = -1
x550661_var_QuestHelp =	""
x550661_var_QuestName="启动泰山传送"
x550661_var_QuestInfo="#cffcf00您开通了#G泰山#W#cffcf00传送！#W"  
x550661_var_QuestTarget=""		
x550661_var_QuestCompleted=""					
x550661_var_ContinueInfo=""


x550661_var_BonusMoney1 =0
x550661_var_BonusMoney2 =0
x550661_var_BonusMoney3 =0
x550661_var_BonusItem	=	{}
x550661_var_BonusChoiceItem ={}
x550661_var_ExpBonus = 10000
x550661_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550661_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550661_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550661_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550661_var_QuestInfo,x550661_var_ExpBonus),8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550661_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550661_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550661_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550661_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550661_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550661_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550661_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550661_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550661_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550661_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550661_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550661_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550661_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550661_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550661_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550661_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550661_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550661_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550661_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550661_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
