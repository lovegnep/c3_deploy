

--DECLARE_QUEST_INFO_START--
x303115_var_FileId = 303115












x303115_var_QuestName1="【跨服六人战场说明】"
x303115_var_QuestInfo1="\n#Y报名规则：#W\n\t1.跨服六人战场在#G每周六的13：00-13：09和13：30-13:39#W期间，凡级别在#G60以上（包括60）#W的玩家都可以单人或组队报名。\n\t2.报名时间结束以后，战斗随即开始，整场战斗最多持续20分钟。\n#Y战斗详细说明#W：\n\t1.在战场中，玩家通过抢夺多种颜色的#G旌旗#W来获得不同的分数。\n\t2.第一面#G旌旗#W会在战场#G中间的两个平台上#W随机刷新，之后的所有#G旌旗#W都会在战场中随机刷新，随着时间的推移，#G旌旗#W的颜色和积分会有所变化。\n\t3.#G旌旗#W的积分值依照绿、蓝、黄、红、彩的顺序增加。\n#Y胜利条件：#W\n\t1：如果战场中的一方所得#G积分#W达到上限，则获得胜利，战斗也提前结束。\n\t2.如果战斗时间达到#G20分钟#W，则战斗结束，积分多的一方获得胜利。\n\t3.如果双方#G积分一样则为平局#W。\n\t4.在#G战场#W、#G副本#W和#G轮回之地#W等场景不能进入跨服战场。"  
















--DECLARE_QUEST_INFO_STOP--







function x303115_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x303115_var_QuestName1)
			TalkAppendString(varMap,x303115_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x303115_var_FileId, x303115_var_QuestName1)

end









function x303115_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x303115_var_FileId, x303115_var_QuestName1,13,1)



	
end









function x303115_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x303115_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x303115_ProcAccept( varMap, varPlayer )
	
end









function x303115_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x303115_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x303115_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x303115_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x303115_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x303115_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x303115_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x303115_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x303115_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x303115_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x303115_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x303115_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x303115_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x303115_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x303115_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
