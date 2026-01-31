













x404841_var_FileId = 404841 




x404841_var_Buf1 = 9841 
x404841_var_Buf2 = -1 




function x404841_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404841_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404841_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404841_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404841_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404841_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404841_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404841_var_Buf1, 0);
	end
	return 1;
end







function x404841_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
