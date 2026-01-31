



x211011_var_FileId = 211011
x211011_var_QuestName="三级运镖"







function x211011_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y三级运镖")
		TalkAppendString(varMap, "来到我们的地盘，就得听我们兄弟俩的。只要你对我们服服帖帖的，懂得道上的潜规则，你在这道上就能有出人头地的一天。不听话，嘿嘿……嘿嘿……我的刀呢！难道被运镖的顺手牵羊了？我刚找大哥借的啊，这下惨了……")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end









function x211011_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211011_var_FileId, x211011_var_QuestName)
end









function x211011_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211011_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211011_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211011_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211011_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211011_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211011_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211011_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
