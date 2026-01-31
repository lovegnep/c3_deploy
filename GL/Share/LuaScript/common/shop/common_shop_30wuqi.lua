

x560087_var_FileId = 560087
x560087_var_QuestName="三十级声望武器店"
x560087_var_ShopList={40,43,46,49,52,55}






function x560087_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560087_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560087_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560087_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560087_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560087_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560087_var_ShopList[6] )
	
	end
	
	
end









function x560087_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560087_var_FileId, x560087_var_QuestName,10)
end









function x560087_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560087_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560087_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560087_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560087_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560087_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560087_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560087_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
