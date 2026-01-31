













x403003_var_FileId = 403003 




x403003_var_Buf1 = 8003 
x403003_var_Buf2 = -1 




function x403003_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403003_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403003_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403003_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403003_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403003_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403003_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403003_var_Buf1, 0);
	end
	return 1;
end







function x403003_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
