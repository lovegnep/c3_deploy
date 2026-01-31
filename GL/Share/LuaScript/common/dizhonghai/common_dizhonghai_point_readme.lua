

--DECLARE_QUEST_INFO_START--
x270206_var_FileId = 270206












x270206_var_QuestName1="【卡迪兹征服度说明】"
x270206_var_QuestInfo1="\t卡迪兹征服度代表着大元帝国征战卡迪兹港的进度。每位玩家完成一次卡迪兹港任务后，卡迪兹港征服度都会增加。\n\t当卡迪兹港征服度到达"..POINT_KADIZI_TRANS.."点后，玩家可以从威海港直接传送到卡迪兹港口。\n\t当卡迪兹港征服度到达5000点后，玩家每天在卡迪兹港口有可能接到新的任务。\n \n当卡迪兹港的征服度满了之后，将开始征服帕尔马港\n \n\t当前卡迪兹港征服度为：#R%d点#W。"  

















--DECLARE_QUEST_INFO_STOP--







function x270206_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
			local point = GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) 
			if point <= 0 then
					point = 0
			end		

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x270206_var_QuestName1)
			TalkAppendString(varMap,format(x270206_var_QuestInfo1,point))
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x270206_var_FileId, x270206_var_QuestName1)

end









function x270206_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x270206_var_FileId, x270206_var_QuestName1,13,1)



	
end









function x270206_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x270206_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x270206_ProcAccept( varMap, varPlayer )
	
end









function x270206_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x270206_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x270206_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x270206_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x270206_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x270206_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x270206_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x270206_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x270206_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x270206_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270206_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270206_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270206_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270206_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270206_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
