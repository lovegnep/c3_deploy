
x300632_var_FileId = 300632





x300632_var_MessionIdAfter1	= 300634
x300632_var_MessionIdAfter2	= 300633



x300632_var_QuestName1="【帮会】帮会建设"
x300632_var_QuestName2="【帮会】帮会募集"
x300632_var_QuestName3="【帮会】帮贡建设"

--DECLARE_QUEST_INFO_STOP--



function x300632_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local Readme_1 = "#Y【帮会】帮会建设#W#r"
	
	local Readme_2 = "\t帮会经验是升级帮会，开启帮贡商店的必需品。#r"
	
	local Readme_3 = "\t帮会成员除了日常帮会任务外还可以通过".."#G".."帮会募集".."#W".."或".."#G".."帮贡建设".."#W".."提升帮会经验，同时建设者也将获得#G高额奖励。#r"
	
	local Readme_4 = "\t#W帮会募集:帮会成员每人每日可以募集1次。#r"
	
	local Readme_5 = "\t#W帮贡建设:每个帮会每日根据本帮会的等级进行建设。1级帮会可以建设25次，2级帮会可以建设50次，3级帮会可以建设75次，4级帮会可以建设100次，5级帮会可以建设125次，6级帮会可以建设150次,7级帮会可以建设175次。"
	
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
	
	StartTalkTask(varMap);TalkAppendString(varMap,varReadme)
	
	TalkAppendButton(varMap,x300632_var_MessionIdAfter1,x300632_var_QuestName2,3,1000)
	
	TalkAppendButton(varMap,x300632_var_MessionIdAfter2,x300632_var_QuestName3,3)
	
	StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
end




function x300632_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos == -1 then
		return
	end
	TalkAppendButton(varMap,x300632_var_FileId,x300632_var_QuestName1,3);
end





function x300632_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300632_ProcAccept( varMap, varPlayer )

end




function x300632_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300632_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300632_CheckSubmit( varMap, varPlayer )

end




function x300632_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300632_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300632_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300632_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
