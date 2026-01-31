

--DECLARE_QUEST_INFO_START--
x550657_var_FileId = 550657
x550657_var_QuestId = 1618
x550657_var_LevelLess	= 	1 
x550657_var_QuestIdPre= -1
x550657_var_QuestIdNext = -1
x550657_var_QuestHelp =	""
x550657_var_QuestName="启动王国右下传送"
x550657_var_QuestInfo="#cffcf00您开通了#G瀚月关#W#cffcf00传送！#W"  
x550657_var_QuestTarget=""		
x550657_var_QuestCompleted=""					
x550657_var_ContinueInfo=""


x550657_var_BonusMoney1 =0
x550657_var_BonusMoney2 =0
x550657_var_BonusMoney3 =0
x550657_var_BonusItem	=	{}
x550657_var_BonusChoiceItem ={}
x550657_var_ExpBonus = 500
x550657_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550657_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550657_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550657_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550657_var_QuestInfo,x550657_var_ExpBonus),8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550657_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550657_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550657_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550657_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550657_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550657_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550657_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550657_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550657_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550657_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550657_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550657_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550657_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550657_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550657_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550657_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550657_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550657_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550657_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550657_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
