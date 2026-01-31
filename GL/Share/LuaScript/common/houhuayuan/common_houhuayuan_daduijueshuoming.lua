

--DECLARE_QUEST_INFO_START--
x320033_var_FileId = 320033












x320033_var_QuestName1="【大对决玩法说明】"
x320033_var_QuestInfo1="#Y参与规则：#W\n\t1.#G周六#W的下午#G14：30-15：00#W，#G40级#W以上#G（含40级）#W的玩家均可参与在后花园会举办一项非常刺激的活动--#G癸∕#W\n\t2.癸∕猭–ㄢ㏄秨Ω\n#Y猭ざ残#W\n\t1.秈堕產穦#G繦诀#W砆だ#Gじ┠璃瓁#W㎝#Gほて瓁#Wい\n\t2.產硄筁ヴ叭#G笲癳碒ド膓ó#W#G蹦栋寄よ碒ド戈方#W#G阑炳蹦栋よ戈方寄#W㎝莉#Gぱ笲碒ドó#W糤よ戈方㎝縩だ\n\t3.笆秨﹍#G1440#W㎝#G1450#W常穦Τ#G5进ぱ笲碒ドó#W眖瓜オà祇猽隔玡秈赣膓ó糤よ戈方㎝縩だ\n#Y疭矗ボ#W\n\t1.笆い產┮莉眔縩だ穦Ω癸∕笆秨笆#G睲#W\n\t2.笆い莉眔縩だ#G堕笆ㄏ皅蠯356222#W矪传Θ竒喷贱纘"  
















--DECLARE_QUEST_INFO_STOP--







function x320033_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x320033_var_QuestName1)
			TalkAppendString(varMap,x320033_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x320033_var_FileId, x320033_var_QuestName1)

end









function x320033_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x320033_var_FileId, x320033_var_QuestName1,13,1)



	
end









function x320033_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x320033_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x320033_ProcAccept( varMap, varPlayer )
	
end









function x320033_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x320033_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x320033_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x320033_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x320033_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x320033_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x320033_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x320033_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x320033_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x320033_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x320033_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x320033_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x320033_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x320033_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x320033_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
