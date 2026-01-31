

x561521_var_FileId = 561521
x561521_var_QuestName="皇帝战回魂丹商店"
x561521_var_EXShopList={27}






function x561521_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local curTime = GetMinOfDay()

	if	( CountryGetOfficial(varMap, varPlayer) ~= 8 ) then 
		Msg2Player(varMap,varPlayer,"很抱歉，此商店只有国王才能查看和购买。",8,3)
    	return
	else
		DeliverDynamicShopItem(varMap, varPlayer, varTalknpc, x561521_var_EXShopList[1])
	end
end









function x561521_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x561521_var_FileId, x561521_var_QuestName,10)
	else
		return
	end
	
end









function x561521_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561521_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561521_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561521_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561521_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561521_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561521_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561521_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
