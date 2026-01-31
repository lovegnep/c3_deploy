

--DECLARE_QUEST_INFO_START--
x550664_var_FileId = 550664
x550664_var_QuestId = 1549
x550664_var_LevelLess	= 	1 
x550664_var_QuestIdPre= -1
x550664_var_QuestIdNext = -1
x550664_var_QuestHelp =	""
x550664_var_QuestName="启动大都崇天门传送"
x550664_var_QuestInfo="#cffcf00您开通了#G崇天门#cffcf00传送！"  
x550664_var_QuestTarget=""		
x550664_var_QuestCompleted=""					
x550664_var_ContinueInfo=""


x550664_var_BonusMoney1 =0
x550664_var_BonusMoney2 =0
x550664_var_BonusMoney3 =0
x550664_var_BonusItem	=	{}
x550664_var_BonusChoiceItem ={}
x550664_var_ExpBonus = 10000
x550664_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550664_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550664_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550664_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550664_var_QuestInfo,x550664_var_ExpBonus),8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550664_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550664_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550664_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550664_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550664_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550664_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550664_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550664_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550664_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550664_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550664_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550664_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550664_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550664_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550664_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550664_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550664_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550664_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550664_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550664_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
