

--DECLARE_QUEST_INFO_START--
x800111_var_FileId = 800111












x800111_var_QuestName1="【护身符补色说明】"
x800111_var_QuestInfo1="\t护身符补色可以将两个吸收了蓝色属性的符文合成一个更强大的符文，最多可以合成五次。将合成后的符文上色到护身符中，可以让护身符发挥更强大的威力。护身符补色需要消耗五彩石（天上人间·梦聊中挖宝大作战、天降魔君玩法和倩女幽魂、画皮副本有概率产出）。\n#Y操作说明#W：\n\t1.与王国#G外装大师#W，大都#G外装大师#W或梦聊中#G护身符补色大师#W对话。\n\t2.选择#G护身符补色#W选项。\n\t3.将主符文放入到介面左上方格内。\n\t4.将副符文放入到介面左下方格内。\n\t5.点击介面下方补色按钮。\n#Y注意事项#W：\n\t1.#G85级以上#W的玩家才能使用该模块。\n\t2.合成过的符文只能做为主符文进行再次合成。\n\t3.符文最多只能合成五次。\n\t4.副符文只有一定百分比的属性能合成到主符文上。"  
















--DECLARE_QUEST_INFO_STOP--







function x800111_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800111_var_QuestName1)
			TalkAppendString(varMap,x800111_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800111_var_FileId, x800111_var_QuestName1)

end









function x800111_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800111_var_FileId, x800111_var_QuestName1,13,1)



	
end









function x800111_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800111_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800111_ProcAccept( varMap, varPlayer )
	
end









function x800111_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800111_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800111_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800111_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800111_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800111_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800111_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800111_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800111_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800111_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800111_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800111_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800111_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800111_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800111_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
