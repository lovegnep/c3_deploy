

--DECLARE_QUEST_INFO_START--
x550590_var_FileId = 550590
x550590_var_QuestId = 1604
x550590_var_LevelLess	= 	1 
x550590_var_QuestIdPre= -1
x550590_var_QuestIdNext = -1
x550590_var_QuestHelp =	""
x550590_var_QuestName="启动卡迪兹港传送"
x550590_var_QuestInfo="#cffcf00您已经开通了#G卡迪兹港#W#cffcf00传送！#W"  
x550590_var_QuestTarget=""		
x550590_var_QuestCompleted=""					
x550590_var_ContinueInfo=""


x550590_var_BonusMoney1 =0
x550590_var_BonusMoney2 =0
x550590_var_BonusMoney3 =0
x550590_var_BonusItem	=	{}
x550590_var_BonusChoiceItem ={}
x550590_var_ExpBonus = 0
x550590_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550590_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	
	return
	
	
end








function x550590_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550590_var_QuestId) > 0 then
			return 
		else
			Msg2Player(varMap,varPlayer,x550590_var_QuestInfo,8,3)
			QuestCom(varMap,varPlayer,varQuest)
			if x550590_var_ExpBonus > 0 then
				AddExp(varMap, varPlayer,x550590_var_ExpBonus)
			end
		end
	else 
			return
	end	
end









function x550590_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550590_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550590_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550590_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550590_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550590_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550590_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550590_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550590_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550590_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550590_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550590_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550590_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550590_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550590_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550590_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550590_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550590_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
