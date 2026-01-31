

--DECLARE_QUEST_INFO_START--
x550498_var_FileId = 550498
x550498_var_QuestId = 1522
x550498_var_LevelLess	= 	1 
x550498_var_QuestIdPre= -1
x550498_var_QuestIdNext = -1
x550498_var_QuestHelp =	""
x550498_var_QuestName="激活大都传送"
x550498_var_QuestInfo="#cffcf00您已经开通了#G大都#W#cffcf00传送！#W"  
x550498_var_QuestTarget=""		
x550498_var_QuestCompleted=""					
x550498_var_ContinueInfo=""


x550498_var_BonusMoney1 =0
x550498_var_BonusMoney2 =0
x550498_var_BonusMoney3 =0
x550498_var_BonusItem	=	{}
x550498_var_BonusChoiceItem ={}
x550498_var_ExpBonus = 50000
x550498_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550498_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
			return
	
	
end








function x550498_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		
	
	if IsQuestHaveDone(varMap, varPlayer, x550498_var_QuestId) > 0 then
		return 
	else
		QuestCom(varMap,varPlayer,varQuest)
		if x550498_var_ExpBonus > 0 then
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550498_var_QuestInfo,x550498_var_ExpBonus),8,3)
			AddExp(varMap, varPlayer,x550498_var_ExpBonus)
		end
	end
		
end









function x550498_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550498_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550498_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550498_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550498_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550498_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550498_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550498_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550498_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550498_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550498_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550498_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550498_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550498_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550498_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550498_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550498_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550498_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
