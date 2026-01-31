













x403004_var_FileId = 403004 




x403004_var_Buf1 = 8004 
x403004_var_Buf2 = -1 




function x403004_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403004_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403004_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403004_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403004_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403004_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403004_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403004_var_Buf1, 0);
	end
	return 1;
end







function x403004_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
