--DECLARE_QUEST_INFO_START--

x310250_var_FileId = 310250
x310250_var_Name = "线上奖励说明"


--DECLARE_QUEST_INFO_STOP--

function x310250_ProcEnumEvent(varMap, varPlayer, varTalknpc, varIndex)

	TalkAppendButton(varMap, x310250_var_FileId, x310250_var_Name, 13, 0)
end

function x310250_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varIndex)
		local str ="\n#W活动时间：#R4月29#W至#R5月1日，9：00到22：00可在NPC领奖大使处领取。"
		local str1 ="\n#G活动说明：#W\n\t在领奖大使领取活动奖励后，将会在一小时内每隔10秒获得一份奖励，有机会获得掌门牌、时装、降世符等稀有物品！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【线上奖励】功能介绍")
	  TalkAppendString(varMap,str)
		TalkAppendString(varMap,str1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310250_var_FileId, -1, 1)	
end

function x310250_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

end




function x310250_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

end

