 
x203329_var_FileId	= 203329
x203329_var_QuestId	=	827





















function x203329_ProcEventEntry( varMap, varPlayer,varTalknpc )            
	StartTalkTask(varMap)                                             
	TalkAppendString(varMap,"\t欢迎你们来到我们斯拉夫人的首都，莫斯科城！\n\t上帝也不希望看到人类相互杀戮，我们的条件很容易满足，请你们尽快给我们一个答覆！")     
	StopTalkTask(varMap)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,827)                                               
	if IsHaveQuest(varMap,varPlayer, 827) > 0 then
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) <= 0 then	                     
		 	TalkAppendButton(varMap, x203330_var_QuestId, "你的阴谋已经败露了！",0, 1)
		end                  
	end                                                                  
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)                      
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)                       
end                                                                    


function x203329_ProcDie(varMap, varPlayer, varKiller)
	SetMonsterCamp(varMap,varPlayer,20)
end
