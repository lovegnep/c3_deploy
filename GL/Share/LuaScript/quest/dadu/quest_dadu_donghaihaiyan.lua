 



x300280_var_FileId = 700004

function x300280_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
 	LuaCallNoclosure( x300280_var_FileId, "ProcEnumEvent", varMap, varPlayer, varTalknpc, -1 )
end


function x300280_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
    LuaCallNoclosure( x300280_var_FileId, "ProcEventEntry", varMap, varPlayer, varTalknpc )
end


function x300280_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
 	return LuaCallNoclosure( x300280_var_FileId, "ProcAccept", varMap, varPlayer, varTalknpc )
end


function x300280_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
	return LuaCallNoclosure( x300280_var_FileId, "ProcQuestObjectKilled", varMap, varPlayer, varObjData, varObj )
end



function x300280_ProcQuestAbandon( varMap, varPlayer, varQuest )
 	LuaCallNoclosure( x300280_var_FileId, "ProcQuestAbandon", varMap, varPlayer )
end

function x300280_ProcQuestAttach( varMap, varPlayer, varTalknpc, varQuestIdx, varQuest )
 	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach", varMap, varPlayer, varTalknpc, varQuestIdx, varQuest )
end




function x300280_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
 	return LuaCallNoclosure( x300280_var_FileId, "ProcQuestSubmit", varMap, varPlayer, varTalknpc )
end


function x300280_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
 	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc,varQuest )
end


function x300280_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
 	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end

function x300280_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
    return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )
end


function x300280_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
    LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end


function x300280_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
    LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
end




function x300280_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
 	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end





function x300280_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end


function x300280_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end


function x300280_ProcGpProcOver( varMap, varPlayer, varTalknpc )
    LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end


function x300280_OpenCheck( varMap, varPlayer, varTalknpc )
    LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end




