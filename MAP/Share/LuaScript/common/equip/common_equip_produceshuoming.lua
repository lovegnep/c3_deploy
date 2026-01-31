

--DECLARE_QUEST_INFO_START--
x800085_var_FileId = 800085












x800085_var_QuestName1="【装备锻造说明】"
x800085_var_QuestInfo1="\t通过锻造可以制作出冥级装备。锻造过程消耗冥界声望石和冥之龙眼石。\n#Y操作说明#W：\n\t1.与王国#G装备锻造大师（312，93）#W或大都#G装备锻造大师（278，209）#W对话。\n\t2.选择#G装备锻造#W选项。\n\t3.点击装备锻造介面上方#G选择套装种类下拉条#W，选择套装种类。\n\t4.点击介面上方#G选择套装部件下拉条#W，选择套装部件。\n\t5.点击介面下方锻造按钮。\n#Y注意事项#W：\n\t锻造出来的装备，其属性是#G随机#W的。"  
















--DECLARE_QUEST_INFO_STOP--







function x800085_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800085_var_QuestName1)
			TalkAppendString(varMap,x800085_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800085_var_FileId, x800085_var_QuestName1)

end









function x800085_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800085_var_FileId, x800085_var_QuestName1,13,1)



	
end









function x800085_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800085_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800085_ProcAccept( varMap, varPlayer )
	
end









function x800085_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800085_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800085_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800085_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800085_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800085_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800085_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800085_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800085_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800085_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800085_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800085_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800085_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800085_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800085_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
