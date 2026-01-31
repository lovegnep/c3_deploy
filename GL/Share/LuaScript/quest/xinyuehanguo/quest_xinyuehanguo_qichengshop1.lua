


x211061_var_FileId = 211061
x211061_var_QuestName="∆Ô≥À…ÃµÍ“ª"
x211061_var_ShopList={11}






function x211061_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x211061_var_ShopList[1] )
end









function x211061_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211061_var_FileId, x211061_var_QuestName)
end









function x211061_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211061_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211061_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211061_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211061_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211061_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211061_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211061_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
