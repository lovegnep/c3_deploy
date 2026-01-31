--DECLARE_QUEST_INFO_START-- 
x300773_var_FileId 					= 	300719
x300773_var_QuestName				= 	"帮会属性天赋" 
x300773_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300719_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300719_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会】帮会属性天赋#r#W"
		local Readme_2 = "  1，#G属性天赋研究：#W“属性天赋”的技能只有帮主能够研究，只有当玩家所在帮会研究了相关技能的时候，才能进行技能学习。#r"
		local Readme_3 = "  2，#G属性天赋学习：#W当玩家天赋达到10级时，可以开始“属性天赋”养成，“属性天赋”养成的等级与天赋等级相关，即需要一定的天赋等级才能完成“属性天赋”养成。学习属性天赋需要帮贡，三级以上属性学习时，还要消耗声望、威望。每级技能消耗的帮贡、声望、威望不同。#r"
		local varReadme = Readme_1..Readme_2..Readme_3
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300773_var_FileId, -1 );
end 

function x300719_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300719_ProcAccept( varMap, varPlayer )
end



function x300719_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300719_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300719_CheckSubmit( varMap, varPlayer )
end



function x300719_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300719_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300719_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300719_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
