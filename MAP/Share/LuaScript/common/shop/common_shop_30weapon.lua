

x560086_var_FileId = 560086
x560086_var_QuestName="换取世传君主套装"
x560086_var_ShopList={60,63,66,69,72,75,1150,1154,1158,1162,1166,1170}






function x560086_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560086_var_ShopList[12] )
	
	end
	if IsHaveQuest(varMap,varPlayer, 3092) > 0 and x256226_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 33,1 )
	end
	
end









function x560086_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560086_var_FileId, x560086_var_QuestName,10)
end









function x560086_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560086_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560086_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560086_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560086_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560086_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560086_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560086_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
