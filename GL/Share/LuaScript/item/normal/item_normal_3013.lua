













x403013_var_FileId = 403013 




x403013_var_Buf1 = 9801 
x403013_var_Buf2 = -1 




function x403013_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403013_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403013_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403013_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403013_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403013_ProcActivateOnce( varMap, varPlayer )

	if(-1~=x403013_var_Buf1) then

		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403013_var_Buf1, 0);
	end
	return 1;
end







function x403013_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
