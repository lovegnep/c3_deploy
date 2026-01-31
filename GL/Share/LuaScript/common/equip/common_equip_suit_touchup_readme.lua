

--DECLARE_QUEST_INFO_START--
x800141_var_FileId = 800141












x800141_var_QuestName1="【时装刺绣说明】"
x800141_var_QuestInfo1="\t时装刺绣可以将纹样的属性添加到时装上。时装刺绣消耗银币和纹样。\n \n#Y操作说明#W：\n\t1.与王国#G外装大师#W或大都#G外装大师#W对话。\n\t2.选择#G时装刺绣#W选项。\n\t3.将时装放入到时装刺绣介面左上方格子内。\n\t4.将纹样放入到时装刺绣介面下方格子内。\n\t5.点击介面下方刺绣按钮。\n \n#Y纹样获得#W：\n\t时装纹样在#G金币商城#W（快速键J）时尚外装区时装纹样类有售。\n\t带有#R神圣一击#W或#R急速#W等极品属性的时装纹样在消灭#G三番副本#W第三环战车BOSS后有几率掉落。\n \n#Y注意事项#W：\n\t时装原有属性刺绣后会替换成为纹样蕴含的新属性。"  
















--DECLARE_QUEST_INFO_STOP--







function x800141_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800141_var_QuestName1)
			TalkAppendString(varMap,x800141_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800141_var_FileId, x800141_var_QuestName1)

end









function x800141_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800141_var_FileId, x800141_var_QuestName1,13,1)



	
end









function x800141_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800141_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800141_ProcAccept( varMap, varPlayer )
	
end









function x800141_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800141_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800141_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800141_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800141_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800141_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800141_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800141_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800141_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800141_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800141_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800141_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800141_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800141_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800141_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
