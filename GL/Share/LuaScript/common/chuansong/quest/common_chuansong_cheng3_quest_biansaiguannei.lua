

--DECLARE_QUEST_INFO_START--
x550653_var_FileId = 550653
x550653_var_QuestId = 1528
x550653_var_LevelLess	= 	1 
x550653_var_QuestIdPre= -1
x550653_var_QuestIdNext = -1
x550653_var_QuestHelp =	""
x550653_var_QuestName="启动边塞关内传送"
x550653_var_QuestInfo="#cffcf00您开通了#G关内#W#cffcf00传送！#W"  
x550653_var_QuestTarget=""		
x550653_var_QuestCompleted=""					
x550653_var_ContinueInfo=""


x550653_var_BonusMoney1 =10000
x550653_var_BonusMoney2 =0
x550653_var_BonusMoney3 =0
x550653_var_BonusItem	=	{}
x550653_var_BonusChoiceItem ={}
x550653_var_ExpBonus = 0
x550653_var_NpcGUID =0
--DECLARE_QUEST_INFO_STOP--







function x550653_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

			return
	
end








function x550653_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	if GetSceneRelation(varMap, varPlayer, varMap) == 1 then
		if IsQuestHaveDone(varMap, varPlayer, x550653_var_QuestId) > 0 then
			return 
		else
				Msg2Player(varMap,varPlayer,format("%s#cffcf00获得#G%d#cffcf00经验", x550653_var_QuestInfo,x550653_var_BonusMoney1),8,3)
				QuestCom(varMap,varPlayer,varQuest)
				if x550653_var_BonusMoney1 > 0 then
				AddExp(varMap, varPlayer,x550653_var_BonusMoney1)
				end
				
		end
	else 
			return
	end		
end









function x550653_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end








function x550653_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550653_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end









function x550653_ProcQuestAbandon(varMap, varPlayer, varQuest)

end








function x550653_CheckSubmit( varMap, varPlayer, varTalknpc)

end







function x550653_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end


function x550653_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end







function x550653_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	 

end









function x550653_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x550653_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x550653_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end









function x550653_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x550653_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x550653_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x550653_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550653_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x550653_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x550653_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
