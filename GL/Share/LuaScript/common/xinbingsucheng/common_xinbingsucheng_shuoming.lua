--DECLARE_QUEST_INFO_START--

x310226_var_FileId = 310226
x310226_var_Name = "【大萨满的祝福】功能介绍"


--DECLARE_QUEST_INFO_STOP--

function x310226_ProcEnumEvent(varMap, varPlayer, varTalknpc, varIndex)

	TalkAppendButton(varMap, x310226_var_FileId, x310226_var_Name, 13, 0)
end

function x310226_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varIndex)
		local str ="\n#G功能开启条件：#W\n\t当等级排行榜第一名达到#R65级#W时，会开启【大萨满的祝福】功能。"
		local str1 ="\n#G功能概述：#W\n\t所有等级低于排行榜第一名#R5级#W以上的玩家，每天可以领取五次【大萨满的祝福】，玩家自身等级不能低于#R45级#W或高于#R110级#W。领取祝福后，在祝福时间内，玩家可获得海量经验。\n\t当玩家剩余经验大于当前等级升级所需经验时，无法使用此功能。每天第一次领取免费，剩余四次需要花费一定的现金，并且返还相同数量的金卡。"
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【大萨满的祝福】功能介绍")
	  TalkAppendString(varMap,str)
		TalkAppendString(varMap,str1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310226_var_FileId, -1, 1)	
end

function x310226_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

end




function x310226_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

end

