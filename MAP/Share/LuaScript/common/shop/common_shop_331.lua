

x560331_var_FileId = 560331
x560331_var_QuestName="灵魂印配方商店"
x560331_var_ShopList={331}






function x560331_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 80 then
--		Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到80级，此商店尚未开放",8,3)
 --   return
--  end

	DispatchShopItem( varMap, varPlayer, varTalknpc, x560331_var_ShopList[1] )
end









function x560331_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x560331_var_FileId, x560331_var_QuestName,10)
end









function x560331_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560331_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560331_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560331_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560331_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560331_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560331_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560331_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
