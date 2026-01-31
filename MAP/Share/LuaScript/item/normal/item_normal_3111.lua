













x403111_var_FileId = 403111 




x403111_var_Buf1 = 9001 
x403111_var_Buf2 = -1 




function x403111_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403111_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403111_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403111_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403111_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403111_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403111_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403111_var_Buf1, 0);
	end
	return 1;
end







function x403111_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
