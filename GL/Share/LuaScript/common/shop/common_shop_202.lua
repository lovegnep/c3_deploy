

x560202_var_FileId = 560202
x560202_var_QuestName="¹ú´«Áé»êÓ¡µê"
x560202_var_ShopList={202}






function x560202_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560202_var_ShopList[1] )
end









function x560202_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x560202_var_FileId, x560202_var_QuestName,10)
	else
		return
	end
	
end









function x560202_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560202_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560202_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560202_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560202_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560202_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560202_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560202_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
