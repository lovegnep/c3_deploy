

--DECLARE_QUEST_INFO_START--
x800076_var_FileId = 800076












x800076_var_QuestName1="【宝石拆卸说明】"
x800076_var_QuestInfo1="\t宝石拆卸可以将已镶嵌到装备上的宝石拆卸下来。宝石拆卸消耗银币和离石剂。\n#Y操作说明#W：\n\t1.与王国#G装备镶嵌大师#W或大都#G装备镶嵌大师#W对话。\n\t2.选择#G宝石拆卸#W选项，打开宝石替换介面。\n\t3.将装备放入到宝石拆卸介面左上方格子内。\n\t4.滑鼠左键点选所要拆卸的宝石。\n\t5.点击介面下方拆卸按钮。\n#Y注意事项#W：\n\t1.#G离石剂#W在金币商城（快速键：J）材料区出售。\n\t2.一瓶离石剂只能拆掉一颗宝石。"  
















--DECLARE_QUEST_INFO_STOP--







function x800076_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800076_var_QuestName1)
			TalkAppendString(varMap,x800076_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800076_var_FileId, x800076_var_QuestName1)

end









function x800076_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800076_var_FileId, x800076_var_QuestName1,13,1)



	
end









function x800076_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800076_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800076_ProcAccept( varMap, varPlayer )
	
end









function x800076_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800076_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800076_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800076_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800076_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800076_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800076_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800076_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800076_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800076_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800076_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800076_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800076_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800076_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800076_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
