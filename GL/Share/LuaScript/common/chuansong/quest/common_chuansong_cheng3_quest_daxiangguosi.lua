

--DECLARE_QUEST_INFO_START--
x550662_var_FileId = 550662
x550662_var_QuestId = 1547
x550662_var_LevelLess	= 	1 
x550662_var_QuestIdPre= -1
x550662_var_QuestIdNext = -1
x550662_var_QuestHelp =	""
x550662_var_QuestName="启动大相国寺传送"
x550662_var_QuestInfo="#cffcf00您开通了#G大相国寺#W#cffcf00传送！#W"  
x550662_var_QuestTarget=""		
x550662_var_QuestCompleted=""					
x550662_var_ContinueInfo=""


x550662_var_BonusMoney1 =0
x550662_var_BonusMoney2 =0
x550662_var_BonusMoney3 =0
x550662_var_BonusItem	=	{}
x550662_var_BonusChoiceItem ={}
x550662_var_ExpBonus = 10000
x550662_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550662_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550662_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550662_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550662_var_QuestInfo,x550662_var_ExpBonus),8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550662_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550662_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550662_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550662_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550662_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550662_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550662_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550662_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550662_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550662_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550662_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550662_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550662_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550662_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550662_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550662_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550662_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550662_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550662_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550662_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
