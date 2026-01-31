





x300362_var_FileId 					= 300362
x300362_var_QuestName				= "【师徒】师傅报名"






function x300362_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x300362_var_FileId, x300362_var_QuestName,3,0);
end







function x300362_ProcEventEntry(varMap, varPlayer, varTalknpc)
	local Readme_1 = "#Y【师徒】师傅报名#r"
	local Readme_2 = "\t#W50级以上并且3天内没有收过徒弟的玩家可以在这里进行师傅资格的报名。报名之后，玩家可以在查询师傅模块中找到你的资讯，从而更方便地让希望成为徒弟的玩家找到你。\n\t你想报名#G成为师傅#W吗？"
	local varReadme = Readme_1..Readme_2
	StartTalkTask(varMap);
	TalkAppendString(varMap, varReadme);
	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300362_var_FileId,-1);
	
end







function x300362_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end







function x300362_ProcAccept(varMap, varPlayer)
	
	MasterCandidate(varMap, varPlayer)

end
