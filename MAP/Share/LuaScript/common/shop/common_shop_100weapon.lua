

x560095_var_FileId = 560095
x560095_var_QuestName="换取冥传君主套装"
x560095_var_ShopList={1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311}






function x560095_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560095_var_ShopList[12] )
	
	end
	
	
end









function x560095_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560095_var_FileId, x560095_var_QuestName,10)
end









function x560095_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560095_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560095_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560095_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560095_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560095_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560095_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560095_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
