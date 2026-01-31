

--DECLARE_QUEST_INFO_START--
x570066_var_FileId = 570066
x570066_var_QuestName1="【专精天赋说明】"
x570066_var_QuestInfo1="\t#W专精天赋分为专攻和专防两类。\n\t#Y专攻的作用#W：提高自己对其他玩家的伤害，对某个职业的专攻等级越高，自己对此职业的伤害提升越大。以武士专攻为例，每击败一名可以获得荣誉的异国玩家，武士职业分配的练功点数越多，获得的专攻点数越多。当专攻点数累积到一定数量，专攻等级就会得到提升，对相应职业的伤害提升。\n\t#R特别说明：练功点数仅对每天的前10个荣誉击杀有效，即本日如果已经击败过10个可以获得荣誉的玩家，再分配练功点数，将不再能够获得职业专攻点数，练功点数分配效果将于次日生效。\n\t#Y专防的作用#W：减少其他玩家对自己的伤害，对某个职业的专防等级越高，此职业对自己的伤害越低。提升专防等级需要累积专防训练点数，专防训练点数需要完成【个人】防御之路任务获得。"  







function x570066_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570066_var_QuestName1)
			TalkAppendString(varMap,x570066_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570066_var_FileId, x570066_var_QuestName1)

end









function x570066_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x570066_var_FileId, x570066_var_QuestName1,13,1)
	
end









function x570066_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		return 1
end








function x570066_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570066_ProcAccept( varMap, varPlayer )
	
end









function x570066_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570066_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570066_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570066_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570066_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570066_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570066_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570066_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570066_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570066_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570066_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570066_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570066_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570066_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570066_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
