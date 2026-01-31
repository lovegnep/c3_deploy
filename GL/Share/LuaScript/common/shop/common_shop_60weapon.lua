

x560089_var_FileId = 560089
x560089_var_QuestName="换取国传君主套装"
x560089_var_ShopList={61,64,67,70,73,76,1151,1155,1159,1163,1167,1171}






function x560089_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560089_var_ShopList[12] )
	
	end
	
	
end









function x560089_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560089_var_FileId, x560089_var_QuestName,10)
end









function x560089_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560089_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560089_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560089_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560089_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560089_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560089_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560089_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
