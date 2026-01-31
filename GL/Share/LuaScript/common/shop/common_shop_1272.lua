

x561272_var_FileId = 561272
x561272_var_QuestName="Ï¡ÊÀÆæÕäÉÌµê"
x561272_var_ShopList={345}






function x561272_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561272_var_ShopList[1] )
end









function x561272_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 1 then
		TalkAppendButton(varMap, x561272_var_FileId, x561272_var_QuestName,10)
	else
		return
	end
	
end









function x561272_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561272_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561272_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561272_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561272_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561272_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561272_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561272_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
