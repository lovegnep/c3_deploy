

--DECLARE_QUEST_INFO_START--
x800096_var_FileId = 800096












x800096_var_QuestName1="【十星启动说明】"
x800096_var_QuestInfo1="\t装备升到10星之后，可以进行十星启动，增加装备的基础属性，每次操作都会随机启动1-10颗星，再次启动会全部重新随机。1-10星中越靠后的星，启动后提升属性越高，每次启动需要消耗1个明亮的彩钻。\n#Y操作说明#W：\n\t1.与王国#G装备升星大师#W或大都#G装备升星大师#W对话。\n\t2.选择#G十星启动#W选项，打开十星启动介面。\n\t3.将所要启动的装备放入到十星启动介面左上方格子内。\n\t4.点击介面下方启动按钮。\n#Y注意事项#W：\n\t#G90级以上#W的玩家才能使用此模块。"  
















--DECLARE_QUEST_INFO_STOP--







function x800096_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800096_var_QuestName1)
			TalkAppendString(varMap,x800096_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800096_var_FileId, x800096_var_QuestName1)

end









function x800096_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800096_var_FileId, x800096_var_QuestName1,13,1)



	
end









function x800096_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800096_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800096_ProcAccept( varMap, varPlayer )
	
end









function x800096_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800096_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800096_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800096_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800096_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800096_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800096_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800096_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800096_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800096_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800096_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800096_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800096_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800096_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800096_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
