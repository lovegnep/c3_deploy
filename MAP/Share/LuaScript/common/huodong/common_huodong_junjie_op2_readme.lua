

--DECLARE_QUEST_INFO_START--
x310935_var_FileId = 310935












x310935_var_QuestName1="【老玩家回归活动说明】"
x310935_var_QuestInfo1="\t欢迎回归成吉思汗3 恶狼传说，更多、更新、更精彩的玩法等着您来体验。\n \n\t#W作为成吉思汗的老朋友，您如果在#G2011年6月9日9:00至6月16日24：00#W期间军阶等级到达#R镇戍精锐#W或更高军阶等级，就可以在#G此期间内#W找我领取一份#G老玩家镇戌大礼包#W。\n \n\t如果在#G2011年7月19日9:00至7月26日24：00#W期间军阶等级到达#R下十户长#W或更高军阶等级，就可以在#G此期间内#W找我领取一份#G老玩家十户长大礼包#W。\n \n\t打开礼包就能获得中生命清露、紫檀木炭、原生钻石矿等大量珍稀道具，期待您的参与。"  
















--DECLARE_QUEST_INFO_STOP--







function x310935_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310935_var_QuestName1)
			TalkAppendString(varMap,x310935_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310935_var_FileId, x310935_var_QuestName1)

end









function x310935_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		if IsQuestHaveDoneNM( varMap, varPlayer, 4396 ) == 1 or IsHaveQuest(varMap,varPlayer, 4396) > 0 then
				TalkAppendButton(varMap, x310935_var_FileId, x310935_var_QuestName1,13,1)
		end
end









function x310935_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x310935_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310935_ProcAccept( varMap, varPlayer )
	
end









function x310935_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310935_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310935_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310935_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310935_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310935_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310935_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310935_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310935_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310935_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310935_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310935_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310935_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310935_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310935_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
