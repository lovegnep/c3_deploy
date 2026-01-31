

x560094_var_FileId = 560094
x560094_var_QuestName="100»Ÿ”˛…ÃµÍ"
x560094_var_ShopList={22,25,28,31,34,37}






function x560094_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560094_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560094_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560094_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560094_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560094_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560094_var_ShopList[6] )
	
	end
	
	
end









function x560094_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560094_var_FileId, x560094_var_QuestName,10)
end









function x560094_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560094_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560094_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560094_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560094_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560094_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560094_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560094_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
