

x560803_var_FileId = 560803
x560803_var_QuestName="中原草药术恢复类药水配方店"
x560803_var_ShopList={803}






function x560803_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560803_var_ShopList[1] )
end









function x560803_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560803_var_FileId, x560803_var_QuestName,10)
	else
		return
	end
	
end









function x560803_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560803_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560803_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560803_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560803_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560803_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560803_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560803_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
