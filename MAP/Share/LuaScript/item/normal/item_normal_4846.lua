













x404846_var_FileId = 404846 




x404846_var_Buf1 = 9837 
x404846_var_Buf2 = -1 




function x404846_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404846_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404846_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404846_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404846_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404846_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404846_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404846_var_Buf1, 0);
	end
	return 1;
end







function x404846_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
