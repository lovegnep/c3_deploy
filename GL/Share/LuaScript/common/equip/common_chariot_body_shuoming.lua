

--DECLARE_QUEST_INFO_START--
x800131_var_FileId = 800131












x800131_var_QuestName1="【战车车身制造说明】"
x800131_var_QuestInfo1="\t战车车身制造的流程如下：打开车身制造介面，选择要制造的车身，放入合金材料，点击制造即可制造对应的车身。\n\t制造过程是有风险的，幸运的话能够直接获得车身，制作失败也能获得#G黄金藏宝图碎片#W的奖励。\n\t集齐一定数量的黄金藏宝图碎片能兑换完整的#G黄金藏宝图#W！"  
















--DECLARE_QUEST_INFO_STOP--







function x800131_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800131_var_QuestName1)
			TalkAppendString(varMap,x800131_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800131_var_FileId, x800131_var_QuestName1)

end









function x800131_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800131_var_FileId, x800131_var_QuestName1,13,1)



	
end









function x800131_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800131_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800131_ProcAccept( varMap, varPlayer )
	
end









function x800131_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800131_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800131_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800131_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800131_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800131_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800131_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800131_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800131_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800131_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800131_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800131_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800131_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800131_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800131_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
