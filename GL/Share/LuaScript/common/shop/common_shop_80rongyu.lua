

x560091_var_FileId = 560091
x560091_var_QuestName="∞À Æº∂»Ÿ”˛…ÃµÍ"
x560091_var_ShopList={21,24,27,30,33,36}






function x560091_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560091_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560091_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560091_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560091_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560091_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560091_var_ShopList[6] )
	
	end
	
	
end









function x560091_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560091_var_FileId, x560091_var_QuestName,10)
end









function x560091_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560091_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560091_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560091_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560091_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560091_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560091_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560091_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
