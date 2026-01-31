


x211009_var_FileId = 211009
x211009_var_QuestName="一级运镖"







function x211009_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y一级运镖")
		TalkAppendString(varMap, "看到我名字了吗？别看我人小，在道上我可是出了名的，旁边这两个都是我收的小弟。\n只要你愿意拜在我的门下，保你以后在道上混得开。不然，嘿嘿……我的名字可不是叫着玩的！！！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211009_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211009_var_FileId, x211009_var_QuestName)
end









function x211009_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211009_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211009_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211009_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211009_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211009_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211009_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211009_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
