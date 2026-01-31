

x560022_var_FileId = 560022
x560022_var_QuestName="ÁùÊ®¼¶ÈÙÓþ±¦Ê¯µê"
x560022_var_ShopList={22,25,28,31,34,37,1202,1206,1210,1214,1218,1222}






function x560022_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560022_var_ShopList[12] )
	
	end
	
	
end









function x560022_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x560022_var_FileId, x560022_var_QuestName,10)
	else
		return
	end

end









function x560022_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560022_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560022_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560022_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560022_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560022_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560022_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560022_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
