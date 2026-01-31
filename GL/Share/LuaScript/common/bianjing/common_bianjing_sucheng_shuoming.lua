--DECLARE_QUEST_INFO_START--

x304007_var_FileId = 304007
x304007_var_Name = "【练兵】任务介绍"


--DECLARE_QUEST_INFO_STOP--

function x304007_ProcEnumEvent(varMap, varPlayer, varTalknpc, varIndex)

	TalkAppendButton(varMap, x304007_var_FileId, x304007_var_Name, 13, 0)
end

function x304007_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varIndex)
		local str ="\n#G任务开启条件：#W\n\t当等级排行榜第一名达到#R65级#W时，会开启【练兵】系列任务。"
		local str1 ="\n#G玩法概述：#W\n\t所有等级低于排行榜等级第一名#R5级#W以上并且自身等级不低于#R50级#W的玩家，每天可以领取一次练兵任务，任务完成后，按照玩家当前等级给予海量经验奖励。\n\t当玩家剩余经验大于当前等级升级所需经验时，无法领取任务。"
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【练兵】任务介绍")
	  TalkAppendString(varMap,str)
		TalkAppendString(varMap,str1)
		--TalkAppendString(varMap,"8、至少完成一次任务的玩家可以在次日1：00之后到本国外城图腾龙魂发布人处领取龙魂封赏，前一日图腾资源数更多的国家的成员将获得更好的奖励。  ")
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x304007_var_FileId, -1, 1)	
end

function x304007_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

end




function x304007_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

end

