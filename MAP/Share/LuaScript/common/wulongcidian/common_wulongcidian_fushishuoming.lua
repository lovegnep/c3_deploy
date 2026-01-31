

--DECLARE_QUEST_INFO_START--
x310189_var_FileId = 310189
x310189_var_QuestIdPre =-1

x310189_var_QuestKind = 8
x310189_var_LevelLess	= 	-1 
x310189_var_QuestIdNext = -1
x310189_var_QuestId1 = 9300
x310189_var_Name	="" 
x310189_var_noDemandItem ={}
x310189_var_ExtTarget={}
x310189_var_NeedNum1= 1
x310189_var_NeedNum2= 1
x310189_var_NeedNum3= 1
x310189_var_QuestHelp =	""
x310189_var_QuestName1="【乌龙辞典大都淘汰赛说明】"
x310189_var_QuestName2="【乌龙辞典大都淘汰赛说明】"
x310189_var_QuestInfo1="\t大都淘汰赛，每人可以参加两轮，可以在大都#G（205，50）（295，50）任意一处找到大都一号主持人参加。\n\t每轮比赛要通过#G一号#W至#G二十号主持人的考验#W，在一位主持人处#G回答正确#W，或#G回答错误两次#W，必须前往下一位主持人处回答。\n\t#G每回答错误一次，均会增加15秒总消耗时间。但是，每人有1次使用过关令（一定回答正确）和3次使用黑白令（50%可能回答正确）的机会。\n\t#W我们将会统计#G每轮用时最短的前三十位玩家#W，他们将取得乌龙辞典终极挑战的资格，在下午16：30后前往大元皇宫找到海总管（257，97）接受考验。"  

x310189_var_QuestCompleted1=""
x310189_var_QuestCompleted2=""
x310189_var_ContinueInfo1="\t你将要x310189_var_QuestName5。\n\t将扣除您的龙眼石x310189_var_NeedNum1颗。"
x310189_var_ContinueInfo2=""
x310189_var_ContinueInfo3=""
x310189_var_ErrorInfo1=""
x310189_var_ErrorInfo2=""
x310189_var_BonusMoney1 =0
x310189_var_BonusMoney2 =0
x310189_var_BonusMoney3 =0
x310189_var_BonusItem	=	{}
x310189_var_BonusChoiceItem ={}
x310189_var_ExpBonus = 250
x310189_var_SkillHalfHour = 7510
x310189_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x310189_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	


		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310189_var_QuestName1)
			TalkAppendString(varMap,x310189_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310189_var_FileId, x310189_var_QuestName1)
	


end









function x310189_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)







		TalkAppendButton(varMap, x310189_var_FileId, x310189_var_QuestName1,13,1)




	
end









function x310189_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1
end








function x310189_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310189_ProcAccept( varMap, varPlayer )
	
end









function x310189_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310189_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310189_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310189_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310189_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310189_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310189_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310189_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310189_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310189_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310189_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310189_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310189_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310189_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310189_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
