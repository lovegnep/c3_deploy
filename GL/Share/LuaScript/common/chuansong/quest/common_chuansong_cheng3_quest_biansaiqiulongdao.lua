

--DECLARE_QUEST_INFO_START--
x550652_var_FileId = 550652
x550652_var_QuestId = 1527
x550652_var_LevelLess	= 	1 
x550652_var_QuestIdPre= -1
x550652_var_QuestIdNext = -1
x550652_var_QuestHelp =	""
x550652_var_QuestName="启动边塞囚龙滩传送"
x550652_var_QuestInfo="#cffcf00您开通了#G囚龙滩#W#cffcf00传送！#W"  
x550652_var_QuestTarget=""		
x550652_var_QuestCompleted=""					
x550652_var_ContinueInfo=""


x550652_var_BonusMoney1 =10000
x550652_var_BonusMoney2 =0
x550652_var_BonusMoney3 =0
x550652_var_BonusItem	=	{}
x550652_var_BonusChoiceItem ={}
x550652_var_ExpBonus = 0
x550652_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550652_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550652_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550652_var_QuestId) > 0 then
			return 
		else
				Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550652_var_QuestInfo,x550652_var_BonusMoney1),8,3)
				QuestCom(varMap,varPlayer,varQuest)
				if x550652_var_BonusMoney1 > 0 then
				AddExp(varMap, varPlayer,x550652_var_BonusMoney1)
				end
		end
	else 
			return
	end		
end









function x550652_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550652_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550652_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550652_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550652_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550652_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550652_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550652_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550652_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550652_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550652_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550652_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550652_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550652_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550652_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550652_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550652_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550652_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
