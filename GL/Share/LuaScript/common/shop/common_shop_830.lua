

x560830_var_FileId = 560830
x560830_var_QuestName="Í»ØÊ¶ÍÔìÊõÖ÷ÎäÆ÷Åä·½µê"
x560830_var_ShopList={830}






function x560830_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560830_var_ShopList[1] )
end









function x560830_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560830_var_FileId, x560830_var_QuestName,10)
	else
		return
	end
	
end









function x560830_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560830_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560830_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560830_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560830_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560830_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560830_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560830_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
