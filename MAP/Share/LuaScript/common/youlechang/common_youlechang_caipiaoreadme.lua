

--DECLARE_QUEST_INFO_START--
x310346_var_FileId = 310346












x310346_var_QuestName1="【乐透彩票说明】"
x310346_var_QuestInfo1="\t周六、日游客第一次进入天上人间会得到一张含有数字的乐透彩票，凭此乐透彩票可以参加乐透大抽奖活动。\n \n#Y详细规则#W:\n\t1.只有当天第一次进入对应等级天上人间才会获得乐透彩票。\n\t2.乐透彩票当天有效，遗失不补。\n\t3.每次开奖的奖金金额为：截止到开奖时间，当天天上人间的部分门票收入。\n\t4.开奖时间为周六、周日的10：30、12：30、14：30、16：30、18：30、20：30、22：30。\n\t5.每周六、周日22:50分后无法领取乐透彩票奖励。\n\t6.每张彩票兑奖后作废，系统回收。\n\t7.未中奖的彩票请玩家自行销毁。"  
















--DECLARE_QUEST_INFO_STOP--







function x310346_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310346_var_QuestName1)
			TalkAppendString(varMap,x310346_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310346_var_FileId, x310346_var_QuestName1)

end









function x310346_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x310346_var_FileId, x310346_var_QuestName1,13,1)



	
end









function x310346_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x310346_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310346_ProcAccept( varMap, varPlayer )
	
end









function x310346_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310346_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310346_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310346_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310346_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310346_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310346_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310346_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310346_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310346_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310346_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310346_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310346_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310346_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310346_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
