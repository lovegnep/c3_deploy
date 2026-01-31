--DECLARE_QUEST_INFO_START-- 
x920008_var_FileId 					= 	920008
x920008_var_QuestName				= 	"【收集战马说明】" 
x920008_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x920008_ProcEnumEvent( varMap, varPlayer, varTalknpc )
	TalkAppendButton(varMap, x920008_var_FileId,x920008_var_QuestName,13,1)
end

function x920008_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【收集战马说明】#r#W"
		local Readme_2 = "  #Y收集战马：#W每位玩家每天可以上缴#G10匹#W战马，每次都会获得银卡奖励。#r"
		local Readme_4 = "  #Y注意事项：#W提交战马的#G携带等级#W越高，所获得的奖励也会越多。#r"
		local Readme_5 = "  #Y特殊奖励：#W在同携带等级下，提交#G良品马#W会获得#G8倍#W于普通马的奖励。" 
		local varReadme = Readme_1..Readme_2..Readme_4..Readme_5
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x920008_var_FileId, -1 );
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x920008_var_FileId,x920008_var_QuestName)
end 

function x920008_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x920008_ProcAccept( varMap, varPlayer )
end



function x920008_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x920008_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x920008_CheckSubmit( varMap, varPlayer )
end



function x920008_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x920008_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x920008_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x920008_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
