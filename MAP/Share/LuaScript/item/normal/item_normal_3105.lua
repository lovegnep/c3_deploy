













x403105_var_FileId = 403105 




x403105_var_Buf1 = 8105 
x403105_var_Buf2 = -1 




function x403105_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403105_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403105_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403105_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403105_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403105_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403105_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403105_var_Buf1, 0);
	end
	return 1;
end







function x403105_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
