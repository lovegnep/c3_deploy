

--DECLARE_QUEST_INFO_START--
x550497_var_FileId = 550497
x550497_var_QuestId = 1524
x550497_var_LevelLess	= 	1 
x550497_var_QuestIdPre= -1
x550497_var_QuestIdNext = -1
x550497_var_QuestHelp =	""
x550497_var_QuestName="启动大都·南传送"
x550497_var_QuestInfo="#cffcf00您已经开通了#G大都·南#W#cffcf00传送！#W"  
x550497_var_QuestTarget=""		
x550497_var_QuestCompleted=""					
x550497_var_ContinueInfo=""


x550497_var_BonusMoney1 =0
x550497_var_BonusMoney2 =0
x550497_var_BonusMoney3 =0
x550497_var_BonusItem	=	{}
x550497_var_BonusChoiceItem ={}
x550497_var_ExpBonus = 10000
x550497_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550497_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
			return
	
	
end








function x550497_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		
	
	if IsQuestHaveDone(varMap, varPlayer, x550497_var_QuestId) > 0 then
		return 
	else
		QuestCom(varMap,varPlayer,varQuest)
		if x550497_var_ExpBonus > 0 then
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550497_var_QuestInfo,x550497_var_ExpBonus),8,3)
			AddExp(varMap, varPlayer,x550497_var_ExpBonus)
		end
	end
		
end









function x550497_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550497_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550497_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550497_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550497_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550497_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550497_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550497_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550497_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550497_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550497_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550497_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550497_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550497_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550497_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550497_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550497_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550497_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
