













x430000_var_FileId = 430000 










function x430000_ProcEventEntry( varMap, varPlayer, varBagIdx )
	ChatLaBa( varMap, varPlayer, varBagIdx, 0)
	return 0;


end






function x430000_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x430000_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430000_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430000_ProcDeplete( varMap, varPlayer )
	
		
	
	
end








function x430000_ProcActivateOnce( varMap, varPlayer )
	
	
	
	
end







function x430000_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
