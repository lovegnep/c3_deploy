













x403016_var_FileId = 403015 




x403016_var_Buf1 = 8200 
x403016_var_Buf2 = -1 




function x403016_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403016_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403016_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403016_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403016_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403016_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403016_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403016_var_Buf1, 0);
	end
	AddItemEffect(varMap, varPlayer)
	return 1;
end







function x403016_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
