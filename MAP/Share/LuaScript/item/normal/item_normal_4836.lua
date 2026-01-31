













x404836_var_FileId = 404836 




x404836_var_Buf1 = 9836 
x404836_var_Buf2 = -1 




function x404836_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404836_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404836_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404836_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404836_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404836_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404836_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404836_var_Buf1, 0);
	end
	return 1;
end







function x404836_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
