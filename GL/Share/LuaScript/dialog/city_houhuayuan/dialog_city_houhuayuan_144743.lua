 
x101050_var_FileId	= 101050
x101050_var_QuestId	=	2282


function x101050_ProcEventEntry( varMap, varPlayer,varTalknpc )            
	StartTalkTask(varMap)                                             
	TalkAppendString(varMap,"\t你是什么人,没事离远点")     
	StopTalkTask(varMap)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,2282)                                               
	if IsHaveQuest(varMap,varPlayer, 2282) > 0 then
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) <= 0 then	                     
		 	TalkAppendButton(varMap, x101050_var_QuestId, "你又是什么人?",0, 1)
		end                  
	end                                                                  
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)                      
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)                       
end                                                                    


function x101050_ProcDie(varMap, varPlayer, varKiller)
	SetMonsterCamp(varMap,varPlayer,20)
end
