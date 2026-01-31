

--DECLARE_QUEST_INFO_START--
x800077_var_FileId = 800077












x800077_var_QuestName1="【宝石升级说明】"
x800077_var_QuestInfo1="\t宝石升级可以提升宝石等级，增加宝石提升的属性值。宝石升级消耗银币及洗石剂。\n#Y操作说明#W：\n\t1.与王国#G装备镶嵌大师#W或大都#G装备镶嵌大师#W对话。\n\t2.选择#G宝石升级#W选项，打开宝石升级介面。\n\t3.将装备放入到宝石升级介面左上方格子内。\n\t4.点击介面下方升级按钮。\n#Y注意事项#W：\n\t可升级的宝石包括：#G红变石#W、#G红琥珀#W、#G红锆石#W、#G绿柱石#W、#G绿晶石#W、#G绿碧玺#W、#G黄刚玉#W、#G黄锆石#W、#G黄琉璃#W、#G蓝玛瑙#W。"  
















--DECLARE_QUEST_INFO_STOP--







function x800077_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800077_var_QuestName1)
			TalkAppendString(varMap,x800077_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800077_var_FileId, x800077_var_QuestName1)

end









function x800077_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800077_var_FileId, x800077_var_QuestName1,13,1)



	
end









function x800077_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800077_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800077_ProcAccept( varMap, varPlayer )
	
end









function x800077_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800077_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800077_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800077_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800077_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800077_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800077_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800077_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800077_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800077_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800077_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800077_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800077_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800077_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800077_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
