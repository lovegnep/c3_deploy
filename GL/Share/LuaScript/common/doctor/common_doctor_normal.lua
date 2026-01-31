


x300411_var_FileId = 300411
x300411_var_QuestName="免费治疗"






function x300411_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "好了，以后再去冒险的时候，记得要时刻注意自己的安危。")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	StartTalkTask(varMap)
		local varText = "你全身恢复了健康"
		TalkAppendString(varMap,varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	
	RestoreHp(varMap, varPlayer,100)
	local ZhiYe= GetZhiye( varMap, varPlayer)
	if ZhiYe~=0 then
		RestoreRage(varMap, varPlayer,100)
	end
end









function x300411_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x300411_var_FileId, x300411_var_QuestName)
end









function x300411_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x300411_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x300411_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x300411_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x300411_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x300411_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x300411_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x300411_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
