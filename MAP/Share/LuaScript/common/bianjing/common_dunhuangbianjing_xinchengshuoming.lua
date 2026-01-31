

--DECLARE_QUEST_INFO_START--
x300582_var_FileId = 300582
x300582_var_QuestIdPre =-1

x300582_var_QuestKind = 8
x300582_var_LevelLess	= 	-1 
x300582_var_QuestIdNext = -1




x300582_var_NeedNum1= 1
x300582_var_NeedNum2= 1
x300582_var_NeedNum3= 1
x300582_var_QuestHelp =	""
x300582_var_QuestName1="【心诚则灵玩法说明】"
x300582_var_QuestName2="【心诚则灵玩法说明】"
x300582_var_QuestInfo1="\t接受天云水晶的考验后，前方四块小水晶会#G不规则的闪烁光芒#W。\n\t记住四块水晶闪烁的#G顺序#W，在光芒闪烁后，按照水晶#G闪烁顺序依次点击四块水晶#W完成考验。\n\t前6轮中点错水晶依然可以继续，直到正确。在第6轮完成后，可领取奖励结束考验。或者到#G天云水晶#W处挑战#G更高奖励#W。\n\t挑战完成第7和第8轮，有可能会获得额外的奖励。\n\t不过，#G第7第8轮，点错一次水晶，任务便要从第1轮重新开始#W。"  

x300582_var_QuestCompleted1=""
x300582_var_QuestCompleted2=""
x300582_var_ContinueInfo1="\t你将要x300582_var_QuestName5。\n\t将扣除您的龙眼石x300582_var_NeedNum1颗。"
x300582_var_ContinueInfo2=""
x300582_var_ContinueInfo3=""
x300582_var_ErrorInfo1=""
x300582_var_ErrorInfo2=""
x300582_var_BonusMoney1 =0
x300582_var_BonusMoney2 =0
x300582_var_BonusMoney3 =0
x300582_var_BonusItem	=	{}
x300582_var_BonusChoiceItem ={}
x300582_var_ExpBonus = 250
x300582_var_SkillHalfHour = 7510
x300582_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x300582_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,9500);
if isHaveQuest == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x300582_var_QuestName2)
			TalkAppendString(varMap,x300582_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x300582_var_FileId, x300582_var_QuestName1)
	
end

end









function x300582_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,9500);
if isHaveQuest == 1 then
		TalkAppendButton(varMap, x300582_var_FileId, x300582_var_QuestName1,0,1)



end
	
end









function x300582_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1
end








function x300582_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x300582_ProcAccept( varMap, varPlayer )
	
end









function x300582_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x300582_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x300582_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x300582_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x300582_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x300582_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x300582_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x300582_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x300582_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x300582_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x300582_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300582_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300582_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300582_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300582_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
