

--DECLARE_QUEST_INFO_START--
x800125_var_FileId = 800125












x800125_var_QuestName1="【冥装制造说明】"
x800125_var_QuestInfo1="\t在学会耶路撒冷冥甲术之后，制造冥级橙装，需要消耗对应部件的图谱和冥铁，越高级的冥铁，制造出的冥级橙装属性也会略高，同时也可能制造出偏向某一防御或某一攻击的装备。\n#Y操作说明#W：\n\t1.与大都#G耶路撒冷冥甲术大师#W对话。\n\t2.学习#G耶路撒冷冥甲术#W及相关配方，打开制造介面。\n\t3.选择需要制造的装备名称，并放入相关必要材料。\n\t4.点击介面下方制造按钮。"  
















--DECLARE_QUEST_INFO_STOP--







function x800125_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800125_var_QuestName1)
			TalkAppendString(varMap,x800125_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800125_var_FileId, x800125_var_QuestName1)

end









function x800125_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800125_var_FileId, x800125_var_QuestName1,13,1)



	
end









function x800125_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800125_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800125_ProcAccept( varMap, varPlayer )
	
end









function x800125_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800125_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800125_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800125_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800125_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800125_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800125_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800125_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800125_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800125_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800125_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800125_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800125_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800125_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800125_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
