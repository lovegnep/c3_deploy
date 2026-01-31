

x560847_var_FileId = 560847
x560847_var_QuestName="罗马铸甲术特殊类物品配方店"
x560847_var_ShopList={847}






function x560847_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560847_var_ShopList[1] )
end









function x560847_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560847_var_FileId, x560847_var_QuestName,10)
	else
		return
	end
	
end









function x560847_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560847_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560847_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560847_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560847_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560847_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560847_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560847_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
