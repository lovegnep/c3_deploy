

--DECLARE_QUEST_INFO_START--
x310345_var_FileId = 310345












x310345_var_QuestName1="【水晶球总动员说明】"
x310345_var_QuestInfo1="\t如果魔女的水晶球跑掉了，那她还算魔女吗？我不知道，不过这水晶球对我很重要，是从小把我带大的嬷嬷送给我的，这次它又很顽皮的藏了起来。找到它，它就会回到我身边。当然，你，以及这天上人间·麒麟内的所有人都会获得无限的惊喜！\n \n#Y活动规则#W：\n\t1.周六、日9：00——23：00，水晶球会#G不断#W的出现在天上人间·麒麟各处。\n\t2.搜寻到水晶球的玩家获得大量经验奖励，同时天上人间·麒麟中其他玩家获得部分经验奖励。\n\t3.水晶球并不会进入玩家背包，搜寻结束后它会回到魔女身边，不过顽皮的它随时会在其他地方再次出现。"  
















--DECLARE_QUEST_INFO_STOP--







function x310345_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310345_var_QuestName1)
			TalkAppendString(varMap,x310345_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310345_var_FileId, x310345_var_QuestName1)

end









function x310345_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x310345_var_FileId, x310345_var_QuestName1,13,1)



	
end









function x310345_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x310345_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310345_ProcAccept( varMap, varPlayer )
	
end









function x310345_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310345_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310345_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310345_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310345_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310345_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310345_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310345_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310345_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310345_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310345_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310345_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310345_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310345_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310345_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
