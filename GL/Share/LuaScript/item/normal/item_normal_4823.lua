













x404823_var_FileId = 404823 




x404823_var_Buf1 = 9823 
x404823_var_Buf2 = -1 




function x404823_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404823_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404823_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404823_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404823_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404823_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404823_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404823_var_Buf1, 0);
	end
	return 1;
end







function x404823_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
