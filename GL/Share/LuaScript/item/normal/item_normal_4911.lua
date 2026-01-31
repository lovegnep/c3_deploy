


x404911_var_FileId  = 404911 
x404911_var_QuestID = 9093

function x404911_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	
	
	local varText = "#Y【专精天赋】专防训练点数重置：#W\n\t使用专精重置之书将会重置您的专精天赋专防训练点数，是否确认使用？"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText)
	StopTalkTask(varMap)
	
	
	DeliverTalkInfoNM(varMap, varPlayer, varPlayer, x404911_var_FileId, x404911_var_QuestID,  0)
	
	return 
	
	
end

function x404911_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x404911_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x404911_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x404911_ProcDeplete( varMap, varPlayer )

	return 0
end

function x404911_ProcActivateOnce( varMap, varPlayer )
end

function x404911_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x404911_ProcDie(varMap, varPlayer, varKiller)
		
end



function x404911_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if DelItemByIDInBag( varMap, varPlayer, 12030219, 1) ~= 1 then return 0 end
	ReallocateInherenceZhuanFangPoint( varMap, varPlayer )
	Msg2Player(varMap,varPlayer,"专精点数重置", 8, 2)
end



