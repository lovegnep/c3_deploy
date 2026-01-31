













x404839_var_FileId = 404839 




x404839_var_Buf1 = 9839 
x404839_var_Buf2 = -1 




function x404839_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404839_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404839_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404839_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404839_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404839_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404839_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404839_var_Buf1, 0);
	end
	return 1;
end







function x404839_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
