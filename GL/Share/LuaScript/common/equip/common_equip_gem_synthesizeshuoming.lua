

--DECLARE_QUEST_INFO_START--
x800078_var_FileId = 800078












x800078_var_QuestName1="【洗石剂配制说明】"
x800078_var_QuestInfo1="\t洗石剂配制可以将5个低等级的洗石剂升级为1个高等级的洗石剂。洗石剂配制消耗银币。\n#Y操作说明#W：\n\t1.与王国#G装备镶嵌大师#W或大都#G装备镶嵌大师#W对话。\n\t2.选择#G洗石剂配制#W选项，打开洗石剂配制介面。\n\t3.将待合成的洗石剂放入到洗石剂配制介面左上方格子内。\n\t4.点击介面下方配制按钮。"  
















--DECLARE_QUEST_INFO_STOP--







function x800078_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800078_var_QuestName1)
			TalkAppendString(varMap,x800078_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800078_var_FileId, x800078_var_QuestName1)

end









function x800078_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800078_var_FileId, x800078_var_QuestName1,13,1)



	
end









function x800078_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800078_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800078_ProcAccept( varMap, varPlayer )
	
end









function x800078_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800078_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800078_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800078_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800078_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800078_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800078_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800078_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800078_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800078_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800078_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800078_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800078_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800078_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800078_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
