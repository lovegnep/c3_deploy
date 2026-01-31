

--DECLARE_QUEST_INFO_START--
x310707_var_FileId = 310707












x310707_var_QuestName1="【大师专属制造说明】"
x310707_var_QuestInfo1="\t大师专属制造可以通过本门手艺的高超技巧制作出各种珍贵物品。\n#Y详细说明#W：\n#G草药大师#W可以制作：\n\t五行神力丸（3个/次）\n\t五行仙火丸（3个/次）\n\t五行魔道丸（3个/次）\n#G珠宝大师#W可以制作：\n\t大师级红龙晶（1个/次）\n\t大师级绿龙晶（1个/次）\n\t大师级黄龙晶（1个/次）\n\t大师级蓝龙晶（1个/次）\n\t大师级金光石（1个/次）\n\t宗师级洗石剂（1个/次）\n\t炼银钻（1个/次）\n#G驯马大师#W可以制作：\n\t骑术强化符：一级健体（3个/次）\n\t骑术强化符：一级蛮力（3个/次）\n\t骑术强化符：一级聪慧（3个/次）\n\t骑术强化符：一级追影（3个/次）\n\t骑术强化符：一级全能（3个/次）\n#G锻造大师#W可以制作：\n\t暴击神水（3个/次）\n\t血银钻（1个/次）\n#G铸甲大师#W可以制作：\n\t一级碎甲丸（3个/次）\n\t一级穿甲丸（3个/次）\n\t一级熔甲丸（3个/次）\n\t淬银钻（1个/次）\n#G工艺大师#W可以制作：\n\t乱士符（5个/次）\n\t优质符文布（10个/次）\n\t玄银钻（1个/次）"  
x310707_var_QuestInfo2="#Y注意事项#W：\n\t#R大师级专属制造的物品共用冷却时间——23小时。#W即：在制作了以上任意物品一次之后，23小时内不能再制作大师专属制造的物品。"  















--DECLARE_QUEST_INFO_STOP--







function x310707_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310707_var_QuestName1)
			TalkAppendString(varMap,x310707_var_QuestInfo1)
            TalkAppendString(varMap,x310707_var_QuestInfo2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310707_var_FileId, x310707_var_QuestName1)

end









function x310707_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x310707_var_FileId, x310707_var_QuestName1,13,1)



	
end









function x310707_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x310707_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310707_ProcAccept( varMap, varPlayer )
	
end









function x310707_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310707_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310707_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310707_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310707_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310707_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310707_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310707_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310707_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310707_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310707_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310707_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310707_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310707_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310707_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
