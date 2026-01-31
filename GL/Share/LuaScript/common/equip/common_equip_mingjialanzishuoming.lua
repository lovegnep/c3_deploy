

--DECLARE_QUEST_INFO_START--
x800127_var_FileId = 800127












x800127_var_QuestName1="【冥级橙装说明】"
x800127_var_QuestInfo1="\t冥级橙装的特点如下：\n\t1.无需进行装备鎏金（洗紫）操作，可以直接进行装备回炉（洗紫）。\n\t2.无法进行装备鎏金（洗蓝）操作，也无法进行装备回炉（洗蓝）操作。\n\t3.可以和原有装备之间进行装备保值操作。"  
















--DECLARE_QUEST_INFO_STOP--







function x800127_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800127_var_QuestName1)
			TalkAppendString(varMap,x800127_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800127_var_FileId, x800127_var_QuestName1)

end









function x800127_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800127_var_FileId, x800127_var_QuestName1,13,1)



	
end









function x800127_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800127_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800127_ProcAccept( varMap, varPlayer )
	
end









function x800127_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800127_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800127_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800127_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800127_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800127_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800127_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800127_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800127_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800127_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800127_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800127_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800127_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800127_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800127_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
