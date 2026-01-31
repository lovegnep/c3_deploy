













x403012_var_FileId = 403012 




x403012_var_Buf1 = 9802 
x403012_var_Buf2 = -1 




function x403012_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403012_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403012_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403012_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403012_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403012_ProcActivateOnce( varMap, varPlayer )

	if(-1~=x403012_var_Buf1) then

		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403012_var_Buf1, 0);
	end
	return 1;
end







function x403012_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
