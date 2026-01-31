

--DECLARE_QUEST_INFO_START--
x800081_var_FileId = 800081












x800081_var_QuestName1="【制造符文说明】"
x800081_var_QuestInfo1="\t制造符文可将蓝色装备上的某项蓝色属性附加在符文布或优质符文布上，成为对应装备部件的符文。制造符文消耗蓝色装备、符文布或优质符文布。\n#Y操作说明#W：\n\t1.与王国#G外装大师#W或大都#G外装大师#W对话。\n\t2.选择#G制造符文#W选项。\n\t3.将符文布或优质符文布放入到制造符文介面左上方格子内。\n\t4.将蓝色装备放入到制造符文介面符文布格子下方格子内。\n\t5.点击介面下方制造按钮。\n#Y注意事项#W：\n\t1.符文布、优质符文布会#G随机#W吸收蓝色装备上的一项蓝色属性。\n\t2.#G符文布#W吸取装备蓝色属性#G有几率失败#W。\n\t3.#G优质符文布#W吸取装备蓝色属性#G不会失败#W。\n\t4.制造符文无论达成与否，#G蓝色装备都会消失#W。"  
















--DECLARE_QUEST_INFO_STOP--







function x800081_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800081_var_QuestName1)
			TalkAppendString(varMap,x800081_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800081_var_FileId, x800081_var_QuestName1)

end









function x800081_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800081_var_FileId, x800081_var_QuestName1,13,1)



	
end









function x800081_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800081_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800081_ProcAccept( varMap, varPlayer )
	
end









function x800081_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800081_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800081_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800081_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800081_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800081_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800081_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800081_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800081_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800081_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800081_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800081_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800081_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800081_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800081_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
