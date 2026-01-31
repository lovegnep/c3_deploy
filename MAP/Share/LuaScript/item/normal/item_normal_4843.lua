













x404843_var_FileId = 404843 




x404843_var_Buf1 = 16033 
x404843_var_Buf2 = -1 




function x404843_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404843_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404843_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404843_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404843_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404843_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404843_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404843_var_Buf1, 0);
	end
	return 1;
end







function x404843_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
