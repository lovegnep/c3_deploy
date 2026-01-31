













x404848_var_FileId = 404848 




x404848_var_Buf1 = 9839 
x404848_var_Buf2 = -1 




function x404848_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404848_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404848_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404848_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404848_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404848_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404848_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404848_var_Buf1, 0);
	end
	return 1;
end







function x404848_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
