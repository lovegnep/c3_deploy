

--DECLARE_QUEST_INFO_START--
x550651_var_FileId = 550651
x550651_var_QuestId = 1526
x550651_var_LevelLess	= 	1 
x550651_var_QuestIdPre= -1
x550651_var_QuestIdNext = -1
x550651_var_QuestHelp =	""
x550651_var_QuestName="启动边塞回鹘部传送"
x550651_var_QuestInfo="#cffcf00您开通了#G回鹘部#W#cffcf00传送！#W"  
x550651_var_QuestTarget=""		
x550651_var_QuestCompleted=""					
x550651_var_ContinueInfo=""


x550651_var_BonusMoney1 =10000
x550651_var_BonusMoney2 =0
x550651_var_BonusMoney3 =0
x550651_var_BonusItem	=	{}
x550651_var_BonusChoiceItem ={}
x550651_var_ExpBonus = 0
x550651_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550651_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550651_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550651_var_QuestId) > 0 then
			return 
		else
				Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550651_var_QuestInfo,x550651_var_BonusMoney1),8,3)
				QuestCom(varMap,varPlayer,varQuest)
				if x550651_var_BonusMoney1 > 0 then
				AddExp(varMap, varPlayer,x550651_var_BonusMoney1)
				end
		end
	else 
			return
	end		
end









function x550651_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550651_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550651_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550651_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550651_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550651_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550651_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550651_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550651_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550651_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550651_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550651_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550651_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550651_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550651_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550651_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550651_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550651_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
