

x561263_var_FileId = 561263
x561263_var_QuestName="合金材料金币商店"
x561263_var_ShopList={1263}






function x561263_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561263_var_ShopList[1] )
end









function x561263_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x561263_var_FileId, x561263_var_QuestName,10)
	else
		return
	end
	
end









function x561263_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561263_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561263_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561263_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561263_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561263_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561263_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561263_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
