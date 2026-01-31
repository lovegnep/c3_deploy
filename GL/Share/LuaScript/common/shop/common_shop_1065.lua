

x561065_var_FileId = 561065
x561065_var_QuestName="60级战绩装备商店"
x561065_var_ShopList={1065,1066,1067,1068,1069,1070,1071,1072,1073,1074,1075,1076}






function x561065_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 75 then
--		Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到75级，此商店尚未开放",8,3)
 --   	return
 -- 	end
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561065_var_ShopList[12] )
	
	end
	
	
end









function x561065_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x561065_var_FileId, x561065_var_QuestName,10)
end









function x561065_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561065_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561065_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561065_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561065_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561065_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561065_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561065_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
