--DECLARE_QUEST_INFO_START--

x302519_var_FileId = 302519
x302519_var_Name = "【家园种好礼活动说明】"


--DECLARE_QUEST_INFO_STOP--

function x302519_ProcEnumEvent(varMap, varPlayer, varTalknpc, varIndex)
	local day =GetDayOfYear()
	if day > 147 then return end
	TalkAppendButton(varMap, x302519_var_FileId, x302519_var_Name, 13, 0)
end

function x302519_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varIndex)
		local str ="\n#W活动时间：#R5月25#W至#R5月27日。"
		local str1 ="\n#G活动说明：#W\n\t在活动期间，进入庄园种植作物，收货后打开果实有几率额外获得星魂碎片，收集足够碎片可在大都活动使者身上兑换丰富奖励。"
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【家园种好礼活动说明】")
	  TalkAppendString(varMap,str)
		TalkAppendString(varMap,str1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x302519_var_FileId, -1, 1)	
end

function x302519_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

end




function x302519_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

end

