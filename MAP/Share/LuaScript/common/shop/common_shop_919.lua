

x560919_var_FileId = 560919
x560919_var_QuestName="战场积分商店"
x560919_var_ShopList={919,920,921,922,923,924,925,926,927,928,929,930}






function x560919_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560919_var_ShopList[12] )
	
	end
	
	
end









function x560919_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560919_var_FileId, x560919_var_QuestName,10)
end









function x560919_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560919_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560919_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560919_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560919_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560919_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560919_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560919_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
