













x404845_var_FileId = 404845 




x404845_var_Buf1 = 9836 
x404845_var_Buf2 = -1 




function x404845_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404845_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404845_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404845_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404845_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404845_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404845_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404845_var_Buf1, 0);
	end
	return 1;
end







function x404845_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
