

--DECLARE_QUEST_INFO_START--
x800159_var_FileId = 800159












x800159_var_QuestName1="【装备升级说明】"
x800159_var_QuestInfo1="\t装备升级功能，可以将原有装备的升星状态，灵魂铭刻状态，麻将铭刻状态，打孔状态，紫色属性完美的复制到新装备上。\n#Y操作说明#W：\n\t1.与王国#G装备升级大师#W或大都#G装备升级大师#W对话。\n\t2.选择#G装备升级#W选项。\n\t3.将原有的装备放入装备升级介面左上方格子内。\n\t4.将新装备放入装备升级介面中部格子内。\n\t5.点击介面下方升级按钮。\n#Y注意事项#W：\n\t#R装备升级完成后，会消耗神字级装备。如非确切需要，请不要随意尝试。 #r    #W只能将#G已绑定#W的#G神级装备#W的相关属性复制到#G天级装备#W，且原级装备必须为#G紫色装备#W，所保值的装备部位必须完全一致，保值后的装备会成为绑定装备。"  
















--DECLARE_QUEST_INFO_STOP--







function x800159_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800159_var_QuestName1)
			TalkAppendString(varMap,x800159_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800159_var_FileId, x800159_var_QuestName1)

end









function x800159_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800159_var_FileId, x800159_var_QuestName1,13,1)



	
end









function x800159_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800159_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800159_ProcAccept( varMap, varPlayer )
	
end









function x800159_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800159_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800159_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800159_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800159_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800159_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800159_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800087_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800087_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800087_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800087_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800087_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800087_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800087_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800087_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
