

x430605_var_FileId = 430605
x430605_var_QuestName="赛马商店"
x430605_var_EXShopList={30}






function x430605_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	
	local minute = GetMinOfDay()
	if minute <=19*60+36 or  minute >19*60+58  then
		Msg2Player(varMap, varPlayer, "商店正在紧急筹备物资，暂不开放", 0, 3)
		return 
	end
	
	if IsQuestHaveDone(varMap, varPlayer, 10284) > 0 then
		Msg2Player(varMap, varPlayer, "你已经完成赛马，无法再使用赛马商店", 0, 3)
		return 
	end
	if IsHaveQuest(varMap,varPlayer, 10284) <= 0 then
		Msg2Player(varMap, varPlayer, "你没有在赛马，无法使用赛马商店", 0, 3)
		return
	end
	
	DeliverDynamicShopItem(varMap, varPlayer, varTalknpc, x430605_var_EXShopList[1])

end









function x430605_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 40 then
		TalkAppendButton(varMap, x430605_var_FileId, x430605_var_QuestName,10)
	else
		return
	end
	
end









function x430605_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x430605_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x430605_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x430605_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x430605_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x430605_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x430605_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x430605_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
