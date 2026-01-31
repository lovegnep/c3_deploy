













x403113_var_FileId = 403113 




x403113_var_Buf1 = 9003 
x403113_var_Buf2 = -1 




function x403113_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403113_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403113_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403113_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403113_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403113_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403113_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403113_var_Buf1, 0);
	end
	return 1;
end







function x403113_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
