

x560915_var_FileId = 560915
x560915_var_QuestName="“Ï ﬁ…ÃµÍ"
x560915_var_ShopList={915}






function x560915_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560915_var_ShopList[1] )
end









function x560915_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560915_var_FileId, x560915_var_QuestName,10)

end









function x560915_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560915_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560915_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560915_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560915_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560915_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560915_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560915_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
