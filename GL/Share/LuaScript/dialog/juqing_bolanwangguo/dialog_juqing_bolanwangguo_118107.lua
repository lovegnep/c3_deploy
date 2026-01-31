 
x203347_var_FileId	= 203347
x203347_var_QuestId	=	922



function x203347_ProcEventEntry( varMap, varPlayer,varTalknpc ) 
local varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x203347_var_QuestId) 
  if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1)  < 1 then
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t东方来的野蛮人，没见过什么叫贵族气质吧！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
	end
	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t英...英雄！我认输，别打了！我这就回捷克，再也不敢来了！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
	end
end

function x203347_ProcDie(varMap, varPlayer, varKiller)
	SetMonsterCamp(varMap,varPlayer,20)
end
