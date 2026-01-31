

x561052_var_FileId = 561052
x561052_var_QuestName="战绩道具商店"
x561052_var_ShopList={1052,1052,1052,1052,1052,1052,1052,1052,1052,1052,1052,1052}






function x561052_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561052_var_ShopList[12] )
	
	end
	
	
end









function x561052_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x561052_var_FileId, x561052_var_QuestName,10)
end









function x561052_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561052_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561052_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561052_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561052_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561052_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561052_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561052_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
