

x561053_var_FileId = 561053
x561053_var_QuestName="40级战绩装备商店"
x561053_var_ShopList={1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064}






function x561053_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local	zhiye = GetZhiye(varMap, varPlayer)
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 60 then
--		Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到60级，此商店尚未开放",8,3)
 --  		return
  --	end
	if zhiye == 0 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[1] )
		
		elseif zhiye == 1 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[2] )
		
		elseif zhiye == 2 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[3] )
		
		elseif zhiye == 3 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[4] )
		
		elseif zhiye == 4 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[5] )
		
		elseif zhiye == 5 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[6] )
		
		elseif zhiye == 6 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[7] )
		
		elseif zhiye == 7 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[8] )
		
		elseif zhiye == 8 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[9] )
		
		elseif zhiye == 9 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[10] )
		
		elseif zhiye == 10 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[11] )
		
		elseif zhiye == 11 then
		DispatchShopItem( varMap, varPlayer, varTalknpc, x561053_var_ShopList[12] )
	
	end
	
	
end









function x561053_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x561053_var_FileId, x561053_var_QuestName,10)
end









function x561053_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561053_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561053_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561053_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561053_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561053_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561053_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561053_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
