

--DECLARE_QUEST_INFO_START--
x570064_var_FileId = 570064
x570064_var_QuestName1="【属性天赋说明】"
x570064_var_QuestInfo1="\t#W只有各项属性全面增强，才能变得更加强大！\n#Y属性天赋的作用#W：\n\t通过学习各种属性，提升自身的综合实力，力图在战场上立于不败之地。\n#Y属性天赋如何学习#W：\n\t在大都天赋区#G属性天赋大师#W处，学习和升级技能（仅能学习帮会已经研发的技能）。需要一定的天赋等级和帮贡。\n#Y帮贡如何获得#W：\n\t各种帮会玩法和帮会战中可以获得帮贡。"  







function x570064_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570064_var_QuestName1)
			TalkAppendString(varMap,x570064_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570064_var_FileId, x570064_var_QuestName1)

end









function x570064_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x570064_var_FileId, x570064_var_QuestName1,13,1)
	
end









function x570064_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		return 1
end








function x570064_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570064_ProcAccept( varMap, varPlayer )
	
end









function x570064_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570064_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570064_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570064_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570064_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570064_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570064_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570064_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570064_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570064_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570064_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570064_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570064_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570064_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570064_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
