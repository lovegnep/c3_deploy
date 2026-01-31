


x800048_var_FileId = 800048
x800048_var_QuestName="骑乘恢复"
x800048_var_QuestInfo="恢复所有骑乘的生命值，\n需要花费银卡"
x800048_var_QuestSuccess="所有骑乘的生命值都恢复了！"
x800048_var_NotNeed="没有骑乘需要恢复生命值。"







function x800048_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local money = GetAllHorseHappyMoney(varMap, varPlayer)
	
	
	local bNeed = 1;
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y"..x800048_var_QuestName.."\n")
		if(money == 0) then
			TalkAppendString(varMap, x800048_var_NotNeed)
			bNeed = 0
		else
			local varStr = format("%s#{_MONEY%d}", x800048_var_QuestInfo, money);
			TalkAppendString(varMap, varStr)
		end
	StopTalkTask(varMap)
	if(bNeed > 0) then
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800048_var_FileId,-1)
	else
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800048_var_FileId,-1,1)
	end

end









function x800048_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x800048_var_FileId, x800048_var_QuestName , 3 )
end









function x800048_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end







function x800048_ProcAccept(varMap, varPlayer)
	if( 0 < AllHorseHappy(varMap, varPlayer)) then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x800048_var_QuestSuccess)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
	end
end









function x800048_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800048_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x800048_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800048_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800048_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x800048_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
