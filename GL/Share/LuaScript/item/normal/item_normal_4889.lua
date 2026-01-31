













x404889_var_FileId = 404889 




x404889_var_Buf1 = 8352 
x404889_var_Buf2 = 8351 




function x404889_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404889_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404889_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404889_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404889_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404889_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404889_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404889_var_Buf1, 0);
	end
	if(-1~=x404889_var_Buf2) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404889_var_Buf2, 0);
	end
	return 1;
end







function x404889_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
