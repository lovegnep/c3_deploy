













x403009_var_FileId = 403009 




x403009_var_Buf1 = 8009 
x403009_var_Buf2 = -1 




function x403009_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403009_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403009_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403009_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403009_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403009_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403009_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403009_var_Buf1, 0);
	end
	return 1;
end







function x403009_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
