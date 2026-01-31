

x560090_var_FileId = 560090
x560090_var_QuestName="ÁùÊ®¼¶ÉùÍûÎäÆ÷µê"
x560090_var_ShopList={41,44,47,50,53,56}






function x560090_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
	
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560090_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560090_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560090_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560090_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560090_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x560090_var_ShopList[6] )
	
	end
	
	
end









function x560090_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x560090_var_FileId, x560090_var_QuestName,10)
end









function x560090_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560090_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560090_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560090_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560090_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560090_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560090_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560090_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
