

--DECLARE_QUEST_INFO_START--
x800163_var_FileId = 800163












x800163_var_QuestName1="【护身符去色说明】"
x800163_var_QuestInfo1="\t护身符去色功能可以将护身符的上色属性清除，需要消耗一个符文溶解剂。\n#Y注意事项#W：\n\t使用符文去色功能所有的符文属性会#G全部清除#W，其它属性不受影响。"  
















--DECLARE_QUEST_INFO_STOP--







function x800163_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800163_var_QuestName1)
			TalkAppendString(varMap,x800163_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800163_var_FileId, x800163_var_QuestName1)

end









function x800163_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800163_var_FileId, x800163_var_QuestName1,13,1)



	
end









function x800163_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800163_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800163_ProcAccept( varMap, varPlayer )
	
end









function x800163_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800163_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800163_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800163_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800163_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800163_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800163_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800163_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800163_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800163_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800163_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800163_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800163_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800163_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800163_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
