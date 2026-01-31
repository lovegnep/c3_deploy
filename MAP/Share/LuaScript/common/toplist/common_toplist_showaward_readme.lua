

--DECLARE_QUEST_INFO_START--
x310605_var_FileId = 310605












x310605_var_QuestName1="【排行榜奖励说明】"
x310605_var_QuestInfo1="#Y冠军的奖励#W\n\t1.获得上周#R屠龙排行榜冠军、智力竞赛排行榜冠军、杀敌排行榜冠军、战场等级排行榜冠军#W的玩家可于本周在大都对应的冠军雕像处领取一份#G冠军大礼包#W。"
x310605_var_QuestInfo2 ="\n\t2.获得上周#R战场积分排行榜冠军、轮回台排行榜冠军、囚龙岛排行榜冠军、夏王墓排行榜冠军、大教堂排行榜冠军、印度河排行榜冠军、祝家庄排行榜冠军、赤血号排行榜冠军、和氏璧排行榜冠军#W的玩家本周可在大都·皇城内对应冠军处领取一份#G冠军大礼包#W。\n\t3.获得上周#R玫瑰排行榜冠军、小喇叭排行榜冠军、烟花排行榜冠军#W的玩家可于本周在大都·皇城内对应冠军处领取一件#G极品时装#W。\n \n#Y同享奖励#W\n\t1.上周#R屠龙排行榜冠军、智力竞赛排行榜冠军、杀敌排行榜冠军、战场等级排行榜冠军#W的好友（好友度100点以上）、同一帮会的成员本周可以在大都对应雕像处领取一份#G好友同享礼包、帮会同享礼包#W。\n\t2.与上周#R战场积分排行榜冠军#W同一帮会的玩家本周可以在大都皇城内的对应冠军处领取一份#G帮会同享礼包#W。\n\t3.与上周#R轮回台排行榜冠军、囚龙岛排行榜冠军、夏王墓排行榜冠军、大教堂排行榜冠军、印度河排行榜冠军、祝家庄排行榜冠军、赤血号排行榜冠军、和氏璧排行榜冠军、玫瑰排行榜冠军、小喇叭排行榜冠军、烟花排行榜冠军#W同国家的玩家本周可以在大都·皇城内对应冠军处领取一份#G国家同享礼包#W。" 
















--DECLARE_QUEST_INFO_STOP--







function x310605_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310605_var_QuestName1)
			TalkAppendString(varMap,x310605_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310605_var_FileId, x310605_var_QuestName1)

end









function x310605_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x310605_var_FileId, x310605_var_QuestName1,13,1)



	
end









function x310605_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x310605_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310605_ProcAccept( varMap, varPlayer )
	
end









function x310605_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310605_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310605_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310605_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310605_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310605_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310605_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310605_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310605_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310605_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310605_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310605_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310605_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310605_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310605_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
