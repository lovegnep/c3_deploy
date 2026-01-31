













x404824_var_FileId = 404824 




x404824_var_Buf1 = 9824 
x404824_var_Buf2 = -1 




function x404824_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404824_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404824_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404824_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404824_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404824_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404824_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404824_var_Buf1, 0);
	end
	return 1;
end







function x404824_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
