













x403002_var_FileId = 403002 




x403002_var_Buf1 = 8002 
x403002_var_Buf2 = -1 




function x403002_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403002_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403002_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403002_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403002_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403002_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403002_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403002_var_Buf1, 0);
	end
	return 1;
end







function x403002_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
