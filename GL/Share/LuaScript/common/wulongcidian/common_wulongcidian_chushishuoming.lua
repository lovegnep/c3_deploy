

--DECLARE_QUEST_INFO_START--
x310188_var_FileId = 310188
x310188_var_QuestIdPre =-1

x310188_var_QuestKind = 8
x310188_var_LevelLess	= 	-1 
x310188_var_QuestIdNext = -1
x310188_var_QuestId1 = 9300
x310188_var_Name	="" 
x310188_var_noDemandItem ={}
x310188_var_ExtTarget={}
x310188_var_NeedNum1= 1
x310188_var_NeedNum2= 1
x310188_var_NeedNum3= 1
x310188_var_QuestHelp =	""
x310188_var_QuestName1="【乌龙辞典王国海选赛说明】"
x310188_var_QuestName2="【乌龙辞典王国海选赛说明】"
x310188_var_QuestInfo1="\t乌龙辞典共分为三个阶段：#G乌龙辞典王国海选赛，乌龙辞典大都淘汰赛，乌龙辞典终极挑战赛。#W\n\t#R20#W级以上的各位玩家可以在自己王国的#G北大街，东大街，西大街#W任意一处找到海选主持人参加比赛。\n\t等级不低于#G40级#W并且#G回答正确10题以上#W的玩家可以获得参加下一轮大都淘汰赛的资格，在下午2点后，前往大都#G（205，50）（295，50）任意一处找到大都一号主持人参加！"  

x310188_var_QuestCompleted1=""
x310188_var_QuestCompleted2=""
x310188_var_ContinueInfo1="\t你将要x310188_var_QuestName5。\n\t将扣除您的龙眼石x310188_var_NeedNum1颗。"
x310188_var_ContinueInfo2=""
x310188_var_ContinueInfo3=""
x310188_var_ErrorInfo1=""
x310188_var_ErrorInfo2=""
x310188_var_BonusMoney1 =0
x310188_var_BonusMoney2 =0
x310188_var_BonusMoney3 =0
x310188_var_BonusItem	=	{}
x310188_var_BonusChoiceItem ={}
x310188_var_ExpBonus = 250
x310188_var_SkillHalfHour = 7510
x310188_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x310188_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	


		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310188_var_QuestName1)
			TalkAppendString(varMap,x310188_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310188_var_FileId, x310188_var_QuestName1)
	


end









function x310188_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)







		TalkAppendButton(varMap, x310188_var_FileId, x310188_var_QuestName1,13,1)




	
end









function x310188_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1
end








function x310188_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310188_ProcAccept( varMap, varPlayer )
	
end









function x310188_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310188_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310188_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310188_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310188_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310188_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310188_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310188_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310188_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310188_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310188_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310188_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310188_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310188_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310188_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
