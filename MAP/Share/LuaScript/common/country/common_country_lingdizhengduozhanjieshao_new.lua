

--DECLARE_QUEST_INFO_START--
x300942_var_FileId = 300942












x300942_var_QuestName1="【领地说明】"
x300942_var_QuestInfo1="\t领地是国家实力强弱的体现。\n \n#Y领地相关说明#W：\n\t\#G每周周日晚24：00#W根据最近一次#G帮会世界杯成绩#W分配#G蔡州城#W、#G碎叶城#W、#G巴格达#W、#G基辅公国#W四个领地。\n领地归属：\n\t获得帮会世界杯#G冠军帮会#W所属国家获得蔡州城领地；\n\t获得帮会世界杯#G亚军帮会#W所属国家获得碎叶城领地；\n\t获得帮会世界杯#G季军帮会#W所属国家获得巴格达领地；\n\t获得帮会世界杯#G殿军帮会#W所属国家获得基辅公国领地。\n \n\t#G每周周日晚24：00#W根据最近一次#G玫瑰排行榜#W、#G小喇叭排行榜#W、#G烟花排行榜冠军#W分配#G神圣罗马帝国#W、#G耶路撒冷#W、#G福冈#W三个领地。\n领地归属：\n\t获得#G玫瑰排行榜冠军#W所属国家获得神圣罗马帝国领地；\n\t获得#G小喇叭排行榜冠军#W所属国家获得耶路撒冷领地；\n\t获得#G烟花排行榜冠军#W所属国家获得福冈领地。"  
















--DECLARE_QUEST_INFO_STOP--







function x300942_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x300942_var_QuestName1)
			TalkAppendString(varMap,x300942_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x300942_var_FileId, x300942_var_QuestName1)

end









function x300942_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x300942_var_FileId, x300942_var_QuestName1,13,1)



	
end









function x300942_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x300942_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x300942_ProcAccept( varMap, varPlayer )
	
end









function x300942_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x300942_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x300942_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x300942_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x300942_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x300942_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x300942_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x300942_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x300942_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x300942_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x300942_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300942_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300942_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300942_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300942_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
