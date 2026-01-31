

--DECLARE_QUEST_INFO_START--
x303108_var_FileId = 303108












x303108_var_QuestName1="【跨服双人战场说明】"
x303108_var_QuestInfo1="\n#Y报名规则：#W\n\t1.#G每周一、四的19：55-21：00#W和#G每周日的12：55-15：00#W期间。\n\t2.凡级别在#G40级以上（包括40级）#W的玩家都可以单人或两人组队参加战斗。\n#Y战斗详细说明#W：\n\t1.战斗为#G死亡竞赛制#W，战斗开始以后，配合队友，在规定时间内击杀敌方队伍中的所有成员，获得胜利。\n\t2.时间结束时，如双方都有存活者，则存活者多的一方胜利。\n#Y注意事项#W：\n\t1.战斗持续过程中#G不允许复活#W。\n\t2.在战场开放期间，玩家可以多次报名参加。\n\t3.在#G战场#W、#G副本#W和#G轮回之地#W等场景不能进入跨服战场。"  
















--DECLARE_QUEST_INFO_STOP--







function x303108_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x303108_var_QuestName1)
			TalkAppendString(varMap,x303108_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x303108_var_FileId, x303108_var_QuestName1)

end









function x303108_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x303108_var_FileId, x303108_var_QuestName1,13,1)



	
end









function x303108_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x303108_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x303108_ProcAccept( varMap, varPlayer )
	
end









function x303108_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x303108_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x303108_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x303108_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x303108_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x303108_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x303108_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x303108_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x303108_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x303108_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x303108_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x303108_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x303108_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x303108_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x303108_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
