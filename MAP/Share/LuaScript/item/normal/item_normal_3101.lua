













x403101_var_FileId = 403101 




x403101_var_Buf1 = 8101 
x403101_var_Buf2 = -1 




function x403101_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403101_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403101_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403101_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403101_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403101_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403101_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403101_var_Buf1, 0);
	end
	return 1;
end







function x403101_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
