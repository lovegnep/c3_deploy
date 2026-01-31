

--DECLARE_QUEST_INFO_START--
x300102_var_FileId = 300102
x300102_var_LevelLess	= 	40

--DECLARE_QUEST_INFO_STOP--


function x300102_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local varLevel = GetLevel(varMap, varPlayer)
	
	if varLevel < 160 then 
		return 
	else
		TalkAppendString(varMap," ")
	end
		
	
	
end

function x300102_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	
end


function x300102_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

	
end


function x300102_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x300102_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x300102_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	                                                 
	     
end


function x300102_ProcQuestAbandon(varMap, varPlayer, varQuest)

end

function x300102_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	
end

function x300102_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x300102_ProcScneneTimer(varMap)

end





function x300102_CloseTimer( varMap, TimerIndex )

end


function x300102_GetBonus( varMap, varPlayer,varTalknpc)

end

function x300102_Msg2toplayer( varMap, varPlayer,type)

end

function x300102_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x300102_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x300102_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x300102_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x300102_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x300102_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x300102_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x300102_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300102_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300102_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300102_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300102_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
