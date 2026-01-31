

--DECLARE_QUEST_INFO_START--
x550658_var_FileId = 550658
x550658_var_QuestId = 1619
x550658_var_LevelLess	= 	1 
x550658_var_QuestIdPre= -1
x550658_var_QuestIdNext = -1
x550658_var_QuestHelp =	""
x550658_var_QuestName="启动王国南城关隘"
x550658_var_QuestInfo="#cffcf00您开通了#G南城关隘#W#cffcf00传送！#W"  
x550658_var_QuestTarget=""		
x550658_var_QuestCompleted=""					
x550658_var_ContinueInfo=""


x550658_var_BonusMoney1 =0
x550658_var_BonusMoney2 =0
x550658_var_BonusMoney3 =0
x550658_var_BonusItem	=	{}
x550658_var_BonusChoiceItem ={}
x550658_var_ExpBonus = 500
x550658_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550658_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550658_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550658_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550658_var_QuestInfo,x550658_var_ExpBonus),8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550658_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550658_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550658_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550658_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550658_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550658_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550658_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550658_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550658_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550658_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550658_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550658_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550658_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550658_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550658_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550658_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550658_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550658_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550658_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550658_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
