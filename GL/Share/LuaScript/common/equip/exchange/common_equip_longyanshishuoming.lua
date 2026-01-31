

--DECLARE_QUEST_INFO_START--
x570000_var_FileId = 570000
x570000_var_QuestIdPre =-1

x570000_var_QuestKind = 8
x570000_var_LevelLess	= 	-1 
x570000_var_QuestIdNext = -1
x570000_var_Name	="" 
x570000_var_noDemandItem ={}
x570000_var_ExtTarget={}
x570000_var_NeedNum1= 1
x570000_var_NeedNum2= 1
x570000_var_NeedNum3= 1
x570000_var_QuestHelp =	""
x570000_var_QuestName1="龙眼石兑换说明"
x570000_var_QuestInfo1="\t#G龙眼石#W是王国加强边防的重要物资。王国大将军派我在这里向所有王国的子民们收集#G龙眼石#W。如果您获得了#G龙眼石#W之后，把它交给我，可以得到珍贵的装备。\n\t龙眼石兑换的装备分为世传，国传，神传，天传，冥传五种。世传装备需要#G初级龙眼石#W，国传装备需要#G中级龙眼石#W，神传装备需要#G高级龙眼石#W。天传装备需要#G天之龙眼石#W。冥传装备需要#G冥之龙眼石#W。\n\t我现在能为您兑换世传装备！"  
x570000_var_QuestInfo2="\t#G龙眼石#W是王国加强边防的重要物资。王国大将军派我在这里向所有王国的子民们收集#G龙眼石#W。如果您获得了#G龙眼石#W之后，把它交给我，可以得到珍贵的装备。\n\t龙眼石兑换的装备分为世传，国传，神传，天传，冥传五种。世传装备需要#G初级龙眼石#W，国传装备需要#G中级龙眼石#W，神传装备需要#G高级龙眼石#W。天传装备需要#G天之龙眼石#W。冥传装备需要#G冥之龙眼石#W。\n\t我现在能为您兑换国传装备、神传装备、天传装备和冥传装备！"  
x570000_var_QuestCompleted1=""
x570000_var_QuestCompleted2=""
x570000_var_ContinueInfo1="\t你将要x570000_var_QuestName5。\n\t将扣除您的龙眼石x570000_var_NeedNum1颗。"
x570000_var_ContinueInfo2=""
x570000_var_ContinueInfo3=""
x570000_var_ErrorInfo1=""
x570000_var_ErrorInfo2=""
x570000_var_BonusMoney1 =0
x570000_var_BonusMoney2 =0
x570000_var_BonusMoney3 =0
x570000_var_BonusItem	=	{}
x570000_var_BonusChoiceItem ={}
x570000_var_ExpBonus = 250
x570000_var_SkillHalfHour = 7510
x570000_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x570000_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
	if varMap ==0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570000_var_QuestName1)
			TalkAppendString(varMap,x570000_var_QuestInfo2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570000_var_FileId, x570000_var_QuestName1)
	else  	
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570000_var_QuestName1)
			TalkAppendString(varMap,x570000_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570000_var_FileId, x570000_var_QuestName1)
	end

end









function x570000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x570000_var_FileId, "【"..x570000_var_QuestName1.."】",0,1)



	
end









function x570000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
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








function x570000_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570000_ProcAccept( varMap, varPlayer )
	
end









function x570000_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570000_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570000_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570000_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570000_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570000_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570000_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570000_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570000_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570000_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570000_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
