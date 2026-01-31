


function x300777_ProcEventEntry( varMap, varPlayer, bufIndex,varOpType )

	if varOpType == 0 then 
		MarkMutexState( varMap, varPlayer, 25 )
	else 
		ClearMutexState( varMap, varPlayer, 25 )
	end

end

