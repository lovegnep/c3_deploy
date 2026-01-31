

x560824_var_FileId = 560824
x560824_var_QuestName="蒙古驯马术辅攻类技能配方店"
x560824_var_ShopList={824}






function x560824_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560824_var_ShopList[1] )
end









function x560824_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560824_var_FileId, x560824_var_QuestName,10)
	else
		return
	end
	
end









function x560824_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560824_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560824_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560824_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560824_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560824_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560824_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560824_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
