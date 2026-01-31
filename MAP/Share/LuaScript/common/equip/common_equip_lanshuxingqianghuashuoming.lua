

--DECLARE_QUEST_INFO_START--
x800090_var_FileId = 800090












x800090_var_QuestName1="【装备鎏金（洗蓝）说明】"
x800090_var_QuestInfo1="\t装备鎏金（洗蓝）会对装备已有的蓝属性进行随机强化。鎏金后该装备某些蓝属性的数值将得到提升。\n\t装备鎏金（洗蓝）所需的道具为：海蓝精金（战场积分商店出售），炫彩精金（天上人间·梦聊中天降魔君玩法产出），晕光精金（天上人间·梦聊中挖宝大作战玩法产出），水火精金（威望商店出售），每次鎏金时，所有洗蓝强化值会重新分配。鎏金次数越多蓝属性能够得到的提升越高。每件装备最多可以鎏金9次。玩家等级与装备等级的差值决定目前玩家可以对该装备鎏金的次数。\n\t#R注意：#G命中、闪避、暴击、韧性、暴击伤害#R属性每鎏金三次才能上升1点。\n#Y操作说明#W：\n\t1.与王国#G装备鎏金大师#W或大都#G装备鎏金大师#W对话。\n\t2.选择#G装备鎏金（洗蓝）#W选项。\n\t3.将黄色或紫色装备放入到装备鎏金（洗蓝）介面左上方格子内。\n\t4.点击介面下方鎏金按钮。"  
x800090_var_QuestInfo2="#Y注意事项#W：\n\t1.只能强化#G力量、敏捷、智力、体质、全属性、攻击、防御、生命上限、命中、闪避、暴击、韧性、暴击伤害#W属性;#G命中、闪避、暴击、韧性、暴击伤害#W属性每鎏金三次才能上升1点。\n\t2.只有#G3孔以上等级不低于80级的装备#W才能使用此模块。\n\t3.只有#G黄色装备#W和#G紫色装备#W才能使用此模块。\n\t4.#G已绑定#W的装备才能进行装备鎏金。\n\t5.装备80～99级，每2级鎏金1次；\n\t  装备100～160级，无需等级提升即可鎏金。"  















--DECLARE_QUEST_INFO_STOP--







function x800090_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800090_var_QuestName1)
			TalkAppendString(varMap,x800090_var_QuestInfo1)
			TalkAppendString(varMap,x800090_var_QuestInfo2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x800090_var_FileId, x800090_var_QuestName1)

end









function x800090_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x800090_var_FileId, x800090_var_QuestName1,13,1)



	
end









function x800090_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x800090_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x800090_ProcAccept( varMap, varPlayer )
	
end









function x800090_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x800090_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x800090_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x800090_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x800090_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x800090_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x800090_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x800090_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x800090_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x800090_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x800090_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x800090_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800090_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x800090_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x800090_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
