

--DECLARE_QUEST_INFO_START--
x550534_var_FileId = 550534
x550534_var_QuestId = 1516
x550534_var_LevelLess	= 	1 
x550534_var_QuestIdPre= -1
x550534_var_QuestIdNext = -1
x550534_var_QuestHelp =	""
x550534_var_QuestName="启动草原塔塔尔部传送"
x550534_var_QuestInfo="#cffcf00您已经开通了#G草原塔塔尔部#W#cffcf00传送！#W"  
x550534_var_QuestTarget=""		
x550534_var_QuestCompleted=""					
x550534_var_ContinueInfo=""


x550534_var_BonusMoney1 =0
x550534_var_BonusMoney2 =0
x550534_var_BonusMoney3 =0
x550534_var_BonusItem	=	{}
x550534_var_BonusChoiceItem ={}
x550534_var_ExpBonus = 0
x550534_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550534_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
		return
end








function x550534_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550534_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550534_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550534_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550534_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550534_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550534_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550534_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550534_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550534_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550534_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550534_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550534_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550534_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550534_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550534_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550534_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550534_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550534_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550534_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550534_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550534_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550534_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
