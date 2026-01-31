

--DECLARE_QUEST_INFO_START--
x800075_var_FileId = 800075












x800075_var_QuestName1="【宝石替换说明】"
x800075_var_QuestInfo1="\t宝石替换可以使用新宝石替换装备上已有的宝石。宝石替换消耗银币和可镶嵌的宝石。\n#Y操作说明#W：\n\t1.与王国#G装备镶嵌大师#W或大都#G装备镶嵌大师#W对话。\n\t2.选择#G宝石替换#W选项，打开宝石替换介面。\n\t3.将装备放入到宝石替换介面左上方格子内。\n\t4.将宝石拖入到介面下方要替换掉的宝石所在格子内。\n\t5.点击介面下方替换按钮。\n#Y注意事项#W：\n\t宝石替换后，装备上原先镶嵌的宝石会消失掉。"  
















--DECLARE_QUEST_INFO_STOP--







function x800075_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800075_var_QuestName1)
			TalkAppendString(varMap,x800075_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800075_var_FileId, x800075_var_QuestName1)

end









function x800075_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800075_var_FileId, x800075_var_QuestName1,13,1)



	
end









function x800075_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800075_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800075_ProcAccept( varMap, varPlayer )
	
end









function x800075_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800075_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800075_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800075_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800075_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800075_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800075_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800075_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800075_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800075_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800075_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800075_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800075_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800075_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800075_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
