

x560932_var_FileId = 560932
x560932_var_QuestName="机枢组件商店"
x560932_var_ShopList={932}






function x560932_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560932_var_ShopList[1] )
end









function x560932_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560932_var_FileId, x560932_var_QuestName,10)
end









function x560932_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560932_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560932_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560932_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560932_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560932_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560932_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560932_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
