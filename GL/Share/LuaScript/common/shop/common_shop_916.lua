

x560916_var_FileId = 560916
x560916_var_QuestName="二级技能书商店"
x560916_var_ShopList={916}






function x560916_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560916_var_ShopList[1] )
end









function x560916_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560916_var_FileId, x560916_var_QuestName,10)

end









function x560916_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560916_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560916_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560916_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560916_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560916_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560916_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560916_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
