

--DECLARE_QUEST_INFO_START--
x800079_var_FileId = 800079












x800079_var_QuestName1="【灵魂铭刻说明】"
x800079_var_QuestInfo1="\t装备进行灵魂铭刻会提高其基础的属性，铭刻后装备不会因死亡而掉落。灵魂铭刻消耗银币和灵魂印。\n#Y操作说明#W：\n\t1.与王国#G装备铭刻大师#W或大都#G装备铭刻大师#W对话。\n\t2.选择#G灵魂铭刻#W选项。\n\t3.将装备放入到灵魂铭刻介面左上方格子内。\n\t4.点击介面下方铭刻按钮。\n#Y注意事项#W：\n\t1.#G40级至59级#W装备需要用#G国传灵魂印#W铭刻。\n\t2.#G60级以上#W装备需要用#G灵魂印#W铭刻。\n\t3.灵魂铭刻会将装备强行#G绑定#W。"  
















--DECLARE_QUEST_INFO_STOP--







function x800079_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800079_var_QuestName1)
			TalkAppendString(varMap,x800079_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800079_var_FileId, x800079_var_QuestName1)

end









function x800079_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800079_var_FileId, x800079_var_QuestName1,13,1)



	
end









function x800079_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800079_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800079_ProcAccept( varMap, varPlayer )
	
end









function x800079_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800079_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800079_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800079_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800079_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800079_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800079_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800079_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800079_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800079_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800079_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800079_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800079_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800079_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800079_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
