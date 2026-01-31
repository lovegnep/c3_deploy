













x403115_var_FileId = 403115 




x403115_var_Buf1 = 9005 
x403115_var_Buf2 = -1 




function x403115_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403115_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403115_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403115_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403115_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403115_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403115_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403115_var_Buf1, 0);
	end
	return 1;
end







function x403115_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
