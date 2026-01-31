

x560088_var_FileId = 560088
x560088_var_QuestName="ŒÂ Æº∂»Ÿ”˛µÍ"
x560088_var_ShopList={20,23,26,29,32,35}






function x560088_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560088_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560088_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560088_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560088_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560088_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560088_var_ShopList[6] )
	
	end
	
	
end









function x560088_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560088_var_FileId, x560088_var_QuestName,10)
end









function x560088_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560088_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560088_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560088_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560088_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560088_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560088_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560088_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
