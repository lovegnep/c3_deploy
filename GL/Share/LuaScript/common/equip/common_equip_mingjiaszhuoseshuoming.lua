

--DECLARE_QUEST_INFO_START--
x800126_var_FileId = 800126












x800126_var_QuestName1="【冥装着色说明】"
x800126_var_QuestInfo1="\t冥装着色，是给玄级、冥级装备附加蓝色属性的过程，必要的材料为蓝光珐琅，由地中海工程术制造。可以选择添加水蓝石，提高一定的蓝色属性，也可以添加蓝色符石，固定获取某一类蓝色属性。\n#Y操作说明#W：\n\t1.与大都#G冥装着色大师#W对话。\n\t2.放入需要着色的装备及相关必要道具。\n\t3.点击介面下方着色按钮。"  
















--DECLARE_QUEST_INFO_STOP--







function x800126_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800126_var_QuestName1)
			TalkAppendString(varMap,x800126_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800126_var_FileId, x800126_var_QuestName1)

end









function x800126_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800126_var_FileId, x800126_var_QuestName1,13,1)



	
end









function x800126_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800126_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800126_ProcAccept( varMap, varPlayer )
	
end









function x800126_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800126_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800126_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800126_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800126_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800126_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800126_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800126_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800126_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800126_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800126_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800126_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800126_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800126_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800126_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
