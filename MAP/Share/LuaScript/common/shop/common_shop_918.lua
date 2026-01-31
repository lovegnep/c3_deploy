

x560918_var_FileId = 560918
x560918_var_QuestName="四级技能书商店"
x560918_var_ShopList={918}






function x560918_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560918_var_ShopList[1] )
end









function x560918_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560918_var_FileId, x560918_var_QuestName,10)

end









function x560918_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560918_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560918_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560918_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560918_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560918_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560918_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560918_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
