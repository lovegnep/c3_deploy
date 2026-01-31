













x404827_var_FileId = 404827 




x404827_var_Buf1 = 9827 
x404827_var_Buf2 = -1 




function x404827_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404827_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404827_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404827_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404827_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404827_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404827_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404827_var_Buf1, 0);
	end
	return 1;
end







function x404827_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
