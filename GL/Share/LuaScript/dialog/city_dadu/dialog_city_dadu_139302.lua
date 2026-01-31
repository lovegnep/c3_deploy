 




function x101002_ProcEventEntry( varMap, varPlayer,varTalknpc )
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t阿弥陀佛，佛门净地请施主不要到处乱走。")
	StopTalkTask(varMap)
	if IsHaveQuest(varMap,varPlayer, 3574) > 0 then
				TalkAppendButton(varMap, 3574, "色即是空",0, 1)
	end
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
end

function x101002_ProcDie(varMap, varPlayer, varKiller)
	SetMonsterCamp(varMap,varPlayer,20)
end
