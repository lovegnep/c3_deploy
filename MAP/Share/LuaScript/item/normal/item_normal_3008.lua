













x403008_var_FileId = 403008 




x403008_var_Buf1 = 8008 
x403008_var_Buf2 = -1 




function x403008_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403008_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403008_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403008_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403008_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403008_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403008_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403008_var_Buf1, 0);
	end
	return 1;
end







function x403008_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
