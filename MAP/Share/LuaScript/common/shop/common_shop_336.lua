

x560336_var_FileId = 560336
x560336_var_QuestName="¥¨∆±…ÃµÍ"
x560336_var_ShopList={351}





function x560336_ProcEventEntry(varMap, varPlayer, varTalknpc)	
--if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
  	-- return 
  --end	 
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560336_var_ShopList[1] )
end









function x560336_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	--if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
  	-- return 
 -- end	 
		TalkAppendButton(varMap, x560336_var_FileId, x560336_var_QuestName,10)
end









function x560336_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560336_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560336_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560336_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560336_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560336_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560336_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560336_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
