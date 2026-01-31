--DECLARE_QUEST_INFO_START-- 
x300936_var_FileId 					= 	300936
x300936_var_QuestName				= 	"【领地介绍】" 
x300936_var_QuestInfo				= 	"【领地争夺战说明】" 
--DECLARE_QUEST_INFO_STOP--

function x300936_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300936_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【报名条件】#r #r#W"
		local Readme_2   = "1、本国有国王的情况下，才可报名。#r2、您必须是帮主#r3、#G周六13点到15点#W才可报名。#r4、每个领地#G最多#W可以有#G2个帮会报名争夺#W，报名时帮会实力高的帮会将顶替帮会实力低的帮会获得报名资格，同一块领地每个国家只能有一个帮会参加报名。#r "
		local Readme_3   = "5、国王、王国守护、已占领领地的帮主，无法报名。#r"
		local varReadme = Readme_1..Readme_2..Readme_3
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300936_var_FileId, -1 );
end 

function x300936_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300936_ProcAccept( varMap, varPlayer )
end



function x300936_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300936_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300936_CheckSubmit( varMap, varPlayer )
end



function x300936_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300936_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300936_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300936_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
