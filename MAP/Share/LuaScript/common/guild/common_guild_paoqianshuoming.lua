--DECLARE_QUEST_INFO_START-- 
x300704_var_FileId 					= 	300704
x300704_var_QuestName				= 	"帮会跑商" 
x300704_var_QuestInfo				= 	"巡按任务信息" 
--DECLARE_QUEST_INFO_STOP--

function x300704_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300704_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【帮会跑商说明】#r#W"
		local Readme_2 = "  1.#G接取任务：#W在不低于#G三级#W的帮会中，所有成员都可以接取该任务，每天每个帮会可以完成100次该任务，接取任务后要缴纳#G5两#W银卡或现银的押金，完成后返还5两银卡。#r"
		local Readme_3 = "  2.#G任务介绍：#W接取跑商任务后，会得到#G三件帮会货物#W和一张#G帮会银票#W在王城地区找到城西商人，城东商人和在王城内游走的王城游商，将身上的帮会货物出售给他们，赚足完成任务的所需金额。注意：货物一定要尽量出售给出价最高的商人，才能赚取足够的金钱。#r"
			local Readme_4 = "  3.#G注意事项：#G王城游商#W对所有货物都是高价收购，但如果有其他人在你之前在王城游商出售了和你相同的货物后，5分钟内王城游商不会再收购这件商品。#r"
		local Readme_5 = "  4.#G任务奖励：#W完成此任务，您将获得不菲的#G经验#W奖励和#G20两#W帮会金钱。" 
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300704_var_FileId, -1 );
end 

function x300704_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300704_ProcAccept( varMap, varPlayer )
end



function x300704_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300704_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300704_CheckSubmit( varMap, varPlayer )
end



function x300704_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300704_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300704_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300704_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
