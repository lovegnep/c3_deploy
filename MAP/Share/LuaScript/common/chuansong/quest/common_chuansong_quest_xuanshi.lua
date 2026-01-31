

--DECLARE_QUEST_INFO_START--
x550513_var_FileId = 550513
x550513_var_QuestId = 1503
x550513_var_LevelLess	= 	1 
x550513_var_QuestIdPre= -1
x550513_var_QuestIdNext = -1
x550513_var_QuestHelp =	""
x550513_var_QuestName="启动王国边塞河西走廊传送"
x550513_var_QuestInfo="#cffcf00您已经开通了#G河西走廊#W#cffcf00传送！#W"  
x550513_var_QuestTarget=""		
x550513_var_QuestCompleted=""					
x550513_var_ContinueInfo=""


x550513_var_BonusMoney1 =0
x550513_var_BonusMoney2 =0
x550513_var_BonusMoney3 =0
x550513_var_BonusItem	=	{}
x550513_var_BonusChoiceItem ={}
x550513_var_ExpBonus = 10000
x550513_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550513_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

		return
	
end








function x550513_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550513_var_QuestId) > 0 then
			return 
		else
			QuestCom(varMap,varPlayer,varQuest)
			if x550513_var_ExpBonus > 0 then
				Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550513_var_QuestInfo,x550513_var_ExpBonus),8,3)
				AddExp(varMap, varPlayer,x550513_var_ExpBonus)
			end
		end
	else 
			return
	end		
end









function x550513_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550513_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550513_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550513_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550513_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550513_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550513_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550513_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550513_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550513_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550513_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550513_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550513_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550513_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550513_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550513_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550513_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550513_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
