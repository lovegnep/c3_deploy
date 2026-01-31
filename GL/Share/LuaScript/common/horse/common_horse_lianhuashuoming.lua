

--DECLARE_QUEST_INFO_START--
x920009_var_FileId = 920009












x920009_var_QuestName1="【骑乘炼化说明】"
x920009_var_QuestInfo1="\t骑乘炼化可以将两只#G40级以上#R非成年非绑定#W的骑乘，炼化为一只新的骑乘。新骑乘外形、资质、属性点、技能等选取范围取决于炼化的两只骑乘的相关属性。#G每人每天只能进行一次骑乘炼化#W。"  

x920009_var_QuestCompleted1="#Y【骑乘外形继承说明】#W\n\t\从所提供的两只骑乘外形之中，随机选取一个作为新骑乘的外形，如果参与炼化的骑乘都为异形骑乘，则有几率炼出#G天龙#W、#G青螭#W等稀有骑乘，这些稀有骑乘可以继续用来下次炼化。"
x920009_var_QuestCompleted2="#Y【骑乘属性点和资质继承说明】#W\n\t\根据炼化的两只骑乘的各项资质（原始属性点），炼化后的每项资质（原始属性点）在原有两只骑乘各项资质（原始属性点）的最低和最高之间随机取值。两只炼化的骑乘之中有一只骑乘为变异的，则合出骑乘为变异的（使用道具固本丹和合出稀有骑乘情况例外，有关稀有骑乘请查看“骑乘外形继承说明”）。\n\t#G注：本说明提及的属性点均为骑乘的初始1级时的属性点。"
x920009_var_QuestCompleted3="#Y【骑乘技能继承说明】#W\n\t根据炼化的两只骑乘所拥有的技能，随机分配，有可能产生出#R拥有互斥技能的骑乘#W（互斥技能可分别使用高级技能书升级，不会相互影响），当然也有可能#R失去很多原有技能#W。\n \n提示：\n\t1.炼化时副骑乘为异兽时，合出更多技能的几率更高。\n\t2.炼化出骑乘的主动技能个数不会超过主或副骑乘中主动技能格最大开格的数量。"
x920009_var_QuestCompleted4="#Y【骑乘等级及携带等级继承说明】#W\n\t根据炼化出骑乘的外形决定新骑乘的携带等级，如炼化出的骑乘为天鹅，则其携带等级为30级。\n\t炼化出的骑乘等级取主骑乘的等级。"
x920009_var_ContinueInfo1="#Y【道具固本丹说明】#W\n\t使用了道具#G固本丹#W，炼化出的新骑乘外形、代数、资质和属性点等同于主骑乘的外形、代数、资质和属性点，对骑乘的主动技能和被动技能继承没有影响。\n\t使用道具固本丹，不会影响炼化出稀有骑乘的几率，且使用道具固本丹后，炼出的稀有骑乘各项资质会更加优秀。"
x920009_var_ContinueInfo2="#Y【道具复元丹说明】#W\n\t使用了道具#G回元丹#W，炼化后可选择放弃领取新骑乘，取回原主骑乘。"
x920009_var_ContinueInfo3="#Y【炼化操作说明】#W\n\t1.与王国#G骑乘炼化大师#W或大都#G骑乘炼化大师#W对话。\n\t2.选择#G骑乘炼化#W选项，打开骑乘炼化介面。\n\t3.在骑乘炼化介面左方主骑乘下拉条中选择主骑乘。\n\t4.在骑乘炼化介面右方副骑乘下拉条中选择副骑乘。\n\t5.可以选择放入道具固本丹。\n\t6.点击开始炼化按钮。\n\t7.点击停止炼化按钮。\n\t8.领取新骑乘或原主骑乘。"










--DECLARE_QUEST_INFO_STOP--







function x920009_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	
	if extid == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x920009_var_QuestName1)
			TalkAppendString(varMap,x920009_var_QuestInfo1)
			TalkAppendButton(varMap, x920009_var_FileId, "骑乘外形继承说明",13,2)
			TalkAppendButton(varMap, x920009_var_FileId, "骑乘等级和携带等级继承说明",13,8)
			TalkAppendButton(varMap, x920009_var_FileId, "骑乘属性点和资质继承说明",13,3)
			TalkAppendButton(varMap, x920009_var_FileId, "骑乘技能继承说明",13,4)
			TalkAppendButton(varMap, x920009_var_FileId, "道具固本丹说明",13,5)
			
			TalkAppendButton(varMap, x920009_var_FileId, "炼化操作说明",13,7)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x920009_var_FileId, x920009_var_QuestName1)
	elseif extid == 2 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x920009_var_QuestCompleted1)
			TalkAppendButton(varMap, x920009_var_FileId, "返回骑乘炼化说明介面",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x920009_var_FileId, x920009_var_QuestName1)
	elseif extid == 3 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x920009_var_QuestCompleted2)
			TalkAppendButton(varMap, x920009_var_FileId, "返回骑乘炼化说明介面",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x920009_var_FileId, x920009_var_QuestName1)
	elseif extid == 4 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x920009_var_QuestCompleted3)
			TalkAppendButton(varMap, x920009_var_FileId, "返回骑乘炼化说明介面",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x920009_var_FileId, x920009_var_QuestName1)
	elseif extid == 5 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x920009_var_ContinueInfo1)
			TalkAppendButton(varMap, x920009_var_FileId, "返回骑乘炼化说明介面",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x920009_var_FileId, x920009_var_QuestName1)
	
	
	
	
	
	
	elseif extid == 7 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x920009_var_ContinueInfo3)
			TalkAppendButton(varMap, x920009_var_FileId, "返回骑乘炼化说明介面",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x920009_var_FileId, x920009_var_QuestName1)	
	elseif extid == 8 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x920009_var_QuestCompleted4)
			TalkAppendButton(varMap, x920009_var_FileId, "返回骑乘炼化说明介面",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x920009_var_FileId, x920009_var_QuestName1)	
	end	
end









function x920009_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x920009_var_FileId, x920009_var_QuestName1,13,1)



	
end









function x920009_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x920009_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x920009_ProcAccept( varMap, varPlayer )
	
end









function x920009_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x920009_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x920009_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x920009_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x920009_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x920009_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x920009_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x920009_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x920009_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x920009_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x920009_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x920009_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x920009_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x920009_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x920009_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
