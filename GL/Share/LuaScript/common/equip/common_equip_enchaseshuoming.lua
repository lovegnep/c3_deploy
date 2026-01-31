

--DECLARE_QUEST_INFO_START--
x800074_var_FileId = 800074












x800074_var_QuestName1="【宝石镶嵌说明】"
x800074_var_QuestInfo1="\t在装备上镶嵌宝石，可以增加装备的属性。宝石镶嵌消耗银币和镶嵌宝石。\n#Y操作说明#W：\n\t1.与王国#G装备镶嵌大师#W或大都#G装备镶嵌大师#W对话。\n\t2.选择#G宝石镶嵌#W选项，打开宝石镶嵌介面。\n\t3.将装备放入到宝石镶嵌介面左上方格子内。\n\t4.将宝石放入到宝石镶嵌介面下方格子内。\n\t5.点击介面下方镶嵌按钮。\n#Y注意事项#W：\n\t1.#G35级以上#W的玩家才能使用此模块。\n\t2.装备上必须有空余的孔，才能镶嵌宝石。"  
















--DECLARE_QUEST_INFO_STOP--







function x800074_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800074_var_QuestName1)
			TalkAppendString(varMap,x800074_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800074_var_FileId, x800074_var_QuestName1)

end









function x800074_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800074_var_FileId, x800074_var_QuestName1,13,1)



	
end









function x800074_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800074_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800074_ProcAccept( varMap, varPlayer )
	
end









function x800074_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800074_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800074_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800074_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800074_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800074_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800074_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800074_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800074_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800074_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800074_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800074_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800074_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800074_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800074_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
