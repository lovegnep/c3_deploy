

--DECLARE_QUEST_INFO_START--
x570051_var_FileId = 570051












x570051_var_QuestName1="【骑乘繁殖说明】"
x570051_var_QuestInfo1="\t骑乘繁殖可以通过两个#G同类型#W的#G一代宝宝#W骑乘，繁殖出属性更高的#G变异#W骑乘。骑乘繁殖消耗银币。\n#Y操作说明#W：\n\t1.与王国#G骑乘繁殖大师#W或大都#G骑乘繁殖大师#W对话。\n\t2.选择#G骑乘繁殖#W选项，打开骑乘繁殖介面。\n\t3.在骑乘繁殖介面左方主骑乘下拉条中选择主骑乘。\n\t4.在骑乘繁殖介面右方主骑乘下拉条中选择副骑乘。\n#Y注意#W：\n\t1.主骑乘等级不可低于60级。\n\t2.繁殖后主、副骑乘都将失去。\n\t3.繁殖出的骑乘#G资质#W保留主骑乘的资质并有所提升。\n\t4.繁殖出的骑乘保留主骑乘的所有#G技能#W。\n\t5.繁殖出的骑乘的#G初始基础属性#W和副骑乘的初始属性一致。\n\t6.繁殖出的骑乘#G等级#W为1级。"  
















--DECLARE_QUEST_INFO_STOP--







function x570051_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570051_var_QuestName1)
			TalkAppendString(varMap,x570051_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x570051_var_FileId, x570051_var_QuestName1)

end









function x570051_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x570051_var_FileId, x570051_var_QuestName1,13,1)



	
end









function x570051_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x570051_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x570051_ProcAccept( varMap, varPlayer )
	
end









function x570051_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x570051_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x570051_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x570051_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x570051_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x570051_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x570051_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x570051_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x570051_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x570051_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x570051_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x570051_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570051_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x570051_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x570051_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
