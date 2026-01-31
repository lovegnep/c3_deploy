

x560400_var_FileId = 560400
x560400_var_QuestName="Ò©Æ·µê"
x560400_var_ShopList={101}






function x560400_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560400_var_ShopList[1] )
end









function x560400_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local camp = GetCurCamp(varMap,varPlayer)
	
	if camp == 5 then
		TalkAppendButton(varMap, x560400_var_FileId, x560400_var_QuestName,10)
	else 	
		return
	end


end









function x560400_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560400_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560400_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560400_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560400_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560400_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560400_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560400_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
