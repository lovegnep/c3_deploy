

--DECLARE_QUEST_INFO_START--
x800092_var_FileId = 800092












x800092_var_QuestName1="【装备转换说明】"
x800092_var_QuestInfo1="\t进行装备转换时，你需要拥有#G装备转换符#W，并且你的装备只能转换为对应职业的装备。\n\t具体装备转换对应为：\n\t#G突厥武士#W可转换为#G地中海十字军#W\n\t#G江南剑侠#W可转换为#G西域圣火使#W\n\t#G蒙古骑射手#W可转换为#G西夏刺客#W\n\t#G中原火枪手#W可转换为#G蒙古近卫军#W\n\t#G波斯先知#W可转换为#G斯拉夫隐修士#W\n\t#G雪山萨满#W可转换为#G高原僧侣#W\n#Y注意事项#W：\n\t只有#G黄色装备#W和#G紫色装备#W才能进行装备转换！"  
















--DECLARE_QUEST_INFO_STOP--







function x800092_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800092_var_QuestName1)
			TalkAppendString(varMap,x800092_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800092_var_FileId, x800092_var_QuestName1)

end









function x800092_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800092_var_FileId, x800092_var_QuestName1,13,1)



	
end









function x800092_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800092_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800092_ProcAccept( varMap, varPlayer )
	
end









function x800092_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800092_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800092_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800092_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800092_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800092_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800092_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800092_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800092_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800092_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800092_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800092_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800092_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800092_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800092_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
