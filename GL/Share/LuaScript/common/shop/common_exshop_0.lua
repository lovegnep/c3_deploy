

x561500_var_FileId = 561500
x561500_var_QuestName="神秘商店"
x561500_var_EXShopList={0}






function x561500_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local curTime = GetMinOfDay()

	if GetWeek() ~= 0 and GetWeek() ~= 6 or curTime < 540 or curTime >= 1320 then
		Msg2Player(varMap,varPlayer,"很抱歉，此商店只在周末9点到22点之间开放",8,3)
    	return
	else
		DeliverDynamicShopItem(varMap, varPlayer, varTalknpc, x561500_var_EXShopList[1])
	end
end









function x561500_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 85 then
		TalkAppendButton(varMap, x561500_var_FileId, x561500_var_QuestName,10)
	else
		return
	end
	
end









function x561500_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561500_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561500_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561500_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561500_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561500_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561500_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561500_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
