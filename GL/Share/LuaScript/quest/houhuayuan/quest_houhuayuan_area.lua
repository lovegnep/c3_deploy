

--DECLARE_QUEST_INFO_START--
x203344_var_FileId = 203344
x203344_var_QuestIdPre =-1
x203344_var_QuestId = 3230
x203344_var_LevelLess	= 	1
x203344_var_QuestIdNext = 3254
x203344_var_Name	={}
x203344_var_ExtTarget={{type=20,n=1,target="找到@npc_125005"}}
x203344_var_QuestName="【新手】武器的进阶"
x203344_var_QuestInfo="\t你已经对自己职业有了充分的认识，那么，去我周围的武器之灵那里找到更强大的兵器吧。"  
x203344_var_QuestTarget="找到@npc_125005"		
x203344_var_QuestCompleted="\t你似乎被武器之灵的呼唤所指引，轻轻的伸出双手接住了你的新武器。"					
x203344_var_ContinueInfo="难道你还不知道最适合你的武器是弓吗？"
x203344_var_QuestHelp =	"#G你只需要耐心观察，哪一把武器之灵有着黄色的问号，那么它就会给你合适的兵器。#W"
x203344_var_DemandItem ={}
x203344_var_ExpBonus = 800
x203344_var_BonusMoney1 =200
x203344_var_BonusMoney2 =0
x203344_var_BonusMoney3 =0
x203344_var_BonusMoney4 =0
x203344_var_BonusMoney5 =0
x203344_var_BonusMoney6 =0
x203344_var_BonusChoiceItem ={}
x203344_var_BonusItem	=	{{item=10030010,n=1}}
x203344_var_NpcGUID ={{ guid = 125005, varName = "弓"} }
--DECLARE_QUEST_INFO_STOP--


function x203344_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	return 1
end

function x203344_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
return 1
end


function x203344_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
return 1
end


function x203344_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x203344_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203344_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )                                                               
	     return 1
end


function x203344_ProcQuestAbandon(varMap, varPlayer, varQuest)
			return 1
end

function x203344_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	return 1
end

function x203344_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	return 1
end

function x203344_GetBonus( varMap, varPlayer,varTalknpc)
return 1
end

function x203344_Msg2toplayer( varMap, varPlayer,type)
	return 1
end

function x203344_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203344_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	
  if IsHaveQuest(varMap,varPlayer, 2287) <= 0 then
		return 0
	end

	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,2287)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )     
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		LuaCallNoclosure( 203335, "CreateNpc",varMap, varPlayer, 203344, 2287 )
	end


	return 1
end

function x203344_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203344_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203344_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203344_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203344_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203344_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203344_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203344_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203344_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203344_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
