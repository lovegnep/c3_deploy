













x404893_var_FileId = 404893 




x404893_var_Buf1 = 8355 




function x404893_ProcDefaultEvent( varMap, varPlayer, varBagIdx )

end






function x404893_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404893_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404893_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404893_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404893_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404893_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404893_var_Buf1, 0);
	end
	return 1;
end







function x404893_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
