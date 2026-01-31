

x560021_var_FileId = 560021
x560021_var_QuestName="五十级荣誉宝石店"
x560021_var_ShopList={21,24,27,30,33,36,1201,1205,1209,1213,1217,1221}






function x560021_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560021_var_ShopList[12] )
	
	end
	
	
end









function x560021_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel >= 50 then
		TalkAppendButton(varMap, x560021_var_FileId, x560021_var_QuestName,10)
	else
		return
	end

end









function x560021_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560021_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560021_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560021_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560021_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560021_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560021_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560021_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
