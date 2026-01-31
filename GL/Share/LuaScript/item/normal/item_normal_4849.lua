













x404849_var_FileId = 404849 




x404849_var_Buf1 = 9840 
x404849_var_Buf2 = -1 




function x404849_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404849_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404849_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404849_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404849_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404849_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404849_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404849_var_Buf1, 0);
	end
	return 1;
end







function x404849_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
