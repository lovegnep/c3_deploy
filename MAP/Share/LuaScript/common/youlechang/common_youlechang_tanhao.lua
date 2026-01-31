

--DECLARE_QUEST_INFO_START--
x310347_var_FileId = 310347
x310347_var_QuestIdPre =-1
x310347_var_QuestId = 9090
x310347_var_LevelLess	= 	65 
x310347_var_QuestIdNext = 3709
x310347_var_Name	={}
x310347_var_ExtTarget={{type=20,n=1,target="抓到一匹@npc_134027"}}
x310347_var_QuestName="【新手】白鹿长老的考验"
x310347_var_QuestInfo="\t在成吉思汗的世界中，想要成为真正的英雄，一匹好马是你必不可少的伙伴。\n\t看见我身后的这些马了吧，你只要将滑鼠移动到小马驹身上，点击左键就可以捕捉了。\n\t现在，按我教给你的方法，去选择一匹来做为你第一个伙伴吧。"  
x310347_var_QuestTarget="抓到一匹@npc_134027"		
x310347_var_QuestCompleted="\t牢记驯服它们的方法，可能今后你将会得到更多更好的坐骑。"					
x310347_var_ContinueInfo="\t你驯服它了么？"
x310347_var_QuestHelp =	"#G将鼠标移动至#R马匹#G上，点击#R左键#G一下，耐心等待抓马读条完毕，系统会提示您捕捉#R完成#G，如果失败了，很可能是由于您和马的#R距离过远#G导致的，您只需要#R靠近马匹#G，重新抓一次即可。#W"
x310347_var_DemandItem ={}
x310347_var_ExpBonus = 310
x310347_var_BonusMoney1 =5				
x310347_var_BonusMoney2 =0
x310347_var_BonusMoney3 =0
x310347_var_BonusMoney4 =0
x310347_var_BonusMoney5 =12
x310347_var_BonusMoney6 =0
x310347_var_BonusItem	=	{}
x310347_var_BonusChoiceItem ={}
x310347_var_NpcGUID = {}
--DECLARE_QUEST_INFO_STOP--


function x310347_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)   

	if GetLevel( varMap, varPlayer)>2 then
		return
	end
end

function x310347_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		
end


function x310347_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	
end


function x310347_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end

function x310347_CheckSubmit( varMap, varPlayer, varTalknpc)

end

function x310347_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

end


function x310347_ProcQuestAbandon(varMap, varPlayer, varQuest)

end

function x310347_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	
end

function x310347_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end

function x310347_GetBonus( varMap, varPlayer,varTalknpc)

end

function x310347_Msg2toplayer( varMap, varPlayer,type)

end

function x310347_ProcQuestHorseChanged(varMap, varPlayer, horseId, varQuest)
	x310347_CheckSubmit( varMap, varPlayer)
end

function x310347_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x310347_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x310347_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x310347_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x310347_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x310347_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x310347_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310347_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310347_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310347_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310347_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310347_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
