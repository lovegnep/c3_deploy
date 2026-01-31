













x403102_var_FileId = 403102 




x403102_var_Buf1 = 8102 
x403102_var_Buf2 = -1 




function x403102_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403102_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403102_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403102_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403102_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403102_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403102_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403102_var_Buf1, 0);
	end
	return 1;
end







function x403102_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
