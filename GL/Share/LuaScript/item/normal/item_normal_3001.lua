













x403001_var_FileId = 403001 




x403001_var_Buf1 = 8001 
x403001_var_Buf2 = -1 




function x403001_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403001_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403001_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403001_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403001_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403001_ProcActivateOnce( varMap, varPlayer, varImpact )
	if(-1~=x403001_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	end
	return 1;
end







function x403001_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
