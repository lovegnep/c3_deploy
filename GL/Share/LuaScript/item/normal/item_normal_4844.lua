













x404844_var_FileId = 404844 




x404844_var_Buf1 = 16034 
x404844_var_Buf2 = -1 




function x404844_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404844_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404844_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404844_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404844_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404844_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404844_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404844_var_Buf1, 0);
	end
	return 1;
end







function x404844_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
