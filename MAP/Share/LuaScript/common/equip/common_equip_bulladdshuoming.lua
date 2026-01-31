

--DECLARE_QUEST_INFO_START--
x800082_var_FileId = 800082












x800082_var_QuestName1="【护身符上色说明】"
x800082_var_QuestInfo1="\t护身符上色可以将符文吸收的蓝色属性添加到护身符上。护身符上色消耗银币和符文。\n#Y操作说明#W：\n\t1.与王国#G外装大师#W或大都#G外装大师#W对话。\n\t2.选择#G护身符上色#W选项。\n\t3.将护身符放入到护身符上色介面左上方格子内。\n\t4.将符文放入到护身符上色介面下方格子内。\n\t5.点击介面下方上色按钮。\n#Y注意事项#W：\n\t一个护身符不能上色两个同种符文。"  
















--DECLARE_QUEST_INFO_STOP--







function x800082_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800082_var_QuestName1)
			TalkAppendString(varMap,x800082_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800082_var_FileId, x800082_var_QuestName1)

end









function x800082_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800082_var_FileId, x800082_var_QuestName1,13,1)



	
end









function x800082_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800082_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800082_ProcAccept( varMap, varPlayer )
	
end









function x800082_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800082_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800082_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800082_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800082_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800082_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800082_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800082_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800082_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800082_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800082_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800082_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800082_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800082_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800082_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
