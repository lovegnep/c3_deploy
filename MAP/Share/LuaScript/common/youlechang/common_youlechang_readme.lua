

--DECLARE_QUEST_INFO_START--
x310340_var_FileId = 310340












x310340_var_QuestName1="【天上人间·麒麟说明】"
x310340_var_QuestInfo1="\t天上人间·麒麟是由摩天轮区、旋转木马区、钧窑区、暴龙大作战区、勾栏曲台区、梦幻城堡区、海盗船区等区域组成的大型周末活动场所。\n\t天上人间·麒麟每#G周六、日#W的09：00——23：00开放，不低于#G65级#W的玩家可通过花费#G25两#W现银或银卡进入。\n \n#Y天上人间·麒麟相关玩法#W：\n\t每天首次进入天上人间·麒麟时会得到一个#G麒麟乐透奖券#W，凭藉里面记录的数位能参加当天10：30、12：30、14：30、16：30、18：30、20：30、22：30举办的天上人间·麒麟#G乐透大抽奖#W。\n\t周六、日9：00——23：00期间，魔女艾丽西丝的水晶球会#G不断#W的出现在天上人间·麒麟各处，搜寻到水晶球的玩家获得大量经验奖励，同时天上人间·麒麟中其他玩家也会获得部分经验奖励。\n\t12:00开始至22：00每个小时整点玩家可参与#G暴龙大作战#W活动。\n\t12：00至22：00每逢半点可参与#G疯狂的宝箱#W活动。\n\t在天上人间·麒麟里面可以进入#G钧窑#W副本和#G勾栏曲台#W副本。\n \n#Y注意事项#W：\n\t1.当天#G第一次#W进入天上人间·麒麟收费及给予乐透奖券。\n\t2.天上人间·麒麟适合65级至84级的玩家进入,超过84级的玩家请去#G聊斋大观园#W参与相关活动"  
















--DECLARE_QUEST_INFO_STOP--







function x310340_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310340_var_QuestName1)
			TalkAppendString(varMap,x310340_var_QuestInfo1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310340_var_FileId, x310340_var_QuestName1)

end









function x310340_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)





		TalkAppendButton(varMap, x310340_var_FileId, x310340_var_QuestName1,13,1)



	
end









function x310340_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	










		return 1
end








function x310340_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x310340_ProcAccept( varMap, varPlayer )
	
end









function x310340_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x310340_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x310340_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x310340_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x310340_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	

end

function x310340_ProcMapTimerTick(varMap, varPlayer )
	 
		
end

function x310340_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest )
	
end









function x310340_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	
end
function x310340_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x310340_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x310340_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x310340_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310340_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x310340_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x310340_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
