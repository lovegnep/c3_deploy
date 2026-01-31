

x560864_var_FileId = 560864
x560864_var_QuestName="地中海工程术配方商店"
x560864_var_ShopList={864}






function x560864_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560864_var_ShopList[1] )
end









function x560864_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 90 then
		TalkAppendButton(varMap, x560864_var_FileId, x560864_var_QuestName,10)
	else
		return
	end
	
end









function x560864_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560864_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560864_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560864_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560864_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560864_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560864_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560864_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
