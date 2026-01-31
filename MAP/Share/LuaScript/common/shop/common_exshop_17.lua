

x561517_var_FileId = 561517
x561517_var_QuestName="沙城神秘商店"
x561517_var_EXShopList={23}






function x561517_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local curTime = GetMinOfDay()

	if  curTime < 540 or curTime >= 1320 then
		Msg2Player(varMap,varPlayer,"很抱歉，此商店只在每天的9点到22点之间开放",8,3)
    	return
	else
		DeliverDynamicShopItem(varMap, varPlayer, varTalknpc, x561517_var_EXShopList[1])
	end
end









function x561517_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
			if GetGameOpenById(2003)<=0 then

		return
	end
	if nLevel >= 60 then
		TalkAppendButton(varMap, x561517_var_FileId, x561517_var_QuestName,10)
	else
		return
	end
	
end









function x561517_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561517_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561517_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561517_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561517_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561517_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561517_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561517_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
