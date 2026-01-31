

--DECLARE_QUEST_INFO_START--
x550660_var_FileId = 550660
x550660_var_QuestId = 3898
x550660_var_LevelLess	= 	1 
x550660_var_QuestIdPre= -1
x550660_var_QuestIdNext = -1
x550660_var_QuestHelp =	""
x550660_var_QuestName="启动太行山传送"
x550660_var_QuestInfo="#cffcf00您开通了#G太行山#W#cffcf00传送！#W"  
x550660_var_QuestTarget=""		
x550660_var_QuestCompleted=""					
x550660_var_ContinueInfo=""


x550660_var_BonusMoney1 =0
x550660_var_BonusMoney2 =0
x550660_var_BonusMoney3 =0
x550660_var_BonusItem	=	{}
x550660_var_BonusChoiceItem ={}
x550660_var_ExpBonus = 10000
x550660_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550660_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550660_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550660_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550660_var_QuestInfo,x550660_var_ExpBonus),8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550660_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550660_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550660_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550660_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550660_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550660_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550660_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550660_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550660_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550660_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550660_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550660_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550660_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550660_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550660_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550660_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550660_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550660_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550660_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550660_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
