

--DECLARE_QUEST_INFO_START--
x300568_var_FileId = 300568
x300568_var_QuestIdPre =-1

x300568_var_QuestKind = 8
x300568_var_LevelLess	= 	-1 
x300568_var_QuestIdNext = -1
x300568_var_QuestId1 = 9300
x300568_var_Name	="" 
x300568_var_noDemandItem ={}
x300568_var_ExtTarget={}
x300568_var_NeedNum1= 1
x300568_var_NeedNum2= 1
x300568_var_NeedNum3= 1
x300568_var_QuestHelp =	""
x300568_var_QuestName1="【四大法王玩法说明】"
x300568_var_QuestName2="【四大法王玩法说明】"
x300568_var_QuestInfo1="\t在本任务中，我会让你去询问四大法王，他们中有#G三个人#W会告诉你#G真话#W，#G一个人会撒谎#W。\n\t记住，#G撒谎的人不一定是叛徒，叛徒不一定撒谎#W。\n\t你可以在#G任务攻略#W中查看四大法王说过的话，以便分析。"  

x300568_var_QuestCompleted1=""
x300568_var_QuestCompleted2=""
x300568_var_ContinueInfo1="\t你将要x300568_var_QuestName5。\n\t将扣除您的龙眼石x300568_var_NeedNum1颗。"
x300568_var_ContinueInfo2=""
x300568_var_ContinueInfo3=""
x300568_var_ErrorInfo1=""
x300568_var_ErrorInfo2=""
x300568_var_BonusMoney1 =0
x300568_var_BonusMoney2 =0
x300568_var_BonusMoney3 =0
x300568_var_BonusItem	=	{}
x300568_var_BonusChoiceItem ={}
x300568_var_ExpBonus = 250
x300568_var_SkillHalfHour = 7510
x300568_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x300568_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,9300);
if isHaveQuest == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x300568_var_QuestName2)
			TalkAppendString(varMap,x300568_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x300568_var_FileId, x300568_var_QuestName1)
	
end

end









function x300568_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,9300);
if isHaveQuest == 1 then
		TalkAppendButton(varMap, x300568_var_FileId, x300568_var_QuestName1,0,1)



end
	
end









function x300568_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1
end








function x300568_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x300568_ProcAccept( varMap, varPlayer )
	
end









function x300568_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x300568_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x300568_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x300568_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x300568_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x300568_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x300568_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x300568_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x300568_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x300568_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x300568_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x300568_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300568_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x300568_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x300568_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
