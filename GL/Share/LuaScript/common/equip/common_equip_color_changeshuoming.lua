

--DECLARE_QUEST_INFO_START--
x800083_var_FileId = 800083












x800083_var_QuestName1="【装备鎏金（洗紫）说明】"
x800083_var_QuestInfo1="\t装备鎏金（洗紫）可以为黄色装备增加紫色属性，并升级为紫色装备。装备鎏金（洗紫）消耗银币和水银。\n#Y操作说明#W：\n\t1.与王国#G装备鎏金大师#W或大都#G装备鎏金大师#W对话。\n\t2.选择#G装备鎏金（洗紫）#W选项。\n\t3.将黄色装备放入到装备鎏金（洗紫）介面左上方格子内。\n\t4.点击介面下方升级按钮。\n#Y注意事项#W：\n\t1.#G60级以上#W的玩家才能使用此模块。\n\t2.#G60级以上#W的装备才能使用此模块。\n\t3.只有#G黄色装备#W才能使用此模块。\n\t4.鎏金（洗紫）之后装备会#G随机#W获得紫色属性。"  
















--DECLARE_QUEST_INFO_STOP--







function x800083_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800083_var_QuestName1)
			TalkAppendString(varMap,x800083_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800083_var_FileId, x800083_var_QuestName1)

end









function x800083_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800083_var_FileId, x800083_var_QuestName1,13,1)



	
end









function x800083_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800083_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800083_ProcAccept( varMap, varPlayer )
	
end









function x800083_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800083_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800083_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800083_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800083_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800083_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800083_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800083_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800083_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800083_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800083_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800083_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800083_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800083_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800083_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
