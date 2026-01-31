

--DECLARE_QUEST_INFO_START--
x310371_var_FileId = 310371












x310371_var_QuestName1="【天上人间·梦聊说明】"
x310371_var_QuestInfo1="\t天上人间·梦聊是不低于85级玩家周末的大型娱乐场。\n\t天上人间·梦聊每#G周六、日#W的09：00——23：00开放，不低于#G85级#W的玩家可通过花费#G25两#W现银或银卡进入。只有第一次进入收费。\n \n#Y天上人间·梦聊相关玩法#W：\n\t每天首次进入天上人间·梦聊时会得到一个#G梦聊乐透奖券#W，凭藉里面记录的数位能参加当天10：30、12：30、14：30、16：30、18：30、20：30、22：30举办的天上人间·梦聊#G乐透大抽奖#W。\n\t周六、日9：00——23：00期间，梦幻聊斋的的财神会#G不断#W的出现在天上人间·梦聊各处，第一个点击财神的玩家将获得大量经验奖励，同时天上人间·梦聊中其他玩家也会获得部分经验奖励。\n\t14:00开始至17：00玩家可参与#G挖宝大作战#W活动。\n\t在开放时间内，可以随时参加天降魔君活动。\n\t在天上人间·梦聊里可以进入#G倩女幽魂#W副本和#G画皮#W副本。\n \n#Y注意事项#W：\n\t1.当天#G第一次#W进入天上人间·梦聊收费及给予乐透奖券。\n\t2.天上人间·梦聊适合不低于85级的玩家进入。"  
















--DECLARE_QUEST_INFO_STOP--







function x310371_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310371_var_QuestName1)
			TalkAppendString(varMap,x310371_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310371_var_FileId, x310371_var_QuestName1)

end









function x310371_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x310371_var_FileId, x310371_var_QuestName1,13,1)



	
end









function x310371_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x310371_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310371_ProcAccept( varMap, varPlayer )
	
end









function x310371_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310371_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310371_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310371_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310371_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310371_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310371_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310371_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310371_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310371_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310371_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310371_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310371_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310371_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310371_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
