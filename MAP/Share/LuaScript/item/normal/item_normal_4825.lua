













x404825_var_FileId = 404825 




x404825_var_Buf1 = 9825 
x404825_var_Buf2 = -1 




function x404825_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404825_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404825_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404825_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404825_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404825_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404825_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404825_var_Buf1, 0);
	end
	return 1;
end







function x404825_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
