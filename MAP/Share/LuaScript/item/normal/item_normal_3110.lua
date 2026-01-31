













x403110_var_FileId = 403110 




x403110_var_Buf1 = 8110 
x403110_var_Buf2 = -1 




function x403110_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403110_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403110_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403110_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403110_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403110_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403110_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403110_var_Buf1, 0);
	end
	return 1;
end







function x403110_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
