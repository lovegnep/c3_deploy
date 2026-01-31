

--DECLARE_QUEST_INFO_START--
x800146_var_FileId = 800146
x800146_var_QuestIdPre =-1

x800146_var_QuestKind = 8
x800146_var_LevelLess	= 	-1 
x800146_var_QuestIdNext = -1
x800146_var_Name	="" 
x800146_var_noDemandItem ={}
x800146_var_ExtTarget={}
x800146_var_NeedNum1= 1
x800146_var_NeedNum2= 1
x800146_var_NeedNum3= 1
x800146_var_QuestHelp =	""
x800146_var_QuestName1="【扑克铭刻说明】"
x800146_var_QuestInfo1="\n\t扑克铭刻项目可以为#R玄级#W装备进行扑克铭刻。进行扑克铭刻可以#R增加装备的属性#W，多个装备进行扑克铭刻后有机会#R启动额外属性#W。扑克铭刻项目消耗银卡（现银）和浮世印。\n \n#Y操作说明：#W\n\t1.与玄装大师对话。\n\t2.选择扑克铭刻选项，打开扑克铭刻介面。\n\t3.将装备放入扑克铭刻介面左上方格子内。\n\t4.点击铭刻按钮。"
x800146_var_QuestName2="【扑克铭刻启动说明】"
x800146_var_QuestInfo2="一.横向启动\n\t在人物属性介面横排对应的装备的#R扑克花色一致#W时，启动额外属性（如主手和副手4个花色一致）：#W\n\t红桃同花属性启动：增加命中。\n\t黑桃同花属性启动：增加闪避。\n\t方块同花属性启动：增加暴击。\n\t梅花同花属性启动：增加韧性。\n \n\t在启动同花属性基础上，如果对应的两件装备的4张扑克牌有#R同样的大小#W则会有更多的属性加成。如主手武器、副手武器4张牌中有一个对、两个对或四张牌数字相同，就会额外增加其属性值。\n \n二.纵向启动\n\t当有任意2行（或2行以上）装备的所有扑克#R花色一致#W时，则启动额外的同花属性：\n\t红桃同花属性启动：增加命中平衡。\n\t黑桃同花属性启动：增加闪避平衡。\n\t方块同花属性启动：增加暴击平衡。\n\t梅花同花属性启动：增加韧性平衡。\n \n\t在启动同花平衡属性基础上，如果对应行数的扑克#R大小一致#W则启动额外的同花炸弹属性（同样是花色对应的平衡属性）。"
x800146_var_QuestCompleted1=""
x800146_var_QuestCompleted2=""
x800146_var_ContinueInfo1="\t你将要x800146_var_QuestName5。\n\t将扣除您的龙眼石x800146_var_NeedNum1颗。"
x800146_var_ContinueInfo2=""
x800146_var_ContinueInfo3=""
x800146_var_ErrorInfo1=""
x800146_var_ErrorInfo2=""
x800146_var_BonusMoney1 =0
x800146_var_BonusMoney2 =0
x800146_var_BonusMoney3 =0
x800146_var_BonusItem	=	{}
x800146_var_BonusChoiceItem ={}
x800146_var_ExpBonus = 250
x800146_var_SkillHalfHour = 7510
x800146_var_SkillOneHour = 7511
--DECLARE_QUEST_INFO_STOP--







function x800146_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
	if extid == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800146_var_QuestName1)
			TalkAppendString(varMap,x800146_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800146_var_FileId, x800146_var_QuestName1)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800146_var_QuestName2)
			TalkAppendString(varMap,x800146_var_QuestInfo2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800146_var_FileId, x800146_var_QuestName2)
	end
	
end









function x800146_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800146_var_FileId, x800146_var_QuestName1,13,1)
		TalkAppendButton(varMap, x800146_var_FileId, x800146_var_QuestName2,13,2)


	
end









function x800146_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
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








function x800146_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800146_ProcAccept( varMap, varPlayer )
	
end









function x800146_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800146_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800146_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800146_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800146_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800146_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800146_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800146_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800146_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800146_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800146_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800146_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800146_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800146_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800146_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
