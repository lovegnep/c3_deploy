

--DECLARE_QUEST_INFO_START--
x800145_var_FileId = 800145
x800145_var_QuestIdPre =-1

x800145_var_QuestKind = 8
x800145_var_LevelLess	= 	-1 
x800145_var_QuestIdNext = -1
x800145_var_Name	="" 
x800145_var_noDemandItem ={}
x800145_var_ExtTarget={}
x800145_var_NeedNum1= 1
x800145_var_NeedNum2= 1
x800145_var_NeedNum3= 1
x800145_var_QuestHelp =	""
x800145_var_QuestName1="【冥装升级说明】"
x800145_var_QuestInfo1="\n\t冥装升级项可以将#R冥级#W装备升级为#R玄级#W装备，升级后在保留其原样成属性的基础上对#R白色属性#W和#R蓝色属性#W进行提升。玄装升级项消耗银卡（现银）和幽冥之华（可以在钧窑副本、倩女幽魂副本内兑换得到）。\n \n#Y操作说明：#W\n\t1.与玄装大师对话。\n\t2.选择冥装升级选项，打开玄装升级介面。\n\t3.将冥传装备放入冥装升级介面左上方格子内。\n\t4.点击升级按钮。"  

x800145_var_QuestCompleted1=""
x800145_var_QuestCompleted2=""
x800145_var_ContinueInfo1="\t你将要x800145_var_QuestName5。\n\t将扣除您的龙眼石x800145_var_NeedNum1颗。"
x800145_var_ContinueInfo2=""
x800145_var_ContinueInfo3=""
x800145_var_ErrorInfo1=""
x800145_var_ErrorInfo2=""
x800145_var_BonusMoney1 =0
x800145_var_BonusMoney2 =0
x800145_var_BonusMoney3 =0
x800145_var_BonusItem	=	{}
x800145_var_BonusChoiceItem ={}
x800145_var_ExpBonus = 250
x800145_var_SkillHalfHour = 7510
x800145_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x800145_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800145_var_QuestName1)
			TalkAppendString(varMap,x800145_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800145_var_FileId, x800145_var_QuestName1)
	
	
	
	
	


end









function x800145_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800145_var_FileId, x800145_var_QuestName1,13,1)



	
end









function x800145_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
	local pkMode = GetPlayerPKMode( varMap, varPlayer)
	local pkValue = GetPKValue( varMap, varPlayer)
	if pkMode ~= 0 or pkValue > 0 then
		StartTalkTask( varMap)
		TalkAppendString( varMap, "处于pk模式或pk值大于0不能获得双倍经验" )
		StopTalkTask()
		DeliverTalkTips( varMap, varPlayer)
		return 0
	end

	return 1
end








function x800145_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800145_ProcAccept( varMap, varPlayer )
	
end









function x800145_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800145_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800145_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800145_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800145_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800145_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800145_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800145_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800145_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800145_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800145_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800145_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800145_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800145_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800145_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
