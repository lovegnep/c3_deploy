

x560800_var_FileId = 560800
x560800_var_QuestName="中原草药术恢复类药水配方店"
x560800_var_ShopList={800}






function x560800_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560800_var_ShopList[1] )
end









function x560800_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560800_var_FileId, x560800_var_QuestName,10)
	else
		return
	end
	
end









function x560800_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560800_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560800_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560800_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560800_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560800_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560800_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560800_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
