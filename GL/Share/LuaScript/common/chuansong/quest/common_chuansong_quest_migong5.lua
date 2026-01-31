

--DECLARE_QUEST_INFO_START--
x550296_var_FileId = 550296
x550296_var_QuestId = 1496
x550296_var_LevelLess	= 	1 
x550296_var_QuestIdPre= -1
x550296_var_QuestIdNext = -1
x550296_var_QuestHelp =	""
x550296_var_QuestName="启动王国迷宫五层传送"
x550296_var_QuestInfo="#cffcf00您已经开通了#G王国迷宫五层#W#cffcf00传送！#W"  
x550296_var_QuestTarget=""		
x550296_var_QuestCompleted=""					
x550296_var_ContinueInfo=""


x550296_var_BonusMoney1 =0
x550296_var_BonusMoney2 =0
x550296_var_BonusMoney3 =0
x550296_var_BonusItem	=	{}
x550296_var_BonusChoiceItem ={}
x550296_var_ExpBonus = 0
x550296_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550296_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550296_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550296_var_QuestId) > 0 then
			return 
		else
				Msg2Player(varMap,varPlayer,x550296_var_QuestInfo,8,3)
				QuestCom(varMap,varPlayer,varQuest)
		end
		if x550296_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550296_var_ExpBonus)
		end
	else 
			return
	end		
end









function x550296_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550296_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550296_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550296_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550296_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550296_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550296_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550296_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550296_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550296_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550296_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550296_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550296_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550296_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550296_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550296_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550296_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550296_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
