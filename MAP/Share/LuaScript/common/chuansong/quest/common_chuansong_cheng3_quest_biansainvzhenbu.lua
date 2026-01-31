

--DECLARE_QUEST_INFO_START--
x550650_var_FileId = 550650
x550650_var_QuestId = 1525
x550650_var_LevelLess	= 	1 
x550650_var_QuestIdPre= -1
x550650_var_QuestIdNext = -1
x550650_var_QuestHelp =	""
x550650_var_QuestName="启动边塞女真部传送"
x550650_var_QuestInfo="#cffcf00您开通了#G边塞女真部#W#cffcf00传送！#W"  
x550650_var_QuestTarget=""		
x550650_var_QuestCompleted=""					
x550650_var_ContinueInfo=""


x550650_var_BonusMoney1 =10000
x550650_var_BonusMoney2 =0
x550650_var_BonusMoney3 =0
x550650_var_BonusItem	=	{}
x550650_var_BonusChoiceItem ={}
x550650_var_ExpBonus = 0
x550650_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550650_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
			return
	
end








function x550650_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550650_var_QuestId) > 0 then
			return 
		else
				Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550650_var_QuestInfo,x550650_var_BonusMoney1),8,3)
				QuestCom(varMap,varPlayer,varQuest)
				if x550650_var_BonusMoney1 > 0 then
				AddExp(varMap, varPlayer,x550650_var_BonusMoney1)
				end
		end
	else 
			return
	end		
end









function x550650_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550650_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550650_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550650_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550650_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550650_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550650_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550650_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550650_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550650_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550650_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550650_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550650_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550650_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550650_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550650_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550650_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550650_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
