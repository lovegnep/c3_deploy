













x403114_var_FileId = 403114 




x403114_var_Buf1 = 9004 
x403114_var_Buf2 = -1 




function x403114_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403114_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403114_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403114_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403114_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403114_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403114_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403114_var_Buf1, 0);
	end
	return 1;
end







function x403114_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
