

--DECLARE_QUEST_INFO_START--
x800072_var_FileId = 800072












x800072_var_QuestName1="【装备升星说明】"
x800072_var_QuestInfo1="\t装备升星可以提升装备的基础属性，星级越高提升的属性越多。升星需要消耗银币、水晶或钻石。\n#Y操作说明#W：\n\t1.与王国#G装备升星大师#W或大都#G装备升星大师#W对话。\n\t2.选择#G装备升星#W选项，打开装备升星介面。\n\t3.将所要升星的装备放入到装备升星介面左上方格子内。\n\t4.在选择宝石种类下拉条内，选择升星使用的宝石。\n\t5.点击介面下方打星按钮开始给装备升星。\n\t6.如果需要使用自动打星的模块，则可以在选择自动打星等级的下拉条内，选择自动打星等级，点击自动打星按钮即可，当银币或水晶、钻石不足，或装备已升级至选择的等级，自动打星将会自动停止。\n#Y注意事项#W：\n\t1.装备前三星的升级一定达成，升到四星及四星以上都#G有几率升星失败#W。\n\t2.使用#G水晶#W给装备升星，升4星以上时失败，装备星级回退到3星。\n\t3.使用#G钻石#W给装备升星，升星失败时，装备星级不会下降，保持升星前等级。"  
















--DECLARE_QUEST_INFO_STOP--







function x800072_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800072_var_QuestName1)
			TalkAppendString(varMap,x800072_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800072_var_FileId, x800072_var_QuestName1)

end









function x800072_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800072_var_FileId, x800072_var_QuestName1,13,1)



	
end









function x800072_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800072_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800072_ProcAccept( varMap, varPlayer )
	
end









function x800072_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800072_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800072_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800072_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800072_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800072_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800072_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800072_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800072_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800072_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800072_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800072_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800072_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800072_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800072_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
