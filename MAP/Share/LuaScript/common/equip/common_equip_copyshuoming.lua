

--DECLARE_QUEST_INFO_START--
x800086_var_FileId = 800086












x800086_var_QuestName1="【装备保值(同级装备)说明】"
x800086_var_QuestInfo1="\t同级装备保值，可以将原有装备的升级状态，灵魂铭刻状态，麻将铭刻状态，打孔状态，紫色属性完美的复制到新装备上。\n#Y操作说明#W：\n\t1.与王国#G装备保值大师#W或大都#G装备保值大师#W对话。\n\t2.选择#G装备保值（同级装备）#W选项。\n\t3.将原有装备放入装备保值介面左上方格子内。\n\t4.将新装备放入装备保值介面中部格子内。\n\t5.点击介面下方保值按钮。\n#Y注意事项#W：\n\t#G已绑定#W的装备才能进行装备保值。"  
















--DECLARE_QUEST_INFO_STOP--







function x800086_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800086_var_QuestName1)
			TalkAppendString(varMap,x800086_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800086_var_FileId, x800086_var_QuestName1)

end









function x800086_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800086_var_FileId, x800086_var_QuestName1,13,1)



	
end









function x800086_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800086_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800086_ProcAccept( varMap, varPlayer )
	
end









function x800086_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800086_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800086_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800086_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800086_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800086_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800086_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800086_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800086_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800086_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800086_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800086_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800086_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800086_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800086_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
