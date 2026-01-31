

--DECLARE_QUEST_INFO_START--
x570037_var_FileId = 570037
x570037_var_QuestIdPre =-1

x570037_var_QuestKind = 8
x570037_var_LevelLess	= 	-1 
x570037_var_QuestIdNext = -1
x570037_var_Name	="" 
x570037_var_noDemandItem ={}
x570037_var_ExtTarget={}
x570037_var_NeedNum1= 1
x570037_var_NeedNum2= 1
x570037_var_NeedNum3= 1
x570037_var_QuestHelp =	""
x570037_var_QuestName1="金刚兑换说明"
x570037_var_QuestInfo1="\n\t#G钻石#W、#G金刚#W是打造极品星装，提升属性的必要物资。我可以将#G钻石#W兑换成#G金刚#W。金刚可用于不低于75级的装备从9星升到10星，升星失败后装备星级不会下降。\n\t金刚的兑换方式很简单，只要你给我一颗#G钻石#W和一定数量的材料，比如#G夜明珠#W等，我就可以给你兑换成相应的#G金刚#W。\n\t还没有明白？举个例子吧，如果你给我一颗#G海蓝钻石#W和#G夜明珠#W，就可以从我这里兑换到一颗#G海蓝金刚#W，如果你给我一颗#G水火钻石#W和#G夜明珠#W，我就可以给你兑换成一颗#G水火金刚#W，以此类推。"  

x570037_var_QuestCompleted1=""
x570037_var_QuestCompleted2=""
x570037_var_ContinueInfo1="\t你将要x570037_var_QuestName5。\n\t将扣除您的龙眼石x570037_var_NeedNum1颗。"
x570037_var_ContinueInfo2=""
x570037_var_ContinueInfo3=""
x570037_var_ErrorInfo1=""
x570037_var_ErrorInfo2=""
x570037_var_BonusMoney1 =0
x570037_var_BonusMoney2 =0
x570037_var_BonusMoney3 =0
x570037_var_BonusItem	=	{}
x570037_var_BonusChoiceItem ={}
x570037_var_ExpBonus = 250
x570037_var_SkillHalfHour = 7510
x570037_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x570037_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
	if varMap ==0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570037_var_QuestName1)
			TalkAppendString(varMap,x570037_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570037_var_FileId, x570037_var_QuestName1)
	
	
	
	
	
	
	end

end









function x570037_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x570037_var_FileId, x570037_var_QuestName1,13,1)



	
end









function x570037_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
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








function x570037_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570037_ProcAccept( varMap, varPlayer )
	
end









function x570037_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570037_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570037_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570037_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570037_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570037_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570037_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570037_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570037_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570037_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570037_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570037_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570037_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570037_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570037_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
