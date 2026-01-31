

--DECLARE_QUEST_INFO_START--
x570065_var_FileId = 570065
x570065_var_QuestName1="【平衡天赋说明】"
x570065_var_QuestInfo1="\t#W每个人的成长之路尽不相同，弥补自身在与敌对阵时属性相克而带来的劣势，才能变得更加强大！\n#Y平衡天赋的作用#W：\n\t在自身属性与敌方属性差异过大，发挥平衡作用，减少一定的属性差异，使得自身战斗力可以淋漓尽致的发挥出来。\n\t1.控制命中平衡：提升控制技能的命中率，每级提升1%。\n\t2.控制抵抗平衡：提升控制技能的抵抗率，每级提升1%。（生效的抵抗率上限为90%）\n\t3.命中平衡：当实际命中率低于50%时生效，每级提升1点命中。\n\t4.闪避平衡：当实际闪避率低于20%时生效，每级提升1点闪避。\n\t5.暴击平衡：当实际暴击率低于10%时生效，每级提升1点暴击。\n\t6.韧性平衡：当实际免暴击率低于50%时生效，每级提升1点韧性。（不影响暴击伤害）\n\t7.暴击伤害平衡：当实际暴击伤害低于50时生效，每级提升1%暴击伤害。\n\t8.暴击减免平衡：当实际被暴击伤害高于100时生效，每级提升1%暴击伤害减免。\n#Y平衡天赋如何学习#W：\n\t在大都天赋区#G平衡天赋大师#W处，学习和升级技能。需要一定的天赋等级和相应等级的平衡之书。\n#Y平衡之书如何获得#W：\n\t各级平衡之书通过低级平衡之书合成而来；一级平衡之书通过平衡之书残页合成而来；平衡之书残页可以在各种玩法中获得。"  







function x570065_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570065_var_QuestName1)
			TalkAppendString(varMap,x570065_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570065_var_FileId, x570065_var_QuestName1)

end









function x570065_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x570065_var_FileId, x570065_var_QuestName1,13,1)
	
end









function x570065_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		return 1
end








function x570065_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570065_ProcAccept( varMap, varPlayer )
	
end









function x570065_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570065_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570065_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570065_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570065_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570065_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570065_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570065_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570065_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570065_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570065_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570065_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570065_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570065_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570065_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
