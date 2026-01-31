













x404847_var_FileId = 404847 




x404847_var_Buf1 = 9838 
x404847_var_Buf2 = -1 




function x404847_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404847_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404847_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404847_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404847_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404847_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404847_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404847_var_Buf1, 0);
	end
	return 1;
end







function x404847_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
