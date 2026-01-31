

--DECLARE_QUEST_INFO_START--
x702000_var_FileId = 702000












x702000_var_QuestName1="【扬武号的安全隐患】"
x702000_var_QuestInfo1="\t扬武号已经起航，将跨越茫茫大洋，携带大汗的勇士们来往地中海的卡迪兹港。是否能传播大元的威名，就要看你们在地中海那边的表现了。\n\t刚才舰长汇报说，他发现了一些问题，扬武号是大元最坚固庞大的战船，可是由于管理不当，居然在船上发现了老鼠。\n\t如果放任不管，老鼠啃坏船板，大家都要遭殃，为了排除安全隐患，还需麻烦船上的人找到并抓住这些老鼠。获得更安全的航行体验后，船上所有的人都会获得经验奖励。麻烦你了。"  














--DECLARE_QUEST_INFO_STOP--







function x702000_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x702000_var_QuestName1)
			TalkAppendString(varMap,x702000_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x702000_var_FileId, x702000_var_QuestName1)

end









function x702000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x702000_var_FileId, x702000_var_QuestName1,13,1)



	
end









function x702000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x702000_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x702000_ProcAccept( varMap, varPlayer )
	
end









function x702000_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x702000_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x702000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x702000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x702000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x702000_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x702000_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x702000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x702000_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x702000_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x702000_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x702000_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x702000_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x702000_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x702000_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
