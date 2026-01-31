

--DECLARE_QUEST_INFO_START--
x800120_var_FileId = 800120












x800120_var_QuestName1="【战绩铭刻说明】"
x800120_var_QuestInfo1="\t装备进行战功铭刻会提高其基础属性，最高可以升到9级，战功铭刻消耗银币和战场获得的奖章。目前只开放到6级战功铭刻。\n#Y操作说明：\n\t#W1.与王国#G装备铭刻大师#W或大都#G装备铭刻大师#W对话。\n\t2.选择#G战功铭刻#W选项。\n\t3.将装备放入到战功铭刻介面左上方格子内。\n\t4.在选择铭刻道具列表内，选择铭刻使用的奖章。\n\t5.点击介面下方铭刻按钮给装备战功铭刻。\n\t6.如果需要使用自动铭刻的项目，则可以在选择自动铭刻等级的下拉条内，选择自动铭刻等级，点击自动铭刻按钮即可，当银币或奖章不足，或装备已升级至选择的等级，自动铭刻将会自动停止。\n#Y注意事项：\n\t#W1.战功铭刻强化的基础属性不受打星影响。\n\t2.铭刻过程有几率失败，失败后会退一级铭刻等级，0升1级、3升4级、6升7级铭刻失败后不退等级。"  
















--DECLARE_QUEST_INFO_STOP--







function x800120_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800120_var_QuestName1)
			TalkAppendString(varMap,x800120_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800120_var_FileId, x800120_var_QuestName1)

end









function x800120_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800120_var_FileId, x800120_var_QuestName1,13,1)



	
end









function x800120_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		return 1
end








function x800120_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800120_ProcAccept( varMap, varPlayer )
	
end









function x800120_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800120_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800120_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800120_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800120_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800120_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800120_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800120_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800120_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800120_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800120_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800120_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800120_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800120_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800120_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
