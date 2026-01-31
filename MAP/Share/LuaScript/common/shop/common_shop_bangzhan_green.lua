

x560401_var_FileId = 560401
x560401_var_QuestName="Ò©Æ·µê"
x560401_var_ShopList={101}






function x560401_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560401_var_ShopList[1] )
end









function x560401_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local camp = GetCurCamp(varMap,varPlayer)
	

	if camp == 6 then
        
		TalkAppendButton(varMap, x560401_var_FileId, x560401_var_QuestName,10)
	else 	
		return
	end

end









function x560401_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560401_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560401_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560401_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560401_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560401_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560401_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560401_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
