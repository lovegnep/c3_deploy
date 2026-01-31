

--DECLARE_QUEST_INFO_START--
x800080_var_FileId = 800080












x800080_var_QuestName1="【麻将铭刻说明】"
x800080_var_QuestInfo1="\t装备进行麻将铭刻会增加麻将属性，也可更替装备现有的麻将属性。麻将铭刻消耗银币、麻将牌或乱士符。\n#Y操作说明#W：\n\t1.与王国#G装备铭刻大师#W或大都#G装备铭刻大师#W对话。\n\t2.选择#G麻将铭刻#W选项。\n\t3.将装备放入到麻将铭刻介面左上方格子内。\n\t4.将麻将牌或乱士符放入到麻将铭刻介面下方格子内\n\t5.点击介面下方确定按钮。\n#Y注意事项#W：\n\t#G65级以上#W人物才可进行麻将铭刻。"  
















--DECLARE_QUEST_INFO_STOP--







function x800080_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800080_var_QuestName1)
			TalkAppendString(varMap,x800080_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800080_var_FileId, x800080_var_QuestName1)

end









function x800080_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800080_var_FileId, x800080_var_QuestName1,13,1)



	
end









function x800080_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800080_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800080_ProcAccept( varMap, varPlayer )
	
end









function x800080_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800080_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800080_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800080_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800080_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800080_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800080_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800080_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800080_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800080_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800080_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800080_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800080_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800080_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800080_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
