

--DECLARE_QUEST_INFO_START--
x570068_var_FileId = 570068
x570068_var_QuestName1="【战魂天赋说明】"
x570068_var_QuestInfo1="\t#W战魂天赋简要说明。\n#Y战魂天赋的作用#W：\n\t秘密。\n#Y战魂天赋如何学习#W：\n\t也是秘密。\n#Y道具如何获得#W：\n\t还是秘密。"  







function x570068_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570068_var_QuestName1)
			TalkAppendString(varMap,x570068_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570068_var_FileId, x570068_var_QuestName1)

end









function x570068_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x570068_var_FileId, x570068_var_QuestName1,13,1)
	
end









function x570068_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		return 1
end








function x570068_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570068_ProcAccept( varMap, varPlayer )
	
end









function x570068_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570068_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570068_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570068_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570068_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570068_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570068_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570068_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570068_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570068_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570068_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570068_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570068_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570068_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570068_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
