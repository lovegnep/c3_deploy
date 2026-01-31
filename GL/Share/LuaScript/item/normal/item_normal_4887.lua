













x404887_var_FileId = 404887 




x404887_var_Buf1 = -1 
x404887_var_Buf2 = -1 




function x404887_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404887_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404887_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404887_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404887_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404887_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404887_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404887_var_Buf1, 0);
	end

    AddExp( varMap, varPlayer, random( 2000, 15000) )
	return 1;
end







function x404887_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
