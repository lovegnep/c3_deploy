

--DECLARE_QUEST_INFO_START--
x800073_var_FileId = 800073












x800073_var_QuestName1="【装备打孔说明】"
x800073_var_QuestInfo1="\t装备打孔之后，可以在孔内镶嵌宝石，增加装备的属性。打孔需要消耗银币和打孔钻。\n#Y操作说明#W：\n\t1.与王国#G装备镶嵌大师#W或大都#G装备镶嵌大师#W对话。\n\t2.选择#G装备打孔#W选项，打开装备打孔介面。\n\t3.将所要打孔的装备放入到装备打孔介面左上方格子内。\n\t4.点击介面下方打孔按钮。\n#Y注意事项#W：\n\t#G35级以上#W的玩家才能使用此模块。"  
















--DECLARE_QUEST_INFO_STOP--







function x800073_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800073_var_QuestName1)
			TalkAppendString(varMap,x800073_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800073_var_FileId, x800073_var_QuestName1)

end









function x800073_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800073_var_FileId, x800073_var_QuestName1,13,1)



	
end









function x800073_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800073_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800073_ProcAccept( varMap, varPlayer )
	
end









function x800073_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800073_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800073_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800073_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800073_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800073_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800073_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800073_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800073_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800073_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800073_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800073_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800073_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800073_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800073_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
