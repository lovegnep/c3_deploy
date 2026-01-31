

x560093_var_FileId = 560093
x560093_var_QuestName="æ≈ Æº∂…˘Õ˚Œ‰∆˜µÍ"
x560093_var_ShopList={42,45,48,51,54,57}






function x560093_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560093_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560093_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560093_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560093_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560093_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560093_var_ShopList[6] )
	
	end
	
	
end









function x560093_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560093_var_FileId, x560093_var_QuestName,10)
end









function x560093_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560093_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560093_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560093_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560093_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560093_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560093_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560093_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
