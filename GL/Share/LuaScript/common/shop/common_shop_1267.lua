

x561267_var_FileId = 561267
x561267_var_QuestName="ÓÄÚ¤½á¾§½ð±ÒÉÌµê"
x561267_var_ShopList={1268}






function x561267_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561267_var_ShopList[1] )
end









function x561267_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x561267_var_FileId, x561267_var_QuestName,10)
	else
		return
	end
	
end









function x561267_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561267_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561267_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561267_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561267_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561267_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561267_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561267_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
