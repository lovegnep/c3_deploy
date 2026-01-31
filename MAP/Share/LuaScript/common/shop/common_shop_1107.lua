

x561107_var_FileId = 561107
x561107_var_QuestName="Ú¤¼×Í¼Æ×ÍþÍûÉÌµê"
x561107_var_ShopList={1107}






function x561107_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	DispatchShopItem( varMap, varPlayer, varTalknpc, x561107_var_ShopList[1] )
end









function x561107_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 70 then
		TalkAppendButton(varMap, x561107_var_FileId, x561107_var_QuestName,10)
	else
		return
	end
	
end









function x561107_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x561107_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x561107_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x561107_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x561107_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x561107_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x561107_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x561107_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
