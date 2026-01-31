

--DECLARE_QUEST_INFO_START--
x270302_var_FileId = 270302












x270302_var_QuestName1="【特殊奖励说明】"
x270302_var_QuestInfo1="\n\t在内政、三番、大都嘉年华以及经验轮回台的玩法当中，只有等级#G小于90级（不包括90级）#W且排名低于排行榜最后一名#G10级（不包括10级）#W的玩家完成任务时才能获得额外的经验奖励。"  
















--DECLARE_QUEST_INFO_STOP--







function x270302_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x270302_var_QuestName1)
			TalkAppendString(varMap,x270302_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x270302_var_FileId, x270302_var_QuestName1)

end









function x270302_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x270302_var_FileId, x270302_var_QuestName1,13,1)



	
end









function x270302_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x270302_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x270302_ProcAccept( varMap, varPlayer )
	
end









function x270302_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x270302_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x270302_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x270302_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x270302_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x270302_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x270302_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x270302_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x270302_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x270302_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270302_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270302_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270302_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270302_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270302_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
