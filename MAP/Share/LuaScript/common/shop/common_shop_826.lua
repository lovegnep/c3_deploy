

x560826_var_FileId = 560826
x560826_var_QuestName="蒙古驯马术攻击类技能配方店"
x560826_var_ShopList={826}






function x560826_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560826_var_ShopList[1] )
end









function x560826_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560826_var_FileId, x560826_var_QuestName,10)
	else
		return
	end
	
end









function x560826_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560826_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560826_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560826_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560826_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560826_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560826_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560826_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
