

--DECLARE_QUEST_INFO_START--
x800093_var_FileId = 800093












x800093_var_QuestName1="【职业转换说明】"
x800093_var_QuestInfo1="\t在成吉思汗3 恶狼传说中新增了6个职业，我可以帮你转职为对应的新职业。\n\t在转换职业时，你需要一个#G职业转换符#W和一定数量的金钱。\n\t具体职业转换对应为：\n\t#G突厥武士#W可转职为#G地中海十字军#W\n\t#G江南剑侠#W可转职为#G西域圣火使#W\n\t#G蒙古骑射手#W可转职为#G西夏刺客#W\n\t#G中原火枪手#W可转职为#G蒙古近卫军#W\n\t#G波斯先知#W可转职为#G斯拉夫隐修士#W\n\t#G雪山萨满#W可转职为#G高原僧侣#W\n#Y注意事项#W：\n\t在转职之后，你的原有技能也会随之转换，但装备不会发生变化，您还需要进行装备转换来获取新职业的装备。"  
















--DECLARE_QUEST_INFO_STOP--







function x800093_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800093_var_QuestName1)
			TalkAppendString(varMap,x800093_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800093_var_FileId, x800093_var_QuestName1)

end









function x800093_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800093_var_FileId, x800093_var_QuestName1,13,1)



	
end









function x800093_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800093_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800093_ProcAccept( varMap, varPlayer )
	
end









function x800093_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800093_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800093_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800093_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800093_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800093_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800093_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800093_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800093_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800093_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800093_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800093_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800093_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800093_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800093_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
