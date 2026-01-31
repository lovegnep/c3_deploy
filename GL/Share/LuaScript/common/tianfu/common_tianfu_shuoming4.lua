

--DECLARE_QUEST_INFO_START--
x570067_var_FileId = 570067
x570067_var_QuestName1="【元素天赋说明】"
x570067_var_QuestInfo1="\t#W元素天赋简要说明。\n#Y元素天赋的作用#W：\n\t秘密。\n#Y元素天赋如何学习#W：\n\t也是秘密。\n#Y道具如何获得#W：\n\t还是秘密。"  







function x570067_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570067_var_QuestName1)
			TalkAppendString(varMap,x570067_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570067_var_FileId, x570067_var_QuestName1)

end









function x570067_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x570067_var_FileId, x570067_var_QuestName1,13,1)
	
end









function x570067_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		return 1
end








function x570067_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570067_ProcAccept( varMap, varPlayer )
	
end









function x570067_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570067_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570067_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570067_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570067_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570067_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570067_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570067_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570067_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570067_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570067_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570067_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570067_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570067_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570067_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
