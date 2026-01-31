

--DECLARE_QUEST_INFO_START--
x800132_var_FileId = 800132












x800132_var_QuestName1="【战车装备制造说明】"
x800132_var_QuestInfo1="\t战车装备制造的流程如下：打开战车装备制造介面，选择要制造的装备，放入对应装备的元件，铸件和铆钉，点击制造即可制造出对应的战车装备。\n\t装备组件分为：\n\t#G龙击炮组件#W：声望商店兑换\n\t#G御行甲出售#W：荣誉商店出售\n\t#G底座组件#W：帮贡商店出售\n\t#G疾风辕组件#W：黄金藏宝图\n\t#G机枢组件#W：战场积分商店出售\n\t#G精准仪组件#W：战车之王掉落\n\t#G重击器组件#W：威望商店出售\n\t#G了望窗组件#W：贺兰山之王掉落\n\t各种#G铸件#W由#G巴尔干战车术#W制造。#G铆钉#W在金币商店出售。使用不同的铸件会对装备的属性产生不同的影响。"  
















--DECLARE_QUEST_INFO_STOP--







function x800132_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800132_var_QuestName1)
			TalkAppendString(varMap,x800132_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800132_var_FileId, x800132_var_QuestName1)

end









function x800132_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800132_var_FileId, x800132_var_QuestName1,13,1)



	
end









function x800132_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800132_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800132_ProcAccept( varMap, varPlayer )
	
end









function x800132_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800132_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800132_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800132_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800132_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800132_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800132_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800132_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800132_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800132_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800132_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800132_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800132_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800132_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800132_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
