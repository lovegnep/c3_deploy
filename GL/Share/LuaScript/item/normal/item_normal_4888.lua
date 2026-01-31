













x404888_var_FileId = 404888 




x404888_var_Buf1 = 9843 
x404888_var_Buf2 = -1 




function x404888_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404888_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404888_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404888_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404888_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404888_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404888_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404888_var_Buf1, 0);
	end
	return 1;
end







function x404888_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
