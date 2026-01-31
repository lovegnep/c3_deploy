

--DECLARE_QUEST_INFO_START--
x305100_var_FileId = 305100












x305100_var_QuestName1="【背包合成说明】"
x305100_var_QuestInfo1="\n背包合成可以使您获得更大的背包。\n \n#Y背包合成公式#W：\n碎布包（10格）= 完整的碎布包图样*1（杂货商店出售）+ 融合剂\n \n粗布包（15格）= 碎布包*2 + 完整的粗布包图样*1（某系生活技能制造）\n \n以此类推，完整的图样来源各制造系生活技能。"  
x305100_var_QuestInfo2="#Y完整的图样合成#W：\n\t完整的图样通过各系生活技能制造而成，材料为不同数量的残破的背包图样+融合剂。残破的背包图样在使用师恩难谢完成师徒任务——能人异士时，徒弟有几率获得。"  















--DECLARE_QUEST_INFO_STOP--







function x305100_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x305100_var_QuestName1)
			TalkAppendString(varMap,x305100_var_QuestInfo1)
			TalkAppendString(varMap,x305100_var_QuestInfo2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x305100_var_FileId, x305100_var_QuestName1)

end









function x305100_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x305100_var_FileId, x305100_var_QuestName1,13,1)



	
end









function x305100_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x305100_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x305100_ProcAccept( varMap, varPlayer )
	
end









function x305100_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x305100_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x305100_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x305100_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x305100_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x305100_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x305100_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x305100_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x305100_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x305100_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x305100_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x305100_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x305100_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x305100_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x305100_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
