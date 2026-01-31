

--DECLARE_QUEST_INFO_START--
x800114_var_FileId = 800114












x800114_var_QuestName1="【时装纹龙说明】"
x800114_var_QuestInfo1="\t时装纹龙可以提升时装的属性，龙的数量越多提升的属性越高。纹龙需要消耗金龙印道具（天上人间·梦聊内挖宝大作战发布人、天降魔君发布人、倩女幽魂发布人、画皮副本发布人、时装纹龙大师处兑换而来）。时装最多可以纹龙五次，五龙时装的强大是不言而喻的。\n \n#Y操作说明#W：\n\t1.与王城外装大师、大都外装大师或梦聊中时装纹龙大师对话。\n\t2.选择时装纹龙选项，打开时装纹龙介面。\n\t3.将所要纹龙的时装放入到时装纹龙介面左上方格子内。\n\t4.选择纹龙使用的道具。\n\t5.点击介面下方纹龙按钮开始给时装纹龙。\n\t6.如果需要使用自动纹龙的模块，则可以在选择自动纹龙等级的下拉条内，选择自动纹龙等级，点击自动纹龙按钮即可。当银币或金龙印不足或纹龙已到选择的等级和最高级时，都会自动停止纹龙。\n \n#Y注意事项#W：\n\t#G85级以上#W的玩家才能使用该模块。\n\t时装最多可纹龙五次；当符合操作条件时，每次纹龙一定会达成。"  
















--DECLARE_QUEST_INFO_STOP--







function x800114_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800114_var_QuestName1)
			TalkAppendString(varMap,x800114_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800114_var_FileId, x800114_var_QuestName1)

end









function x800114_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800114_var_FileId, x800114_var_QuestName1,13,1)



	
end









function x800114_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800114_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800114_ProcAccept( varMap, varPlayer )
	
end









function x800114_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800114_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800114_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800114_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800114_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800114_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800114_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800114_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800114_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800114_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800114_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800114_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800114_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800114_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800114_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
