

x561108_var_FileId = 561108
x561108_var_QuestName="冥甲图谱战场积分商店"
x561108_var_ShopList={1108}






function x561108_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561108_var_ShopList[1] )
end









function x561108_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 70 then
		TalkAppendButton(varMap, x561108_var_FileId, x561108_var_QuestName,10)
	else
		return
	end
	
end









function x561108_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561108_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561108_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561108_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561108_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561108_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561108_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561108_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
