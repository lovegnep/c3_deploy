

x561264_var_FileId = 561264
x561264_var_QuestName="装备打孔金币商店"
x561264_var_ShopList={1264}






function x561264_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561264_var_ShopList[1] )
end









function x561264_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x561264_var_FileId, x561264_var_QuestName,10)
	else
		return
	end
	
end









function x561264_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561264_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561264_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561264_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561264_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561264_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561264_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561264_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
