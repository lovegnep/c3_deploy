













x404838_var_FileId = 404838 




x404838_var_Buf1 = 9838 
x404838_var_Buf2 = -1 




function x404838_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404838_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404838_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404838_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404838_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404838_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404838_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404838_var_Buf1, 0);
	end
	return 1;
end







function x404838_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
