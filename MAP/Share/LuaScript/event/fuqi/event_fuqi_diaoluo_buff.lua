
x300395_var_FileId = 300395


function x300395_ProcIntervalOverEvent( varMap, varPlayer )
	
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,7535, 0);
	StartItemTask(varMap)
	ItemAppend( varMap, 12030061, 2 )
	ItemAppend( varMap, 12030062, 2 )
	ItemAppend( varMap, 12030063, 2 )
	ItemAppend( varMap, 12030064, 2 )
	
	DropItemListToScene(varMap, varPlayer, 1)
end


function x300395_ProcActiveEvent( varMap, varPlayer )
end


function x300395_ProcFadeOutEvent( varMap, varPlayer )
end

function x300395_ProcEventEntry()
end
