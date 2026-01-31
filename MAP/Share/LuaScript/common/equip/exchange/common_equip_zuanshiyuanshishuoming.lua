

--DECLARE_QUEST_INFO_START--
x570036_var_FileId = 570036
x570036_var_QuestIdPre =-1

x570036_var_QuestKind = 8
x570036_var_LevelLess	= 	-1 
x570036_var_QuestIdNext = -1
x570036_var_Name	="" 
x570036_var_noDemandItem ={}
x570036_var_ExtTarget={}
x570036_var_NeedNum1= 1
x570036_var_NeedNum2= 1
x570036_var_NeedNum3= 1
x570036_var_QuestHelp =	""
x570036_var_QuestName1="钻石原石说明"
x570036_var_QuestInfo1="\n\t#G钻石#W、#G金刚#W是打造极品星装，提升属性的必要物资。\n\t#G钻石原石#W非常稀有，只有守护钧窑的#G陶录#W手里才有，你可以通过天上人间·麒麟的#G怒焰之锤#W进入钧窑，当你帮助陶录击败蜂拥而出的第六至十波怪物后，便可以使用#G次生钻石矿#W或#G原生钻石矿#W和他兑换成#G钻石原石#W。\n\t我可以从钻石原石中提炼出你所需要的各种#G钻石#W和#G金刚#W。"  

x570036_var_QuestCompleted1=""
x570036_var_QuestCompleted2=""
x570036_var_ContinueInfo1="\t你将要x570036_var_QuestName5。\n\t将扣除您的龙眼石x570036_var_NeedNum1颗。"
x570036_var_ContinueInfo2=""
x570036_var_ContinueInfo3=""
x570036_var_ErrorInfo1=""
x570036_var_ErrorInfo2=""
x570036_var_BonusMoney1 =0
x570036_var_BonusMoney2 =0
x570036_var_BonusMoney3 =0
x570036_var_BonusItem	=	{}
x570036_var_BonusChoiceItem ={}
x570036_var_ExpBonus = 250
x570036_var_SkillHalfHour = 7510
x570036_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x570036_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
	if varMap ==0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570036_var_QuestName1)
			TalkAppendString(varMap,x570036_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570036_var_FileId, x570036_var_QuestName1)
	
	
	
	
	
	
	end

end









function x570036_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x570036_var_FileId, x570036_var_QuestName1,13,1)



	
end









function x570036_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
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








function x570036_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570036_ProcAccept( varMap, varPlayer )
	
end









function x570036_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570036_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570036_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570036_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570036_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570036_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570036_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570036_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570036_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570036_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570036_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570036_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570036_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570036_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570036_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
