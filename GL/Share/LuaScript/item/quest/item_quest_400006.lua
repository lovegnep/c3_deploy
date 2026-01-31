x400006_var_FileId  = 400006
x400006_var_Buf1   = 1241
x400006_var_Buf2   = -1 





function x400006_ProcEventEntry( varMap, varPlayer, varBagIdx )
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"你必须到达60级，接受之后你就会接受武林大会任务")
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varPlayer, 270000, 3533);

end


function x400006_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400006_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400006_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400006_ProcDeplete( varMap, varPlayer )

	return 1
end

function x400006_ProcActivateOnce( varMap, varPlayer )
end

function x400006_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
