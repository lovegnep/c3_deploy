

x560150_var_FileId = 560150
x560150_var_QuestName="╫П╠рил╣Й"







function x560150_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	LuaCallNoclosure(560888, "ProcDispatchGoldShopItem", varMap, varPlayer, 0,0)

end









function x560150_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560150_var_FileId, x560150_var_QuestName,10)
end









function x560150_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560150_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560150_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560150_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560150_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560150_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560150_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560150_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
