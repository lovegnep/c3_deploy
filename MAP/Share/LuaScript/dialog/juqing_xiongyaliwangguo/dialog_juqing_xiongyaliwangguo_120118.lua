 
x203353_var_FileId	= 203353
x203353_var_QuestId	=	973



function x203353_ProcEventEntry( varMap, varPlayer,varTalknpc ) 
local varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x203353_var_QuestId) 
  if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1)  < 1 then
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t你是什么人？找我有事么？没事别挡着大爷在这里欣赏风景！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
	end
	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t英雄！别再打我了，我也只是为了讨生活才替贝拉四世去做事的，我再也不敢了！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
	end
end

function x203353_ProcDie(varMap, varPlayer, varKiller)
	SetMonsterCamp(varMap,varPlayer,20)
end
