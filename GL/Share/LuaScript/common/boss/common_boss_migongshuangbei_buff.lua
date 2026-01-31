












x310002_var_FileId = 310002 




function x310002_ProcEventEntry( varMap, varPlayer, varIndex, sign )

	if sign==1 then
		SetWanFaExpMult( varMap, varPlayer, 0 )
	end
					

end






function x310002_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x310002_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310002_ProcConditionCheck( varMap, varPlayer )
	
	
		
	
	return 1; 
end







function x310002_ProcDeplete( varMap, varPlayer )
	
		
	
	return 1;
end








function x310002_ProcActivateOnce( varMap, varPlayer )
	
		
	
	return 1;
end







function x310002_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
