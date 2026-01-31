 




function x101000_ProcEventEntry( varMap, varPlayer,varTalknpc )
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t你是什么人？别挡着大爷的好事。")
	StopTalkTask(varMap)
	if IsHaveQuest(varMap,varPlayer, 3568) > 0 then
		if GetItemCount(varMap,varPlayer,13020312) < 1 then
				TalkAppendButton(varMap, 3568, "你见过峨嵋派的女弟子吗？",0, 1)
		end
	end
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
end

function x101000_ProcDie(varMap, varPlayer, varKiller)
	SetMonsterCamp(varMap,varPlayer,20)
end
