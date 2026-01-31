













x403106_var_FileId = 403106 




x403106_var_Buf1 = 8106 
x403106_var_Buf2 = -1 




function x403106_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403106_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403106_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403106_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403106_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403106_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403106_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403106_var_Buf1, 0);
	end
	return 1;
end







function x403106_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
