













x403107_var_FileId = 403107 




x403107_var_Buf1 = 8107 
x403107_var_Buf2 = -1 




function x403107_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403107_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403107_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403107_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403107_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403107_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403107_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403107_var_Buf1, 0);
	end
	return 1;
end







function x403107_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
