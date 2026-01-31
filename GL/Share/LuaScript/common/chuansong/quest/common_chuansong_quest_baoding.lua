

--DECLARE_QUEST_INFO_START--
x550535_var_FileId = 550535
x550535_var_QuestId = 1517
x550535_var_LevelLess	= 	1 
x550535_var_QuestIdPre= -1
x550535_var_QuestIdNext = -1
x550535_var_QuestHelp =	""
x550535_var_QuestName="启动草原乃蛮部传送"
x550535_var_QuestInfo="#cffcf00您已经开通了#G草原乃蛮部#W#cffcf00传送！#W"  
x550535_var_QuestTarget=""		
x550535_var_QuestCompleted=""					
x550535_var_ContinueInfo=""


x550535_var_BonusMoney1 =0
x550535_var_BonusMoney2 =0
x550535_var_BonusMoney3 =0
x550535_var_BonusItem	=	{}
x550535_var_BonusChoiceItem ={}
x550535_var_ExpBonus = 0
x550535_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550535_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

	return
	
	
end








function x550535_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550535_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550535_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550535_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550535_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550535_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550535_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550535_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550535_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550535_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550535_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550535_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550535_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550535_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550535_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550535_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550535_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550535_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550535_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550535_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550535_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550535_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550535_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
