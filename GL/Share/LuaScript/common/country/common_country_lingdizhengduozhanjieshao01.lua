--DECLARE_QUEST_INFO_START-- 
x300935_var_FileId 					= 	300935
x300935_var_QuestName				= 	"【领地介绍】" 
x300935_var_QuestInfo				= 	"【领主战场说明】" 
--DECLARE_QUEST_INFO_STOP--

function x300935_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300935_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【领地介绍】#r#W"
		local Readme_2   = "1、游戏中，共有#G9个#W领地可供争夺，根据#G等级排行榜#W最后一名的#G玩家等级#W开放对应可争夺地图。#r #r"
		local Readme_3   = "2、领地及相应开放等级为：#r#G蔡州城           （45级）#W#r#G碎叶城           （60级）#W#r#G巴格达           （60级）#W#r#G基辅公国         （70级）#W#r#G神圣罗马帝国     （70级）#W#r#G耶路撒冷         （70级）#W#r#G福冈             （未开放）#W#r#G缅甸             （未开放）#W#r#G爪哇岛           （未开放）#W#r #r"
		local Readme_4   = "3、占领领地的60级以上帮会成员于每周六可以领取津贴和海量经验，帮主领取的奖励为帮众的四倍。#r"		
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300935_var_FileId, -1 );
end 

function x300935_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300935_ProcAccept( varMap, varPlayer )
end



function x300935_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300935_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300935_CheckSubmit( varMap, varPlayer )
end



function x300935_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300935_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300935_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300935_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
