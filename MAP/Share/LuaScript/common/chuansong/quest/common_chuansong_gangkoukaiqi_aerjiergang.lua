

--DECLARE_QUEST_INFO_START--
x550595_var_FileId = 550595
x550595_var_QuestId = 1609
x550595_var_LevelLess	= 	1 
x550595_var_QuestIdPre= -1
x550595_var_QuestIdNext = -1
x550595_var_QuestHelp =	""
x550595_var_QuestName="启动阿尔及尔港传送"
x550595_var_QuestInfo="#cffcf00您已经开通了#G阿尔及尔港#W#cffcf00传送！#W"  
x550595_var_QuestTarget=""		
x550595_var_QuestCompleted=""					
x550595_var_ContinueInfo=""


x550595_var_BonusMoney1 =0
x550595_var_BonusMoney2 =0
x550595_var_BonusMoney3 =0
x550595_var_BonusItem	=	{}
x550595_var_BonusChoiceItem ={}
x550595_var_ExpBonus = 0
x550595_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550595_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	
	return
	
	
end








function x550595_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550595_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550595_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550595_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550595_var_ExpBonus)
			end
		end
	else 
			return
	end	
end









function x550595_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550595_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550595_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550595_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550595_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550595_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550595_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550595_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550595_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550595_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550595_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550595_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550595_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550595_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550595_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550595_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550595_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550595_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
