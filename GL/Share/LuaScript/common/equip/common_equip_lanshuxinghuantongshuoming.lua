

--DECLARE_QUEST_INFO_START--
x800091_var_FileId = 800091












x800091_var_QuestName1="【装备回炉（洗蓝）说明】"
x800091_var_QuestInfo1="\t在不改变装备强化次数的情况下，对强化的蓝属性值进行重置，使其重新分配装备蓝属性条目中。装备回炉（洗蓝）所需的道具为：蓝光火石（金币商城装备打造区装备强化类出售）。\n\t#R注意：#G命中、闪避、暴击、韧性#R属性每强化三次才能上升1点，#G暴击伤害#R属性每强化三次才能上升2点。\n#Y操作说明#W：\n\t1.与王国#G装备鎏金大师#W或大都#G装备鎏金大师#W对话。\n\t2.选择#G装备回炉（洗蓝）#W选项。\n\t3.将已做过装备鎏金（洗蓝）的装备放入到装备回炉（洗蓝）介面左上方格子内。\n\t4.点击介面下方重新开机按钮。\n#Y注意事项#W：\n\t只有#G装备鎏金（洗蓝）过的装备#W才能使用此模块。"  
















--DECLARE_QUEST_INFO_STOP--







function x800091_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800091_var_QuestName1)
			TalkAppendString(varMap,x800091_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800091_var_FileId, x800091_var_QuestName1)

end









function x800091_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800091_var_FileId, x800091_var_QuestName1,13,1)



	
end









function x800091_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800091_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800091_ProcAccept( varMap, varPlayer )
	
end









function x800091_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800091_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800091_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800091_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800091_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800091_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800091_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800091_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800091_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800091_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800091_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800091_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800091_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800091_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800091_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
