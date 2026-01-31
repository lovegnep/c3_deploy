

x560335_var_FileId = 560335
x560335_var_QuestName="Òø¿¨°üÉÌµê"
x560335_var_ShopList={335}






function x560335_ProcEventEntry(varMap, varPlayer, varTalknpc)	
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
  --	 return 
--  end	 
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560335_var_ShopList[1] )
end









function x560335_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
  --	 return 
 -- end	 
		TalkAppendButton(varMap, x560335_var_FileId, x560335_var_QuestName,10)
end









function x560335_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560335_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560335_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560335_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560335_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560335_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560335_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560335_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
