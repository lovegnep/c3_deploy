

--DECLARE_QUEST_INFO_START--
x270110_var_FileId = 270110












x270110_var_QuestName1="【庆奥运活动说明】"
x270110_var_QuestInfo1="\n\t伦敦奥运会已经开幕，为了庆祝这四年一开的盛会，也为了继承和发扬奥林匹克精神，成吉思汗将在2012年8月举办庆奥运活动。\n \n\t#W作为成吉思汗的老朋友，您如果在#G庆祝伦敦奥运会活动#W期间每花费#R5#W两现金，即可在我这里领取相应的#G庆奥运大礼#W一份。花费现金数额到达#R100#W的倍数，更有额外份数大礼送出！\n \n\t活动期间不仅有大量金卡送出，还有#R四彩护身符、永不磨损的掌门牌：清一色、五孔钻碎片、神器碎片、生命图谱#W等稀有道具可以获得，消费越多，赠送越多。"  
















--DECLARE_QUEST_INFO_STOP--







function x270110_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x270110_var_QuestName1)
			TalkAppendString(varMap,x270110_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x270110_var_FileId, x270110_var_QuestName1)

end









function x270110_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

				TalkAppendButton(varMap, x270110_var_FileId, x270110_var_QuestName1,13,1)
end









function x270110_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x270110_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x270110_ProcAccept( varMap, varPlayer )
	
end









function x270110_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x270110_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x270110_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x270110_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x270110_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x270110_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x270110_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x270110_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x270110_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x270110_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270110_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270110_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270110_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270110_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270110_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
