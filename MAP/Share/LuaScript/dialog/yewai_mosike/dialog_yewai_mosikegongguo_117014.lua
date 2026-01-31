 
x203326_var_FileId	= 203326
x203326_var_QuestId	=	806



function x203326_ProcEventEntry( varMap, varPlayer,varTalknpc ) 
local varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x203326_var_QuestId) 
  if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1)  < 1 then
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t你是什么人？找我有事么？没事别挡着大爷在这里欣赏风景！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
	end
	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t英雄！别再打我了，我也只是为了讨生活才替那些老爷们做事！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
	end
end

function x203326_ProcDie(varMap, varPlayer, varKiller)
	SetMonsterCamp(varMap,varPlayer,20)
end
