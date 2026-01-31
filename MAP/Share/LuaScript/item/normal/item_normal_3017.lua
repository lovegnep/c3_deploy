













x403017_var_FileId = 403017 




x403017_var_Buf1 = 8001 
x403017_var_Buf2 = -1 




function x403017_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403017_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403017_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403017_ProcConditionCheck( varMap, varPlayer )
	
	return 1; 
end







function x403017_ProcDeplete( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 1
	end
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403017_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	return 1;
end







function x403017_ProcActivateEachTick( varMap, varPlayer, varImpact)
	
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	return 1; 
end
