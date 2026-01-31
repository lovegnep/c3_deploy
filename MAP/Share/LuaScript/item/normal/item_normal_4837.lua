













x404837_var_FileId = 404837 




x404837_var_Buf1 = 9837 
x404837_var_Buf2 = -1 




function x404837_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404837_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404837_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404837_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404837_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404837_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404837_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404837_var_Buf1, 0);
	end
	return 1;
end







function x404837_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
