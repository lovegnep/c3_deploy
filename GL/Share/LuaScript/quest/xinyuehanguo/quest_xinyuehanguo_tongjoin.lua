


--DECLARE_QUEST_INFO_START--
x211035_var_FileId = 211035
x211035_var_QuestName = "【帮会】加入帮会"

--DECLARE_QUEST_INFO_STOP--






function x211035_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	
	
	local Readme_1 = "#Y【帮会】加入帮会#W#r #r"
	
	local Readme_2 = "加入帮会您要满足二个条件：#r #r"
	
	local Readme_3 = "  1，加入帮会所需#G等级#W至少#G20级#W。#r #r"
	
	local Readme_4 = "  2，加入帮会必须是#G无帮会状态#W，或者#G离开帮会#W在#G24小时#W以上。#r #r"
	
	local Readme_5 = "满足以上条件，点击#G确定#W就可以#G查看帮会#W资讯，您一定会找到心仪的帮会，祝您顺利。#r #r"
	
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
	
	StartTalkTask(varMap);TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x211035_var_FileId, -1 );	
end









function x211035_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= -1 then
		return
	end
	TalkAppendButton(varMap, x211035_var_FileId, x211035_var_QuestName, 3)
end









function x211035_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end






function x211035_ProcAccept(varMap, varPlayer)
	GuildList(varMap, varPlayer, 0)
end









function x211035_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211035_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211035_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x211035_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211035_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211035_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
