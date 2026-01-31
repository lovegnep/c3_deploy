













x403005_var_FileId = 403005 




x403005_var_Buf1 = 8005 
x403005_var_Buf2 = -1 




function x403005_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403005_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403005_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403005_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403005_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403005_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403005_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403005_var_Buf1, 0);
	end
	return 1;
end







function x403005_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
