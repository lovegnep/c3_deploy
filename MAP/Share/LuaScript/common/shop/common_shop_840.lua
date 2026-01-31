

x560840_var_FileId = 560840
x560840_var_QuestName="罗马铸甲术靴子类防具配方店"
x560840_var_ShopList={840}






function x560840_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560840_var_ShopList[1] )
end









function x560840_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560840_var_FileId, x560840_var_QuestName,10)
	else
		return
	end
	
end









function x560840_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560840_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560840_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560840_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560840_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560840_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560840_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560840_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
