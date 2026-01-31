

x560337_var_FileId = 560337
x560337_var_QuestName="±¦Ê¯Å×¹âµñ×ÁÉÌµê"
x560337_var_ShopList={337}






function x560337_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560337_var_ShopList[1] )
end









function x560337_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	
	local nLevel = GetLevel(varMap,varPlayer)
			if GetGameOpenById(2005)<=0 then
		return
	end
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560337_var_FileId, x560337_var_QuestName,10)
	else
		return
	end
	
end









function x560337_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560337_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560337_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560337_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560337_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560337_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560337_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560337_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
