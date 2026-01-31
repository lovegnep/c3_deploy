

x561520_var_FileId = 561520
x561520_var_QuestName="皇帝战回魂丹商店"
x561520_var_EXShopList={26}






function x561520_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local curTime = GetMinOfDay()

	if	( CountryGetOfficial(varMap, varPlayer) ~= 8 ) then 
		Msg2Player(varMap,varPlayer,"很抱歉，此商店只有国王才能查看和购买。",8,3)
    	return
	else
		DeliverDynamicShopItem(varMap, varPlayer, varTalknpc, x561520_var_EXShopList[1])
	end
end









function x561520_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x561520_var_FileId, x561520_var_QuestName,10)
	else
		return
	end
	
end









function x561520_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561520_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561520_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561520_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561520_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561520_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561520_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561520_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
