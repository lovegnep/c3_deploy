

--DECLARE_QUEST_INFO_START--
x800116_var_FileId = 800116












x800116_var_QuestName1="【橙色装备打造说明】"
x800116_var_QuestInfo1="策划待补充..."  
















--DECLARE_QUEST_INFO_STOP--







function x800116_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800116_var_QuestName1)
			TalkAppendString(varMap,x800116_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800116_var_FileId, x800116_var_QuestName1)

end









function x800116_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800116_var_FileId, x800116_var_QuestName1,13,1)



	
end









function x800116_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		return 1
end








function x800116_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800116_ProcAccept( varMap, varPlayer )
	
end









function x800116_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800116_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800116_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800116_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800116_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800116_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800116_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800116_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800116_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800116_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800116_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800116_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800116_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800116_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800116_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
