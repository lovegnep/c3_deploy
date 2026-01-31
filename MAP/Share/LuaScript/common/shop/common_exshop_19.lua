

x561519_var_FileId = 561519
x561519_var_QuestName="皇帝战回魂丹商店"
x561519_var_EXShopList={25}






function x561519_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local curTime = GetMinOfDay()

	if	( CountryGetOfficial(varMap, varPlayer) ~= 8 ) then 
		Msg2Player(varMap,varPlayer,"很抱歉，此商店只有国王才能查看和购买。",8,3)
    	return
	else
		DeliverDynamicShopItem(varMap, varPlayer, varTalknpc, x561519_var_EXShopList[1])
	end
end









function x561519_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x561519_var_FileId, x561519_var_QuestName,10)
	else
		return
	end
	
end









function x561519_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561519_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561519_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561519_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561519_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561519_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561519_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561519_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
