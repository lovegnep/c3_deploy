

--DECLARE_QUEST_INFO_START--
x570049_var_FileId = 570049












x570049_var_QuestName1="【天赋修炼说明】"
x570049_var_QuestInfo1="\t#W天赋等级增加，可以提升玩家自身控制技能的命中率，降低对方玩家控制技能的命中率。70级以上的玩家才可以开始修炼天赋！多多修炼提升天赋等级，您才能拥有万夫不当之勇！\n#Y操作说明#W：\n\t1.与大都#G天赋修炼大师#W对话。\n\t2.选择#G天赋修炼#W选项。\n\t3.点击介面下方#G确定#W按钮。\n#Y注意事项#W：\n\t1.天赋等级上限为（玩家等级-69）*4。\n\t2.修炼天赋要消耗一定的经验和金钱。"  
















--DECLARE_QUEST_INFO_STOP--







function x570049_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570049_var_QuestName1)
			TalkAppendString(varMap,x570049_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570049_var_FileId, x570049_var_QuestName1)

end









function x570049_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x570049_var_FileId, x570049_var_QuestName1,13,1)



	
end









function x570049_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x570049_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570049_ProcAccept( varMap, varPlayer )
	
end









function x570049_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570049_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570049_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570049_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570049_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570049_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570049_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570049_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570049_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570049_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570049_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570049_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570049_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570049_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570049_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
