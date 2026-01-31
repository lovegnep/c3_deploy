

--DECLARE_QUEST_INFO_START--
x800084_var_FileId = 800084












x800084_var_QuestName1="【装备回炉（洗紫）说明】"
x800084_var_QuestInfo1="\t装备回炉（洗紫）可以将紫色装备的属性随机更换为新的紫色属性。装备回炉（洗紫）消耗银币和紫檀木炭。\n#Y操作说明#W：\n\t1.与王国#G装备鎏金大师#W或大都#G装备鎏金大师#W对话。\n\t2.选择#G装备回炉（洗紫）#W选项。\n\t3.将紫色装备放入到装备回炉（洗紫）介面左上方格子内。\n\t4.点击介面下方洗紫按钮。\n#Y注意事项#W：\n\t装备回炉（洗紫）生成的新紫色属性的种类及数值都是#G随机#W的。"  
















--DECLARE_QUEST_INFO_STOP--







function x800084_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800084_var_QuestName1)
			TalkAppendString(varMap,x800084_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800084_var_FileId, x800084_var_QuestName1)

end









function x800084_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800084_var_FileId, x800084_var_QuestName1,13,1)



	
end









function x800084_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800084_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800084_ProcAccept( varMap, varPlayer )
	
end









function x800084_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800084_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800084_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800084_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800084_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800084_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800084_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800084_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800084_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800084_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800084_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800084_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800084_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800084_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800084_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
