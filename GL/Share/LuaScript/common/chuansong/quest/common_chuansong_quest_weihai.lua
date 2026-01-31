

--DECLARE_QUEST_INFO_START--
x550538_var_FileId = 550538
x550538_var_QuestId = 1520
x550538_var_LevelLess	= 	1 
x550538_var_QuestIdPre= -1
x550538_var_QuestIdNext = -1
x550538_var_QuestHelp =	""
x550538_var_QuestName="启动王城中心广场传送"
x550538_var_QuestInfo="#cffcf00您已经开通了#G中心广场#W#cffcf00传送！#W"  
x550538_var_QuestTarget=""		
x550538_var_QuestCompleted=""					
x550538_var_ContinueInfo=""


x550538_var_BonusMoney1 =0
x550538_var_BonusMoney2 =0
x550538_var_BonusMoney3 =0
x550538_var_BonusItem	=	{}
x550538_var_BonusChoiceItem ={}
x550538_var_ExpBonus = 500
x550538_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550538_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	
	return
	
	
end








function x550538_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550538_var_QuestId) > 0 then
			return 
		else
			QuestCom(varMap,varPlayer,varQuest)
			if x550538_var_ExpBonus > 0 then
				Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550538_var_QuestInfo,x550538_var_ExpBonus),8,3)
				AddExp(varMap, varPlayer,x550538_var_ExpBonus)
			end
		end
	else 
			return
	end	
end









function x550538_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550538_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550538_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550538_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550538_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550538_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550538_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550538_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550538_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550538_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550538_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550538_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550538_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550538_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550538_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550538_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550538_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550538_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
