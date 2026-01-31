













x403116_var_FileId = 403116 




x403116_var_Buf1 = 9006 
x403116_var_Buf2 = -1 




function x403116_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403116_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403116_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403116_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403116_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403116_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403116_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403116_var_Buf1, 0);
	end
	return 1;
end







function x403116_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
