

x560917_var_FileId = 560917
x560917_var_QuestName="三级技能书商店"
x560917_var_ShopList={917}






function x560917_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560917_var_ShopList[1] )
end









function x560917_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560917_var_FileId, x560917_var_QuestName,10)

end









function x560917_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560917_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560917_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560917_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560917_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560917_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560917_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560917_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
